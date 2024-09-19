#!/bin/bash

# Chemin vers le répertoire de votre projet
PROJECT_DIR=~/Documents/courses

# Message de commit par défaut (vous pouvez le personnaliser ou le rendre dynamique)
COMMIT_MESSAGE="Mise à jour automatique du contenu"

# Se déplacer vers le répertoire du projet
cd $PROJECT_DIR || exit

# Vérifier l'état du dépôt Git
git status

# Ajouter tous les nouveaux fichiers, modifications et nouveaux dossiers
git add .

# Vérifier s'il y a des modifications à committer
if git diff-index --quiet HEAD --; then
    echo "Aucun changement à committer"
else
    # Demander un message de commit personnalisé à l'utilisateur
    read -p "Entrez le message de commit (ou appuyez sur Entrée pour utiliser le message par défaut) : " USER_COMMIT_MESSAGE

    # Utiliser le message par défaut si l'utilisateur n'a pas fourni de message personnalisé
    if [ -z "$USER_COMMIT_MESSAGE" ]; then
        USER_COMMIT_MESSAGE=$COMMIT_MESSAGE
    fi

    # Créer un commit avec le message choisi
    git commit -m "$USER_COMMIT_MESSAGE"
    
    # Pousser les modifications vers la branche principale sur GitHub
    git push origin main
    
    echo "Modifications poussées vers GitHub avec succès"
fi


