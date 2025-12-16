# Automation of Server Configuration Using Sed

## Overview
This project automates the process of updating server configuration files using a Bash shell script and the `sed` command. Instead of manually editing configuration files, the script updates server parameters such as IP address, hostname, and port automatically based on user input. This approach makes server management faster, easier, and less error-prone.

## Problem Statement
Server configuration files need frequent updates due to changes in IP addresses, hostnames, and port numbers. Manual editing of these files is time-consuming and prone to human errors. An automated solution is required to efficiently update configuration files while ensuring accuracy and consistency.

## Objectives
- Automate server configuration updates  
- Reduce manual errors  
- Use `sed` for editing configuration files  
- Preview changes before applying them  

## Project Structure
OS_Project/
└── server.conf
└── modified_server.conf
└── update_config.sh

markdown
Copy code

## Description of Files
- **server.conf**  
  Contains the original server configuration parameters.

- **update_config.sh**  
  Bash shell script that updates the configuration file using `sed` commands.

- **modified_server.conf**  
  Output file containing the updated server configuration.

## Solution Overview
The solution is implemented using a Bash shell script that reads user input and applies configuration updates using various `sed` operations. The script replaces existing values, inserts update comments, appends missing settings, deletes outdated entries, and previews changes before saving them to a new file.

## Sed Commands Used
- **s (substitute)** – Replaces IP address, hostname, port, and other values  
- **i (insert)** – Inserts a configuration update comment  
- **a (append)** – Appends missing configuration values  
- **d (delete)** – Removes obsolete configuration lines  
- **p (print)** – Previews changes before saving  

## How to Run the Project
1. Open the project folder in the terminal.
2. Give execution permission to the script:
   ```bash
   chmod +x update_config.sh
   bash update_config.sh
Run the script:

bash
Copy code
./update_config.sh
or

bash
Copy code
bash update_config.sh
Output
After successful execution, the updated configuration is saved in modified_server.conf, and the final output is displayed on the terminal.

Advantages
Eliminates manual configuration editing

Reduces errors

Saves time

Easy to reuse and modify

Conclusion
This project demonstrates the effective use of shell scripting and the sed command to automate server configuration management. Automation improves reliability, consistency, and efficiency in managing configuration files.


## Author

Aavani Rajesh Perumbessi
