# ÉCOLE HEXAGONE
*Établissement d’enseignement supérieur privé*  
*Cursus Intelligence Artificielle (IA)*  


# RAPPORT PROFESSIONNEL DE FIN D'ÉTUDES

## Jumeaux Numériques et Intelligence Artificielle Topologique : Vers une prédiction instantanée de la résilience et des émissions urbaines
### (De la Micro-Simulation à l'Analyse Spectrale)

**Présenté par :** Thomas CLERC  
**Année Universitaire :** 2025-2026  

**Sous le tutorat de :**  
*   **M. Pierre UZARRALDE (IA)**, Professeur à l'École Hexagone  

**Co-encadrant de recherche (VinUniversity) :**  
*   **Équipe de recherche Smart Mobility**, VinUniversity (Hanoï, Vietnam)  

*Illustration de couverture : Jumeau Numérique Urbain et Signature Spectrale de Graphe*


\newpage

# REMERCIEMENTS

Je tiens à exprimer ma profonde gratitude à l'ensemble des personnes qui ont contribué au succès de ce travail de recherche et à l'aboutissement de mon cursus de fin d'études.

Tout d'abord, je remercie chaleureusement mon tuteur académique, **M. Pierre Uzarralde**, pour son suivi rigoureux, ses conseils méthodologiques et son exigence scientifique tout au long de la rédaction de ce rapport professionnel.

Mes remerciements s'adressent également aux équipes de recherche en mobilité intelligente de l'Université **VinUniversity** à Hanoï (Vietnam), qui m'ont accueilli lors de mon séjour de recherche et m'ont fourni les moyens matériels et de collecte de données nécessaires à cette étude.

Je remercie particulièrement les groupes **Vingroup**, **VinFast** et **V-Green** pour l'accès aux données opérationnelles du hub de recharge ultra-rapide de Sao Bien (Vinhomes Ocean Park), ainsi que la compagnie **GSM (Green and Smart Mobility)** pour les données relatives à leur flotte de taxis électriques.

Enfin, je remercie l'administration et le corps enseignant de l'**École Hexagone** pour la qualité de l'enseignement dispensé, ainsi que ma famille et mes proches pour leur soutien indéfectible durant cette année académique.


\newpage

# RÉSUMÉ & MOTS-CLÉS

### Résumé
Ce mémoire de fin d'études présente un cadre méthodologique de recherche pour l'évaluation et la prédiction de la résilience cinématique et environnementale des réseaux de transport urbain face à la transition vers l'électromobilité. La planification des infrastructures de recharge à haute puissance en milieu dense se heurte à une double contrainte : l'hybridation des flux cinématiques et énergétiques, et la lenteur computationnelle des micro-simulateurs physiques multi-agents comme SUMO. Ce travail de recherche s'articule autour d'un double objectif complémentaire. 

D'une part, nous développons des jumeaux numériques microscopiques de haute-fidélité calibrés par vision par ordinateur (YOLOv8) sur l'avenue Sao Bien à Hanoï (Vinhomes Ocean Park), documentant des comportements stochastiques d'arrêt (*Dwell Time*) et l'inversion modale de trafic lors des vacances (« Holiday Reversal »). 

D'autre part, nous proposons une méthode de rupture basée sur l'**Intelligence Artificielle Topologique Spectrale**. En exploitant la structure mathématique non-normale de la matrice d'adjacence du réseau urbain (rayon spectral, constante de Kreiss, perturbations de Kato) et l'algorithme XGBoost, notre modèle prédictif en cascade à deux niveaux estime de manière instantanée les émissions globales de $CO_2$. Les résultats démontrent une précision de prédiction supérieure à 95 % (RMSE de 15,5 tonnes de $CO_2$) et un temps d'exécution de 0,2 seconde, éliminant les goulots d'étranglement computationnels (surcharge RAM/SWAP) et ouvrant la voie à des boucles d'optimisation hybrides (IA-SUMO) pour les planificateurs de la ville intelligente.

### Mots-clés
Jumeau Numérique, Micro-simulation, SUMO, Analyse Spectrale, Graphes Non-Normaux, Constante de Kreiss, Théorie des Perturbations de Kato, XGBoost, Mobilité Durable, Vinhomes Ocean Park, Hanoï.


\newpage

# LISTE DES ILLUSTRATIONS

*   **Figure 1 :** Morphologie géométrique et contraintes d'accès du hub de recharge de Sao Bien (12 bornes en épi à 135 degrés) et de la zone d'attente de taxis GSM le long de la voie de service. (*Chapitre 8*)
*   **Figure 2 :** Représentation schématique du flux de circulation et du tissage des motocyclistes au niveau de l'insertion sur l'avenue Sao Bien. (*Chapitre 8*)
*   **Figure 3 :** Répartition modale comparée du fluide de trafic lors d'un midi de semaine classique (*Regular Midday Baseline*) face à l'inversion modale observée en période de congés (*Holiday Reversal*). (*Chapitre 8*)
*   **Figure 4 :** Pipeline de prédiction en cascade à deux niveaux (*Two-Stage Cascade Model*) pour l'estimation de la vitesse moyenne ajustée et des émissions de $CO_2$ finales sous intempéries régionalisées. (*Chapitre 7*)


\newpage

# LISTE DES TABLEAUX

*   **Tableau 1 :** Caractéristiques topologiques générales des 21 villes étudiées (nombre de nœuds, d'arêtes, densité de connexion, degré moyen, indice d'asymétrie, ratio de sources et de puits). (*Chapitre 6*)
*   **Tableau 2 :** Métriques spectrales de non-normalité des matrices d'adjacence non pondérées pour les 21 réseaux urbains (asymétrie, rayon spectral, valeur singulière maximale, norme $H_2$, constante de Kreiss). (*Chapitre 6*)
*   **Tableau 3 :** Performances comparatives des modèles d'apprentissage machine pour la prédiction des émissions de $CO_2$ (RMSE, MAE, $R^2$ de XGBoost, Ridge, Random Forest et MLP). (*Chapitre 7*)
*   **Tableau 4 :** Profil d'importance des variables (*Feature Importance*) dans le modèle final de prédiction de $CO_2$ par XGBoost. (*Chapitre 7*)
*   **Tableau 5 :** Taille géométrique des fichiers net.xml sur disque et occupation correspondante de la mémoire RAM en Python (filtrage DOM via sumolib) pour cinq villes types. (*Chapitre 9*)
*   **Tableau 6 (Annexe A) :** Indicateurs macroscopiques des 17 simulations complètes exécutées dans le framework multi-villes agnostique (véhicules, vitesse moyenne, $CO_2$ émis, conditions météo, taux d'adoption EV, temps d'exécution). (*Annexes, Annexe A*)
*   **Tableau 7 (Annexe B) :** Répartition des tonnages de $CO_2$ émis par classe de véhicule de la flotte (voitures, motos, bus, camions) pour les 17 simulations de référence. (*Annexes, Annexe B*)
*   **Tableau 8 (Annexe C) :** Profil de performance informatique détaillé des exécutions CPU (temps de routage Dijkstra, calcul physique SUMO, parsing XML, durée totale). (*Annexes, Annexe C*)


\newpage

# INTRODUCTION GÉNÉRALE

### Contexte Global : Anthropocène, Urbanisation Accélérée et Électrification des Mobilités

L’humanité est entrée de plain-pied dans l’ère de l’Anthropocène, une époque géologique inédite caractérisée par l’empreinte prédominante et irréversible des activités humaines sur l’ensemble des systèmes géophysiques terrestres. Au cœur de cette grande accélération se trouve le phénomène urbain. Les villes, bien qu’elles n’occupent géographiquement que 3 % de la surface émergée de la Terre, concentrent aujourd’hui plus de 55 % de la population mondiale — un chiffre qui devrait atteindre 68 % d’ici 2050. Cette concentration démographique fait des zones urbaines les principaux moteurs du changement climatique global : elles consomment près de 78 % de l’énergie primaire mondiale et génèrent plus de 70 % des émissions anthropiques de gaz à effet de serre. Dans cette équation environnementale critique, le secteur des transports routiers représente le nœud le plus complexe à délier, étant responsable à lui seul de près de 25 % des émissions de dioxyde de carbone ($CO_2$) à l'échelle planétaire (City of Paris, 2024).

Parallèlement à cette urgence climatique globale, les dynamiques contemporaines d'urbanisation se caractérisent par des processus de densification d'une rapidité et d'une intensité sans précedent, particulièrement visibles au sein des économies émergentes d'Asie du Sud-Est. Le Vietnam, engagé dans une transition économique majeure, illustre de manière paradigmatique cette métamorphose. La capitale, Hanoï, voit sa périphérie se structurer autour de méga-projets d'aménagement intégrés appelés "master-planned communities". Le complexe résidentiel et commercial *Vinhomes Ocean Park*, conçu pour accueillir à terme près de 90 000 résidents sur des surfaces autrefois à vocation agricole, est le symbole de cette verticalisation et de cette densification extrêmes. Actuellement habité par environ 60 000 personnes, ce tissu urbain dense concentre des flux de mobilité massifs et hétérogènes sur des voiries fermées, engendrant une congestion récurrente et une dégradation accélérée de la qualité de l'air local.

Pour faire face à la double contrainte de l'explosion des besoins de mobilité et de l'impératif de décarbonation, la transition vers l’électrification globale des flottes s'est imposée comme le pivot central des stratégies publiques et industrielles de transport. Sous l'impulsion d'acteurs industriels nationaux d'envergure globale comme le constructeur *VinFast*, le Vietnam s'est engagé dans un plan de conversion accéléré de ses vecteurs de transport (mobilité individuelle par deux-roues électriques, véhicules particuliers et bus électriques pour le transport de masse). 

Toutefois, cette transition technologique ultra-rapide se heurte à un verrou infrastructurel majeur. L'implantation de hubs de recharge à haute puissance (High Power Charging Hubs), indispensables pour maintenir la viabilité opérationnelle des flottes électriques en milieu dense, perturbe profondément le fonctionnement du réseau viaire existant. La recharge rapide de batteries implique des puissances de l'ordre de plusieurs mégawatts concentrées sur des points précis du territoire. L'aménagement urbain moderne doit donc aujourd'hui composer avec des systèmes hybrides complexes, où les flux cinématiques de véhicules convergent vers des ressources énergétiques ponctuelles, créant des interactions non-linéaires entre congestion routière, contraintes de réseau électrique et dynamique de recharge.


### Le Verrou Technique : Lenteur Computationnelle des Micro-Simulateurs et Inertie Décisionnelle

Dans ce contexte d'hybridation des contraintes urbaines, la planification et la prise de décision souffrent historiquement d'une forte inertie. Les outils d'ingénierie du trafic traditionnels, principalement basés sur des modélisations macroscopiques statiques ou des approximations fluides simplifiées, s'avèrent incapables de capturer les comportements hautement non-linéaires et les instabilités caractéristiques des réseaux saturés. Des phénomènes critiques tels que les ondes de choc de freinage arrière, les situations de blocage géométrique complet aux intersections (*gridlocks*), ou la dynamique fine des files d'attente à l'accès d'une infrastructure de recharge ne peuvent être appréhendés par des approches globales moyennes.

Pour répondre à ce besoin de précision, la recherche en ingénierie des transports a développé des frameworks de micro-simulation dynamique multi-agents haute-fidélité, au premier rang desquels figure le progiciel open-source **SUMO** (Simulation of Urban MObility) (Krajzewicz et al., 2012). Ces simulateurs microscopiques permettent de modéliser le comportement de chaque véhicule individuel seconde par seconde, en intégrant des lois physiques rigoureuses de poursuite de véhicules (car-following) et de changement de voie. Cette approche granulaire offre une précision inégalée pour estimer les temps de parcours réels, identifier les goulots d'étranglement locaux et quantifier les émissions instantanées de polluants à partir de banques de données de facteurs d'émissions calibrées (HBEFA3) (Kratzsch et al., 2020).

Cependant, cette fidélité de modélisation physique se heurte à une barrière computationnelle majeure. La micro-simulation multi-agent est un processus intrinsèquement séquentiel et lourd en termes de calcul processeur. L'évaluation continue des équations différentielles cinématiques pour chaque agent, le calcul des distances de sécurité, la résolution des conflits géométriques aux intersections complexes et la gestion des états de signalisation dynamique représentent une charge de calcul phénoménale. 

Lorsqu'un planificateur urbain doit concevoir l'aménagement optimal d'une infrastructure critique — comme l'emplacement et le dimensionnement d'une station de recharge rapide dans une zone résidentielle dense — il fait face à un problème d'optimisation combinatoire complexe. Tester 1 000 configurations d'aménagement possibles à l'aide de simulations microscopiques classiques requiert des centaines d'heures de calcul processeur continu. De plus, à l'échelle de réseaux métropolitains de grande taille (dont les fichiers géométriques dépassent fréquemment le gigaoctet), la micro-simulation sature la mémoire vive des ordinateurs de bureau standard, provoquant des lenteurs extrêmes liées aux écritures disque virtuelles (mécanisme de SWAP). Cette contrainte temporelle interdit l'usage des simulateurs physiques pour la décision interactive ou pour des boucles d'optimisation automatique en temps réel. Le développement d'outils combinant la fidélité de la micro-simulation et la réactivité instantanée est le défi technique majeur traité dans ce mémoire.


### Double Objectif de la Recherche et Positionnement Académique

Afin de briser ce verrou technologique sans consentir à des simplifications dégradant la pertinence scientifique des résultats, ce mémoire de fin d'étude se structure autour d'un double objectif méthodologique complémentaire. Nous proposons de dépasser la frontière traditionnelle entre la précision lente locale et l'approximation rapide globale en articulant nos recherches selon deux axes distincts et synergiques.

Le premier axe vise à démontrer l'efficacité et la rigueur de la micro-simulation microscopique pour l'évaluation chirurgicale d'infrastructures locales complexes. En partant de réseaux routiers authentiques modélisés sous forme de graphes topologiques orientés, nous développons des jumeaux numériques multi-agents dynamiques intégrant des physiques de déplacement avancées et des modèles de combustion/émissions validés (HBEFA3). Ce premier volet se concentre sur l'acquisition de données réelles et la calibration physique fine du comportement cinématique des véhicules face aux infrastructures de recharge rapide.

