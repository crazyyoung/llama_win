$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1
function InstallFail {
    Write-Output "Installing fail"
    Read-Host | Out-Null ;
    Exit
}

function Check {
    param (
        $ErrorInfo
    )
    if (!($?)) {
        Write-Output $ErrorInfo
        InstallFail
    }
}

if (!(Test-Path -Path "venv")) {
    Write-Output "Creating venv ..."
    python -m venv venv
    Check "fail"
}

.\venv\Scripts\activate
Check "activate fail"

Write-Output "Installing deps for windows..."
pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117
Check "torch install fail"
pip install --upgrade -r requirements.txt
Check "install fail"


Write-Output "Install completed"
Read-Host | Out-Null ;