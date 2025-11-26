#!/bin/bash

set -e

VF_REPO="https://raw.githubusercontent.com/SEU_USUARIO/SEU_REPO/main"
INSTALL_PATH="/usr/local/bin/vf"

echo "============================================="
echo "   Instalando Viajaflux Git Flow Helper (vf)"
echo "============================================="
echo

if [[ "$EUID" -ne 0 ]]; then
  echo "⚠ Precisa de sudo!"
  echo "Use: sudo bash vf.install.sh"
  exit 1
fi

echo "📥 Baixando CLI..."
curl -fsSL "$VF_REPO/vf" -o "$INSTALL_PATH"

chmod +x "$INSTALL_PATH"

echo "✔ Instalado em $INSTALL_PATH"
echo "→ Testando..."

if vf version >/dev/null 2>&1; then
  echo "🎉 Sucesso! Rode:  vf help"
else
  echo "⚠ Instalação concluída, mas não consegui rodar."
  echo "Feche o terminal e abra novamente."
fi
