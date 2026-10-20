# Miroir — versions installables

Miroir rend un disque ou un dossier de backup identique à son master, sans jamais toucher au master.
Ce dépôt ne contient que les fichiers à installer ; le code est dans un dépôt privé.

## Installer sur un Mac

Coller dans le Terminal (Applications → Utilitaires → Terminal), puis Entrée :

```bash
curl -fsSL https://raw.githubusercontent.com/groupemarcdorcel-creator/miroir-releases/main/installer.sh | bash
```

Miroir est installé dans Applications et se lance. Aucun message de sécurité : l'application n'est pas signée par Apple, mais un fichier téléchargé de cette façon n'est pas mis en quarantaine.

Ensuite, Miroir vérifie à chaque lancement s'il existe une version plus récente et te la propose : la mise à jour se fait dans l'application.

## À la main

Télécharger `Miroir.dmg` dans la dernière version, l'ouvrir, glisser Miroir dans Applications. Au premier lancement macOS dira « Miroir est endommagé » (c'est la quarantaine, pas un dommage) : dans le Terminal, `xattr -dr com.apple.quarantine /Applications/Miroir.app`, puis relancer.

Mac Apple Silicon et Intel, macOS 12 ou plus récent.
