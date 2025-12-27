PowerShell Subnet Scanner

Skrip PowerShell ringkas untuk mengimbas (scan) peranti aktif dalam satu subnet rangkaian menggunakan ping dan mendapatkan hostname (jika ada).

Sesuai digunakan untuk:

Pentadbir sistem

Audit rangkaian dalaman

Troubleshooting peranti LAN

PowerShell 5.1 (Windows lama / server)

Ciri-ciri

Imbas subnet /24

Tetapkan julat IP mula dan akhir

Ping setiap IP (1 kali)

Papar status Online sahaja

Cuba resolve hostname menggunakan DNS

Output dalam bentuk PSCustomObject (mudah di-export)

Keperluan

Windows PowerShell 5.1

Akses rangkaian ke subnet sasaran

ICMP (ping) tidak disekat firewall

Cara Guna
1. Simpan skrip

Contoh nama fail:

scan-subnet.ps1

2. Jalankan dengan nilai default
.\scan-subnet.ps1


Default:

Subnet: 192.168.88.0/24

Start IP: 25

End IP: 254

3. Jalankan dengan parameter custom
.\scan-subnet.ps1 -Subnet 192.168.1 -StartIP 1 -EndIP 100

Contoh Output
Scanning subnet 192.168.88.0/24 ...
-------------------------------------------
[+] 192.168.88.30 ONLINE (server01.local)
[+] 192.168.88.45 ONLINE (printer.local)

Scan completed.

Simpan Hasil ke Fail
Export ke CSV
$results = .\scan-subnet.ps1
$results | Export-Csv -NoTypeInformation -Path scan_results.csv

Papar dalam Table
$results | Format-Table -AutoSize

Nota Penting

Skrip ini tidak mengesan peranti yang block ICMP

Hostname mungkin N/A jika:

DNS tidak wujud

Reverse lookup gagal

Skrip ini hanya mengesan peranti yang online
