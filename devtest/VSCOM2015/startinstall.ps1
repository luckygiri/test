$NewDIR = "C:\SoftwaresDump\QTP12.5"
$SoftwareWebLink = "https://download.microsoft.com/download/e/4/c/e4c393a9-8fff-441b-ad3a-3f4040317a1f/vs_community.exe"
$SoftwarePath = "C:\SoftwaresDump\QTP12.5\vs_community.exe"

# Create temp directory
New-Item "C:\SoftwaresDump\QTP12.5" -ItemType Directory -ErrorAction SilentlyContinue
# Download
(New-Object System.Net.WebClient).DownloadFile("$SoftwareWebLink", "$SoftwarePath")

(New-Object System.Net.WebClient).DownloadFile("http://artifacts.g7crm4l.org/softwares/QTP12.5/vs2015.exe", "C:\SoftwaresDump\QTP12.5\vs2015.exe")



# Install

Start-Process "C:\SoftwaresDump\QTP12.5\vs_community.exe"
Start-Process "C:\SoftwaresDump\QTP12.5\vs2015.exe"  


