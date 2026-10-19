# Final Reflection — Missions 1 to 10

**Group:** LAGUIT MARK KENNETH | DOMINGO ANDREKYLE | MAALA JOSHUA | FALINTAG JUNELLE | BULALAYAO RAIVEN  
**Course:** CCM101 — Cloud Computing  
**Section:** 4-J

> Personalize this draft before submitting. Replace the bracketed prompts with your own experience and keep only statements that accurately describe your work.

## My learning journey

Mission 10 brought together Linux administration, virtualization, Docker, networking, security and automation. A working website was only one part of the task. The project also required a clear explanation of where the application runs, how its data is stored and how it can be recovered.

[Describe one skill you learned in Missions 1–3, one from Missions 4–6, and one from Missions 7–9. Explain how you used each skill in this project.]

## Challenges during setup

The setup process included SSH connection errors, a username mismatch, Docker socket permission errors and a WordPress database connection error. These issues showed why it matters to distinguish Windows PowerShell from the Ubuntu terminal. The Windows host and Ubuntu VM have separate network interfaces and services, even when both are accessed through the same terminal application.

[Explain one error you personally fixed. Include the exact cause, the command or setting you changed, and the result you observed. If the WordPress database error is still unresolved, say so.]

## Storage and recovery

Named volumes keep application data when containers are recreated. Backups serve a different purpose: they provide a recoverable copy if data is damaged or the VM is lost. A database backup alone does not include uploaded images, themes or plugins. A complete recovery therefore needs both the database and WordPress files, along with the correct configuration and credentials.

[Describe your persistence test and backup test. Record whether you successfully restored the data. Do not claim recovery succeeded unless you checked the restored result.]

## Security and automation

The planned design limits access to SSH and uses an SSH tunnel for the local website. MySQL remains on an internal Docker network without a published host port. Scheduled backups reduce manual work, but the schedule must be tested and the VM must be running when the task is due.

[Describe what your firewall allows, why those ports are needed, and how you confirmed that your scheduled task actually ran.]

## What I would improve

Possible improvements include off-host backup storage, clearer monitoring, HTTPS for public access and regular recovery rehearsals. A single VM can still fail, so this laboratory design needs further work before it could support a real organization's availability requirements.

[Choose two improvements you would prioritize and explain why.]

## Final takeaway

[Write three to five sentences about what you can now do independently, which part remains difficult, and how you would prepare for the live defense.]

## AI disclosure

AI assisted with drafting documentation and explaining troubleshooting steps. I am responsible for reviewing the material and ensuring that the final reflection describes my own work. [Add the disclosure wording required by your instructor.]
