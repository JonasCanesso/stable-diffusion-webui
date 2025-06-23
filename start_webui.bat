@echo off
echo ============================================
echo    INICIANDO STABLE DIFFUSION WEBUI
echo ============================================

REM Verifica se o Python 3.10 está instalado
python --version | findstr "3.10" >nul
if %errorlevel% neq 0 (
    echo ERRO: Python 3.10.x nao encontrado!
    echo Instale Python 3.10.10 com Add to PATH marcado.
    pause
    exit /b
)

REM Cria ambiente virtual se ainda não existir
if not exist "venv" (
    echo Criando ambiente virtual...
    python -m venv venv
)

REM Ativa o ambiente virtual
call venv\Scripts\activate

REM Instala o PyTorch com suporte à GPU (CUDA 11.8)
echo Instalando PyTorch compatível com RTX 4060...
pip install torch==2.0.1+cu118 torchvision==0.15.2+cu118 torchaudio==2.0.2 --extra-index-url https://download.pytorch.org/whl/cu118

REM Inicia o WebUI
echo Iniciando WebUI...
call webui-user.bat