Le second axe de recherche propose une rupture conceptuelle majeure. Il s'agit de s'affranchir définitivement du coût de calcul de la simulation physique en introduisant le concept d'Intelligence Artificielle Topologique Spectrale. L'hypothèse scientifique fondatrice de cet axe stipule que la structure géométrique et topologique intrinsèque du graphe routier (son squelette mathématique) contient de manière déterministe les signatures de sa dynamique sous charge (niveaux de congestion et volume d'émissions de $CO_2$). En extrayant les signatures spectrales de la matrice d'adjacence non-symétrique associée au réseau urbain (Boeing, 2017) et en exploitant des concepts issus de l'analyse non-normale (Trefethen & Embree, 2005) et de la théorie des perturbations d'opérateurs (Kato, 1995), nous construisons un moteur prédictif capable de se substituer au simulateur physique en une fraction de seconde, offrant un outil d'aide à la décision d'une agilité inédite pour les planificateurs de la ville intelligente.


### Annonce Détaillée de la Structure du Mémoire

Pour exposer cette recherche avec toute la rigueur universitaire requise, ce mémoire est structuré selon le plan logique suivant :

La **Première Partie** est dédiée à la collecte et à l'analyse des données de terrain, ainsi qu'à la constitution du jeu de données multi-villes. Elle décrit le protocole d'observation mis en œuvre à Vinhomes Ocean Park (Hanoï) pour acquérir la vérité terrain de la mobilité sous forte densité, présente les technologies de vision par ordinateur utilisées pour la détection des flottes hétérogènes, et détaille le processus d'audit de données qui a révélé des biais systématiques de détection. Enfin, elle formalise la constitution de notre base d'apprentissage multi-villes à grande échelle issue de simulations de référence pour l'entraînement de notre IA.

La **Deuxième Partie** pose les fondations techniques et théoriques de nos modèles. D'une part, elle détaille le fonctionnement interne du simulateur SUMO (équations de poursuite de Krauß, connexité et algorithme de Tarjan). D'autre part, elle présente le formalisme de l'analyse spectrale des graphes asymétriques et de la théorie des perturbations de Kato, avant de détailler la conception de notre métamodèle d'intelligence artificielle prédictif direct.

La **Troisième Partie** confronte ces outils théoriques à des applications concrètes. Elle présente en premier lieu l'étude de cas localisée du hub de recharge de Sao Bien à Hanoï (Chapitre 8), modélisant les dynamiques de files d'attente et le comportement stochastique des sessions de recharge. En second lieu, elle déploie un cadre expérimental global (Chapitre 9) pour tester la généricité de notre modèle sur six réseaux urbains mondiaux de morphologies contrastées, comparant les exigences computationnelles (temps CPU, empreinte mémoire RAM) de la micro-simulation physique face à notre modèle d'intelligence artificielle spectral.


\newpage

# PREMIÈRE PARTIE : ACQUISITION DES DONNÉES, PROTOCOLE DE COLLECTE ET CONTEXTES DE MOBILITÉ



## Chapitre 1 : Contexte démographique et modélisation de la transition électrique

### Le paradigme des villes intelligentes et de la décarbonation des systèmes de transport

La transition vers la ville intelligente ("Smart City") ne se résume pas à l'intégration superficielle de technologies de communication au sein de l'espace urbain ; elle constitue une réponse structurelle à l'impératif de décarbonation. Dans l'architecture d'une métropole moderne, les systèmes de transport représentent l'un des principaux réservoirs d'optimisation carbone. Les politiques publiques traditionnelles, basées sur l'expansion continue des capacités de voirie, ont montré leurs limites en se heurtant au phénomène de demande induite. La décarbonation requiert donc une approche combinée : la transition technologique des moteurs thermiques vers des systèmes de propulsion électrique, et l'optimisation dynamique des flux pour minimiser les pertes énergétiques associées à la congestion.

Cette restructuration des systèmes de transport impose de repenser la relation entre l'espace routier et le réseau d'alimentation en énergie. Que ce soit à Paris ou à Hanoï, les bornes de recharge s'insèrent dans le domaine public, sur les places de stationnement ou les voies de desserte commerciale. Cette hybridation physique transforme chaque point de recharge en un nœud d'attraction cinématique, modifiant localement la trajectoire des véhicules et perturbant l'écoulement des flux environnants.


### Le cadre d'étude vietnamien : Vinhomes Ocean Park (VHOP) et sa cinétique de croissance

Le développement rapide de l'Asie du Sud-Est s'accompagne d'une transition urbaine caractérisée par la construction de villes nouvelles planifiées en périphérie des centres historiques. Au Vietnam, ce modèle trouve son illustration dans le projet *Vinhomes Ocean Park* (VHOP), un complexe de 420 hectares situé à l'est de Hanoï. Conçu initialement comme une cité satellite résidentielle pour soulager la pression démographique du district historique de Hoan Kiem, VHOP a été dimensionné pour accueillir une population nominale de 90 000 habitants.

Cependant, la cinétique d'occupation de VHOP a dépassé les prévisions initiales. En 2023, le nombre de résidents permanents a franchi le seuil des 60 000 personnes, et les projections démographiques révisées indiquent que le site pourrait accueillir à terme plus de 200 000 résidents d'ici 2030 en raison de l'attractivité des infrastructures intégrées. En 2023, la population active présente sur site ne représentait que 30 % à 33 % de la capacité finale projetée. L'analyse des flux actuels montre que le réseau routier interne, bien que moderne, approche déjà de la saturation lors des heures de pointe.


### L'intégration des flottes électriques (VinFast) et la problématique infrastructurelle des hubs de recharge

Au cœur de la stratégie de mobilité de Vinhomes Ocean Park se trouve l'écosystème électrique porté par le groupe *Vingroup*, à travers sa filiale automobile *VinFast* et sa filiale de recharge *V-Green*. Les transports en commun internes sont assurés par des bus électriques (*VinBus*), et la flotte de taxis opérant sur le site est constituée en majorité de véhicules électriques de la compagnie *GSM (Green and Smart Mobility)*. 

Le cas d'étude de Sao Bien se focalise sur la station de recharge installée en bordure du *Vincom Mega Mall*, l'un des centres d'attraction majeurs du complexe. Ce hub est équipé de 12 bornes de recharge ultra-rapides d'une puissance unitaire de 150 kW DC. L'intégration d'une telle infrastructure génère des contraintes opérationnelles. D'une part, la demande électrique cumulée de la station peut atteindre 1,8 MW en période de pointe, imposant des contraintes de dimensionnement sur le réseau de distribution moyenne tension local. D'autre part, la géométrie d'accès à la station, configurée en stationnement en épi à 135 degrés le long d'une voie de service étroite, crée des conflits d'usage avec la file des taxis en attente de clients pour le centre commercial.


\newpage

## Chapitre 2 : Méthodologie de collecte de données terrain par vision par ordinateur

### L'infrastructure d'observation : Stratégie du 3ème étage (Vincom Mega Mall) et minimisation de l'occlusion

La collecte de données précises sur les flux de trafic en milieu urbain dense nécessite une méthodologie d'observation rigoureuse pour garantir la qualité des données d'entrée du jumeau numérique (voir Figures D.1 et D.2, Annexe D). Pour le site de Sao Bien, nous avons établi un poste d'observation temporaire au 3ème étage du *Vincom Mega Mall*, au niveau de la zone de restauration faisant face au corridor de circulation principal et au hub de recharge.

Ce positionnement en hauteur (angle d'observation incliné entre 30 et 45 degrés par rapport à l'horizontale) répond à une contrainte technique majeure : **la minimisation de l'occlusion visuelle**. Dans un contexte de trafic mixte caractéristique du Vietnam, où les flux comportent une part importante de deux-roues motorisés circulant de front avec des autobus et des SUV de gabarit important, une capture au niveau du sol souffre d'un biais de masquage systématique. La perspective plongeante du 3ème étage permet d'obtenir une vue dégagée "pseudo-orthogonale" du réseau, garantissant que chaque trajectoire de véhicule reste visible tout au long du segment d'analyse.


### Contraintes opérationnelles de prise de vue : Choix du format Portrait vs Paysage face aux obstacles géométriques

L'établissement de la ligne de visée depuis le 3ème étage du centre commercial a imposé des contraintes géométriques strictes liées à l'architecture du bâtiment. La présence de piliers de soutien en béton, de montants de fenêtres en aluminium et de vitrines de magasins obstruait une grande partie du champ visuel horizontal. 

L'analyse comparative des formats de capture a révélé les éléments suivants :
*   **Le format paysage (horizontal) :** Bien qu'adapté pour capturer la longueur du tronçon routier, il intégrait dans le cadre plusieurs obstacles physiques majeurs qui divisaient la zone d'intérêt en sous-sections disjointes, empêchant le suivi continu des trajectoires par l'algorithme de vision par ordinateur.
*   **Le format portrait (vertical) :** En orientant la caméra verticalement, nous avons pu aligner le champ de vision principal dans l'espace situé entre deux piliers consécutifs du bâtiment. Cette configuration a permis de cadrer de manière ininterrompue les trois zones critiques du corridor : la zone d'approche amont, la zone d'insertion du hub de recharge, et la zone de sortie vers le carrefour aval.


### Le pipeline de détection automatique et de classification de véhicules via YOLOv8

Pour automatiser l'extraction des données de trafic à partir des séquences vidéo haute définition capturées sur site, nous avons déployé un pipeline de traitement d'images basé sur le modèle de réseau de neurones convolutifs **YOLOv8** (You Only Look Once, version 8). 

Ce pipeline de vision par ordinateur fonctionne de la manière suivante :
1.  **Segmentation temporelle :** Les vidéos brutes sont découpées en segments de 10 minutes pour correspondre aux intervalles standards d'analyse de trafic.
2.  **Inférence et détection :** Le modèle YOLOv8 traite les trames vidéo avec un seuil de confiance de détection fixé à $0.50$.
3.  **Classification catégorielle :** Les objets détectés sont classés selon trois classes de véhicules : *Standard Car*, *Electric Vehicle*, et *Motorcycle*.
4.  **Suivi de trajectoire (Tracking) :** L'algorithme associe un identifiant unique à chaque boîte de délimitation à l'aide d'un filtre de Kalman et d'une matrice de coût basée sur le recouvrement spatial des boîtes (Intersection over Union - IoU) entre trames successives.


\newpage

## Chapitre 3 : Traitement, audit et correction des données de trafic brutes

### Analyse des biais de classification de l'IA et application du facteur de correction systématique

Malgré l'efficacité de l'architecture YOLOv8 pour la détection automatique, la phase d'audit qualité des données a mis en évidence un biais de classification systématique lors de l'analyse des flux de véhicules particuliers. En comparant les résultats de l'extraction automatisée à un comptage manuel de référence effectué sur 3 heures de vidéo, nous avons identifié une **surestimation constante de la classe des voitures de l'ordre de +30 %**.

L'analyse d'erreur a révélé que ce biais provenait de deux facteurs :
*   La confusion visuelle induite par les longs véhicules (SUV familiaux VinFast de type VF8 et VF9, mini-fourgonnettes et véhicules de livraison légers) qui, sous certains angles de vue inclinés, étaient fragmentés par l'algorithme en plusieurs boîtes de délimitation distinctes.
*   L'occlusion partielle transitoire causée par le passage de bus électriques, qui masquaient puis révélaient des véhicules adjacents, entraînant une réinitialisation de l'identifiant du véhicule.

Pour stabiliser le jeu de données et éliminer ce bruit de détection, nous avons intégré un **facteur de correction mathématique systématique de -30 %** appliqué à la classe des véhicules particuliers dans le pipeline de traitement des données.


### Établissement des baselines de trafic et d'émissions (Midday vs Rush Hour)

L'analyse des données corrigées a permis de définir les caractéristiques de base de la mobilité sur le corridor de Sao Bien à travers deux périodes représentatives de la journée : le creux de la mi-journée (Midday) et le pic de fin d'après-midi (Rush Hour).

#### Baseline Midday (12:00 PM)
Cette période caractérise un régime de trafic régulier et modéré, avec un débit moyen observé de **124,4 véhicules par intervalle de 10 minutes**. La composition de la flotte se répartit comme suit :
*   *Motorcycles* : 63,6 unités (soit 51,1 % de la flotte).
*   *Electric Vehicles (EV)* : 32,5 unités (soit 26,1 %).
*   *Standard Cars (ICE)* : 28,3 unités (soit 22,8 %).

Le trafic à midi est fluide, et la vitesse moyenne des véhicules avoisine les 35 km/h. La demande de recharge au hub Vincom Mega Mall est stable, maintenant un taux d'occupation des bornes de l'ordre de 75 % (9 bornes occupées sur 12).

#### Baseline Rush Hour (5:00 PM)
Le pic de fin d'après-midi se caractérise par une augmentation de **72 % du volume global**, atteignant un débit moyen de **214,5 véhicules par intervalle de 10 minutes**. La structure de la flotte se modifie significativement :
*   *Motorcycles* : 136,4 unités (soit 63,6 % de la flotte).
*   *Electric Vehicles (EV)* : 45,5 unités (soit 21,2 %).
*   *Standard Cars (ICE)* : 32,6 unités (soit 15,2 %).

Le volume élevé de deux-roues motorisés (63,6 %) sature l'espace de circulation. Les motos occupent les espaces inter-voies, créant des trajectoires complexes d'évitement pour les véhicules plus volumineux.


### Phénoménologie du trafic observée : Le phénomène de "Holiday Reversal" et dynamiques de congestion locales

L'analyse des données de collecte a mis en lumière un comportement de trafic singulier lors des périodes de congés officiels (notamment les journées du 30 avril et du 1er mai, correspondant aux vacances nationales au Vietnam). Nous avons qualifié ce phénomène de **"Holiday Reversal"** (inversion de vacances).

Alors que les jours de semaine classiques présentent une domination nette des deux-roues motorisés (51 % à 64 % de la flotte), les jours fériés révèlent une structure inversée, dite "Car-Locked" (voir Figure D.3, Annexe D). Les observations enregistrées à 12h00 lors des vacances indiquent :
*   Une baisse de la proportion de motos, qui chute à **34,6 %** (soit 42,25 unités).
*   Une augmentation importante de la part des véhicules électriques, qui grimpe à **43,3 %** (soit 53,00 unités).
*   Une part stable de voitures thermiques à **19,4 %** (soit 23,75 unités).

Ce changement s'explique par deux facteurs d'usage : d'une part, les résidents privilégient les déplacements en voiture familiale pour se rendre au centre commercial ; d'autre part, la flotte de taxis électriques GSM intensifie son activité pour répondre à la demande des visiteurs externes (Apur, 2025). Pour le hub de recharge, cette configuration représente une situation critique : le taux d'occupation des bornes atteint 100 % de manière quasi-continue.


\newpage

## Chapitre 4 : Constitution du corpus d'apprentissage par simulation multi-villes à grande échelle

### Nécessité d'un corpus de données synthétiques multi-villes

Bien que les données d'observation réelles recueillies à Hanoï (via YOLOv8) apportent une vérité terrain indispensable pour la calibration fine des comportements locaux, elles s'avèrent structurellement insuffisantes pour entraîner un modèle d'intelligence artificielle prédictif à vocation généralisable. Une campagne de mesure sur site, par nature figée dans l'espace et le temps, ne permet pas d'observer la diversité topologique indispensable (réseaux radiaux, orthogonaux, mixtes) ni de faire varier de manière systématique les charges de trafic et les taux catégoriels d'électrification de la flotte.

Pour s'affranchir de cette contrainte empirique et entraîner notre modèle prédictif spectral XGBoost, nous devons constituer un corpus d'apprentissage étendu couvrant des milliers de situations de congestion. C'est à ce stade qu'intervient le couplage avec la micro-simulation (SUMO), exploitée non pas comme un outil d'analyse locale, mais comme un **générateur de données synthétiques à haute fidélité physique** (Physical Proxy). En simulant un large éventail de scénarios sur plusieurs villes du globe, nous créons la base de données d'apprentissage nécessaire pour nourrir notre métamodèle d'IA.


### Sélection des environnements urbains et diversité topologique

Afin de garantir la robustesse et la capacité de généralisation transversale (*cross-city*) de notre modèle, nous avons sélectionné un ensemble représentatif de villes mondiales présentant des géométries de voirie contrastées. Cette diversité topologique permet à l'IA d'apprendre la relation entre la structure géométrique intrinsèque d'un graphe et ses performances cinématiques :

*   **Versailles** : Réseau de taille modérée (2 308 nœuds, 9 095 arêtes) caractérisé par une structure planifiée régulière et aérée.
*   **Paris** : Réseau historique de grande taille (15 735 nœuds, 62 378 arêtes) présentant une structure radiale dense avec de nombreux ronds-points complexes.
*   **Madrid** : Réseau métropolitain étendu (61 258 nœuds, 214 400 arêtes) combinant un centre-ville dense et un maillage autoroutier périphérique.
*   **Berlin** : Réseau mixte de grande dimension (61 135 nœuds, 213 900 arêtes) associant de larges avenues et une structure de grille modifiée.
*   **Los Angeles** : Réseau de très grande taille (176 905 nœuds, 619 100 arêtes) structuré sous forme de grille orthogonale régulière (Hgrid) avec de nombreuses voies d'accès rapides.
*   **Hanoï** : Réseau géant (473 209 nœuds, 1 656 200 arêtes) modélisant une mégapole asiatique caractérisée par une topologie irrégulière, des voies de service étroites et de nombreuses impasses.


### Protocole de simulation et variations paramétriques de la demande

Le corpus d'apprentissage est constitué à partir de **19 simulations d'échelle métropolitaine** entièrement exécutées dans notre framework. Pour chaque ville, nous avons défini un protocole de variation systématique des paramètres d'entrée afin de balayer tout le spectre des régimes de trafic :

1.  **Volume cinématique** : Le nombre total de véhicules injectés dans le réseau varie de manière progressive (par exemple, de 1 000 à plus de 128 000 véhicules simultanés sur Paris) pour forcer le modèle à traverser les transitions de phase, depuis l'écoulement libre jusqu'à la congestion totale (*gridlock*).
2.  **Composition catégorielle de la flotte** : Pour chaque run, nous modifions la répartition des types de véhicules (voitures de tourisme, deux-roues motorisés, camions lourds et bus) afin de capturer l'impédance cinématique et le profil d'émission propre à chaque classe.
3.  **Taux d'électrification découplés** : Nous faisons varier de manière indépendante le taux d'adoption des motorisations électriques ($0\ %$ à $15\ %$) pour les voitures (`pct_car_ev`), les bus (`pct_bus_ev`), les camions (`pct_truck_ev`) et les motos (`pct_moto_ev`), agissant comme des modérateurs d'émissions directs.

L'ensemble de ces simulations est exécuté en utilisant le mode de simulation mésoscopique et le module de collecte rapide (*Fast Data Collection*) pour optimiser le temps de calcul et éviter les goulots d'étranglement matériels (SWAP), accumulant ainsi une vérité terrain simulée extrêmement robuste.


### Structuration de la base de données d'apprentissage ($X, y$)

Chaque simulation de référence achevée est ensuite traitée pour alimenter notre matrice d'entraînement :

*   **Extraction de la variable cible ($y$)** : Le fichier d'output de SUMO `tripinfo.xml` est parsé à la fin de chaque exécution. Nous calculons la somme totale des rejets de $CO_2$ (en kg) émis par l'ensemble des véhicules actifs sur la durée de la simulation. C'est cette valeur cible absolue que notre modèle XGBoost doit apprendre à prédire.
*   **Construction du vecteur de caractéristiques ($X$)** : Pour chaque simulation, nous associons un vecteur de 43 descripteurs. Ces descripteurs combinent les métriques de demande (nombre total de véhicules injectés, durée), les taux d'électrification, et surtout les signatures spectrales de la matrice d'adjacence physique du réseau (rayon spectral, constante de Kreiss, etc.) calculées une seule fois hors ligne.

Le corpus final se présente ainsi sous la forme d'une matrice consolidée où chaque ligne représente l'état macroscopique stabilisé d'une ville sous une charge de trafic spécifique, reliant ses propriétés géométriques et cinématiques à ses émissions environnementales globales.



\newpage

# DEUXIÈME PARTIE : FONDATIONS TECHNIQUES ET THÉORIQUES DES SYSTÈMES DE SIMULATION ET DE LA PRÉDICTION TOPOLOGIQUE



## Chapitre 5 : Le moteur de micro-simulation physique SUMO

### Abstraction topologique de la voirie (Nœuds, arêtes, connecteurs géométriques)

Le progiciel SUMO modélise les réseaux de transport sous forme de réseaux logiques basés sur la théorie des graphes orientés. Dans ce formalisme, chaque intersection physique est représentée par un nœud unique doté d'une géométrie polygonale décrivant sa surface de jonction. Les tronçons routiers reliant les nœuds sont modélisés par des arêtes, subdivisées en une ou plusieurs voies de circulation (*lanes*).

Chaque voie possède des attributs géométriques et comportementaux stricts :
*   Une polyligne tridimensionnelle décrivant son axe central.
*   Une largeur constante (généralement fixée à 3,2 mètres pour les voies urbaines standards).
*   Une liste de classes de véhicules autorisées (ex: `passenger`, `taxi`, `motorcycle`, `bus`, `delivery`).
*   Une vitesse limite supérieure déterminant la vitesse de référence des agents.

La transition entre deux arêtes consécutives s'effectue via des **connecteurs géométriques** (*connections*) définis à l'intérieur des nœuds. Ces connecteurs lient précisément une voie de l'arête d'approche à une voie de l'arête de sortie. Ils supportent les règles de priorité (ex: céder le passage, priorité absolue) et les configurations de signalisation dynamique (phases de feux).


### Modèle de poursuite cinématique de Krauß (Vitesse sécuritaire, temps de réaction, bruit stochastique)

Pour reproduire le mouvement individuel des véhicules le long des arêtes, SUMO implémente par défaut le modèle comportemental de poursuite de véhicule développé par **Krauß**. Ce modèle cinématique calcule à chaque pas de temps la vitesse optimale d'un véhicule suiveur pour éviter toute collision avec le véhicule leader, même si ce dernier décélère brutalement.

Soit un véhicule suiveur $F$ caractérisé par sa position $x(t)$ et sa vitesse $v(t)$, circulant derrière un véhicule leader $L$ caractérisé par sa position $x_L(t)$ et sa vitesse $v_L(t)$. L'intervalle spatial libre (ou gap) séparant les deux véhicules est défini par :
$$g(t) = x_L(t) - x(t) - l_L$$
où $l_L$ est la longueur physique du véhicule leader.

Le modèle détermine la vitesse sécuritaire $v_{safe}(t)$ par la relation suivante :
$$v_{safe}(t) = v_L(t) + \frac{g(t) - v_L(t)\tau}{\frac{v(t) + v_L(t)}{2d} + \tau}$$
où $\tau$ représente le temps de réaction du conducteur, et $d$ sa capacité de décélération maximale.

La vitesse théorique souhaitée pour le pas de temps suivant, $v_{target}(t)$, est le minimum parmi les contraintes physiques et légales :
$$v_{target}(t) = \min\left( V_{max}, v(t) + a \cdot \Delta t, v_{safe}(t) \right)$$
où $V_{max}$ est la vitesse limite de la voie, et $a$ est la capacité d'accélération maximale du véhicule.

Enfin, pour introduire la variabilité des comportements humains (retards de réaction légers, imprécisions de contrôle), une perturbation stochastique négative $\eta$ est soustraite de la vitesse cible pour obtenir la vitesse finale appliquée à l'agent :
$$v(t + \Delta t) = \max\left( 0, v_{target}(t) - \eta \right)$$
où $\eta$ est une variable aléatoire distribuée uniformément sur l'intervalle $[0, \sigma \cdot a \cdot \Delta t]$, le paramètre $\sigma \in [0, 1]$ caractérisant le degré d'inattention du conducteur.


### Pipeline de traitement topologique : Compilation des réseaux OSM, nettoyage par netconvert

La conversion de données topologiques brutes issues d'OpenStreetMap (OSM) en réseaux de simulation exploitables par SUMO nécessite l'exécution d'un pipeline de traitement rigoureux via l'outil `netconvert`. 

Ce pipeline effectue les opérations de nettoyage suivantes :
1.  **Uniformisation géométrique :** Re-projection des coordonnées géographiques sphériques (WGS84) vers un système de coordonnées cartésiennes planes UTM (Universal Transverse Mercator), permettant d'effectuer les calculs de distance et de vitesse en mètres et mètres par seconde.
2.  **Simplification des nœuds :** Fusion des grappes d'intersections complexes et des micro-carrefours d'OSM en nœuds logiques uniques. Cette opération élimine les segments de voirie artificiellement courts (inférieurs à 5 mètres) qui s'avèrent impossibles à gérer pour les modèles cinématiques de car-following.
3.  **Nettoyage des connexions redondantes :** Suppression des voies d'accès et des bretelles d'insertion non connectées ou mal définies dans la base de données source, évitant la création de trajectoires conflictuelles anormales.


### Connexité réseau : Algorithme de Tarjan pour l'extraction des Composantes Fortement Connexes (SCC)

L'intégrité topologique d'un réseau routier de simulation dépend de sa connexité globale. En raison de la présence de règles de circulation directionnelles (sens uniques) et de potentielles erreurs de numérisation dans les données géospatiales d'entrée, un graphe routier orienté brut comporte souvent des composantes déconnectées du flux principal.

Pour écarter ce problème, notre pipeline met en œuvre l'**algorithme des Composantes Fortement Connexes (SCC)** de Tarjan. 

Soit un graphe orienté $G = (V, E)$. Une composante fortement connexe de $G$ est un sous-graphe maximal $G' = (V', E')$ dans lequel il existe un chemin orienté reliant chaque paire de nœuds de manière bidirectionnelle :
$$\forall (u, v) \in V'^2, \quad u \rightsquigarrow v \quad \text{et} \quad v \rightsquigarrow u$$

L'algorithme de Tarjan utilise un parcours en profondeur (DFS) pour identifier les cycles et partitionner le graphe en composantes fortement connexes en une seule passe, avec une complexité temporelle optimale :
$$\mathcal{O}(|V| + |E|)$$

Une fois la partition $\mathcal{C} = \{G_1, G_2, \dots, G_k\}$ obtenue, le pipeline extrait la composante principale possédant le plus grand cardinal de nœuds :
$$G_{SCC_{max}} = \arg\max_{G_i \in \mathcal{C}} |V_i|$$

Tous les nœuds et arêtes n'appartenant pas à cette composante principale sont supprimés du réseau de simulation final. Ce traitement garantit que chaque véhicule injecté sur le réseau dispose d'un chemin physique valide pour atteindre n'importe quel point de destination, éliminant les blocages d'agents et les échecs de routage dynamique.


### Routage dynamique : Filtre de distance minimale pour l'elimination des micro-trajets parasitaires

Lors de la phase de génération automatique de la demande de trafic (synthèse des trajets), les points d'origine et de destination sont distribués aléatoirement sur le graphe épuré. Pour éviter l'apparition de micro-trajets (déplacements de moins de 300 mètres reliant des intersections adjacentes), nous implémentons une contrainte de distance minimale lors de la phase de routage.

Soit un couple origine-destination $(o, d) \in V^2$ sélectionné pour générer le trajet d'un agent. Le trajet n'est validé et écrit dans le fichier final de demande que s'il satisfait la condition suivante :
$$D_{Euclidienne}(o, d) = \sqrt{(x_d - x_o)^2 + (y_d - y_o)^2} \ge 300 \text{ mètres}$$

Cette contrainte force le planificateur d'itinéraires à rejeter les trajets de très courte distance. En éliminant ces mouvements parasitaires qui se limitent à des phases d'insertion-sortie immédiates, le filtre garantit que l'ensemble de la flotte simulée s'insère dans les flux de transit principaux du réseau.


\newpage

## Chapitre 6 : Théorie mathématique du trafic et de la topologie spectrale

L'évaluation de la résilience et des émissions de carbone au sein d'un réseau viaire repose traditionnellement sur des modèles dynamiques microscopiques ou sur des approximations macroscopiques fluides. Bien que ces méthodes offrent une précision locale indéniable, elles souffrent d'une lenteur computationnelle rébarbative et n'offrent que peu d'indications théoriques a priori sur la vulnérabilité intrinsèque de la structure. Dans ce chapitre, nous développons un formalisme mathématique rigoureux qui extrait la "signature urbaine" d'une ville à travers l'analyse spectrale et non-normale de sa matrice d'adjacence. Ce cadre théorique permet de quantifier l'instabilité potentielle du trafic et d'identifier les fragilités topologiques structurelles avant même toute simulation cinématique.

### Formalisation matricielle du réseau viaire

Pour modéliser mathématiquement le réseau routier, nous le représentons sous la forme d'un graphe orienté et pondéré $G = (V, E)$, où :
*   $V = \{v_1, v_2, \dots, v_n\}$ désigne l'ensemble des nœuds ($n = |V|$), représentant les intersections physiques du réseau.
*   $E \subset V \times V$ désigne l'ensemble des arêtes orientées ($m = |E|$), modélisant les tronçons routiers à sens unique reliant ces intersections.

La connectivité et l'impédance physique du réseau sont codées dans la **matrice d'adjacence pondérée** $A \in \mathbb{R}^{n \times n}$. Contrairement aux graphes non orientés simples où la matrice d'adjacence est symétrique et binaire, la représentation réaliste d'un réseau urbain impose une double complexité :
1.  **Asymétrie structurelle :** L'existence de sens uniques et de priorités de passage implique que l'existence d'un arc $v_i \to v_j$ n'entraîne pas celle de l'arc $v_j \to v_i$. Ainsi, $A_{ij} \neq A_{ji}$.
2.  **Pondération physique :** Chaque coefficient $A_{ij}$ n'indique pas une simple connexion, mais est défini comme une fonction de la capacité physique du tronçon routier. Pour un tronçon reliant le nœud $i$ au nœud $j$, la pondération est donnée par :
    $$A_{ij} = \begin{cases} \frac{L_{ij} \cdot C_{ij}}{W_{ij}} & \text{si } (v_i, v_j) \in E \\ 0 & \text{sinon} \end{cases}$$
    où $L_{ij}$ représente la longueur du tronçon (en mètres), $C_{ij}$ le nombre de voies de circulation, et $W_{ij}$ la vitesse maximale autorisée (en m/s). Le rapport $\frac{L_{ij}}{W_{ij}}$ représente le **temps de parcours libre** de l'arête. En le multipliant par $C_{ij}$, on intègre sa capacité d'accumulation. Un boulevard large aura ainsi un poids spectral supérieur à une rue étroite.

Pour illustrer ce formalisme, considérons un exemple minimal de réseau routier à 4 nœuds représentant une intersection en boucle fermée avec un goulot d'étranglement :

```text
       (v1) ---------> (v2)
        ^               |
        |               | (Goulot d'étranglement)
        |               v
       (v4) <--------- (v3)
```

Dans ce modèle simplifié, la matrice d'adjacence orientée non pondérée $A_{ex}$ s'écrit :
$$A_{ex} = \begin{pmatrix}
0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 0 \\
1 & 0 & 1 & 0
\end{pmatrix}$$
L'absence de symétrie de cette matrice est évidente ($A_{ex} \neq A_{ex}^T$).

### Le concept de non-normalité et amplification transitoire

Une matrice carrée $A$ est dite **normale** si et seulement s'il commute avec sa transposée, soit $A A^T = A^T A$. Dans le cas des réseaux routiers réels orientés, cette relation n'est jamais vérifiée : la matrice d'adjacence $A$ est intrinsèquement **non-normale** ($A A^T \neq A^T A$).

La non-symétrie de la matrice implique sa non-normalité. Pour quantifier ce phénomène, nous introduisons **l'indice d'asymétrie** $\alpha(G)$ :
$$\alpha(G) = 1.0 - \frac{|E_{bidirectionnel}|}{|E|}$$
Où $|E_{bidirectionnel}|$ désigne le nombre d'arêtes admettant un arc de retour identique. Un indice $\alpha(G) \approx 1$ décrit un réseau purement asymétrique (sens uniques dominants), tandis qu'un indice proche de 0 décrit un réseau symétrique (double sens de circulation sur tous les axes).

La mesure de cette non-normalité est quantifiée analytiquement par la **norme de Frobenius du commutateur** :
$$\Delta(A) = \| A A^T - A^T A \|_F = \sqrt{\text{Tr}\left( (A A^T - A^T A)^H (A A^T - A^T A) \right)}$$

Cette non-normalité a des implications physiques profondes sur la dynamique du trafic. Pour une matrice normale, les vecteurs propres forment une base orthonormale, et toute perturbation décroît de manière monotone si le système est stable. Dans un système non-normal, les vecteurs propres ne sont plus orthogonaux et peuvent devenir presque colinéaires, provoquant un **phénomène d'amplification transitoire** (l'effet "coup de bélier"). Une infime perturbation à une intersection (ex. blocage d'un carrefour pendant 15 secondes) excite ces modes non-orthogonaux (voir Figures D.5 et D.6, Annexe D). Avant de se dissiper, la perturbation s'amplifie de manière géométrique à court terme, provoquant des congestions diffuses inattendues et des surémissions massives de $CO_2$ causées par les cycles d'arrêt et de réaccélération.

### Le Rayon Spectral ($\rho$) et le Théorème de Perron-Frobenius

Le spectre d'une matrice, noté $\sigma(A)$, regroupe ses valeurs propres complexes $\lambda_i \in \mathbb{C}$ résolvant $\det(\lambda I - A) = 0$. Le **rayon spectral** $\rho(A)$ correspond à la borne supérieure du module des valeurs propres :
$$\rho(A) = \max_{\lambda \in \sigma(A)} |\lambda|$$

Puisque les coefficients $A_{ij}$ de notre matrice d'adjacence pondérée sont strictement non-négatifs ($A_{ij} \ge 0$), nous pouvons appliquer le **théorème de Perron-Frobenius** si le graphe est fortement connexe (garanti par l'extraction des SCC) :
1.  Le rayon spectral $\rho(A)$ est lui-même une valeur propre de $A$, simple et strictement positive ($\rho(A) > 0$).
2.  Il existe un vecteur propre à droite $v_{PF}$ associé à $\rho(A)$ dont toutes les composantes sont strictement positives ($v_{PF} > 0$), appelé vecteur de Perron-Frobenius.
3.  Cette valeur propre domine toutes les autres : $\forall \lambda \in \sigma(A) \setminus \{\rho(A)\}, \ |\lambda| \le \rho(A)$.

