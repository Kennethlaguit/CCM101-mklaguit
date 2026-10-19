# Final Reflection — Missions 1 to 10

**Group:** LAGUIT MARK KENNETH | DOMINGO ANDREKYLE | MAALA JOSHUA | FALINTAG JUNELLE | BULALAYAO RAIVEN  
**Course:** CCM101 — Cloud Computing  
**Section:** 4-J


## My Learning Journey

Mission 10 helped me connect the skills I learned throughout the course. In Missions 1–3, I learned basic Linux commands and how virtual machines work. I used those skills to navigate Ubuntu Server, create project folders and manage files.

In Missions 4–6, I learned about Docker containers, networks and volumes. These helped me understand how WordPress connects to MySQL and how application data can be stored outside a container.

In Missions 7–9, I learned about security and automation. I applied these lessons when configuring the firewall and preparing the backup script.

This project taught me that running a website is only one part of managing a cloud environment. I also need to understand how users connect to it, where its data is stored and how to recover it when something goes wrong.

## Challenges During Setup

One problem I encountered was the “permission denied” error when running Docker commands. My Ubuntu account did not have permission to access the Docker socket. I fixed this by using sudo, such as:

    sudo docker compose ps

After that, I could check the containers and manage the application.

I also encountered a WordPress database connection error. This taught me that a healthy database container does not automatically mean WordPress can connect to it. Later, I successfully opened the WordPress dashboard and published a post.

Another important lesson was knowing where to enter commands. Windows PowerShell and the Ubuntu terminal may appear in the same terminal application, but they control different environments. Checking the terminal prompt helped me avoid confusion.

## Storage and Recovery

I learned that named volumes and backups have different purposes. Volumes keep data outside a container’s temporary storage, while backups provide another copy that can be used for recovery.

During testing, I recreated the containers and confirmed that they started again. I also ran the backup script manually and saw a success message and a 240 KB compressed SQL backup file.

However, I still need to document a complete before-and-after persistence test and verify that the backup can be restored successfully. Creating a backup file is a useful first step, but checking the restored data is what proves recovery works.

I also learned that a database backup alone is not enough to recover the entire WordPress website. Uploaded images, themes, plugins and configuration files must also be included.

## Security and Automation

I configured UFW to deny incoming connections by default and allow SSH on port 22 for remote administration. VirtualBox forwards port 2222 on my Windows laptop to port 22 inside Ubuntu.

I access WordPress through an SSH tunnel. MySQL remains on the internal Docker network without a published host port, which limits direct access to the database.

For automation, I prepared the backup script and opened the root crontab to configure its schedule. The manual backup worked, but I still need to confirm an actual scheduled run by checking the backup log and a newly created backup.

This taught me that setting a schedule and proving that it works are separate tasks. The virtual machine must also be running when the scheduled task is due.

## What I Would Improve

My first priority would be storing backups outside the virtual machine. If the VM or its disk becomes damaged, backups stored inside it could also be lost. Keeping a protected copy on separate storage would make recovery more reliable.

My second priority would be regular recovery testing. A success message from a backup script does not guarantee that the website can be restored. I would practice restoring the database and WordPress files in a separate environment, then check the posts, images and administrator login.

## Final Takeaway

I can now use Ubuntu commands, manage Docker containers and check whether my application is running. I also understand how SSH, firewall rules and persistent storage support the project. Troubleshooting database connections and verifying complete recovery are the areas where I still need more practice. To prepare for the live defense, I would rehearse deployment on a fresh environment and practice explaining each command in my own words.

## AI Disclosure

I used ChatGPT to help explain technical concepts, suggest troubleshooting steps and improve the wording of my documentation. This reflection was drafted with AI assistance, and I am responsible for reviewing and revising it so that it accurately describes my own work and understanding.
