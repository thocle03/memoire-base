# Résumé des Évolutions du Mémoire (de la Version 18 à la Version 21)

Ce document récapitule les modifications et les optimisations apportées au mémoire entre la **version 18** et la **version 21 (dernière version en date)**. Ces ajustements visent à renforcer la cohérence scientifique du mémoire, à améliorer sa lisibilité et sa structure pour le jury, et à corriger les incohérences de mise en page.

---

## 1. Synthèse Globale des Modifications

Les révisions effectuées se répartissent en quatre grands axes :
1. **Restructuration et cohérence éditoriale** : Clarification de la structure globale et harmonisation des transitions.
2. **Intégration du contexte professionnel (Stage)** : Précisions sur les travaux menés à *VinUniversity* (Hanoï) servant de socle aux simulations physiques.
3. **Élimination des redondances** : Nettoyage des paragraphes doublons, notamment dans l'analyse des performances informatiques.
4. **Correction et mise en conformité des listes** : Alignement de la table des figures et des tableaux avec le contenu réel du texte, et insertion des illustrations manquantes.

---

## 2. Détail des Changements par Chapitre et Section

### Introduction Générale
* **Annonce des chapitres** : Mise à jour complète du paragraphe d'annonce pour refléter la structure réelle en **4 chapitres** (les versions précédentes faisaient encore référence à une structure à 3 chapitres).
* **Remerciements & Mots-clés** : Légères corrections typographiques et ajustement des mots-clés de recherche pour le référencement du mémoire.

### Chapitre 1 : Contexte du Problème Computationnel
* **Titres des sections** : Harmonisation et correction de la numérotation des sous-sections pour une meilleure fluidité de lecture.

### Chapitre 2 : Construction de la Base de Connaissance (Modélisation)
* **Restructuration de la mise en page** : Réorganisation des équations physiques de SUMO et du modèle de Krauß afin d'assurer un enchaînement plus logique des concepts mathématiques.
* **Explications physiques** : Intégration des explications textuelles directement après les équations (suppression des en-têtes répétitifs du type *"Explication physique de la formule"*).

### Chapitre 3 : Élaboration du Modèle Prédictif (Analyse Spectrale & Machine Learning)
* **Reformulation de la section 3.1.7 (Tableau 2)** :
  * La liste à puces décrivant les métriques spectrales de non-normalité (non-normalité, rayon spectral, sigma max, norme $H_2$, constante de Kreiss) a été transformée en un **paragraphe rédigé continu**.
  * Retrait de toutes les mises en gras superflues et des majuscules inutiles pour fluidifier le style académique.
  * Ajout d'une phrase d'introduction claire avant le Tableau 2 expliquant la signification générale des colonnes.
* **Explications cinématiques** : Intégration des descriptions cinématiques directement dans le corps de texte après les formules.

### Chapitre 4 : Applications Empiriques, Études de Cas et Validations Comparatives
* **Section 4.1 (Internship à VinUniversity)** :
  * Ajout et enrichissement du contexte de stage pour justifier l'acquisition des données locales et l'étalonnage initial de SUMO à l'aide de la vision par ordinateur (YOLOv8) sur le campus de Vinhomes.
  * Remplacement de 3 figures d'illustration redondantes par un tableau synthétique unique (**Tableau 4e**), allégeant visuellement cette partie.
* **Section 4.2.5 (Validation Croisée - *Cross-City*)** :
  * Réintégration physique de la **Figure 2** (le scatter plot de corrélation et d'analyse des résidus entre les prédictions de l'IA et la vérité terrain de SUMO sur les 27 scénarios de test). Cette figure était listée dans les illustrations mais absente du corps du texte.
* **Section 4.2.6 (Optimisation et temps de calcul)** :
  * **Suppression des redondances** : Retrait complet de la sous-section *##### A. Description du processus séquentiel de calcul* qui répétait inutilement les étapes du pipeline déjà décrites dans le chapitre 3.
  * **Réorganisation** : Ré-indexation des sous-sections suivantes (de B, C, D vers A, B, C) pour conserver une numérotation continue sans saut logique.
  * Nettoyage des paragraphes concernant le pipeline d'évaluation pour éviter les redites sur le temps d'inférence.

---

## 3. Mise en Conformité des Listes de Documents

Pour éliminer les écarts entre les index de début de document et le corps du mémoire, les corrections suivantes ont été appliquées :
* **Liste des Illustrations** : Ajustement des pointeurs de chapitres pour les figures (les figures du chapitre 4 pointent désormais correctement vers le *Chapitre 4* et non le *Chapitre 3*).
* **Liste des Tableaux** :
  * Suppression des tableaux listés qui n'apparaissaient pas dans le texte final (**Tableaux 4b, 4c, 4d** et **Tableaux 6c, 6d, 6e**).
  * Les tableaux situés en annexes (**Tableaux 7, 8, 9**) ont été correctement indexés avec la mention *(*Annexes*)*.
  * Correction du Tableau 1 (*Caractéristiques topologiques générales*) et du Tableau 2 (*Métriques spectrales*) pour correspondre exactement à leur intitulé dans le document.

---

## 4. Tableau Récapitulatif des Versions

| Version | Modifications Majeures | Statut Cohérence |
| :--- | :--- | :--- |
| **V18** | Version initiale avec le corpus de 242 simulations et l'analyse spectrale. | Présence de figures manquantes et de légendes incohérentes. |
| **V19** | Ajout du contexte de stage à Hanoï (*VinUniversity*) et remerciements associés. | Structure de l'annonce d'introduction non à jour (indiquait 3 chapitres au lieu de 4). |
| **V20** | Restructuration de la mise en page des équations et suppression des sauts de page inutiles. | Redondances détectées dans la partie 4.2.6 (processus séquentiel). |
| **V21 (Actuelle)** | Suppression des sections redondantes (4.2.6.A), intégration de la Figure 2, reformulation continue de la section 3.1.7 (sans gras/capitales inutiles), nettoyage final des listes de tableaux et d'illustrations. | **Prêt pour soutenance / relecture finale.** |