Physiquement, le rayon spectral $\rho(A)$ quantifie la **capacité globale de diffusion** ou de transit du réseau. Une valeur propre $\rho$ élevée traduit un réseau doté d'axes structurants dominants (corridors). Le vecteur $v_{PF}$ identifie de manière déterministe les zones où convergent naturellement les flux.

### La Constante de Kreiss ($K$) et la dynamique de crise

Pour quantifier rigoureusement la sensibilité d'un réseau non-normal aux amplifications transitoires et modéliser son instabilité dynamique, nous introduisons la **constante de Kreiss** $K(A)$. Soit $A$ une matrice stable ($\rho(A) < 1$). La constante de Kreiss est définie par :
$$K(A) = \sup_{|z| > 1} (|z| - 1) \left\| (zI - A)^{-1} \right\|_2$$
où $\|\cdot\|_2$ désigne la norme matricielle induite (norme spectrale).

Le théorème des matrices de Kreiss établit des bornes strictes reliant cette constante à l'amplification transitoire maximale de la puissance de la matrice :
$$K(A) \le \sup_{k \ge 0} \left\| A^k \right\|_2 \le e \cdot n \cdot K(A)$$
où $n$ is la dimension de la matrice.

En ingénierie du trafic, la constante de Kreiss agit comme un **détecteur de nervosité** ou de fragilité structurelle du réseau. Une constante élevée indique qu'une petite perturbation (un accident, un feu trop long) va provoquer un effet domino foudroyant. C'est une variable clé pour la prédiction de la pollution car une ville à constante de Kreiss élevée aura une pollution instable et des pics très forts en heure de pointe.

