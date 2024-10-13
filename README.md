# PowerShell Script: Get Network and DNS Information

This PowerShell script is designed to retrieve basic network information and DNS configuration details for the system on which it is run. It provides details like IP address, MAC address, default gateway, DNS servers, and displays the current DNS cache.

## Features

- Retrieve **hostname**, **IP address**, **MAC address**, and **network interface status**.
- Display the system's **default gateway**.
- List configured **DNS servers** for each network adapter.
- Optionally display the current **DNS cache**.

## Usage

### Prerequisites

- **PowerShell 5.0+** (Comes pre-installed on Windows 10+)
- Administrator privileges (recommended for retrieving some network and DNS-related information)

### Running the Script

1. **Clone the repository** or **download** the script file.

    ```bash
    git clone https://github.com/yourusername/network-dns-info-script.git
    ```

2. Open **PowerShell as Administrator**.
3. Navigate to the folder where the script is saved.
4. Run the script:

    ```powershell
    .\Get-NetworkAndDNSInfo.ps1
    ```

The script will output the following information:

- Hostname
- IP address and subnet for each network interface
- MAC address and adapter status
- Default gateway
- DNS servers for each adapter
- Current DNS cache

### Example Output

```plaintext
Hostname: MyComputer
Interface: Ethernet0 | IP Address: 192.168.1.10 | Subnet: 24
Interface: Wi-Fi | IP Address: 192.168.1.15 | Subnet: 24

Network Interfaces:
Interface: Ethernet0 | MAC Address: AA:BB:CC:DD:EE:FF | Status: Up
Interface: Wi-Fi | MAC Address: 11:22:33:44:55:66 | Status: Up

Default Gateway: 192.168.1.1

DNS Servers:
Interface: Ethernet0 | DNS Server(s): 8.8.8.8, 8.8.4.4
Interface: Wi-Fi | DNS Server(s): 1.1.1.1

Current DNS Cache:
...
