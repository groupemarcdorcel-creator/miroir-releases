#!/bin/bash
# Installe ou met à jour Miroir dans /Applications, sans message de sécurité :
# un fichier téléchargé par curl n'est pas mis en quarantaine par macOS.
#   curl -fsSL https://raw.githubusercontent.com/groupemarcdorcel-creator/miroir-releases/main/installer.sh | bash
set -e
URL="https://github.com/groupemarcdorcel-creator/miroir-releases/releases/latest/download/Miroir.dmg"
T=$(mktemp -d)
echo "Téléchargement de Miroir…"
curl -fsSL -o "$T/Miroir.dmg" "$URL"
echo "Installation dans /Applications…"
MNT=$(hdiutil attach -nobrowse -readonly "$T/Miroir.dmg" | awk -F'\t' '/\/Volumes\//{print $NF; exit}')
[ -n "$MNT" ] || { echo "Impossible d'ouvrir l'image disque." >&2; exit 1; }
osascript -e 'tell application "Miroir" to quit' >/dev/null 2>&1 || true
rm -rf "/Applications/Miroir.app"
cp -R "$MNT/Miroir.app" /Applications/
hdiutil detach "$MNT" -quiet || true
rm -rf "$T"
xattr -dr com.apple.quarantine /Applications/Miroir.app 2>/dev/null || true
echo "Miroir est installé. Lancement…"
open -a /Applications/Miroir.app
