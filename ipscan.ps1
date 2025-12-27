param (
    [string]$Subnet = "192.168.88",
    [int]$StartIP = 25,
    [int]$EndIP = 254
)

Write-Host "Scanning subnet $Subnet.0/24 ..."
Write-Host "-------------------------------------------"

$results = @()

for ($i = $StartIP; $i -le $EndIP; $i++) {
    $ip = "$Subnet.$i"

    # PowerShell 5.1 compatible
    $ping = Test-Connection -ComputerName $ip -Count 1 -Quiet -ErrorAction SilentlyContinue

    if ($ping) {
        try {
            $hostname = [System.Net.Dns]::GetHostEntry($ip).HostName
        } catch {
            $hostname = "N/A"
        }

        $obj = [PSCustomObject]@{
            IPAddress = $ip
            Hostname  = $hostname
            Status    = "Online"
        }

        $results += $obj
        Write-Host "[+] $ip ONLINE ($hostname)"
    }
}

Write-Host "`nScan completed."
$results