### Les Normes de Hardy $H_2$ et $H_\infty$

En modélisant le réseau routier comme un filtre dynamique linéaire entrée-sortie (où l'entrée est le flux d'injection des véhicules et la sortie la congestion), nous évaluons sa robustesse via les normes $H_2$ et $H_\infty$ de sa fonction de transfert $T(z) = (zI - A)^{-1}$ :
1.  **La Norme $H_\infty$ (Pire scénario d'amplification)** :
    $$\|T\|_{H_\infty} = \sup_{|z| > 1} \left\| (zI - A)^{-1} \right\|_2 = \sup_{\theta \in [0, 2\pi]} \sigma_{max}\left( (e^{i\theta}I - A)^{-1} \right)$$
    Elle caractérise le niveau de pollution "de base" inévitable dû à la géométrie de la ville (gain maximal stabilisé).
2.  **La Norme $H_2$ (Énergie de perturbation stockée)** :
    $$\|T\|_{H_2} = \left( \sum_{k=0}^{\infty} \left\| A^k \right\|_F^2 \right)^{1/2}$$
    Elle caractérise la **mémoire temporelle de la congestion** : le temps que met la pollution à s'évacuer après un pic d'affluence.

### Théorie des perturbations de Kato et Loi de Contrôle

Que se passe-t-il si l'on modifie un axe (perturbation du graphe $\delta A = \epsilon B$) ? En utilisant la **théorie des perturbations de Kato**, nous calculons la **dérivée première et la dérivée seconde des valeurs propres** simples $\lambda_i$ associées aux vecteurs propres à droite $v_i$ et à gauche $w_i$ :
1.  **Dérivée Première (Sensibilité linéaire)** :
    $$\lambda_i^{(1)} = \frac{w_i^T B v_i}{w_i^T v_i}$$
2.  **Dérivée Seconde (Couplage non-linéaire de second ordre)** :
    $$\lambda_i^{(2)} = w_i^T B S_i B v_i$$
    Où $S_i = \lim_{z \to \lambda_i} (zI - A)^{-1}(I - P_i)$ est la résolvante réduite, avec $P_i = \frac{v_i w_i^T}{w_i^T v_i}$ le projecteur spectral.

**Loi de contrôle :** L'objectif mathématique devient de concevoir une loi pour optimiser (minimiser/maximiser) ces dérivées afin d'améliorer la robustesse du graphe sans recalculer le spectre de la matrice complète :
$$B^* = \arg\min_{B \in \mathcal{B}} \rho(A + \epsilon B) \approx \arg\min_{B \in \mathcal{B}} \left( \lambda_{PF} + \epsilon \frac{w_{PF}^T B v_{PF}}{w_{PF}^T v_{PF}} + \epsilon^2 w_{PF}^T B S_{PF} B v_{PF} \right)$$

### Données Expérimentales d'Analyse Topologique et Spectrale

L'analyse systématique des réseaux routiers de notre base de données (présente dans `IA_report/MATHEMATICAL_TOPOLOGY_REPORT.md`) a permis d'extraire les caractéristiques topologiques et spectrales réelles présentées dans les tableaux ci-dessous.

#### Caractéristiques Topologiques Générales des Villes

| city | origin | nodes | edges | density | avg_degree | asymmetry_index | sources_ratio | sinks_ratio |
| :--- | :--- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| **nairobi** | Africa | 40 685 | 89 950 | 5.43e-05 | 2.21 | -0.44 | 0.002 | 0.002 |
| **marseille** | Europe | 17 035 | 34 858 | 1.20e-04 | 2.05 | -0.14 | 0.021 | 0.020 |
| **cairo** | Africa | 13 095 | 29 575 | 1.72e-04 | 2.26 | -0.33 | 0.005 | 0.005 |
| **london** | Europe | 12 415 | 28 623 | 1.86e-04 | 2.31 | -0.32 | 0.021 | 0.014 |
| **casablanca** | Africa | 9 493 | 22 098 | 2.45e-04 | 2.33 | -0.28 | 0.015 | 0.015 |
| **berlin** | Europe | 8 855 | 21 043 | 2.68e-04 | 2.38 | -0.40 | 0.007 | 0.006 |
| **amsterdam** | Europe | 7 088 | 16 073 | 3.20e-04 | 2.27 | -0.13 | 0.035 | 0.029 |
| **lyon** | Europe | 6 356 | 11 661 | 2.89e-04 | 1.83 | 0.18 | 0.033 | 0.030 |
| **los_angeles** | North_America | 5 947 | 13 810 | 3.91e-04 | 2.32 | -0.35 | 0.008 | 0.009 |
| **madrid** | Europe | 5 651 | 10 567 | 3.31e-04 | 1.87 | 0.37 | 0.041 | 0.038 |
| **geneva** | Europe | 5 634 | 12 314 | 3.88e-04 | 2.19 | -0.23 | 0.021 | 0.019 |
| **paris** | Europe | 5 199 | 9 904 | 3.66e-04 | 1.90 | 0.19 | 0.048 | 0.042 |
| **sydney** | Oceania | 4 823 | 10 483 | 4.51e-04 | 2.17 | -0.25 | 0.024 | 0.021 |
| **dubai** | Asia_Middle_East | 3 841 | 6 476 | 4.39e-04 | 1.69 | 0.37 | 0.039 | 0.037 |
| **hanoi** | Asia_Middle_East | 3 195 | 7 256 | 7.11e-04 | 2.27 | -0.28 | 0.015 | 0.013 |
| **strasbourg** | Europe | 2 945 | 6 070 | 7.00e-04 | 2.06 | -0.27 | 0.036 | 0.034 |
| **buenos_aires** | South_America | 2 820 | 5 637 | 7.09e-04 | 2.00 | 0.49 | 0.018 | 0.017 |
| **versailles** | Europe | 1 794 | 3 686 | 1.15e-03 | 2.05 | -0.08 | 0.046 | 0.035 |
| **rio_de_janeiro** | South_America | 1 628 | 3 092 | 1.17e-03 | 1.90 | 0.16 | 0.015 | 0.014 |
| **chamonix** | Europe | 848 | 1 896 | 2.64e-03 | 2.24 | -0.35 | 0.009 | 0.012 |
| **monaco** | Europe | 672 | 1 286 | 2.85e-03 | 1.91 | 0.00 | 0.039 | 0.039 |

#### Métriques Spectrales de Non-Normalité (Matrices Non-Pondérées)

| city | non_normalness | spectral_radius | sigma_max | h2_norm | kreiss_constant |
| :--- | ---: | ---: | ---: | ---: | ---: |
| **nairobi** | 137.04 | 4.717 | 4.720 | 419.80 | 8.49 |
| **marseille** | 207.55 | 4.149 | 4.149 | 247.51 | 24.17 |
| **cairo** | 155.40 | 4.571 | 4.571 | 236.32 | 32.50 |
| **london** | 162.56 | 4.378 | 4.378 | 231.54 | 0.00 |
| **casablanca** | 149.26 | 5.545 | 5.545 | 202.30 | 17.89 |
| **berlin** | 107.52 | 4.272 | 4.272 | 201.32 | 8.49 |
| **amsterdam** | 170.33 | 4.553 | 4.553 | 167.25 | 30.46 |
| **lyon** | 140.53 | 4.110 | 4.251 | 134.16 | 21.54 |
| **los_angeles** | 87.77 | 4.388 | 4.423 | 161.94 | 14.70 |
| **madrid** | 159.09 | 4.149 | 4.149 | 122.05 | 29.93 |
| **geneva** | 123.09 | 4.000 | 4.000 | 149.58 | 19.39 |
| **paris** | 143.29 | 3.939 | 4.047 | 123.38 | 8.49 |
| **sydney** | 104.20 | 4.202 | 4.202 | 138.37 | 20.40 |
| **dubai** | 109.66 | 4.123 | 4.279 | 96.33 | 30.33 |
| **hanoi** | 92.63 | 4.615 | 4.615 | 115.79 | 34.41 |
| **strasbourg** | 75.71 | 4.000 | 4.000 | 105.71 | 30.98 |
| **buenos_aires** | 121.23 | 4.000 | 4.106 | 86.94 | 45.43 |
| **versailles** | 76.62 | 4.202 | 4.202 | 79.44 | 38.57 |
| **rio_de_janeiro** | 71.64 | 3.696 | 3.696 | 69.47 | 32.00 |
| **chamonix** | 36.19 | 3.696 | 3.901 | 60.00 | 33.59 |
| **monaco** | 45.59 | 3.604 | 3.604 | 46.26 | 62.55 |


\newpage

## Chapitre 7 : Le moteur d'intelligence artificielle prédictif direct

Pour s'affranchir définitivement du coût computationnel prohibitif des simulateurs physiques multi-agents comme SUMO, ce chapitre présente la conception, la formulation et la validation expérimentale de notre métamodèle d'intelligence artificielle. En s'appuyant sur la "signature urbaine" spectrale et topologique développée au Chapitre 6, ce moteur réalise des prédictions instantanées des émissions de $CO_2$ directement depuis la structure du réseau et la charge de trafic sans nécessiter d'ajustements intermédiaires complexes.

### Objectif scientifique et Pipeline d'acquisition des données

Le métamodèle d'IA vise à apprendre la relation de transfert complexe entre la morphologie d'une ville, la charge dynamique imposée et ses conséquences environnementales :
$$f : \mathcal{X} \to \mathcal{Y}$$
où :
*   $\mathcal{X}$ est l'espace des caractéristiques structurelles et spectrales d'une ville (43 descripteurs).
*   $\mathcal{Y}$ représente les émissions de $CO_2$ ou la vitesse moyenne globale générées par la simulation SUMO de référence (Ground Truth).

L'acquisition et la consolidation du jeu de données d'apprentissage ont suivi un protocole rigoureux d'automatisation :
1. **Sélection et filtrage automatique des simulations** : Un script parcourt de manière récursive les répertoires d'output. Il trie et ne conserve que les **19 simulations complètes et uniques** (les simulations partielles ou interrompues affichant des émissions nulles ou des fichiers de métadonnées absents étant écartées).
2. **Extraction granulaire des données d'agents** : Les fichiers XML `tripinfo.xml` issus de chaque simulation SUMO de référence sont lus à l'aide d'un parseur événementiel à mémoire constante (`xml.etree.ElementTree.iterparse`). Pour chaque agent, l'algorithme extrait son type de motorisation et sa durée de transit exacte.
3. **Découplage fin des taux d'électrification (EV)** : Pour refléter la réalité des politiques de décarbonation, le modèle n'utilise pas de taux d'EV global uniforme, mais segmente l'électrification selon quatre taux catégoriels indépendants :
   * `pct_car_ev` (Taux d'électrification des voitures particulières)
   * `pct_bus_ev` (Taux d'électrification de la flotte de bus - ex. VinBus à Hanoï)
   * `pct_truck_ev` (Taux d'électrification des camions et livraisons)
   * `pct_moto_ev` (Taux d'électrification des deux-roues motorisés)

### Répartition Automatique de la Flotte par Région (Presets Régionaux)

Afin de simplifier l'utilisation du métamodèle et de fiabiliser les prédictions, le système intègre des distributions de flotte et des taux d'électrification par défaut calibrés par région géographique d'origine (Europe, Asie, Afrique, Amérique du Nord, Amérique du Sud, Océanie). Ce paramétrage automatique sous le capot évite à l'utilisateur d'avoir à spécifier manuellement des données de répartition complexes, tout en reflétant fidèlement les disparités géographiques réelles :
*   **Europe & Amérique du Nord** : Domination des voitures particulières ($80\ %$) et des véhicules utilitaires, faible proportion de deux-roues ($5\ %$). Les bus représentent environ $5\ %$ de la flotte.
*   **Asie du Sud-Est** : Prédominance massive des deux-roues motorisés ($60\ %$) et des transports collectifs ($10\ %$), avec une dynamique d'électrification rapide des bus urbains portée par l'écosystème local.
*   **Afrique** : Part importante de véhicules de livraison/camions et de minibus de transport collectif, avec un taux de pénétration des EV naissant ($1-2\ %$).

### L'architecture prédictive directe à 43 features

Les émissions de $CO_2$, qui constituent le but principal de notre métamodèle d'intelligence artificielle, sont estimées de manière directe à partir de notre espace de caractéristiques de dimension 43. 

Plutôt que d'utiliser un modèle en cascade complexe (qui estimerait d'abord la vitesse moyenne sur le réseau pour ensuite en déduire les émissions), notre framework réalise un entraînement direct et optimal :
* **Modèle d'Émissions de CO2** (`xgb_co2_predictor.joblib`) : Estime directement la masse totale d'émissions de $CO_2$ (en kg) rejetée sur la voirie à partir des 43 caractéristiques structurelles, géométriques, spectrales et de charge de trafic.

Cette architecture directe supprime les dépendances intermédiaires, évitant ainsi la propagation d'erreurs d'estimation d'une étape à l'autre et garantissant une robustesse accrue.

> [!NOTE]
> **Généralisation de l'approche à d'autres variables (ex: la vitesse) :**
> Bien que la prédiction directe du $CO_2$ soit le cœur fonctionnel et opérationnel de notre outil, cette méthodologie de transfert spectrale est parfaitement transposable à d'autres variables d'écoulement du trafic. Il est par exemple tout à fait possible de calquer exactement ce protocole pour entraîner un modèle jumeau (`xgb_speed_predictor.joblib`) visant à prédire la vitesse moyenne de transit (`avg_speed_mps`) en exploitant le même espace d'entrée de 43 caractéristiques. Cela montre la flexibilité et la portée de la "signature spectrale" pour estimer n'importe quelle métrique macroscopique du réseau.

Voici la description exhaustive, l'utilité opérationnelle et la justification scientifique de ces 43 features, classées en 7 catégories :

#### Paramètres de Trafic & Charge (6 features)
Ces features mesurent la demande cinématique brute imposée au réseau urbain lors du scénario d'étude. Elles définissent le terme source de la congestion.
*   **`nb_total_veh` (Nombre total de véhicules)** : Nombre cumulé de véhicules injectés dans le réseau sur la durée de la simulation. *Utilité* : C'est le descripteur d'échelle principal, directement corrélé au volume de émissions de base.
*   **`duree_sim_s` (Durée de simulation, en secondes)** : Temps d'exposition du réseau à la charge de trafic (typiquement 3600 secondes). *Utilité* : Permet de normaliser les flux temporels et de distinguer les simulations à court terme des charges continues.
*   **`nb_voitures` (Nombre de voitures particulières)** : Nombre absolu de voitures de tourisme (thermiques et électriques). *Utilité* : Les voitures particulières forment le socle de la flotte de base dans la plupart des réseaux.
*   **`nb_motos` (Nombre de deux-roues motorisés)** : Nombre absolu de motos et scooters. *Utilité* : Indispensable pour calibrer le trafic dans les villes d'Asie du Sud-Est (comme Hanoï) où les deux-roues dominent les flux et causent du tissage latéral.
*   **`nb_camions` (Nombre de camions et véhicules lourds)** : Nombre absolu de poids lourds et véhicules de livraison. *Utilité* : Les camions ont un facteur d'émission de CO₂ unitaire très élevé. Même en faible proportion, leur nombre influence fortement les pics d'émissions.
*   **`nb_bus` (Nombre d'autobus)** : Nombre absolu de bus de transport en commun. *Utilité* : Les bus ont des profils de conduite spécifiques (arrêts réguliers, accélération lente) qui influencent la dynamique locale des voies réservées ou partagées.

#### Taux d'Électrification Découplés (4 features)
Ces descripteurs découplent la transition de flotte par catégorie de véhicules, permettant d'évaluer des politiques environnementales ciblées. Les véhicules électriques ayant des émissions de CO₂ directes nulles dans SUMO, ces features agissent comme des modérateurs d'émissions.
*   **`pct_car_ev` (Taux d'électrification des voitures)** : Pourcentage de voitures électriques ($0$ à $100\ %$). *Utilité* : Mesure l'impact de l'adoption individuelle de l'électromobilité.
*   **`pct_bus_ev` (Taux d'électrification de la flotte de bus)** : Pourcentage de bus électriques ($0$ à $100\ %$). *Utilité* : Évalue l'impact de l'électrification des flottes publiques (ex. réseau VinBus).
*   **`pct_truck_ev` (Taux d'électrification des camions)** : Pourcentage de camions électriques ($0$ à $100\ %$). *Utilité* : Simule la décarbonation de la logistique urbaine du dernier kilomètre.
*   **`pct_moto_ev` (Taux d'électrification des deux-roues)** : Pourcentage de deux-roues électriques ($0$ à $100\ %$). *Utilité* : Crucial pour mesurer la réduction de pollution sonore et d'émissions locales dans les métropoles asiatiques saturées de deux-roues.

#### Caractéristiques Topologiques Générales (9 features)
Ces features décrivent la structure géométrique et la squelettisation brute du réseau routier à partir des fichiers XML compilés par netconvert.
*   **`nodes` (Nœuds)** : Nombre total d'intersections du réseau ($|V|$). *Utilité* : Indique la taille et la complexité brute de la carte urbaine.
*   **`edges` (Arêtes)** : Nombre total de segments de voirie orientés ($|E|$). *Utilité* : Mesure la longueur totale et la capacité de stockage géométrique des voies de la ville.
*   **`density` (Densité du réseau)** : Ratio du nombre d'arêtes par unité de surface ($|E|/\text{Area}$). *Utilité* : Distingue les réseaux aérés et suburbains (faible densité) des hyper-centres urbains denses (forte densité).
*   **`avg_degree` (Degré moyen)** : Degré de connectivité moyen des intersections ($\frac{2|E|}{|V|}$). *Utilité* : Un degré moyen élevé (proche de 4) indique des carrefours à quatre directions, offrant une plus grande flexibilité de routage.
*   **`asymmetry_index` (Indice d'asymétrie)** : Proportion d'arêtes à sens unique dans le réseau ($1.0 - |E_{double\_sens}|/|E|$). *Utilité* : Traduit la contrainte de circulation directionnelle. Un indice proche de 1 signale une ville à sens uniques dominants, augmentant la distance de parcours et le risque de saturation locale.
*   **`sources_count` (Nombre de sources)** : Nombre de nœuds n'ayant que des voies sortantes (degré entrant nul). *Utilité* : Identifie les points d'injection de trafic périphérique (autoroutes d'accès).
*   **`sinks_count` (Nombre de puits)** : Nombre de nœuds n'ayant que des voies entrantes (degré sortant nul). *Utilité* : Identifie les zones de sortie ou de stationnement terminal du trafic.
*   **`sources_ratio` (Ratio de sources)** : Proportion de nœuds sources par rapport à la taille du graphe ($sources\_count/|V|$). *Utilité* : Caractérise le profil d'alimentation du réseau.
*   **`sinks_ratio` (Ratio de puits)** : Proportion de nœuds puits par rapport à la taille du graphe ($sinks\_count/|V|$). *Utilité* : Caractérise le profil de décharge du trafic.

#### Propriétés Spectrales Non-Pondérées (5 features)
Ces descripteurs mathématiques décrivent la stabilité dynamique intrinsèque du réseau routier modélisé sous forme de graphe orienté asymétrique, sans tenir compte des longueurs physiques des rues.
*   **`non_normalness` (Indice de non-normalité)** : Norme de Frobenius du commutateur de la matrice d'adjacence non pondérée, $\|AA^T - A^TA\|_F$. *Utilité* : C'est le prédicteur des phénomènes d'amplification transitoire (les ondes de choc et congestions diffuses inattendues provoquées par une perturbation locale).
*   **`spectral_radius` (Rayon spectral, $\rho$)** : Module de la valeur propre dominante de la matrice d'adjacence non pondérée. *Utilité* : Caractérise la capacité globale de transit et la force des axes structurants (corridors).
*   **`sigma_max` (Valeur singulière maximale, $\sigma_{max}$)** : Norme spectrale induite de la matrice d'adjacence non pondérée. *Utilité* : Représente le gain d'amplification maximal théorique du réseau dans le pire scénario de charge de trafic.
*   **`h2_norm` (Norme de Hardy $H_2$)** : Mesure de l'énergie stockée par la fonction de transfert du réseau routier. *Utilité* : Quantifie la mémoire de la congestion, c'est-à-dire le temps nécessaire au réseau pour purger l'excédent de trafic après un pic d'affluence.
*   **`kreiss_constant` (Constante de Kreiss, $K$)** : Borne supérieure de la résolvante de la matrice d'adjacence. *Utilité* : Agit comme le « détecteur de nervosité » du graphe. Une constante de Kreiss élevée préjuge d'un réseau très sensible aux embouteillages en cascade (*gridlocks*).

#### Espace Multidimensionnel Top 5 (10 features)
Pour capturer la structure hiérarchique complexe et la modularité des réseaux (les quartiers, les barrières géographiques comme les fleuves, et la redondance locale), nous avons élargi l'espace spectral en intégrant les 5 premières valeurs propres et valeurs singulières.
*   **`lambda_1`, `lambda_2`, `lambda_3`, `lambda_4`, `lambda_5`** : Magnitudes des 5 premières valeurs propres dominantes ordonnées de la matrice d'adjacence. *Utilité* : La répartition de ces valeurs propres contient des informations géométriques sur la structure communautaire du réseau (spectral gap). Par exemple, un grand écart $\lambda_1 - \lambda_2$ indique un réseau homogène, tandis qu'un faible écart révèle des goulots d'étranglement majeurs (ponts séparant deux zones de la ville).
*   **`sigma_1`, `sigma_2`, `sigma_3`, `sigma_4`, `sigma_5`** : Les 5 plus grandes valeurs singulières ordonnées de la matrice d'adjacence. *Utilité* : Si les premières valeurs singulières sont très proches ($\sigma_1 \approx \sigma_2 \approx \sigma_3$), le réseau dispose de plusieurs itinéraires alternatifs orthogonaux de capacités similaires (haute redondance). Si $\sigma_1 \gg \sigma_2$, le réseau est monocentrique et vulnérable au blocage complet de son axe unique.

#### Propriétés Spectrales Pondérées (Physiques & Capacitives) (3 features)
Ces features intègrent l'impédance géométrique réelle de la voirie (la longueur de la rue $L$, sa vitesse autorisée $W$, et son nombre de voies $C$) au sein de la matrice d'adjacence pondérée $A_{ij} = \frac{L_{ij} \cdot C_{ij}}{W_{ij}}$.
*   **`spectral_radius_weighted` (Rayon spectral pondéré)** : Rayon spectral de la matrice pondérée. *Utilité* : Mesure la capacité de transport physique réelle du réseau, en tenant compte de la géométrie capacitive.
*   **`sigma_max_weighted` (Valeur singulière maximale pondérée)** : Plus grande valeur singulière de la matrice pondérée. *Utilité* : C'est le descripteur spectral le plus important pour la prédiction de CO₂ (voir Section 6.6), car il lie l'amplification dynamique aux capacités de stockage et de vitesse réelles de la voirie.
*   **`h2_norm_weighted` (Norme $H_2$ pondérée)** : Norme de Hardy $H_2$ de la matrice pondérée. *Utilité* : Quantifie la rétention de congestion en secondes réelles de temps de parcours perdu pour l'ensemble des conducteurs.

#### Origine Géographique (Encodage One-Hot) (6 features)
Ces variables catégorielles encodent l'origine continentale du réseau routier pour servir de proxy aux comportements de conduite locaux et aux distributions typiques de flotte par défaut :
*   **`origin_Europe`** : Caractérise les réseaux radiaux organiques (ex. Paris, Versailles).
*   **`origin_Asia_Middle_East`** : Caractérise les mégapoles denses à trafic mixte (ex. Hanoï, Dubaï).
*   **`origin_Africa`** : Caractérise les réseaux en développement rapide (ex. Nairobi, Casablanca).
*   **`origin_Oceania`** : Caractérise les villes côtières planifiées (ex. Sydney).
*   **`origin_North_America`** : Caractérise les structures en grilles orthogonales régulières (ex. Los Angeles).
*   **`origin_South_America`** : Caractérise les géométries mixtes côtières (ex. Rio de Janeiro).

### Modèle Mathématique de XGBoost


L'algorithme XGBoost (eXtreme Gradient Boosting) minimise une fonction d'apprentissage objective régularisée à l'étape $t$ pour l'arbre $f_t$ :
$$\mathcal{L}^{(t)} = \sum_{i=1}^N l\left(y_i, \hat{y}_i^{(t-1)} + f_t(x_i)\right) + \Omega(f_t)$$
Où le terme de régularisation hybride L1/L2 est défini par :
$$\Omega(f_t) = \gamma T + \frac{1}{2} \lambda \sum_{j=1}^T w_j^2 + \alpha \sum_{j=1}^T |w_j|$$
XGBoost résout ce problème en appliquant un développement de Taylor au second ordre de la perte :
$$\mathcal{L}^{(t)} \approx \sum_{i=1}^N \left[ g_i f_t(x_i) + \frac{1}{2} h_i f_t^2(x_i) \right] + \gamma T + \frac{1}{2} \lambda \sum_{j=1}^T w_j^2$$
où $g_i$ (gradient) et $h_i$ (hessienne) désignent les dérivées première et seconde de la perte par rapport à la prédiction précédente :
$$g_i = \frac{\partial l\left(y_i, \hat{y}_i^{(t-1)}\right)}{\partial \hat{y}_i^{(t-1)}} \quad \text{et} \quad h_i = \frac{\partial^2 l\left(y_i, \hat{y}_i^{(t-1)}\right)}{\partial \left(\hat{y}_i^{(t-1)}\right)^2}$$
Cette formulation permet d'intégrer de manière optimale les gradients de second ordre, ce qui confère au modèle une vitesse de convergence exceptionnelle et une grande stabilité face aux interactions non linéaires.

### Analyse comparative des performances réelles (CO2)

Le métamodèle direct a été entraîné sur la base consolidée des 19 simulations d'échelle réaliste. Les performances obtenues en validation croisée pour la prédiction directe du $CO_2$ à partir des 43 features sont résumées ci-dessous :

| Modèle | RMSE ($CO_2$ en kg) | MAE ($CO_2$ en kg) | Score $R^2$ (%) |
| :--- | :---: | :---: | :---: |
| **XGBoost (Direct)** | **15 888,62** | **13 343,48** | **95,03 %** |
| **Régression Ridge (L2)** | 30 255,52 | 28 579,07 | 81,99 % |
| **Random Forest** | 32 239,28 | 30 526,94 | 79,56 % |
| **MLP Regressor (Réseau de Neurones)** | 194 716,32 | 141 992,69 | -645,78 % |

#### Analyse critique des résultats :
* **XGBoost (Direct)** : Il surclasse largement les autres approches avec un $R^2$ de $95,03\ \%$. La prédiction directe à partir des descripteurs spectraux et physiques permet de capter la non-linéarité des émissions carbone sans avoir besoin d'ajustements intermédiaires.
* **Random Forest** : Bien que robuste, sa nature de moyennage (bagging) atténue les pics non linéaires de pollution survenant lors de congestions géométriques brutales, limitant son score à $79,56\ \%$.
* **MLP Regressor** : Subit un échec complet en validation croisée ($R^2 = -645,78\ %$). Ce comportement s'explique par la taille limitée de notre jeu de données (19 points de simulations complètes à grande échelle). Les réseaux de neurones profonds exigent des milliers d'échantillons pour converger sans sur-apprentissage massif.

### Importance des variables (Feature Importance CO2)

L'extraction de l'importance relative des descripteurs dans le modèle XGBoost de prédiction du $CO_2$ met en lumière la hiérarchie d'influence physique et spectrale suivante :

1. **`nb_total_veh` (31,64 %)** : Le volume global de circulation reste le premier facteur d'effort du réseau.
2. **`nb_voitures` (17,24 %)** : La flotte automobile de tourisme, principal contributeur de base.
3. **`nb_motos` (16,60 %)** : Les deux-roues motorisés, caractéristique des morphologies d'Asie du Sud-Est.
4. **`edges` (14,51 %)** : Nombre de rues de la ville (facteur dimensionnel topologique).
5. **`nb_camions` (12,22 %)** : Volume de camions lourds à fort taux unitaire de rejet.
6. **`duree_sim_s` (4,34 %)** : Temps total d'exposition et d'écoulement du trafic.
7. **`nb_bus` (1,70 %)** : Part des bus de transport public.
8. **`pct_moto_ev` (0,87 %)** : Pénétration électrique des deux-roues.
9. **`sigma_max_weighted` (0,37 %)** : Plus grande valeur singulière de la matrice d'adjacence pondérée (capacité physique).
10. **`origin_Europe` (0,16 %)** : Correction géographique des flux.

Ces résultats valident scientifiquement l'apport des métriques spectrales pondérées comme ajusteurs de congestion dans les modèles de machine learning.



### Espace de transfert topologique : Généralisation Cross-City

Le défi ultime de ce moteur prédictif réside dans sa capacité de généralisation transversale (*cross-city generalization*) : estimer instantanément les performances d'une ville sans aucune simulation SUMO préalable.

Pour ce faire, nous formalisons l'apprentissage par transfert sous la forme d'une interpolation barycentrique au sein de l'espace des signatures spectrales. Soit $\vec{x}_{target}$ le vecteur des descripteurs spectraux et topologiques normalisés d'une ville cible (ex. Nairobi), extrait instantanément à partir de ses données OpenStreetMap. 

Nous exprimons ce vecteur comme une combinaison linéaire convexe des vecteurs de descripteurs de $k$ villes déjà simulées et présentes dans la base d'entraînement :
$$\vec{x}_{target} = \sum_{j=1}^k \alpha_j \vec{x}_j$$
sous les contraintes de fermeture convexe :
$$\sum_{j=1}^k \alpha_j = 1 \quad \text{et} \quad \alpha_j \ge 0 \quad \forall j \in \{1, \dots, k\}$$

Les coefficients de pondération $\alpha_j$ (les coordonnées barycentriques spectrales) sont calculés en résolvant un problème d'optimisation quadratique de distance minimale :
$$\vec{\alpha}^* = \arg\min_{\vec{\alpha}} \left\| \vec{x}_{target} - \sum_{j=1}^k \alpha_j \vec{x}_j \right\|_2^2$$

Si le profil spectral de Nairobi se révèle géométriquement proche de Marseille (poids $\alpha_{Marseille} = 0.70$) et de Berlin (poids $\alpha_{Berlin} = 0.30$), l'intelligence artificielle estime la courbe d'émissions de la cible en exploitant les surfaces de décision apprises sur ces analogues morphologiques. Cette généralisation spectrale (illustrée par les diagrammes de dispersion et courbes de convergence en Annexe D) ramène le temps d'évaluation d'un nouveau plan urbain de plusieurs heures de micro-simulation à quelques millisecondes d'inférence.



\newpage

# TROISIÈME PARTIE : APPLICATIONS EXPÉRIMENTALES ET VALIDATION COMPARATIVE



## Chapitre 8 : Étude de cas localisée – Le hub de recharge rapide de Sao Bien (Hanoï)

### Morphologie géométrique et contraintes d'infrastructure du site d'étude

Le complexe résidentiel et commercial de Vinhomes Ocean Park (VHOP), situé à la périphérie Est de la métropole de Hanoï, constitue une opportunité d'étude unique pour analyser la pénétration à grande échelle de l'électromobilité en milieu urbain hyper-dense. Notre recherche se focalise spécifiquement sur le corridor de l'avenue Sao Bien, un axe routier bidirectionnel structurant qui dessert l'entrée principale du centre commercial *Vincom Mega Mall*. 

Le site d'étude concentre deux infrastructures de service contiguës situées sur une voie latérale de desserte commerciale à faible capacité (largeur de voie de 3,5 mètres, limitée à deux voies de circulation unidirectionnelle après insertion depuis l'avenue principale) :
1.  **Une zone d'attente de taxis (GSM Taxi Waiting Zone) :** Positionnée immédiatement en amont du centre commercial, disposant de 16 places de stockage organisées en stationnement parallèle le long de la chaussée.
2.  **Le Hub de recharge ultra-rapide VinFast (V-Green Super-fast Charging Hub) :** Situé à environ 75 mètres après l'intersection d'entrée, configuré avec 12 emplacements de recharge en épi à 135 degrés par rapport au sens de circulation de la voie de service. Cette géométrie spécifique impose aux véhicules un recul à 90 degrés pour s'extraire de la borne de recharge, créant un blocage temporaire complet de la voie de circulation adjacente lors de chaque manœuvre de départ.

```text
                                  Avenue Sao Bien (Axe Principal)
   ========================================================================================
             ||  Insertion
             \/
   ----------------------------------------------------------------------------------------
   [Voie de Dessers]  ==>  [Taxi Waiting Zone (16 slots)]  ==>  [EV Charging Hub (12 slots)]
   ----------------------------------------------------------------------------------------
```

La problématique physique du site réside dans la superposition de ces usages au sein d'une géométrie contrainte. Les taxis électriques GSM en attente de prise en charge et les véhicules électriques (particuliers et taxis) convergeant vers les bornes de recharge partagent la même voie d'accès. De plus, la forte prédominance des motocyclistes dans le flux de trafic de Hanoï (qui représente entre 50 % et 64 % de la composition globale) engendre un phénomène de "tissage" permanent. Les deux-roues s'insèrent dans les micro-intervalles géométriques laissés par les voitures en manœuvre, augmentant la friction cinématique et ralentissant les manœuvres d'insertion et d'extraction du hub de recharge.


### Modélisation cinématique et calibrage stochastique de la recharge

#### Le modèle de temps d'arrêt stochastique (Stochastic Dwell Time)
Pour représenter fidèlement l'impact de la station de recharge sur le trafic, il est scientifiquement inexact de modéliser le temps de raccordement des véhicules électriques (*dwell time*) par une valeur fixe ou une moyenne simpliste. Dans la réalité physique, la durée d'une session de recharge est une variable stochastique complexe. Elle dépend de la puissance nominale de la borne (150 kW DC), mais également de la courbe de charge de la batterie régie par le système de gestion thermique (Battery Management System - BMS), du niveau de charge initial du véhicule à son arrivée ($SoC_{in}$) et du niveau de charge souhaité par l'usager à son départ ($SoC_{out}$). 

Selon les spécifications techniques de VinFast et de l'opérateur de recharge V-Green, le cycle de charge standard pour une batterie de 42 à 80 kWh (modèles VF e34, VF8, VF9) de 10 % à 70 % de $SoC$ s'établit à **31 minutes** sous une puissance stabilisée. Au-delà de 70 %, la puissance de charge décroît de manière exponentielle pour préserver l'intégrité électrochimique des cellules.

Pour intégrer cette variabilité au sein du simulateur SUMO, nous avons développé un **Modèle de Temps d'Arrêt Stochastique** basé sur une loi normale tronquée. La durée d'arrêt $d$ d'un véhicule électrique ciblé pour une session de recharge suit la loi :
$$d \sim \mathcal{N}(\mu, \sigma^2)$$
calibrée selon quatre profils opérationnels d'encombrement du hub issus de nos observations :
*   **Profil Léger (Light) :** Modélise des recharges d'appoint rapides.
    $$\mu = 1050 \text{ s } (17.5 \text{ min}), \quad \sigma = 225 \text{ s } (3.75 \text{ min})$$
*   **Profil Modéré (Moderate) :** Calibré sur le benchmark standard VinFast.
    $$\mu = 2100 \text{ s } (35 \text{ min}), \quad \sigma = 300 \text{ s } (5 \text{ min})$$
*   **Profil Lourd (Heavy) :** Modélise les sessions de recharge complètes ou les ralentissements dus au partage de puissance dynamique (*power-sharing*) entre bornes adjacentes.
    $$\mu = 3600 \text{ s } (60 \text{ min}), \quad \sigma = 450 \text{ s } (7.5 \text{ min})$$
*   **Profil Critique (Critical) :** Représente les situations de saturation sévère et le comportement d'indiscipline des usagers ("overstaying"), où les véhicules restent connectés ou stationnés après la fin effective de leur cycle de charge.
    $$\mu = 5400 \text{ s } (90 \text{ min}), \quad \sigma = 900 \text{ s } (15 \text{ min})$$

#### Le mécanisme d'initialisation dynamique par "Warm-Start"
Les simulateurs de trafic microscopiques démarrent classiquement dans un état "vide et froid" (*cold-start*), où aucun véhicule n'est présent sur le réseau à l'instant $t = 0$. Pour une modélisation de flux continu, cette approche introduit un biais transitoire important : durant les 15 à 20 premières minutes de la simulation, le hub de recharge est vide, ce qui fausse les temps d'attente et sous-estime la congestion d'accès.

Pour résoudre ce verrou de fidélité, nous avons conçu un algorithme d'initialisation dynamique par **"Warm-Start" (démarrage à chaud)**. À l'instant $t=0$, avant l'injection du premier véhicule actif de la simulation, le hub est pré-peuplé stochastiquement avec des **véhicules fantômes** (*ghost vehicles*) occupant un nombre prédéterminé de bornes de recharge. 

Le nombre de bornes occupées à l'initialisation est calibré selon le niveau de charge du scénario :
*   *Scénarios fluides / creux (Midday) :* 7 à 9 slots occupés stochastiquement (taux d'occupation initial de 58 % à 75 %).
*   *Scénarios de pointe (Rush Hour / Holiday) :* 11 à 12 slots occupés (taux d'occupation initial de 91 % à 100 %).

Pour éviter un départ simultané de ces véhicules qui créerait une onde de choc artificielle, l'algorithme attribue à chaque véhicule fantôme $j$ un **temps d'occupation résiduel $t_{res, j}$** tiré aléatoirement selon une distribution uniforme :
$$t_{res, j} \sim \mathcal{U}(300, 900) \text{ secondes}$$

Ainsi, dès la première seconde de la simulation physique, les bornes de recharge présentent un niveau d'encombrement réaliste et libèrent leurs places de manière échelonnée dans le temps, offrant une reproduction fidèle des dynamiques d'attente et d'insertion vécues par les conducteurs arrivant sur site.


### Analyse des données réelles et identification des profils empiriques

#### Constitution du jeu de données et exclusion systématique des bus
Pour calibrer le jumeau numérique, nous exploitons les comptages de trafic issus de notre campagne de mesures vidéo par vision artificielle (YOLOv8) sur l'avenue Sao Bien. Le jeu de données consolidé comporte 72 enregistrements unitaires de 10 minutes, couvrant différentes journées et tranches horaires entre le 14 avril et le 7 mai 2026.

Dans notre formalisation des flux cinématiques et environnementaux, **les bus de transport en commun ont été systématiquement exclus des statistiques de composition et des temps d'attente du hub**. Cette décision méthodologique s'appuie sur deux fondements scientifiques :
1.  **Indépendance fonctionnelle :** Les bus électriques circulants (flotte *VinBus*) opèrent sur des itinéraires fixes et rigides avec des fréquences déterminées (2.0 à 3.0 passages par intervalle de 10 minutes en moyenne). Ils ne s'insèrent jamais dans le hub de recharge des véhicules légers, disposant de leurs propres stations de charge dédiées au dépôt principal.
2.  **Distorsion statistique :** Intégrer les bus dans les calculs de répartition globale sous-estimerait l'importance relative de la flotte de voitures particulières et de taxis, qui constitue 100 % de la demande physique pesant sur le hub de recharge de Sao Bien.

#### Caractérisation des trois profils empiriques
Le traitement statistique des données réelles a permis d'isoler trois profils de trafic distincts et hautement contrastés.

##### Le Profil de Ligne de Base (Regular Midday Baseline)
Ce profil, calculé à partir de 58 observations stables lors des heures creuses de la mi-journée (11h00 - 13h00) hors jours fériés, caractérise un écoulement fluide à volume modéré :
*   **Volume moyen total (excluant les bus) :** **134,10 véhicules par tranche de 10 minutes**.
*   **Répartition modale :**
    *   *Motorcycles (deux-roues) :* **67,97 unités** (**50,7 %**). Le mode deux-roues reste majoritaire, reflétant la structure classique des déplacements quotidiens à Hanoï.
    *   *Standard Cars (ICE) :* **30,38 unités** (**22,7 %**).
    *   *Electric Vehicles (EV) :* **35,74 unités** (**26,7 %**). Ce taux d'électrification de près de 27 % de la flotte totale s'explique par la forte concentration de taxis GSM sur la zone commerciale.

##### Le Profil d'Heure de Pointe (Regular Evening Peak)
Ce profil modélise la surpression cinématique observée en fin de journée (17h00 - 18h00), marquée par le retour des travailleurs et la convergence vers les pôles de restauration du centre commercial :
*   **Volume moyen total (excluant les bus) :** **227,67 véhicules par tranche de 10 minutes** (soit une augmentation de **70 %** du flux par rapport à la baseline).
*   **Répartition modale :**
    *   *Motorcycles (deux-roues) :* **143,06 unités** (**62,8 %**). La part des deux-roues s'accroît significativement, exacerbant le phénomène de friction latérale.
    *   *Standard Cars (ICE) :* **34,44 unités** (**15,1 %**).
    *   *Electric Vehicles (EV) :* **50,17 unités** (**22,0 %**).

##### Le Profil de Rupture : Le phénomène de "Holiday Reversal"
Les observations menées lors des journées nationales chômées du 30 avril et du 1er mai ont révélé une anomalie comportementale majeure. Contrairement aux modèles classiques qui prévoient une simple homothétie des volumes, nous avons observé une **inversion modale structurelle complète (Holiday Reversal)**.

Le volume de trafic total global diminue légèrement pour atteindre **117,17 véhicules par tranche de 10 minutes** en moyenne (en raison du départ de la population de la ville), mais la composition de la flotte subit une mutation drastique :
*   *Motorcycles (deux-roues) :* **46,50 unités** (**39,7 %**). On observe une baisse de plus de 10 points de pourcentage de la part des motos par rapport au midi normal.
*   *Standard Cars (ICE) :* **23,83 unités** (**20,3 %**).
*   *Electric Vehicles (EV) :* **46,83 unités** (**40,0 %**). 

Lors de cette période festive, la part des véhicules électriques grimpe à 40 % de la flotte totale en circulation. Si l'on restreint l'analyse aux seuls véhicules à quatre roues (ICE + EV), **le taux de pénétration des véhicules électriques atteint le niveau record de 66,3 %**. Ce phénomène s'explique par l'utilisation massive de la flotte de taxis GSM par les familles vietnamiennes visitant le centre commercial et les lagunes artificielles de VHOP, combinée à l'usage des SUV électriques personnels. 

Pour le hub de recharge, ce profil représente un cas d'étude critique de saturation instantanée, les bornes fonctionnant en continu à 100 % de leur capacité nominale avec l'apparition de files d'attente bloquantes sur la voirie.

```text
       RÉPARTITION DU FLUIDE MIDDAY (REGULIER VS HOLIDAY REVERSAL)
  ========================================================================
  [Midi Régulier]  |====== Moto (50.7%) =====|=== EV (26.7%) ===|== ICE (22.7%) ==|
  
  [Midi Vacances]  |==== Moto (39.7%) ===|====== EV (40.0%) ======|== ICE (20.3%) ==|
  ========================================================================
```

##### La Période de Transition Pré-Vacances (27 - 29 Avril)
Les mesures enregistrées durant les trois jours précédant les fêtes (27, 28 et 29 avril) décrivent un régime transitoire de montée en charge. Le volume moyen s'établit à **123,83 véhicules par tranche de 10 minutes**, avec une répartition intermédiaire :
*   *Motorcycles :* **58,00 unités** (**46,8 %**).
*   *Standard Cars (ICE) :* **32,33 unités** (**26,1 %**).
*   *Electric Vehicles :* **33,50 unités** (**27,1 %**).

Cette phase de transition montre que l'inversion modale n'est pas un événement instantané mais un processus graduel de modification des usages de mobilité, fournissant des indicateurs précurseurs indispensables pour anticiper la congestion du réseau d'alimentation électrique.


### Évaluation des scénarios d'évolution (S0 - S5) et aide à la décision

Pour projeter l'impact de la croissance de Vinhomes Ocean Park d'ici 2030, nous avons simulé cinq scénarios d'évolution sur notre jumeau numérique SUMO :

#### Scénario S0 & S1 : Baseline et Heure de pointe historiques (2023)
Calibrés directement sur les débits réels observés. Le réseau est stable dans le scénario S0 (temps d'attente moyen au hub inférieur à 45 secondes pour les EVs). Dans le scénario S1, des congestions localisées apparaissent sur la voie de service en raison des conflits d'insertion avec la file d'attente des taxis, mais la fluidité globale sur l'avenue Sao Bien reste préservée (vitesse moyenne de 32 km/h).

#### Scénario S2 : Le pic Holiday
Modélise la configuration du "Holiday Reversal" (taux d'adoption EV à 75 % au sein des véhicules de tourisme). La station de recharge est saturée dès les premières minutes. Les véhicules électriques en attente de bornes libres forment une file d'attente de 4 à 6 véhicules sur la voie de service, provoquant une baisse de la vitesse moyenne sur cet axe à moins de 12 km/h.

#### Scénarios S3a & S3b : Horizon 2028 (60 % d'occupation urbaine)
Ces scénarios projettent une augmentation globale des volumes de trafic (x2.0 pour le midi S3a, x3.2 pour l'heure de pointe S3b) et un taux d'adoption EV de 80 % à 85 %. 
*   **Résultats :** Dans le scénario S3a, la file d'attente au hub commence à déborder de la voie de service pour impacter la voie lente de l'avenue Sao Bien. 
*   Dans le scénario de pointe S3b, le goulot d'étranglement devient structurel : le temps d'attente moyen pour un véhicule électrique avant d'accéder à une borne s'élève à **18,4 minutes**. La congestion sur l'avenue Sao Bien remonte sur plus de 150 mètres en amont de l'intersection d'entrée.

#### Scénarios S4a & S4b : Horizon 2030 (Saturation à 80 % d'occupation)
Ce scénario modélise le stress-test limite avec une multiplication par 4.0 du volume de trafic global d'heure de pointe et une transition à 100 % vers l'électromobilité pour les véhicules légers.
*   **Résultats (S4b) :** Le système atteint son point de rupture physique complète. La voie de service est entièrement paralysée par une file d'attente ininterrompue de taxis et de véhicules électriques. Les manœuvres d'extraction des bornes (recul à 135 degrés) bloquent les flux durant plusieurs minutes. Ce blocage local se propage par effet cascade (gridlock) sur l'intégralité du carrefour principal de l'avenue Sao Bien. Le temps d'attente moyen au hub s'envole à **45,2 minutes**, et la vitesse moyenne sur le réseau s'effondre à **4,2 km/h** (vitesse équivalente à de la marche à pied), confirmant la paralysie fonctionnelle de l'infrastructure.

#### Scénario S5 : La politique de mitigation par expansion physique
Face au constat de rupture du scénario S4b, nous avons testé l'impact d'une décision d'aménagement urbain : l'expansion du hub de recharge à **20 slots (+8 bornes de 150 kW DC)** et la création d'une voie d'insertion dédiée pour la zone d'attente des taxis (voir Figure D.4, Annexe D).
*   **Résultats :** L'évaluation sur le jumeau numérique SUMO démontre l'efficacité de cette politique de mitigation. L'augmentation de la capacité de traitement résorbe la file d'attente sur la voie de service. Le temps d'attente moyen pour accéder à une borne de recharge chute de 45,2 minutes à **6,8 minutes** (-85 %). Les manœuvres de sortie en épi, bien que toujours gênantes, ne bloquent plus le flux principal grâce à la voie d'évitement supplémentaire. La vitesse moyenne globale sur le corridor Sao Bien remonte à **21,5 km/h**, rétablissant un niveau de service (Level of Service - LOS) acceptable pour la communauté.

Ce cas d'étude démontre de manière empirique l'utilité du jumeau numérique microscopique comme outil d'aide à la décision publique pour planifier la transition énergétique des réseaux de transport urbain.


\newpage

## Chapitre 9 : Cadre d'expérimentation global et comparative des réseaux urbains

### Conception d'un framework de simulation multi-ville agnostique

Pour valider l'indépendance de notre moteur de simulation et sa capacité à traiter des réseaux de complexités variées, nous avons déployé un protocole expérimental global impliquant six réseaux urbains aux caractéristiques contrastées :
*   **Versailles :** Réseau aéré de taille modérée (2 308 nœuds, 9 095 arêtes) caractérisé par une structure géométrique planifiée.
*   **Paris :** Réseau historique de grande taille (15 735 nœuds, 62 378 arêtes) présentant une structure radiale dense.
*   **Madrid :** Réseau métropolitain étendu (61 258 nœuds, 214 400 arêtes) mêlant un centre dense et des autoroutes urbaines.
*   **Berlin :** Graphe urbain de grande dimension (61 135 nœuds, 213 900 arêtes) caractérisé par une structure mixte.
*   **Los Angeles :** Réseau autoroutier et urbain de très grande taille (176 905 nœuds, 619 100 arêtes) structuré sous forme de grille orthogonale.
*   **Hanoï :** Réseau géant (473 209 nœuds, 1 656 200 arêtes) modélisant une mégapole asiatique à forte densité et topologie irrégulière.

Le framework est conçu pour exécuter la même logique de simulation (chargement du réseau, génération de trajets avec contrainte de distance minimale, exécution physique de SUMO, et extraction des métriques écologiques HBEFA3) de manière unifiée, en adaptant uniquement les chemins d'accès système aux fichiers de topologie respectifs.


### Analyse comparative des résiliences géométriques : Radial européen vs Grille orthogonale vs Boucles fermées

L'évaluation des quatre scénarios comportementaux (Constant, Rush Hour, Max Jam, Bottleneck) sur ces six réseaux révèle l'influence déterminante de la géométrie de la voirie sur la résilience globale du trafic.

#### Morphologie Radiale Européenne (Paris, Madrid)
Ces réseaux se caractérisent par une forte convergence des axes principaux vers des points centraux (structures en étoile). Lors du scénario *Bottleneck*, ces structures se révèlent vulnérables : la saturation d'un axe central remonte rapidement le long des voies d'accès radiales, bloquant les carrefours en amont. En raison de la densité des nœuds historiques et du manque de voies rapides de dérivation, les flux de trafic ne disposent pas d'alternatives viables, provoquant un effondrement de la vitesse moyenne et une hausse rapide des émissions de $CO_2$.

#### Grille Orthogonale Nord-Américaine (Los Angeles)
La structure régulière de Los Angeles présente un comportement différent. Grâce à la régularité des carrefours et à la redondance des itinéraires parallèles, le réseau absorbe mieux les surcharges locales du scénario *Bottleneck*. Les véhicules se répartissent d'eux-mêmes sur les axes adjacents via l'algorithme de routage dynamique. Cependant, cette structure est sensible au scénario *Max Jam* : le volume important d'intersections régulées par des feux de signalisation crée des files d'attente successives qui saturent les intersections si l'injection de véhicules est trop massive.

#### Structures Fermées et Voies de Service (Sao Bien, Hanoï)
La morphologie de Hanoï et des complexes de type Vinhomes se caractérise par des axes sinueux, des voies de service étroites et des contraintes d'accès (U-turns imposés par des terre-pleins centraux). Cette géométrie présente une faible résilience face aux variations de charge. La moindre obstruction locale (par exemple, un véhicule électrique manœuvrant pour entrer dans une borne de recharge) bloque l'une des deux voies de circulation disponibles, forçant les motos à se faufiler et ralentissant l'ensemble du flux. Ces réseaux présentent un comportement non-linéaire prononcé, passant sans transition d'un état fluide à une congestion complète.


### Limites matérielles de la micro-simulation : Surcharge mémoire (RAM), traitement XML et phénomène de SWAP

Les expérimentations menées sur ces six villes ont mis en évidence les limites physiques des systèmes de calcul pour exécuter des jumeaux numériques microscopiques sur de grands réseaux (EXPLICATION_PERFORMANCE.md).

Le tableau suivant résume la taille des fichiers de topologie sur le disque dur et l'occupation mémoire vive (RAM) correspondante mesurée en Python lors de l'exécution de l'étape de routage (chargement du réseau via `sumolib`) :

| Ville | Taille du fichier net.xml (Disque) | Occupation mémoire RAM (Python DOM) | Temps de chargement initial |
| :--- | :---: | :---: | :---: |
| **Versailles** | 6,6 Mo | ~110 Mo | < 1 s |
| **Paris** | 52 Mo | ~880 Mo | 4 s |
| **Madrid** | 184 Mo | ~3,1 Go | 18 s |
| **Los Angeles** | 533 Mo | ~8,9 Go | 55 s |
| **Hanoï** | 1 239 Mo | ~18,5 Go | 142 s |

Pour les réseaux de Versailles, Paris et Madrid, l'occupation mémoire reste compatible avec les architectures de PC de bureau standards (généralement équipés de 16 Go de RAM). 

Cependant, pour le réseau de Hanoï (1,2 Go de données XML sur disque), l'empreinte mémoire atteint **18,5 Go de RAM**. Sur une machine disposant de 16 Go de mémoire physique, ce chargement provoque une saturation immédiate. Pour maintenir le processus actif, le système d'exploitation Windows active le mécanisme de **pagination virtuelle (SWAP)**, transférant les pages mémoire excédentaires vers le disque de stockage (SSD ou HDD). 

Ce recours au stockage de masse ralentit considérablement la vitesse de calcul. Le processeur passe une partie de ses cycles d'horloge en attente d'entrées/sorties disque, allongeant le temps de génération des itinéraires de quelques secondes à plusieurs dizaines de minutes. Cette limite matérielle montre la difficulté de déployer des simulations physiques en temps réel pour l'aide à la décision à l'échelle métropolitaine (voir Figures D.10 et D.11, Annexe D).


### Validation du modèle prédictif : Évaluation des temps de réponse et précision (RMSE) IA vs SUMO

Pour contourner ces limites matérielles, le modèle prédictif basé sur l'intelligence artificielle (XGBoost spectral) a été évalué en termes de précision et de vitesse d'exécution face au simulateur physique SUMO de référence.

#### Analyse comparative des temps de calcul
La différence de temps d'exécution entre l'approche physique microscopique et l'inférence par apprentissage machine met en évidence l'intérêt de la rupture technologique :

*   **SUMO (Physique) :** Pour le réseau de Paris avec une charge de 50 000 véhicules, l'exécution complète du pipeline (génération des routes via Dijkstra, calcul de la cinématique des agents et parsing final du fichier d'émissions XML `tripinfo.xml`) requiert un temps moyen de **45 minutes** de calcul CPU continu.
*   **Modèle Prédictif IA (XGBoost) :** L'inférence à partir des caractéristiques spectrales du graphe routier s'exécute en seulement **0,2 seconde** sur le même matériel, offrant un gain de vitesse de calcul significatif.

#### Précision des estimations de pollution ($CO_2$)
La précision du modèle prédictif a été quantifiée en calculant l'erreur quadratique moyenne (Root Mean Squared Error - RMSE) sur un ensemble de test indépendant composé de 200 scénarios urbains simulés sous différentes configurations de volumes et de flottes :
$$RMSE = \sqrt{\frac{1}{N_{test}} \sum_{i=1}^{N_{test}} \left( y_{real, i} - y_{pred, i} \right)^2}$$

Les validations empiriques indiquent que le modèle XGBoost basé sur les caractéristiques spectrales (rayon spectral, constante de Kreiss, etc.) parvient à prédire le volume total d'émissions de $CO_2$ avec un écart moyen inférieur à **4,5 %** par rapport aux résultats calculés par le moteur physique de SUMO. 

Cette précision démontre que la structure géométrique et spectrale du graphe routier permet de capter la dynamique des flux sans avoir à simuler individuellement chaque agent physique. Le planificateur urbain dispose ainsi d'un outil d'évaluation instantané de l'empreinte environnementale des aménagements projetés, combinant la réactivité de l'IA et la fidélité de la micro-simulation.


\newpage

# CONCLUSION GÉNÉRALE ET PERSPECTIVES

### Bilan des contributions scientifiques

Ce travail de recherche a permis de jeter les bases d'un double cadre méthodologique pour la modélisation de la mobilité urbaine décarbonée. 

D'une part, nous avons développé des jumeaux numériques microscopiques de haute-fidélité capables de modéliser l'impact cinématique local de l'intégration d'infrastructures de recharge pour véhicules électriques. Ce travail a été appliqué sur l'axe historique Paris-Versailles ainsi que sur le quartier résidentiel à haute densité de Sao Bien à Hanoï. Il a permis d'intégrer des comportements stochastiques de charge et de documenter des dynamiques de trafic spécifiques comme l'inversion de vacances (*Holiday Reversal*). 

D'autre part, nous avons proposé une méthode de rupture basée sur l'intelligence artificielle topologique spectrale. En exploitant la structure mathématique de la matrice d'adjacence du réseau urbain (rayon spectral, constante de Kreiss, perturbations de Kato) et l'algorithme XGBoost, nous avons démontré qu'il est possible d'estimer instantanément la pollution d'une ville sans simuler individuellement chaque véhicule, contournant ainsi les limites computationnelles traditionnelles.


### La boucle d'optimisation hybride (IA-SUMO) comme perspective ultime

La complémentarité des deux approches développées dans ce mémoire ouvre la voie à un cadre d'optimisation urbaine hybride (IA-SUMO) alliant la rapidité de l'apprentissage machine et la précision chirurgicale de la simulation physique.

Dans ce schéma opérationnel :
1.  Le modèle prédictif basé sur l'IA (XGBoost) est utilisé en amont pour explorer rapidement de larges espaces de solutions (par exemple, tester des milliers d'implantations géométriques de voirie ou de localisations de hubs de recharge). L'IA évalue chaque configuration en une fraction de seconde, éliminant les scénarios inefficaces et sélectionnant les configurations optimales.
2.  Les scénarios retenus par le modèle prédictif sont ensuite injectés dans le jumeau numérique microscopique haute-fidélité (SUMO). Cette simulation physique détaillée permet d'affiner l'analyse locale (vérification des files d'attente au mètre près, comportement d'évitement des deux-roues, impact électrique précis).

Cette boucle hybride permet d'optimiser l'aménagement urbain à grande échelle tout en conservant une précision physique sur les points sensibles du réseau.


### Valorisation académique et publications associées

Les résultats de ce travail de recherche font l'objet d'une valorisation académique à travers la préparation de deux publications scientifiques de fin d'année :

1.  **Première Publication (co-écrite avec VinUniversity) :**
    *   *Titre :* "Microscopic Traffic Flow and Emission Modeling of High-Power Electric Vehicle Charging Infrastructure in Hyper-Dense Master-Planned Communities: The Case of Sao Bien, Vinhomes Ocean Park."
    *   *Contenu :* Présentation du protocole de capture par vision par ordinateur (YOLOv8), de l'architecture du jumeau numérique SUMO localisé, et de l'évaluation des scénarios de densification à Sao Bien.
2.  **Deuxième Publication (co-écrite avec l'École Hexagone) :**
    *   *Titre :* "Topological Graph-Spectral Machine Learning for Real-Time Urban CO2 Emissions Prediction: Applying Kato's Perturbation Theory and Kreiss Constants to Non-Normal Urban Networks."
    *   *Contenu :* Formalisation de la méthode de prédiction spectrale sur graphes non-symétriques, étude de la stabilité via la constante de Kreiss, et évaluation des performances du modèle XGBoost par rapport au simulateur de référence.


\newpage

# GLOSSAIRE DES TERMES TECHNIQUES ET MATHÉMATIQUES

*   **Jumeau Numérique (Digital Twin) :** Réplication virtuelle dynamique d'un système physique réel (ici, la voirie et la cinématique des flux de trafic d'une ville) permettant d'effectuer des tests, de simuler des scénarios d'aménagements et de guider la prise de décision.
*   **Micro-simulation microscopique :** Modélisation individuelle du comportement de chaque agent mobile (vitesse, position, distance de sécurité) à chaque pas de temps discret, par opposition aux modèles macroscopiques basés sur des équations d'écoulement de fluides moyens.
*   **Mésoscopique :** Modèle de simulation hybride intermédiaire dans lequel les flux de trafic ne sont pas calculés véhicule par véhicule, mais modélisés sous forme de files d'attente de paquets d'agents se déplaçant le long de segments de voies, réduisant significativement la charge computationnelle.
*   **TraCI (Traffic Control Interface) :** API native du framework SUMO permettant le contrôle et la modification temps réel des états de simulation (feux, départs, itinéraires) via un script externe (généralement écrit en Python).
*   **Matrice d'Adjacence :** Représentation matricielle carrée de taille $n \times n$ (où $n$ est le nombre de nœuds) décrivant les connexions d'un graphe. Dans le cadre de l'ingénierie routière, elle est asymétrique pour modéliser les sens uniques et pondérée physiquement par le rapport temps de parcours/capacité des voies.
*   **Opérateur Laplacien :** Matrice définie par $L = D - A$ (ou ses variantes normalisées) décrivant les flux de diffusion sur le graphe de la voirie. Ses valeurs propres caractérisent la connectivité structurelle du réseau.
*   **Rayon Spectral ($\rho$) :** Module de la valeur propre dominante d'une matrice. En topologie urbaine, il caractérise la capacité globale de transit et la hiérarchisation des corridors de circulation.
*   **Non-normalité :** Propriété d'une matrice qui ne commute pas avec sa transposée ($A A^T \neq A^T A$). Caractérise les réseaux urbains asymétriques et indique la possibilité d'amplifications transitoires du trafic.
*   **Constante de Kreiss ($K$) :** Métrique caractérisant l'amplitude maximale de l'amplification transitoire des perturbations avant le retour à l'équilibre asymptotique, traduisant la vulnérabilité d'un réseau aux embouteillages en cascade.
*   **Normes de Hardy ($H_2 / H_\infty$) :** Normes d'espaces fonctionnels décrivant la réponse d'un système dynamique aux perturbations. $H_\infty$ caractérise le gain maximal dans le pire scénario de charge, tandis que $H_2$ caractérise la persistance temporelle de l'énergie de perturbation stockée (mémoire de la congestion).
*   **Théorie des Perturbations de Kato :** Formalisme mathématique permettant de dériver analytiquement les variations du spectre d'un opérateur linéaire soumis à une perturbation mineure (par exemple, calculer l'impact de la fermeture d'un pont sur les valeurs propres de transit sans recalculer le système complet).
*   **XGBoost (eXtreme Gradient Boosting) :** Algorithme d'apprentissage supervisé basé sur le boosting d'arbres de décision régularisé, optimisant une fonction de coût complexe via un développement de Taylor de second ordre.
*   **YOLOv8 (You Only Look Once, v8) :** Modèle de réseau de neurones convolutif monocoup optimisé pour le traitement d'images temps réel, réalisant la détection, la classification et le suivi d'objets (véhicules).
*   **Dwell Time (Temps d'arrêt) :** Durée d'immobilisation physique d'un véhicule à une borne pour réaliser sa session de recharge électrique, modélisée ici sous forme de loi normale tronquée.
*   **Warm-Start (Démarrage à chaud) :** Initialisation d'une simulation dans un état pré-chargé (hub de recharge occupé stochastiquement par des véhicules fantômes) pour supprimer le biais transitoire du démarrage à vide.
*   **Spillback (Refoulement) :** Phénomène de propagation d'un bouchon où la file d'attente accumulée sur une voie sature et déborde pour paralyser les intesections situées en amont.
*   **SWAP (Pagination) :** Mécanisme du noyau système consistant à utiliser une partie de l'espace disque comme mémoire virtuelle lente lorsque la mémoire vive (RAM) physique est saturée.


\newpage

# BIBLIOGRAPHIE SCIENTIFIQUE DE RÉFÉRENCE

*   Agarwal, M., Maze, T. H., & Souleyrette, R. (2005). *Impacts of Weather on Urban Freeway Traffic Flow Characteristics and Facility Capacity*. Center for Transportation Research and Education, Iowa State University.
*   Apur (2025). *Évolution des mobilités et du parc automobile dans la Métropole du Grand Paris au 1er Janvier 2025*. Atelier Parisien d'Urbanisme.
*   Boeing, G. (2017). *OSMnx: New methods for acquiring, constructing, analyzing, and visualizing complex street networks*. Computers, Environment and Urban Systems, 65, 126-139.
*   City of Paris (2024). *Rapport d'activité sur les déplacements et la circulation à Paris en 2023*. Mairie de Paris.
*   Kato, T. (1995). *Perturbation Theory for Linear Operators* (Vol. 132). Springer Science & Business Media.
*   Krajzewicz, D., Erdmann, J., Behrisch, M., & Bieker, L. (2012). *Recent development and applications of SUMO - Simulation of Urban MObility*. International Journal on Advances in Systems and Measurements, 5(3&4), 128-138.
*   Kratzsch, V. et al. (2020). *HBEFA Version 4.1 – Handbook Emission Factors for Road Transport*. INFRAS.
*   Kreiss, H. O. (1962). *Über die Stabilitätsdefinition für Differenzengleichungen, die partielle Differentialgleichungen approximieren*. BIT Numerical Mathematics, 2(3), 153-181.
*   Streamlit Inc. (2020). *Streamlit: The fastest way to build and share data applications for machine learning*.
*   Trefethen, L. N., & Embree, M. (2005). *Spectra and Pseudospectra: The Behavior of Nonnormal Matrices and Operators*. Princeton University Press.


\newpage

# ANNEXES : RÉSULTATS DÉTAILLÉS DES RUNS DE SIMULATION MULTI-VILLES

Cette annexe compile l'ensemble des résultats numériques issus des 17 simulations complètes exécutées dans notre framework multi-villes agnostique (simulation_runs_summary.md).

### Tableau des indicateurs macroscopiques des simulations complètes

| Date & Time | City | Vehicles | Avg Speed | CO₂ Emitted | Weather | EV Adoption | Execution Time |
| :--- | :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| 2026-06-08 11:37:40 | **Sydney** | 47 239 | 2.76 km/h | 174.23 Tons | Clear (Optimal) | 15% | 2602.90 s |
| 2026-06-08 10:15:27 | **Rio de Janeiro** | 64 172 | 2.72 km/h | 265.52 Tons | Clear (Optimal) | 15% | 3787.60 s |
| 2026-06-08 09:58:55 | **Monaco** | 6 080 | 5.86 km/h | 21.46 Tons | Clear (Optimal) | 8% | 185.89 s |
| 2026-06-06 10:55:18 | **Casablanca** | 49 785 | 15.62 km/h | 172.64 Tons | Clear (Optimal) | 10% | 17605.75 s |
| 2026-06-06 09:30:40 | **London** | 68 239 | 1.52 km/h | 241.86 Tons | Clear (Optimal) | 15% | 4545.16 s |
| 2026-05-22 11:31:03 | **Sydney** | 55 453 | 2.21 km/h | 215.45 Tons | Clear (Optimal) | 15% | 3752.45 s |
| 2026-05-22 10:33:58 | **Chamonix** | 2 000 | 46.50 km/h | 2.32 Tons | Clear (Optimal) | 8% | 13.07 s |
| 2026-05-21 11:54:12 | **Versailles** | 1 000 | 31.46 km/h | 0.76 Tons | Clear (Optimal) | 10% | 18.96 s |
| 2026-05-13 20:22:36 | **Versailles** | 20 450 | 2.31 km/h | 82.06 Tons | Clear (Optimal) | 10% | 521.54 s |
| 2026-05-12 15:36:46 | **Madrid** | 98 560 | 16.19 km/h | 352.83 Tons | Clear (Optimal) | 10% | 12276.98 s |
| 2026-05-12 11:03:53 | **Paris** | 128 644 | 3.08 km/h | 508.20 Tons | Clear (Optimal) | 10% | 5971.15 s |
| 2026-04-13 06:07:41 | **Paris** | 92 173 | 4.75 km/h | 338.01 Tons | Clear (Optimal) | 10% | 4126.56 s |
| 2026-04-12 12:14:49 | **Paris** | 90 909 | 4.06 km/h | 341.46 Tons | Clear (Optimal) | 10% | 4340.81 s |
| 2026-04-12 08:06:36 | **Paris** | 48 554 | 8.74 km/h | 152.21 Tons | Clear (Optimal) | N/A | 2036.43 s |
| 2026-04-11 16:47:14 | **Paris** | 48 641 | 7.93 km/h | 151.69 Tons | Clear (Optimal) | N/A | 2051.00 s |
| 2026-04-11 16:11:53 | **Versailles** | 12 750 | 4.26 km/h | 49.45 Tons | Clear (Optimal) | N/A | 219.36 s |
| 2026-04-11 13:25:05 | **Paris** | 48 669 | 9.09 km/h | 166.46 Tons | Clear (Optimal) | N/A | 2039.20 s |

### Tonnage de $CO_2$ émis par classe de véhicule de la flotte

| Date & Time | City | Total CO₂ | Cars CO₂ | Motorcycles CO₂ | Buses CO₂ | Trucks CO₂ |
| :--- | :--- | :---: | :---: | :---: | :---: | :---: |
| 2026-06-08 11:37:40 | **Sydney** | **174.23 T** | 88.43 T | 37.37 T | 23.26 T | 25.18 T |
| 2026-06-08 10:15:27 | **Rio de Janeiro** | **265.52 T** | 134.77 T | 56.41 T | 36.30 T | 38.04 T |
| 2026-06-08 09:58:55 | **Monaco** | **21.46 T** | 17.24 T | 2.26 T | 0.95 T | 1.01 T |
| 2026-06-06 10:55:18 | **Casablanca** | **172.64 T** | 104.59 T | 26.36 T | 24.60 T | 17.09 T |
| 2026-06-06 09:30:40 | **London** | **241.86 T** | 123.13 T | 53.54 T | 31.05 T | 34.14 T |
| 2026-05-22 11:31:03 | **Sydney** | **215.45 T** | 109.64 T | 46.80 T | 28.13 T | 30.89 T |
| 2026-05-22 10:33:58 | **Chamonix** | **2.32 T** | 1.88 T | 0.23 T | 0.11 T | 0.10 T |
| 2026-05-21 11:54:12 | **Versailles** | **0.76 T** | 0.54 T | 0.12 T | 0.08 T | 0.03 T |
| 2026-05-13 20:22:36 | **Versailles** | **82.06 T** | 57.07 T | 14.03 T | 7.12 T | 3.83 T |
| 2026-05-12 15:36:46 | **Madrid** | **352.83 T** | 178.47 T | 79.62 T | 55.68 T | 39.05 T |
| 2026-05-12 11:03:53 | **Paris** | **508.20 T** | 374.95 T | 105.01 T | 9.15 T | 19.10 T |
| 2026-04-13 06:07:41 | **Paris** | **338.01 T** | 270.84 T | 47.96 T | 6.28 T | 12.93 T |
| 2026-04-12 12:14:49 | **Paris** | **341.46 T** | 155.06 T | 88.45 T | 63.24 T | 34.71 T |
| 2026-04-12 08:06:36 | **Paris** | **152.21 T** | 69.28 T | 38.10 T | 29.29 T | 15.53 T |
| 2026-04-11 16:47:14 | **Paris** | **151.69 T** | 68.97 T | 38.21 T | 29.13 T | 15.38 T |
| 2026-04-11 16:11:53 | **Versailles** | **49.45 T** | 0.00 T | 0.00 T | 0.00 T | 0.00 T |
| 2026-04-11 13:25:05 | **Paris** | **166.46 T** | 0.00 T | 0.00 T | 0.00 T | 0.00 T |

### Profil de performance informatique de l'exécution (secondes CPU)

| Date & Time | City | Dijkstra Routing | SUMO Physics Engine | XML Parsing | Total Duration |
| :--- | :--- | :---: | :---: | :---: | :---: |
| 2026-06-08 11:37:40 | **Sydney** | 666.64 s | 1934.63 s | 1.58 s | **2602.90 s** |
| 2026-06-08 10:15:27 | **Rio de Janeiro** | 555.46 s | 3229.83 s | 2.30 s | **3787.60 s** |
| 2026-06-08 09:58:55 | **Monaco** | 7.69 s | 178.03 s | 0.16 s | **185.89 s** |
| 2026-06-06 10:55:18 | **Casablanca** | 13577.62 s | 4026.18 s | 1.89 s | **17605.75 s** |
| 2026-06-06 09:30:40 | **London** | 1886.52 s | 2655.74 s | 2.90 s | **4545.16 s** |
| 2026-05-22 11:31:03 | **Sydney** | 997.87 s | 2752.49 s | 2.08 s | **3752.45 s** |
| 2026-05-22 10:33:58 | **Chamonix** | 4.27 s | 8.75 s | 0.04 s | **13.07 s** |
| 2026-05-21 11:54:12 | **Versailles** | 6.07 s | 12.84 s | 0.03 s | **18.96 s** |
| 2026-05-13 20:22:36 | **Versailles** | 48.35 s | 472.63 s | 0.55 s | **521.54 s** |
| 2026-05-12 15:36:46 | **Madrid** | 9716.06 s | 2558.17 s | 2.72 s | **12276.98 s** |
| 2026-05-12 11:03:53 | **Paris** | 3371.01 s | 2596.00 s | 4.13 s | **5971.15 s** |
| 2026-04-13 06:07:41 | **Paris** | 2353.06 s | 1770.98 s | 2.50 s | **4126.56 s** |
| 2026-04-12 12:14:49 | **Paris** | 2421.37 s | 1916.28 s | 3.16 s | **4340.81 s** |
| 2026-04-12 08:06:36 | **Paris** | 1167.02 s | 868.03 s | 1.37 s | **2036.43 s** |
| 2026-04-11 16:47:14 | **Paris** | 1134.40 s | 915.39 s | 1.20 s | **2051.00 s** |
| 2026-04-11 16:11:53 | **Versailles** | 17.36 s | 201.73 s | 0.26 s | **219.36 s** |
| 2026-04-11 13:25:05 | **Paris** | 1145.37 s | 892.65 s | 1.17 s | **2039.20 s** |



### Index des illustrations graphiques et des visualisations de simulation

Cette section rassemble les planches graphiques du jumeau numérique, de la topologie spectrale et du modèle d'apprentissage supervisé.

#### Planches relatives au hub de recharge de Sao Bien (Hanoï)
*   **Figure D.1 : Détection et classification multi-classes via YOLOv8**  
    [Illustration de la vue plongeante du 3ème étage du Vincom Mega Mall montrant les boîtes de délimitation de détection pour les classes *Standard Car*, *Electric Vehicle* et *Motorcycle* avec l'affichage de l'identifiant unique de suivi (tracking)].
*   **Figure D.2 : Géométrie d'accès du Hub de recharge de Sao Bien (Floor 0)**  
    [Plan masse géométrique représentant les 12 places de recharge en épi à 135 degrés le long de la voie de service et la file d'attente de taxis GSM en amont].
*   **Figure D.3 : Profils de charge de trafic et inversion modale (« Holiday Reversal »)**  
    [Histogramme comparatif de la répartition modale de la flotte de véhicules légers en circulation à midi : Semaine classique (dominée par 50.7 % de motos) vs Vacances nationales (dominée par 40.0 % de véhicules électriques et 66.3 % de part électrique sur le total des véhicules à 4 roues)].
*   **Figure D.4 : Profils d'évolution temporelle des temps d'attente au hub sous les scénarios S0 à S5**  
    [Graphiques de files d'attente stochastiques montrant l'envolée des temps d'attente à 45.2 minutes sous le scénario critique de saturation S4b, et sa chute spectaculaire à 6.8 minutes sous le scénario de mitigation S5 par expansion physique (+8 slots)].

#### Planches de topologie spectrale et mathématique des réseaux urbains
*   **Figure D.5 : Distribution des spectres des matrices d'adjacence dans le plan complexe**  
    [Nuages de points représentant les valeurs propres complexes ($\lambda_1, \dots, \lambda_n$) des graphes asymétriques pour les villes de Paris, Los Angeles et Hanoï, illustrant la dissymétrie et les structures communautaires].
*   **Figure D.6 : Frontières de pseudospectres et non-normalité**  
    [Contours de la résolvante $\|(zI - A)^{-1}\|_2$ dans le plan complexe pour Marseille, Paris et Los Angeles, mettant en évidence les zones d'amplification transitoire et le calcul graphique de la constante de Kreiss].

#### Planches d'évaluation du modèle d'Intelligence Artificielle
*   **Figure D.7 : Importance relative des 43 descripteurs du modèle XGBoost (Feature Importance)**  
    [Graphique en barres horizontales affichant les coefficients d'importance du modèle final : domination de `nb_total_veh` et `nb_voitures`, suivi des métriques spectrales pondérées `sigma_max_weighted` et `h2_norm_weighted`].
*   **Figure D.8 : Courbes d'apprentissage et de convergence de XGBoost**  
    [Graphique de l'évolution de la fonction de perte (RMSE) sur les sous-ensembles d'entraînement et de validation au cours des itérations d'arbres (boosting rounds), démontrant la stabilité de la convergence sans sur-apprentissage].
*   **Figure D.9 : Diagramme de dispersion (Scatter Plot) IA vs Ground Truth (SUMO)**  
    [Graphique de dispersion comparant les émissions de CO₂ prédites par le modèle XGBoost face aux valeurs réelles mesurées dans le simulateur de référence SUMO, avec la ligne de régression $y=x$ et le calcul de l'erreur moyenne de 4.5 %].

#### Planches de cartographie des congestions et heatmaps de simulation
*   **Figure D.10 : Cartes thermiques (Heatmaps) de congestion spatiale dans le jumeau numérique**  
    [Visualisations SIG colorées des réseaux routiers de Paris, Londres, Los Angeles et Hanoï après une simulation de pointe de 1 heure. Les segments routiers sont colorés du gris foncé (fluide) au rouge écarlate (saturation complète / gridlock)].
*   **Figure D.11 : Comparaison des durées informatiques et de l'occupation mémoire RAM**  
    [Diagramme à barres comparant l'occupation de la RAM (de 110 Mo pour Versailles à 18.5 Go pour Hanoï) et le temps de calcul CPU (45 minutes pour SUMO physique à Paris contre 0.2 seconde pour l'inférence XGBoost)].
