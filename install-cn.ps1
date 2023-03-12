$Env:PIP_DISABLE_PIP_VERSION_CHECK = 1
function InstallFail {
    Write-Output "��װʧ�ܡ�"
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
    Write-Output "���ڴ������⻷��..."
    python -m venv venv
    Check "�������⻷��ʧ�ܣ����� python �Ƿ�װ����Լ� python �汾��"
}

.\venv\Scripts\activate
Check "�������⻷��ʧ�ܡ�"

Write-Output "��װ������������ (�ѽ��й��ڼ��٣����޷�ʹ�ü���Դ���� install.ps1)..."
pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 -f https://mirror.sjtu.edu.cn/pytorch-wheels/torch_stable.html -i https://mirrors.bfsu.edu.cn/pypi/web/simple
Check "torch ��װʧ�ܣ���ɾ�� venv �ļ��к��������С�"
pip install --upgrade -r requirements.txt -i https://mirrors.bfsu.edu.cn/pypi/web/simple
Check "����������װʧ�ܡ�"


Write-Output "��װ��ϡ�"
Read-Host | Out-Null ;