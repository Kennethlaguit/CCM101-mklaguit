#!/usr/bin/env bash
set -Eeuo pipefail
umask 077
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PROJECT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"
mkdir -p backups
exec 9>backups/.backup.lock
flock -n 9 || exit 0
STAMP="$(date +%Y-%m-%d_%H-%M-%S)"
DEST="$PROJECT_DIR/backups/$STAMP"
mkdir "$DEST"
RESTART=0
cleanup() {
  result=$?
  trap - EXIT
  if [ "$RESTART" = 1 ]; then
    docker compose start wordpress || result=1
  fi
  if [ "$result" != 0 ]; then
    echo "$(date -Is) BACKUP FAILED: $DEST" >&2
  fi
  exit "$result"
}
trap cleanup EXIT
# Only run when WordPress is already running.
test -n "$(docker compose ps --status running -q wordpress)"
RESTART=1
docker compose stop wordpress
docker compose exec -T db sh -c '
  export MYSQL_PWD="$(cat /run/secrets/db_root_password)"
  exec mysqldump --user=root --single-transaction \
    --quick --no-tablespaces --set-gtid-purged=OFF \
    wordpress
' | gzip > "$DEST/database.sql.gz"
gzip -t "$DEST/database.sql.gz"
docker compose run --rm --no-deps -T \
  --entrypoint tar wordpress \
  -C /var/www/html -czf - . \
  > "$DEST/wordpress-files.tar.gz"
tar -tzf "$DEST/wordpress-files.tar.gz" > /dev/null
cp docker-compose.yml "$DEST/"
cp -a secrets "$DEST/"
docker compose start wordpress
RESTART=0
touch "$DEST/COMPLETE"
echo "$(date -Is) BACKUP SUCCESS: $DEST"
