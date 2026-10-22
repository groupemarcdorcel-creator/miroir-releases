# Miroir — mode d'emploi

Miroir rend un dossier ou un disque de **backup** identique à un dossier ou un disque **master**. Le master n'est jamais modifié, pas même un fichier caché. Tout ce qui est retiré du backup passe par une corbeille. Rien ne part sans un clic de ta part.

Avant de t'en servir, lis l'[avertissement](AVERTISSEMENT.md) : un backup ne vaut que s'il est vérifié, et Miroir est fourni sans garantie.

## 1. Installer

Une ligne dans le Terminal (Applications → Utilitaires → Terminal), puis Entrée :

```bash
curl -fsSL https://raw.githubusercontent.com/groupemarcdorcel-creator/miroir-releases/main/installer.sh | bash
```

Miroir s'installe dans Applications et se lance. Ensuite, il vérifie à chaque lancement s'il existe une version plus récente et te la propose. L'installation ne part que sur ton clic.

## 2. Désigner une paire

Une paire, c'est un master et un backup.

1. **Master** : le dossier ou le disque à protéger. Il ne recevra rien.
2. **Backup** : le dossier ou le disque qui *contient* les sauvegardes. Miroir y crée un sous-dossier au nom du master, et c'est ce sous-dossier qui devient la copie. Plusieurs masters peuvent donc partager le même disque de backup.
3. **Désigner**. Miroir vérifie que les deux ne se contiennent pas l'un l'autre, écrit un petit fichier marqueur dans le sous-dossier (jamais sur le master) et prend une empreinte du master : nombre de fichiers et d'octets.

Si le sous-dossier existe déjà et n'est pas vide, Miroir compare son contenu au master. Il ne l'**adopte** que si au moins 80 % de ses fichiers existent à l'identique sur le master : un ancien backup passe, un dossier de documents ne passera jamais.

## 3. Analyser, puis sauvegarder

- **Analyser** lit les deux côtés et montre ce qui va se passer : à copier, à mettre à jour, à mettre en corbeille. Rien n'est modifié.
- **Sauvegarder** exécute ce que l'analyse a montré, après confirmation. Les fichiers en trop vont dans une corbeille datée sur le backup, puis les mises à jour et les copies sont faites une par une. **Pause** et **Arrêter** sont là pendant toute l'opération. À la fin, un rapport, que tu peux enregistrer en texte.
- **Tout analyser** et **Tout sauvegarder**, en bas, enchaînent les paires présentes une par une.

L'analyse bloque quand quelque chose ne colle pas : master vide, pas assez de place, plus de 10 % des fichiers du backup à retirer, ou un master qui a perdu plus de la moitié de son contenu depuis la dernière fois. Dans les deux derniers cas, un bouton **Continuer quand même** permet de passer après une confirmation : les fichiers retirés vont en corbeille, rien n'est irréversible.

## 4. La corbeille

Chaque passage qui a retiré des fichiers a son dossier dans la corbeille du backup (`.miroir-corbeille/<date>/`). Sous la carte, « Corbeille et journal de ce backup » montre les passages : **Restaurer** remet les fichiers à leur place, **Supprimer** les efface pour de bon. Purge automatique après 30 jours. Le journal, lui, liste tout ce qui a été copié, mis à jour ou mis en corbeille, passage par passage.

## 5. Contrôle complet

L'analyse compare tailles et dates, pas le contenu. Le **Contrôle complet** relit tous les fichiers des deux côtés et compare leurs empreintes. C'est long, à lancer une nuit de temps en temps. Les fichiers différents sont ajoutés aux mises à jour : un clic sur Sauvegarder les recopie depuis le master.

Le réglage « Contrôle complet automatique » lance ce contrôle un jour et une heure par semaine, à condition que le Mac soit allumé. Une notification résume.

## 6. Backup chiffré

À la désignation, coche **Chiffrer ce backup**. Miroir crée dans le dossier choisi une image disque chiffrée (AES-256) et la copie vit dedans. Tant que l'image est fermée, personne ne peut lire le backup, pas même Miroir.

- La phrase secrète fait au moins 8 caractères. Elle est vérifiée en ouvrant l'image, puis rangée dans le trousseau de ce Mac : Miroir rouvre le backup tout seul.
- **Verrouiller et éjecter** ferme l'image puis éjecte le disque, pour le débrancher.
- **Déverrouiller** rouvre l'image. Sur un autre Mac, ou si le trousseau ne l'a plus, il demande la phrase une fois.
- Pour relire le backup sans Miroir : double-clic sur l'image dans le Finder, la phrase, et les fichiers sont là.
- **Si tu perds la phrase, le backup est perdu.** Personne ne peut la retrouver. Note-la dans ton gestionnaire de mots de passe avant de créer l'image.

Le chiffrement se choisit à la désignation : on ne chiffre pas un backup existant, on en désigne un nouveau. macOS seulement.

## 7. Au quotidien

- Chaque carte affiche « Dernière sauvegarde il y a N » avec les comptes du dernier passage, en orange au-delà de sept jours ou s'il y a eu des erreurs.
- **Éjecter** sort le disque de backup proprement. Sur exFAT, c'est là que se joue la corruption : éjecte avant de débrancher.
- La case « Analyser automatiquement au branchement » lance une analyse à chaque disque branché, et te prévient par une notification s'il y a quelque chose à faire. Jamais de sauvegarde automatique.
- L'option « Relire chaque fichier copié » relit chaque copie hors cache et compare son empreinte à la source avant de lui donner son vrai nom. Plus lent, plus sûr, conseillé avec un câble ou un disque dont on doute.
- Une sauvegarde interrompue brutalement (disque arraché, Mac éteint) est signalée au lancement suivant, avec le contrôle complet en un clic. Une copie interrompue reprend là où elle en était.

## 8. Que faire si…

- **« Le disque n'est pas branché »** : branche-le. Si le volume est monté sous un autre nom (« Medias 1 »), Miroir le retrouve quand même.
- **« Un dossier existe mais ce n'est pas celui qui a été désigné »** : un dossier du même nom a été recréé au même endroit. Vérifie que c'est le bon disque. Si oui, retire la paire et désigne-la à nouveau.
- **« Le master a beaucoup rétréci »** : presque toujours un disque mal monté ou un dossier recréé. Vérifie avant de continuer.
- **Le backup chiffré est verrouillé** : clique sur Déverrouiller. S'il demande la phrase, c'est que le trousseau ne l'a plus.
- **Le disque ne répond plus** : Miroir le dit en rouge. Retire le disque, le passage suivant reprend le fichier interrompu.
- **Je veux arrêter d'utiliser Miroir** : retire les paires, puis supprime l'application. Les backups restent lisibles tels quels (ou avec la phrase, s'ils sont chiffrés) ; les fichiers `.miroir-*` sur le backup peuvent être effacés.

## 9. Ce que Miroir ne fait pas

Pas de synchronisation dans les deux sens, pas de sauvegarde vers le réseau ou le cloud, pas de sauvegarde automatique sans clic, pas de version Windows. Les fichiers de Miroir sur le backup commencent tous par `.miroir-`.
