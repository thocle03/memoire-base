# Résumé des Évolutions du Mémoire (de la Version 29 à la Version 30)

Ce document récapitule les modifications et les optimisations apportées au mémoire pour produire la **version 30**. L'objectif principal de cette révision était de nettoyer la syntaxe et d'adapter le style rédactionnel afin d'éliminer les formulations caractéristiques d'une génération automatique par intelligence artificielle (style "ChatGPT") et de rendre le ton plus naturel et académique.

---

## 1. Synthèse des Modifications Réalisées

Les modifications effectuées se répartissent selon les axes suivants :

### A. Simplification et Uniformisation des Titres
Les titres longs, démonstratifs ou redondants ont été raccourcis pour être simples et descriptifs. 
- *Exemple* : `### 1.2 Le verrou computationnel des micro-simulateurs physiques (SUMO)` a été remplacé par `## 1.2 Limites de la micro-simulation`.
- *Exemple* : `#### 4.2.4 Évaluation de transfert (cross-city) sur une ville cible non entraînée : cadre théorique de l'approche barycentrique` a été remplacé par `### 4.2.4 Évaluation du transfert de modèle`.

### B. Suppression Systématique du Gras (Exceptionnel)
La mise en gras (`**`) a été retirée du corps de texte pour toutes les occurrences qui mettaient en valeur des noms de villes, des chiffres, des résultats, des architectures ou des mots individuels sans justification académique. Le texte est désormais entièrement sobre et uniforme.
- *Exemple* : `Le **Modèle A** (trafic pur) n'atteint que $R^2 = 62{,}53\ %$` est devenu `Le Modèle A (trafic pur) n'atteint que $R^2 = 62{,}53\ %$`.
- *Exemple* : `propulsé le $R^2$ global à **82,44 %**, réduisant l'erreur quadratique moyenne de **17,2 %**` est devenu `propulsé le $R^2$ global à 82,44 %, réduisant l'erreur quadratique moyenne de 17,2 %`.

### C. Réduction des Listes à Puces et Passage au Style Rédigé
Plusieurs listes à puces ou numérotées trop denses ont été réécrites sous forme de paragraphes rédigés pour fluidifier la lecture.
- *Exemple* : La liste détaillant les limites (CPU, RAM, SWAP) au chapitre 1.2 a été transformée en trois paragraphes fluides décrivant précisément chaque limitation.
- *Exemple* : L'annonce des chapitres dans l'introduction et la liste des primitives OSM ont été converties en paragraphes fluides.

### D. Remplacement des Formulations Pédagogiques par un Ton Neutre
Toutes les expressions de type "cours enseignant" ou "objection artificielle" ont été remplacées par des formulations scientifiques directes.
- *Exemple* : `Une objection légitime consiste à demander : est-ce que ces métriques...` a été reformulé en `Pour évaluer l'apport des métriques spectrales...`.
- *Exemple* : `*Lecture des résultats :*` ou `*Lecture du tableau :*` ont été supprimés et intégrés au texte de transition.
- *Exemple* : Les termes démonstratifs comme `de rupture`, `verrou computationnel`, `sans ambiguïté` ont été simplifiés (e.g. `limite de calcul`, `limitation`).

### E. Élimination des Adverbes Superflus
Les adverbes à forte connotation emphatique ont été retirés ou remplacés par des synonymes plus sobres (e.g. *fondamentalement*, *considérablement*, *précisément*, *intrinsèquement*, *drastiquement*, *uniquement*).

---

## 2. Exemples Avant / Après Comparatifs

| Type de modification | Version 29 (Avant) | Version 30 (Après) |
| :--- | :--- | :--- |
| **Gras abusif & Adverbes** | L'introduction en V3 de descripteurs physiques d'interaction [...] a propulsé le $R^2$ global à **82,44 %**, réduisant l'erreur quadratique moyenne de **17,2 %** (soit 2,3 tonnes de $CO_2$ évitées d'incertitude par simulation). | L'introduction en V3 de descripteurs physiques d'interaction [...] a propulsé le $R^2$ global à 82,44 %, réduisant l'erreur quadratique moyenne de 17,2 % (soit 2,3 tonnes de $CO_2$ évitées d'incertitude par simulation). |
| **Formulation pédagogique** | *Lecture des résultats :* > - Le **Modèle A**... | L'analyse des résultats montre les points suivants : Le Modèle A... |
| **Objection artificielle** | Une objection légitime consiste à demander : est-ce que ces métriques (Kato, $H_2$, $H_\infty$) *améliorent* réellement les prédictions, ou ne sont-elles que des redondances mathématiques... | Pour évaluer l'apport des métriques spectrales (Kato, $H_2$, $H_\infty$) par rapport au volume de trafic ou à la taille du réseau, une analyse d'ablation a été réalisée. |
| **Passage en paragraphe** | `1. Limitation CPU : Le calcul du routage dynamique...` `2. Surcharge de la mémoire...` | La première limitation concerne le processeur (CPU). Le calcul du routage dynamique... La deuxième limitation porte sur la mémoire vive (RAM)... |
| **Simplification de Titre** | #### 3.2.4 Pipeline complet d'entraînement : de la carte OpenStreetMap au modèle IA (étape par étape) | ### 3.2.5 Pipeline d'entraînement |

---

## 3. Statut de la Compilation
Le script local `compile.ps1` a été exécuté avec succès. Les fichiers LaTeX correspondants ont été mis à jour :
- [REDACTION_MEMOIRE_NOUVEAU.md](file:///c:/Users/admin/Documents/memoire-base/REDACTION_MEMOIRE_NOUVEAU.md) $\rightarrow$ [memoire.tex](file:///c:/Users/admin/Documents/memoire-base/memoire.tex)
- [REDACTION_MEMOIRE_NOUVEAU (30).md](file:///c:/Users/admin/Documents/memoire-base/REDACTION_MEMOIRE_NOUVEAU (30).md) $\rightarrow$ [memoire (30).tex](file:///c:/Users/admin/Documents/memoire-base/memoire (30).tex)
