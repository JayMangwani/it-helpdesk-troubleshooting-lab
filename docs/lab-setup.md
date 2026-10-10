# Lab Setup

## 1. Install VirtualBox
Download from virtualbox.org. Enable virtualization (VT-x/AMD-V) in BIOS if VMs won't start.

## 2. Domain Controller VM
1. Download Windows Server 2022 Evaluation ISO from Microsoft Evaluation Center.
2. Create VM: 2 vCPU, 4 GB RAM, 50 GB disk. Network adapter: **Internal Network** named `labnet`.
3. Install Windows Server (Desktop Experience).
4. Set static IP: `192.168.10.10/24`, DNS `127.0.0.1`.
5. Server Manager -> Add Roles -> **Active Directory Domain Services** and **DNS Server**.
6. Promote to domain controller: new forest `lab.local`.
7. (Optional) Add **DHCP** role with scope `192.168.10.100-200`, gateway `192.168.10.1`, DNS `192.168.10.10`. Needed for TKT-004.

## 3. Client VM
1. Windows 10/11 VM, adapter 1: Internal Network `labnet`. Optional adapter 2: NAT (for internet access).
2. Set DNS to `192.168.10.10`, then join the domain `lab.local`.
3. Take a **snapshot** named `clean-baseline` so you can reset between tickets.

## 4. Organizational structure
Run `scripts/ad-bulk-users.ps1` on the DC to create OUs, users, and groups.
