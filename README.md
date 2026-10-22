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

## Mode d'emploi

Le [mode d'emploi](MODE-D-EMPLOI.md) explique, dans l'ordre : désigner une paire, analyser puis sauvegarder, la corbeille, le contrôle complet, le backup chiffré, les automatismes, et que faire quand quelque chose bloque. Il est aussi dans l'application, bouton Aide.

## Avertissement

Miroir est un outil personnel, fourni gratuitement et **tel quel, sans aucune garantie**. Un backup n'est pas une garantie : garde plusieurs copies de ce qui compte et vérifie que tu sais les relire. Tu restes seul responsable de tes données, des confirmations que tu donnes et de la phrase secrète d'un backup chiffré : si elle est perdue, le backup est perdu. Dans toute la mesure permise par la loi, l'auteur ne peut être tenu responsable d'aucune perte ou altération de données ni d'aucun autre dommage lié à l'utilisation de Miroir. L'application n'est pas signée par Apple et ne collecte rien.

Le texte complet est dans [AVERTISSEMENT.md](AVERTISSEMENT.md). En installant ou en utilisant Miroir, tu l'acceptes ; l'application le montre au premier lancement.
