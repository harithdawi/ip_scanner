
<body>

<h1>PowerShell Subnet Scanner</h1>

<p>
Skrip PowerShell ringkas untuk mengimbas peranti aktif dalam satu subnet rangkaian
menggunakan ping dan mendapatkan hostname (jika tersedia).
</p>

<div class="box">
<h2>Ciri-ciri</h2>
<ul>
    <li>Imbas subnet /24</li>
    <li>Julat IP boleh dikonfigurasi</li>
    <li>Ping setiap IP (1 kali)</li>
    <li>Papar peranti yang online sahaja</li>
    <li>Resolve hostname menggunakan DNS</li>
    <li>Output dalam bentuk PSCustomObject</li>
</ul>
</div>

<div class="box">
<h2>Keperluan</h2>
<ul>
    <li>Windows PowerShell 5.1</li>
    <li>Akses ke rangkaian sasaran</li>
    <li>ICMP (ping) tidak disekat firewall</li>
</ul>
</div>

<div class="box">
<h2>Cara Guna</h2>

<h3>1. Simpan skrip</h3>
<pre>scan-subnet.ps1</pre>

<h3>2. Jalankan dengan tetapan default</h3>
<pre>
.\scan-subnet.ps1
</pre>

<p>Default:</p>
<ul>
    <li>Subnet: 192.168.88.0/24</li>
    <li>Start IP: 25</li>
    <li>End IP: 254</li>
</ul>

<h3>3. Jalankan dengan parameter custom</h3>
<pre>
.\scan-subnet.ps1 -Subnet 192.168.1 -StartIP 1 -EndIP 100
</pre>
</div>

<div class="box">
<h2>Contoh Output</h2>
<pre>
Scanning subnet 192.168.88.0/24 ...
-------------------------------------------
[+] 192.168.88.30 ONLINE (server01.local)
[+] 192.168.88.45 ONLINE (printer.local)

Scan completed.
</pre>
</div>

<div class="box">
<h2>Simpan Hasil Scan</h2>

<h3>Export ke CSV</h3>
<pre>
$results = .\scan-subnet.ps1
$results | Export-Csv -NoTypeInformation -Path scan_results.csv
</pre>

<h3>Papar sebagai table</h3>
<pre>
$results | Format-Table -AutoSize
</pre>
</div>

<div class="box">
<h2>Nota Penting</h2>
<ul>
    <li>Peranti yang block ICMP tidak akan dikesan</li>
    <li>Hostname mungkin N/A jika DNS reverse lookup gagal</li>
    <li>Skrip hanya mengesan peranti yang online</li>
</ul>
</div>

<div class="box">
<h2>Lesen</h2>
<p>
MIT License – Bebas digunakan, diubah, dan diedarkan.
</p>
</div>

<footer>
PowerShell Subnet Scanner<br>
Dokumentasi README (HTML)
</footer>

</body>
</html>
