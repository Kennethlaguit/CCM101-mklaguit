# Final Reflection — Missions 1 to 10

**Group:** LAGUIT MARK KENNETH | DOMINGO ANDREKYLE | MAALA JOSHUA | FALINTAG JUNELLE | BULALAYAO RAIVEN  
**Course:** CCM101 — Cloud Computing  
**Section:** 4-J

> Personalize this draft before submitting. Replace the bracketed prompts with your own experience and keep only statements that accurately describe your work.

My learning journey
Mission 10 helped me connect the skills I learned throughout the course. In Missions 1–3, I learned basic Linux commands and how virtual machines work. I used those skills to navigate Ubuntu Server, create project folders and manage files. In Missions 4–6, I learned about Docker containers, networks and volumes, which helped me connect WordPress to MySQL and provide persistent storage. In Missions 7–9, I learned about security and automation, which I applied when configuring the firewall and preparing the backup script.
This project helped me understand that running a website is only part of managing a cloud environment. I also need to understand how users access it, where its data is stored and what to do when something goes wrong.
Challenges during setup
One problem I encountered was the “permission denied” error when running Docker commands. My Ubuntu account did not have permission to access the Docker socket. I fixed this by using sudo, such as running sudo docker compose ps. After that, I could check the containers and manage the application.
I also encountered a WordPress database connection error. This taught me that a healthy database container does not automatically mean WordPress can connect to it. I had to check the application configuration and access permissions. Later, I successfully opened the WordPress dashboard and published a post.
Another lesson was knowing where to enter commands. Windows PowerShell and the Ubuntu terminal may appear in the same terminal application, but they control different environments.
Storage and recovery
I learned that named volumes and backups have different purposes. Volumes keep data outside the container’s temporary storage, while backups provide another copy that can be used for recovery.
During testing, I recreated the containers and confirmed that they started again. I also ran the backup script manually and saw a success message and a 240 KB compressed SQL backup file. However, I still need to document a complete before-and-after persistence test and verify that the backup can be restored successfully.
I also learned that a database backup alone is not enough to recover the entire WordPress website. Uploaded images, themes, plugins and configuration files must also be included.
Security and automation
I configured UFW to deny incoming connections by default and allow SSH on port 22 for remote administration. VirtualBox forwards port 2222 on my Windows laptop to port 22 inside Ubuntu. I access WordPress through an SSH tunnel, while MySQL remains on the internal Docker network without a published host port.
For automation, I prepared the backup script and opened the root crontab to configure its schedule. The manual backup worked, but I still need to confirm an actual scheduled run by checking the backup log and the newly created backup file. This helped me understand that setting a schedule and proving that it works are separate tasks.
What I would improve
My first priority would be storing backups outside the virtual machine. If the VM or its disk becomes damaged, backups stored inside it could also be lost. Keeping a protected copy on separate storage would make recovery more reliable.
My second priority would be regular recovery testing. A success message from a backup script does not guarantee that the website can be restored. I would practice restoring the database and WordPress files in a separate environment, then check the posts, images and administrator login.
Final takeaway
I can now use Ubuntu commands, manage Docker containers and check whether my application is running. I also understand how SSH, firewall rules and persistent storage support the project. Troubleshooting database connections and verifying complete recovery are the areas where I still need more practice. To prepare for the live defense, I would rehearse deployment on a fresh environment and practice explaining each command in my own words.
AI disclosure
I used ChatGPT to help explain technical concepts, suggest troubleshooting steps and improve the wording of my documentation. This reflection was drafted with AI assistance, and I am responsible for reviewing and revising it so that it accurately describes my own work and understanding.
