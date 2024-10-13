# Function to get basic network information
function Get-NetworkInfo {
    # Get Hostname
    $hostname = $env:COMPUTERNAME
    Write-Host "Hostname: $hostname"

    # Get IP Address
    $ipconfig = Get-NetIPAddress -AddressFamily IPv4 | Where-Object {$_.InterfaceAlias -ne "Loopback Pseudo-Interface 1"}
    foreach ($ip in $ipconfig) {
        Write-Host "Interface: $($ip.InterfaceAlias) | IP Address: $($ip.IPAddress) | Subnet: $($ip.PrefixLength)"
    }

    # Get MAC Address and Adapter Status
    $network_adapters = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }
    Write-Host "`nNetwork Interfaces:"
    $network_adapters | ForEach-Object {
        Write-Host "Interface: $($_.Name) | MAC Address: $($_.MacAddress) | Status: $($_.Status)"
    }

    # Get Default Gateway
    $gateway = Get-NetRoute | Where-Object { $_.DestinationPrefix -eq '0.0.0.0/0' }
    Write-Host "`nDefault Gateway: $($gateway.NextHop)"
}

# Function to get DNS information
function Get-DNSInfo {
    # Get DNS Servers
    Write-Host "`nDNS Servers:"
    $dns_servers = Get-DnsClientServerAddress -AddressFamily IPv4
    $dns_servers | ForEach-Object {
        Write-Host "Interface: $($_.InterfaceAlias) | DNS Server(s): $($_.ServerAddresses -join ', ')"
    }

    # Get DNS Cache (optional)
    Write-Host "`nCurrent DNS Cache:"
    ipconfig /displaydns | Out-String | Write-Host
}

# Run both functions to get network and DNS information
Get-NetworkInfo
Get-DNSInfo
