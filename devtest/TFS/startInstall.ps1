[CmdletBinding()]
param(
)

###################################################################################################

#
# PowerShell configurations
#

# NOTE: Because the $ErrorActionPreference is "Stop", this script will stop on first failure.
#       This is necessary to ensure we capture errors inside the try-catch-finally block.
$ErrorActionPreference = "Stop"

# Ensure we set the working directory to that of the script.
pushd $PSScriptRoot

###################################################################################################

#
# Functions used in this script.
#

function Handle-LastError
{
    $message = $error[0].Exception.Message
    if ($message)
    {
        Write-Host -Object "ERROR: $message" -ForegroundColor Red
    }
    
    # IMPORTANT NOTE: Throwing a terminating error (using $ErrorActionPreference = "Stop") still
    # returns exit code zero from the PowerShell script when using -File. The workaround is to
    # NOT use -File when calling this script and leverage the try-catch-finally block and return
    # a non-zero exit code from the catch block.
    exit -1
}

###################################################################################################

#
# Handle all errors in this script.
#

trap
{
    # NOTE: This trap will handle all errors. There should be no need to use a catch below in this
    #       script, unless you want to ignore a specific error.
    Handle-LastError
}

###################################################################################################

#
# Main execution block.
#

try
{
    $NewDIR = "C:\SoftwaresDump\QTP12.5"
    $SoftwareWebLink = "https://download.microsoft.com/download/a/8/2/a82a195a-9520-4e00-b130-58bcdb0f1746/tfsserver2017.exe?ranMID=24542&ranEAID=je6NUbpObpQ&ranSiteID=je6NUbpObpQ-np7WWHlo65ts4mglVjXUqQ&tduid=(75199473308132b0f49a9bc7df81ed1d)(256380)(2459594)(je6NUbpObpQ-np7WWHlo65ts4mglVjXUqQ)()"
    $SoftwarePath = "C:\SoftwaresDump\QTP12.5\tfsserver2017.exe"

    Write-Output 'Preparing temp directory ...'
    New-Item "C:\SoftwaresDump\QTP12.5" -ItemType Directory -Force | Out-Null

    Write-Output 'Downloading pre-requisite files ...'
    (New-Object System.Net.WebClient).DownloadFile("$SoftwareWebLink", "$SoftwarePath")
   

 Write-Output 'Installing ...'
Start-Process "C:\SoftwaresDump\QTP12.5\tfsserver2017.exe" -ArgumentList '/q' -Wait 

    

    Write-Output 'Done!'
}
finally
{
    popd
}
