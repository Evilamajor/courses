#!/bin/bash

# Chemin vers le répertoire de votre projet
PROJECT_DIR=~/Documents/courses

# Message de commit par défaut (vous pouvez le personnaliser ou le rendre dynamique)
COMMIT_MESSAGE="Mise à jour automatique du contenu"

# Se déplacer vers le répertoire du projet
cd $PROJECT_DIR

# Vérifier l'état du dépôt Git
git status

# Ajouter tous les nouveaux fichiers, modifications et nouveaux dossiers
git add .

# Vérifier s'il y a quelque chose à committer
if git diff-index --quiet HEAD --; then
    echo "Aucun changement à committer"
else
    # Créer un commit avec un message
    git commit -m "$COMMIT_MESSAGE"
    
    # Pousser les modifications vers la branche principale sur GitHub
    git push origin main
    
    echo "Modifications poussées vers GitHub"
fi
