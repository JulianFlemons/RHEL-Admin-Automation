# RHEL-Admin-Automation



Automated Red Hat Enterprise Linux (RHEL) system administration suite for user lifecycle management, Group-Based Access Control (RBAC), and directory security hardening.

## 🚀 Project Overview
This project features a collection of modular Bash scripts designed to automate enterprise-level administration tasks. It replaces manual command-line configuration with reproducible scripts, ensuring consistency and security across a RHEL environment.

### Key Objectives
* [cite_start]**User & Identity Management**: Programmatically created 10+ unique user accounts with standardized naming conventions and custom metadata [cite: 2, 4-13].
* [cite_start]**RBAC Implementation**: Structured a hierarchical group model (Dev, Test, Prod, sadmin, Unix) to manage departmental access [cite: 14-19].
* [cite_start]**System Hardening**: Applied "Least Privilege" security policies to system directories using both octal and symbolic permissions [cite: 31-38].
* [cite_start]**Automated Credentialing**: Enforced a mandatory password-rotation policy requiring all new users to change their credentials upon their first login[cite: 3, 46].

---

## 📂 Repository Structure

| File | Purpose |
| :--- | :--- |
| **`creation_of_users.sh`** | [cite_start]Automates the creation of 10 system users with full-name metadata [cite: 2-13]. |
| **`creation_of_groups.sh`** | [cite_start]Provisions specialized administrative and department groups [cite: 14-19]. |
| **`update_user_group.sh`** | [cite_start]Handles secondary group assignments for RBAC compliance [cite: 20-23]. |
| **`setup_opt_dirs.sh`** | [cite_start]Provisions the `/opt` directory infrastructure [cite: 24-30]. |
| **`opt_directory_permissions.sh`** | [cite_start]Implements specific permission masks for system directories [cite: 31-38]. |
| **`init_bash_files.sh`** | [cite_start]Initializes a secure practice environment under `/root/bash` [cite: 39-44]. |

---

## 🛠 Technical Implementation Details

### Security & Permissions Matrix
The following configuration was applied to the `/opt` subdirectories to ensure environment isolation:

| Directory | Requirement | Numeric Mode |
| :--- | :--- | :--- |
| **/opt/Java** | [cite_start]Owner: RWX, Group: R, Others: None [cite: 32-33] | `740` |
| **/opt/Perl** | [cite_start]Owner/Group: Full (RWX), Others: R [cite: 34] | `774` |
| **/opt/Python** | [cite_start]Executable by all, Writable only by User [cite: 35] | `755` |
| **/opt/swift** | [cite_start]Owner: Full, Group/Others: Read/Write [cite: 36] | `766` |
| **/opt/Bash** | [cite_start]Global Read/Write access [cite: 37] | `666` |
| **/opt/Clojure** | [cite_start]Owner/Group: RW, Others: R [cite: 38] | `664` |

### Specialized User Configuration: Marcelo Desantos
[cite_start]Configured a specific system user to simulate legacy application requirements[cite: 45]:
* **Username**: `mdesantos`
* **UID**: `1382`
* **Home Directory**: `/opt/backtofuture`
* [cite_start]**Security**: Forced password change at next login[cite: 46].

---

## ⚙️ Usage
To run these scripts on a RHEL/CentOS system, clone the repository and execute the scripts with sudo privileges:

```bash
git clone [https://github.com/JulianFlemons/RHEL-Admin-Automation.git](https://github.com/JulianFlemons/RHEL-Admin-Automation.git)
cd RHEL-Admin-Automation
chmod +x *.sh
sudo ./creation_of_users.sh
sudo ./creation_of_groups.sh
