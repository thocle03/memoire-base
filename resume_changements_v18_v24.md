# Résumé des Évolutions du Mémoire (de la Version 18 à la Version 24)

Ce document récapitule les modifications et les optimisations apportées au mémoire entre la **version 18** et la **version 24 (dernière version en date)**. Ces ajustements visent à renforcer la rigueur académique du mémoire, à harmoniser les notations mathématiques, à intégrer des éléments de modélisation dynamique et à corriger les incohérences de mise en page pour la présentation finale au tuteur.

---

## 1. Synthèse Globale des Évolutions

Les révisions effectuées se répartissent en cinq grands axes :
1. **Restructuration et cohérence éditoriale (v19-v21)** : Clarification de la structure globale, mise à jour des annonces de chapitres pour refléter les 4 chapitres réels, et harmonisation des transitions.
2. **Contexte professionnel de stage (v19-v20)** : Précisions sur les travaux menés à *VinUniversity* (Hanoï) avec étalonnage par vision par ordinateur (YOLOv8) servant de base aux simulations physiques.
3. **Optimisation cinématique et simulation (v22)** : Mise à jour complète du tableau des simulations du réseau routier pour refléter les runs physiques réels sous SUMO.
4. **Précision et rigueur de l'analyse spectrale (v24)** :
   - Insertion de notes explicatives et de bas de page rigoureuses justifiant le choix des outils mathématiques dans le cadre de matrices non normales.
   - Rectification de coquilles dans les expressions mathématiques (notations de $\rho(A)$ et de $\approx$ corrigées).
   - Francisation et nettoyage typographique des tableaux de résultats (Tableaux 2 et 2b).
5. **Élimination des redondances et nettoyage typographique (v21-v24)** :
   - Retrait des en-têtes redondants et des sections répétitives dans le chapitre 4 (inférence et temps de calcul).
   - Suppression systématique des mises en gras et des majuscules superflues dans le corps des sections 3.1.1 à 3.1.8 pour respecter les conventions d'écriture académique.

---

## 2. Détail des Modifications par Version

### Version 19
* **Contexte de stage à Hanoï** : Enrichissement de la section 4.1 décrivant l'étalonnage cinématique par vision par ordinateur (campus de Vinhomes, VinUniversity).
* **Remerciements et introduction** : Correction de l'annonce des chapitres dans l'introduction générale pour passer à une description cohérente en 4 chapitres.

### Version 20
* **Mise en page des équations** : Réorganisation des modèles physiques de SUMO (modèle de Krauß) et enchaînement plus naturel des descriptions mathématiques.
* **Suppression des en-têtes répétitifs** : Retrait des phrases d'introduction redondantes devant chaque explication de formule.

### Version 21
* **Nettoyage du Chapitre 4 (Section 4.2.6)** : Suppression complète de la sous-section d'explication séquentielle redondante et réorganisation des sections suivantes.
* **Intégration de la Figure 2** : Réintégration physique du nuage de points de validation croisée (*Cross-City*) entre les prédictions du modèle d'IA et SUMO.
* **Mise en conformité des listes** : Nettoyage des listes des illustrations et des tableaux pour éliminer les références fantômes (tableaux listés mais inexistants).

### Version 22
* **Mise à jour des simulations** : Révision complète et actualisation du tableau récapitulatif des runs de simulation cinématique SUMO pour 13 métropoles.

### Version 23
* **Validation de la compilation** : Stabilisation de la chaîne de compilation automatique Pandoc -> LaTeX pour intégration Overleaf.

### Version 24 (Actuelle)
* **Intégration de 4 illustrations géospatiales (SIG)** : Insertion des heatmaps et tracés SIG de congestion pour les villes tests (dont Versailles et Paris) à leurs emplacements dédiés dans le texte.
* **Ajout de notes et bas de page rigoureuses** :
  - **Footnote 1 (Section 3.1.3)** : Clarification sur le fait que la matrice d'adjacence $A$ étant non symétrique et non normale, ses valeurs propres sont complexes ($\sigma(A) \subset \mathbb{C}$) et non diagonalisables dans $\mathbb{R}$.
  - **Footnote 2 (Section 3.1.8)** : Justification physique de l'utilisation de la théorie des perturbations de Kato pour gérer le cas des matrices d'adjacence non normales (non diagonalisables ou présentant des points exceptionnels d'intersection), là où la théorie classique des perturbations échoue.
* **Correction des coquilles de notation mathématique** :
  - Remplacement de toutes les occurrences erronées de `$ho(A)$` par `$\rho(A)$` (rayon spectral).
  - Remplacement de toutes les occurrences de `pprox` par `\approx` (approximation).
* **Harmonisation et francisation du Tableau 2** :
  - Traduction des en-têtes en français (`Ville`, `Non-normalité`, `Rayon spectral`, `Sigma max`, `Norme H2`, `Constante de Kreiss`).
  - Suppression des balises de mise en gras inutiles autour des noms de villes.
* **Harmonisation du Tableau 2b** :
  - Traduction et suppression des balises de mise en gras sur les noms des descripteurs spectraux à gauche.
* **Nettoyage typographique général** : Suppression de toutes les mises en gras et majuscules superflues dans le texte courant jusqu'à la section 3.1.8 pour garantir un ton académique sobre.

---

## 3. Tableau Récapitulatif des Versions pour le Tuteur

| Version | Focus Principal | Statut |
| :--- | :--- | :--- |
| **V18** | Version initiale avec le corpus de 242 simulations et l'analyse spectrale. | Présence de figures manquantes et de légendes incohérentes. |
| **V19-v20** | Intégration du contexte de stage (YOLOv8, VinUniversity) et correction de la mise en page des formules. | Annonces de chapitres obsolètes dans l'introduction. |
| **V21** | Nettoyage des sections redondantes (4.2.6), intégration de la Figure 2 de validation, et cohérence des tables des matières. | Tableau des simulations non finalisé. |
| **V22-v23** | Mise à jour complète du tableau récapitulatif des runs de simulation cinématique. | Manque d'illustrations SIG et de précision sur la non-normalité. |
| **V24 (Actuelle)** | Insertion des 4 figures de tracés SIG, ajout des footnotes mathématiques de Kato et Perron-Frobenius, francisation des tableaux, correction des notations spectrales et nettoyage typographique global. | **Version finale prête à être présentée.** |
