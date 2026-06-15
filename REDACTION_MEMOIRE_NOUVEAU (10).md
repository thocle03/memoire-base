# RÉSUMÉ & MOTS-CLÉS

### Résumé
Ce mémoire de fin d'études présente un cadre méthodologique de recherche pour l'évaluation et la prédiction de la résilience cinématique et environnementale des réseaux de transport urbain face à la transition vers l'électromobilité. La planification des infrastructures de recharge à haute puissance en milieu dense se heurte à une double contrainte : l'hybridation des flux cinématiques et énergétiques, et la lenteur computationnelle des micro-simulateurs physiques multi-agents comme SUMO. Ce travail de recherche s'articule autour d'un double objectif complémentaire. 

D'une part, nous développons des jumeaux numériques microscopiques de haute-fidélité calibrés par vision par ordinateur (YOLOv8) sur l'avenue Sao Bien à Hanoï (Vinhomes Ocean Park), documentant des comportements stochastiques d'arrêt (*Dwell Time*) et l'inversion modale de trafic lors des vacances (« Holiday Reversal »). 

D'autre part, nous proposons une méthode de rupture basée sur l'**Intelligence Artificielle Topologique Spectrale**. En exploitant la structure mathématique non-normale de la matrice d'adjacence du réseau urbain (rayon spectral, constante de Kreiss, perturbations de Kato) et l'algorithme XGBoost, notre modèle prédictif direct estime de manière instantanée les émissions globales de $CO_2$ sous divers régimes météorologiques grâce à un paradigme de bases de données d'apprentissage découplées. Les résultats démontrent une précision de prédiction supérieure à 95 % (RMSE de 15,9 tonnes de $CO_2$) et un temps d'exécution de 0,2 seconde, éliminant les goulots d'étranglement computationnels (surcharge RAM/SWAP) et ouvrant la voie à des boucles d'optimisation hybrides (IA-SUMO) pour les planificateurs de la ville intelligente.

### Mots-clés
Jumeau Numérique, Micro-simulation, SUMO, Analyse Spectrale, Graphes Non-Normaux, Constante de Kreiss, Théorie des Perturbations de Kato, XGBoost, Mobilité Durable, Vinhomes Ocean Park, Hanoï.

\newpage

# REMERCIEMENTS

Je tiens à exprimer ma profonde gratitude à l'ensemble des personnes qui ont contribué au succès de ce travail de recherche et à l'aboutissement de mon cursus de fin d'études.

Tout d'abord, je remercie chaleureusement mon tuteur académique, **M. Pierre Uzarralde**, pour son suivi rigoureux, ses conseils méthodologiques et son exigence scientifique tout au long de la rédaction de ce rapport professionnel.

Mes remerciements s'adressent également aux équipes de recherche en mobilité intelligente de l'Université **VinUniversity** à Hanoï (Vietnam), qui m'ont accueilli lors de mon séjour de recherche et m'ont fourni les moyens matériels et de collecte de données nécessaires à cette étude.

Je remercie particulièrement les groupes **Vingroup**, **VinFast** et **V-Green** pour l'accès aux données opérationnelles du hub de recharge ultra-rapide de Sao Bien (Vinhomes Ocean Park), ainsi que la compagnie **GSM (Green and Smart Mobility)** pour les données relatives à leur flotte de taxis électriques.

Enfin, je remercie l'administration et le corps enseignant de l'**École Hexagone** pour la qualité de l'enseignement dispensé, ainsi que ma famille et mes proches pour leur soutien indéfectible durant cette année académique.

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
*   **Dwell Time (Temps d'arrêt) :** Durée d'immobilisation physique d'un véhicule à une borne pour réaliser sa session de recharge électrique, modélisée sous forme de loi normale tronquée.
*   **Warm-Start (Démarrage à chaud) :** Initialisation d'une simulation dans un état pré-chargé (hub de recharge occupé stochastiquement par des véhicules fantômes) pour supprimer le biais transitoire du démarrage à vide.
*   **Spillback (Refoulement) :** Phénomène de propagation d'un bouchon où la file d'attente accumulée sur une voie sature et déborde pour paralyser les intersections situées en amont.
*   **SWAP (Pagination) :** Mécanisme du noyau système consistant à utiliser une partie de l'espace disque comme mémoire virtuelle lente lorsque la mémoire vive (RAM) physique est saturée.

\newpage

# LISTE DES ILLUSTRATIONS

*   **Figure 1 :** Répartition du fluide Midday lors d'un midi de semaine classique face à l'inversion modale observée en période de congés (*Holiday Reversal*) à Vinhomes Ocean Park (*Chapitre 3, Section 1*).
*   **Figure 2 :** Profils d'évolution temporelle des temps d'attente au hub sous les scénarios S0 à S5 à Vinhomes Ocean Park (*Chapitre 3, Section 1*).
*   **Figure 3 :** Matrice de corrélation de Pearson entre les variables physiques et spectrales de la base de données multi-villes (*Chapitre 3, Section 2*).
*   **Figure 4 :** Sensibilité des émissions de CO₂ au volume de véhicules (à droite) et à l'impédance spectrale (à gauche) (*Chapitre 3, Section 2*).
*   **Figure 5 :** *[Espace réservé pour l'insertion des graphiques de validation croisée (Scatter Plot IA vs SUMO sur la ville test)]* (*Chapitre 3, Section 2*).
*   **Figure 6 :** Visualisation SIG de la ville test (Illustration de la cartographie des congestions) (*Chapitre 3, Section 2*).

\newpage

# LISTE DES TABLEAUX

*   **Tableau 1 :** Caractéristiques topologiques générales des 21 villes étudiées (nombre de nœuds, d'arêtes, densité de connexion, degré moyen, indice d'asymétrie, ratio de sources et de puits) (*Chapitre 2, Section 2*).
*   **Tableau 2 :** Métriques spectrales de non-normalité des matrices d'adjacence non pondérées pour les 21 réseaux urbains (asymétrie, rayon spectral, valeur singulière maximale, norme $H_2$, constante de Kreiss) (*Chapitre 2, Section 2*).
*   **Tableau 3 :** Performances comparatives des modèles d'apprentissage machine pour la prédiction directe des émissions de $CO_2$ (RMSE, MAE, $R^2$ de XGBoost, Ridge, Random Forest et MLP) (*Chapitre 2, Section 3*).
*   **Tableau 4 :** Profil d'importance des variables (*Feature Importance*) dans le modèle final de prédiction de $CO_2$ par XGBoost (*Chapitre 2, Section 3*).
*   **Tableau 5 :** Taille géométrique des fichiers net.xml sur disque et occupation correspondante de la mémoire RAM en Python (filtrage DOM via sumolib) pour cinq villes types (*Chapitre 3, Section 2*).
*   **Tableau 6 :** Extrait représentatif de 17 simulations parmi les 50 simulations complètes du framework multi-villes agnostique (véhicules, vitesse moyenne, $CO_2$ émis, conditions météo, taux d'adoption EV, temps d'exécution) (*Chapitre 3, Section 2*).
*   **Tableau 7 :** Répartition des tonnages de $CO_2$ émis par classe de véhicule de la flotte (voitures, motos, bus, camions) pour l'extrait représentatif des 17 simulations de référence (*Chapitre 3, Section 2*).
*   **Tableau 8 :** Profil de performance informatique détaillé des exécutions CPU (temps de routage Dijkstra, calcul physique SUMO, parsing XML, durée totale) (*Chapitre 3, Section 2*).

\newpage

# INTRODUCTION

### Expansion urbaine, transition électrique et défis environnementaux de la mobilité

Aujourd'hui, plus de la moitié de la population mondiale réside en milieu urbain. Selon les rapports officiels des Nations Unies (United Nations, 2018), 55 % de la population globale vivait en ville en 2018, et cette proportion devrait franchir le seuil des 68 % d'ici 2050. Cette transition démographique sans précédent représente un apport de plus de 2,5 milliards d'urbains supplémentaires, dont près de 90 % de la croissance se concentrera dans les pays en développement d'Asie et d'Afrique. Cette métamorphose rapide des métropoles s'accompagne d'une densification extrême de l'espace et d'une augmentation géométrique des flux de transport et des déplacements quotidiens (World Bank, 2024).

Les infrastructures et réseaux routiers existants n'ayant pas été conçus pour absorber une telle cinématique de croissance, cette saturation engendre des congestions chroniques de trafic et une hausse massive des émissions polluantes. À l'échelle mondiale, le secteur des transports routiers constitue l'un des principaux contributeurs au changement climatique. Selon les données de l'Agence Internationale de l'Énergie (IEA, 2025), le transport routier est responsable de plus de 6 Gt de $CO_2$ émises en 2024, affichant une croissance continue de 8 % depuis 2015. Dans ce bilan carbone, les véhicules particuliers et utilitaires légers représentent plus de 60 % des émissions, tandis que les véhicules lourds et camions comptent pour environ un tiers.

La congestion routière aggrave considérablement cette situation : les cycles d'arrêt-démarrage et l'inactivité des moteurs thermiques dans les embouteillages (*idling*) provoquent une surconsommation de carburant et des émissions de polluants locaux majeures, en particulier chez les poids lourds. L'évaluation de l'Organisation de Coopération et de Développement Économiques (OECD, 2024) et de l'Agence Européenne pour l'Environnement (European Environment Agency, 2024) montre que l'efficacité écologique globale ne dépend pas uniquement de l'efficacité énergétique individuelle des véhicules, mais également de la résilience cinématique et de la fluidité des réseaux routiers eux-mêmes, qui peinent à dissiper les ondes de congestion en conditions de haute densité.

Pour endiguer ce fléau environnemental, l'électrification massive des flottes de véhicules s'est imposée comme le pivot central des politiques publiques. En France, l'État encourage activement cette transition par des aides financières ciblées (bonus écologique, prime à la conversion) (French Government, 2026) et un déploiement massif d'infrastructures de recharge porté par des initiatives publiques et privées. Le réseau national s'étend rapidement le long des grands axes autoroutiers, mais s'implante aussi dans les zones commerciales à travers les réseaux de grande distribution, à l'image des stations installées par des enseignes de distribution majeures (Avere-France, 2025).

Dès lors, la problématique générale de ce travail de recherche s'établit comme suit : **comment développer un modèle numérique capable d'estimer de manière instantanée, précise et généralisable les émissions de $CO_2$ urbaines générées par le trafic routier, dans n'importe quelle ville du monde, sous divers scénarios de transition de flotte et d'infrastructures ?**

### Le verrou scientifique : La barrière computationnelle de la micro-simulation physique

Les réseaux routiers urbains se comportent comme des systèmes complexes hautement non-linéaires (*Complex Adaptive Systems*). Une modification locale de la topologie — qu'il s'agisse de l'ajout d'un giratoire, du retrait d'une voie de circulation pour y aménager une piste cyclable, ou de l'installation d'un hub de recharge rapide — peut déclencher des ondes de choc cinématiques et propager des congestions à l'ensemble de la ville (Braess, 1968). Face à ces comportements émergents, les urbanistes et planificateurs sont historiquement confrontés à une impossibilité de prévoir a priori la robustesse et la vulnérabilité d'un réseau viaire sous charge.

Pour étudier ces interactions physiques à l'échelle granulaire, l'ingénierie du transport s'est structurée autour d'outils de micro-simulation multi-agents tels que SUMO (Simulation of Urban MObility) (Krajzewicz et al., 2012), Aimsun, MATsim ou PTV Vissim. Ces simulateurs modélisent de manière granulaire le déplacement de chaque agent (vitesse, changement de voie, distance de sécurité) seconde par seconde en s'appuyant sur des lois physiques de poursuite (*car-following*). Couplés à des bases de données d'émissions de référence telles que le modèle HBEFA3 (Kratzsch et al., 2020), ils offrent une fidélité remarquable pour quantifier les surémissions de $CO_2$ associées aux comportements transitoires des véhicules (cycles d'arrêt-démarrage).

Néanmoins, cette précision physique se heurte à une barrière computationnelle majeure. La résolution séquentielle des équations différentielles cinématiques pour chaque véhicule est extrêmement coûteuse en temps de calcul CPU et en mémoire vive RAM. Si ces simulateurs se révèlent efficaces pour des évaluations ciblées à petite échelle, leur passage à l'échelle métropolitaine s'avère impossible en pratique. Simuler un scénario de plusieurs heures impliquant des centaines de milliers d'agents sur une métropole comme Los Angeles ou Paris sature les ressources matérielles des ordinateurs portables classiques des planificateurs, entraînant des temps de calcul préjudiciables (plusieurs heures par exécution) et des écritures de mémoire virtuelle lentes sur le disque (mécanisme de SWAP). Cette inertie computationnelle empêche l'exploration de larges espaces de scénarios et interdit toute utilisation pour la prise de décision en temps réel ou dans des boucles d'optimisation automatique.

Cette limitation majeure justifie le développement de nouvelles approches de rupture, capables de contourner la simulation physique en s'appuyant sur l'intelligence artificielle pour prédire de manière instantanée la pollution urbaine globale.

### Objectif de la Recherche et Structure du Mémoire

Pour briser ce verrou technologique, ce mémoire propose une méthodologie hybride alliant la précision locale de la micro-simulation et la rapidité de prédiction instantanée de l'intelligence artificielle. Nos travaux s'articulent autour d'un double objectif : la modélisation locale par jumeau numérique microscopique et la généralisation à grande échelle par intelligence artificielle topologique spectrale.

Pour exposer notre recherche avec toute la rigueur universitaire requise, ce mémoire est structuré en trois grands chapitres :
*   Le **Chapitre 1** réexplique le contexte de base de la transition vers l'électromobilité, le protocole général de traitement topologique des réseaux à partir de cartes OpenStreetMap (OSM) via l'outil `netconvert`, et le protocole général de collecte de données de trafic par vision par ordinateur (YOLOv8).
*   Le **Chapitre 2** pose le cadre théorique et mathématique rigoureux de notre méthodologie. Nous y détaillons les équations cinématiques du modèle de Krauß, le traitement géométrique de la connexité (Tarjan), le formalisme des graphes non-normaux (constante de Kreiss, perturbations de Kato, normes de Hardy) et l'architecture mathématique de notre modèle IA XGBoost à 43 descripteurs. Chaque formule est accompagnée d'une explication physique vulgarisée.
*   Le **Chapitre 3** est notre chapitre principal d'applications et de validations. La Section 1 y présente l'étude de cas microscopique du hub de recharge de Hanoï (Vinhomes Ocean Park) et ses scénarios de mitigation. La Section 2 y présente l'expérimentation macroscopique globale sur 50 simulations, l'évaluation des performances informatiques (RAM, SWAP) et la validation transversale (*cross-city*) de l'IA sur des villes cibles non entraînées.

\newpage

# CHAPITRE 1 : CONTEXTE DE LA MOBILITÉ DURABLE, ACQUISITION ET TRAITEMENT DES DONNÉES

### Section 1 : La transition vers l'électromobilité et le problème d'échelle

La transition vers la ville intelligente (*Smart City*) ne se résume pas à l'intégration superficielle de technologies de communication au sein de l'espace urbain ; elle constitue une réponse structurelle à l'impératif de décarbonation. Dans l'architecture d'une métropole moderne, les systèmes de transport représentent l'un des principaux réservoirs d'optimisation carbone. Les politiques publiques traditionnelles, basées sur l'expansion continue des capacités de voirie, ont montré leurs limites en se heurtant au phénomène de demande induite. La décarbonation requiert donc une approche combinée : la transition technologique des moteurs thermiques vers des systèmes de propulsion électrique, et l'optimisation dynamique des flux pour minimiser les pertes énergétiques associées à la congestion.

Cette restructuration des systèmes de transport impose de repenser la relation entre l'espace routier et le réseau d'alimentation en énergie. Les bornes de recharge s'insèrent dans le domaine public, sur les places de stationnement ou les voies de desserte commerciale. Cette hybridation physique transforme chaque point de recharge en un nœud d'attraction cinématique, modifiant localement la trajectoire des véhicules et perturbant l'écoulement des flux environnants. 

L'intégration de flottes entièrement décarbonées de transports publics et de taxis électriques crée des perturbations majeures sur le réseau routier local. La recharge simultanée de flottes d'autobus et de taxis au niveau de stations à haute puissance modifie l'écoulement naturel du trafic. Les manœuvres d'insertion et d'attente à proximité des hubs de recharge modifient la cinématique locale, engendrant des congestions localisées inattendues.

### Section 2 : Traitement topologique des réseaux OpenStreetMap (OSM)

La construction d'une simulation de trafic microscopique débute par l'importation de la topologie réelle de la voirie. Le protocole standardisé développé dans nos travaux s'appuie sur la récupération des données cartographiques collaboratives d'OpenStreetMap (OSM). Un fichier `.osm` brut contient des informations géographiques détaillées (coordonnées des nœuds d'intersection, géométrie des rues sous forme de polylignes, limitations de vitesse et sens de circulation). Cependant, ces données brutes ne sont pas directement exploitables par un simulateur physique et nécessitent un pipeline de compilation et de nettoyage systématique.

Le traitement topologique est opéré par l'outil **`netconvert`**, fourni par la suite logicielle SUMO. Ce compilateur de réseau réalise trois tâches critiques :
1.  **Uniformisation géométrique et projection cartographique :** Les coordonnées sphériques d'OSM (latitude/longitude sous le système WGS84) sont projetées dans un système cartésien plan UTM (*Universal Transverse Mercator*). Cette projection permet de travailler avec des distances métriques réelles, indispensables pour résoudre les équations différentielles de vitesse et d'accélération des véhicules.
2.  **Simplification et nettoyage des nœuds complexes :** Les données OSM comportent de nombreuses intersections découpées de manière artificielle en micro-nœuds (ronds-points historiques, bretelles d'accès complexes). `netconvert` applique des algorithmes de fusion topologique pour agréger ces grappes de micro-nœuds en nœuds de jonction uniques. Il élimine ainsi les segments routiers extrêmement courts (inférieurs à 5 mètres) qui provoqueraient des instabilités numériques ou des collisions physiques artificielles dans les modèles de poursuite.
3.  **Établissement des connexions de voies (*Lane Connections*) :** `netconvert` parse les attributs de voirie pour générer les liaisons géométriques entre chaque voie entrante et chaque voie sortante d'un carrefour, en y insérant les règles de priorité par défaut (priorité à droite, stop, feux tricolores) et les classes de véhicules autorisées (ex. voies réservées aux bus).

Le résultat de cette compilation est un fichier XML unique de réseau, nommé **`net.xml`**. Ce fichier structure l'ensemble de la voirie sous forme de nœuds (`<junction>`), d'arêtes (`<edge>`) et de connexions (`<connection>`). Pour la micro-simulation, ce fichier est complété par des fichiers de trajets (`<trip>`) décrivant le point d'injection, la destination et l'heure de départ de chaque véhicule, permettant au module de routage dynamique d'allouer les itinéraires optimaux sur le graphe.

### Section 3 : Protocole général de collecte par vision par ordinateur (YOLOv8)

La collecte de données précises sur les flux de trafic en milieu urbain dense nécessite une méthodologie d'observation rigoureuse pour garantir la qualité des données d'entrée des jumeaux numériques. Notre protocole s'appuie sur le déploiement de caméras en hauteur (typiquement au niveau des étages supérieurs des bâtiments bordant les axes routiers majeurs).

Ce positionnement en hauteur (angle d'observation incliné entre 30 et 45 degrés par rapport à l'horizontale) répond à une contrainte technique majeure : **la minimisation de l'occlusion visuelle**. Dans un contexte de trafic mixte, où les flux comportent une part importante de deux-roues motorisés circulant de front avec des autobus et des véhicules de gabarit important, une capture au niveau du sol souffre d'un biais de masquage systématique. La perspective plongeante permet d'obtenir une vue dégagée, garantissant que chaque trajectoire de véhicule reste visible tout au long du segment d'analyse.

Pour automatiser l'extraction des données de trafic à partir des séquences vidéo haute définition capturées sur site, nous avons déployé un pipeline de traitement d'images basé sur le modèle de réseau de neurones convolutifs **YOLOv8** (You Only Look Once, version 8). 

Ce pipeline de vision par ordinateur fonctionne de la manière suivante :
1.  **Segmentation temporelle :** Les vidéos brutes sont découpées en segments temporels de référence pour correspondre aux intervalles standards d'analyse de trafic.
2.  **Inférence et détection :** Le modèle YOLOv8 traite les trames vidéo avec un seuil de confiance de détection fixé à $0.50$.
3.  **Classification catégorielle :** Les objets détectés sont classés selon trois classes de véhicules : *Standard Car*, *Electric Vehicle*, et *Motorcycle*.
4.  **Suivi de trajectoire (Tracking) :** L'algorithme associe un identifiant unique à chaque boîte de délimitation à l'aide d'un filtre de Kalman et d'une matrice de coût basée sur le recouvrement spatial des boîtes (Intersection over Union - IoU) entre trames successives.

\newpage

# CHAPITRE 2 : MODÉLISATION CINÉMATIQUE ET FONDATIONS THÉORIQUES DE LA TOPOLOGIE SPECTRALE

Le développement d'un modèle d'intelligence artificielle capable de se substituer à la simulation physique requiert une compréhension intime des équations cinématiques qui régissent le déplacement des véhicules (microscopique) et des propriétés topologiques du réseau qui gouvernent l'écoulement des flux (macroscopique). Ce chapitre pose le formalisme mathématique rigoureux de ces deux échelles et explicite physiquement la signification de chaque formule.

### Section 1 : Le moteur behavioriste de SUMO

#### Abstraction de la voirie
Le simulateur SUMO modélise les réseaux de transport sous forme de réseaux logiques basés sur la théorie des graphes orientés. Dans ce formalisme, chaque intersection physique est représentée par un nœud unique doté d'une géométrie polygonale décrivant sa surface de jonction. Les tronçons routiers reliant les nœuds sont modélisés par des arêtes, subdivisées en une ou plusieurs voies de circulation (*lanes*).

Chaque voie possède des attributs géométriques et comportementaux stricts : une polyligne tridimensionnelle décrivant son axe central, une largeur constante (généralement fixée à 3,2 mètres pour les voies urbaines standards), une liste de classes de véhicules autorisées et une vitesse limite supérieure déterminant la vitesse de référence des agents.

La transition entre deux arêtes consécutives s'effectue via des **connecteurs géométriques** (*connections*) définis à l'intérieur des nœuds. Ces connecteurs lient précisément une voie de l'arête d'approche à une voie de l'arête de sortie. Ils supportent les règles de priorité (ex: céder le passage, priorité absolue) et les configurations de signalisation dynamique (phases de feux).

#### Le modèle de poursuite cinématique de Krauß
Pour reproduire le mouvement individuel des véhicules le long des arêtes, SUMO implémente par défaut le modèle comportemental de poursuite de véhicule développé par **Krauß**. Ce modèle cinématique calcule à chaque pas de temps la vitesse optimale d'un véhicule suiveur pour éviter toute collision avec le véhicule leader, même si ce dernier décélère brutalement.

Soit un véhicule suiveur $F$ caractérisé par sa position $x(t)$ et sa vitesse $v(t)$, circulant derrière un véhicule leader $L$ caractérisé par sa position $x_L(t)$ et sa vitesse $v_L(t)$. L'intervalle spatial libre (ou gap) séparant les deux véhicules est défini par :
$$g(t) = x_L(t) - x(t) - l_L$$
où $l_L$ est la longueur physique du véhicule leader.

Le modèle détermine la vitesse sécuritaire $v_{safe}(t)$ par la relation suivante :
$$v_{safe}(t) = v_L(t) + \frac{g(t) - v_L(t)\tau}{\frac{v(t) + v_L(t)}{2d} + \tau}$$
où $\tau$ représente le temps de réaction du conducteur, et $d$ sa capacité de décélération maximale.

*Explication physique de la formule :*
> La formule de vitesse sécuritaire exprime un principe de conservation physique simple. Le numérateur $g(t) - v_L(t)\tau$ représente la distance de sécurité nette disponible (le gap spatial diminué de la distance parcourue par le leader pendant le temps de réaction du conducteur suiveur). Le dénominateur $\frac{v(t) + v_L(t)}{2d} + \tau$ représente le temps total nécessaire au freinage d'urgence (le rapport entre la vitesse moyenne des deux véhicules et leur décélération maximale, auquel s'ajoute le temps de réaction). Diviser la distance de sécurité nette par ce temps de freinage donne la vitesse maximale sécurisée à laquelle le suiveur peut rouler pour s'arrêter à temps si le leader pile devant lui.

La vitesse théorique souhaitée pour le pas de temps suivant, $v_{target}(t)$, est le minimum parmi les contraintes physiques et légales :
$$v_{target}(t) = \min\left( V_{max}, v(t) + a \cdot \Delta t, v_{safe}(t) \right)$$
où $V_{max}$ est la vitesse limite de la voie, et $a$ est la capacité d'accélération maximale du véhicule.

Enfin, pour introduire la variabilité des comportements humains (retards de réaction légers, imprécisions de contrôle), une perturbation stochastique négative $\eta$ est soustraite de la vitesse cible pour obtenir la vitesse finale appliquée à l'agent :
$$v(t + \Delta t) = \max\left( 0, v_{target}(t) - \eta \right)$$
où $\eta$ est une variable aléatoire distribuée uniformément sur l'intervalle $[0, \sigma \cdot a \cdot \Delta t]$, le paramètre $\sigma \in [0, 1]$ caractérisant le degré d'inattention du conducteur.

#### Extraction de la connexité par l'algorithme de Tarjan
Pour garantir la cohérence dynamique du réseau de simulation, il est crucial d'identifier et d'isoler les sections de graphe déconnectées (ex. une route à sens unique sans issue). Pour ce faire, notre pipeline met en œuvre l'**algorithme des Composantes Fortement Connexes (SCC)** de Tarjan.

Soit un graphe orienté $G = (V, E)$. Une composante fortement connexe de $G$ est un sous-graphe maximal $G' = (V', E')$ dans lequel il existe un chemin orienté reliant chaque paire de nœuds de manière bidirectionnelle :
$$\forall (u, v) \in V'^2, \quad u \rightsquigarrow v \quad \text{et} \quad v \rightsquigarrow u$$

L'algorithme de Tarjan utilise un parcours en profondeur (DFS) pour identifier ces composantes en un temps linéaire $\mathcal{O}(|V| + |E|)$, nous permettant de filtrer les réseaux pour ne conserver que la plus grande composante fortement connexe, éliminant ainsi les "nœuds isolés" et les culs-de-sac structurels qui fausseraient les simulations de routage à long terme.

### Section 2 : Théorie des graphes non-normaux et signatures spectrales

#### Formalisation matricielle et pondération d'impédance
Pour modéliser mathématiquement le réseau routier, nous le représentons sous la forme d'un graphe orienté et pondéré $G = (V, E)$, où $V$ désigne l'ensemble des nœuds ($n = |V|$), représentant les intersections physiques du réseau, et $E$ désigne l'ensemble des arêtes orientées ($m = |E|$), modélisant les tronçons routiers.

La connectivité et l'impédance physique du réseau sont codées dans la **matrice d'adjacence pondérée** $A \in \mathbb{R}^{n \times n}$. La représentation réaliste d'un réseau urbain impose une double complexité :
1.  **Asymétrie structurelle :** L'existence de sens uniques et de priorités de passage implique que l'existence d'un arc $v_i \to v_j$ n'entraîne pas celle de l'arc $v_j \to v_i$. Ainsi, $A_{ij} \neq A_{ji}$.
2.  **Pondération d'impédance physique :** Chaque coefficient $A_{ij}$ quantifie l'impédance géométrique (le coût ou temps de parcours) du tronçon routier reliant le nœud $i$ au nœud $j$ :
    $$A_{ij} = \begin{cases} \frac{L_{ij}}{W_{ij} \cdot C_{ij}} & \text{si } (v_i, v_j) \in E \\ 0 & \text{sinon} \end{cases}$$
    où $L_{ij}$ représente la longueur du tronçon (en mètres), $W_{ij}$ la vitesse maximale autorisée (en m/s), et $C_{ij}$ le nombre de voies de circulation. 

*Explication physique de la pondération :*
> Le rapport $\frac{L_{ij}}{W_{ij}}$ représente le **temps de parcours libre** de l'arête (combien de secondes un véhicule met à traverser la rue à vitesse maximale sans trafic). En le divisant par le nombre de voies $C_{ij}$, on intègre sa capacité d'atténuation de la congestion. Une avenue large (plusieurs voies) offre une plus grande capacité d'absorption de trafic, ce qui réduit son impédance effective. Ainsi, plus la rue est large et rapide, plus son impédance $A_{ij}$ est faible, ce qui est physiquement cohérent avec notre objectif de minimiser la résistance globale aux flux.

Considérons un exemple minimal de réseau routier à 4 nœuds représentant une boucle fermée simple (cycle orienté) :
```text
       (v1) ---------> (v2)
        ^               |
        |               |
        |               v
       (v4) <--------- (v3)
```
Dans ce modèle, si l'on suppose que toutes les voies ont des caractéristiques identiques telles que le rapport $\frac{L_{ij}}{W_{ij} \cdot C_{ij}} = 1$, la matrice d'adjacence orientée pondérée $A_{ex}$ s'écrit :
$$A_{ex} = \begin{pmatrix}
0 & 1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 1 \\
1 & 0 & 0 & 0
\end{pmatrix}$$
L'absence de symétrie de cette matrice est évidente ($A_{ex} \neq A_{ex}^T$).

#### Le concept de non-normalité et amplification transitoire
Une matrice carrée $A$ est dite **normale** si et seulement si elle commute avec sa transposée, soit $A A^T = A^T A$. Dans le cas des réseaux routiers réels orientés, cette relation n'est jamais vérifiée : la matrice d'adjacence $A$ est intrinsèquement **non-normale** ($A A^T \neq A^T A$).

La non-symétrie de la matrice implique sa non-normalité. Pour quantifier ce phénomène, nous introduisons **l'indice d'asymétrie** $\alpha(G)$ :
$$\alpha(G) = 1.0 - \frac{|E_{bidirectionnel}|}{|E|}$$
Où $|E_{bidirectionnel}|$ désigne le nombre d'arêtes admettant un arc de retour identique. La mesure de cette non-normalité est quantifiée analytiquement par la **norme de Frobenius du commutateur** :
$$\Delta(A) = \| A A^T - A^T A \|_F = \sqrt{\text{Tr}\left( (A A^T - A^T A)^H (A A^T - A^T A) \right)}$$

*Explication physique de la non-normalité :*
> Dans un système dynamique normal (symétrique), les vecteurs propres sont orthogonaux : toute perturbation (ex. un bouchon) s'amortit de façon monotone sans jamais dépasser son intensité initiale. Dans un système non-normal (asymétrique, comme un réseau à sens uniques), les vecteurs propres ne sont plus orthogonaux et peuvent devenir presque colinéaires. Cette non-orthogonalité permet à des perturbations mineures (ex. un carrefour bloqué temporairement) de s'additionner géométriquement à court terme avant de s'amortir. C'est le **phénomène d'amplification transitoire** : le bouchon local engendre une onde de choc cinématique qui se propage vers l'amont en s'amplifiant, forçant des dizaines de véhicules à freiner et à réaccélérer, ce qui cause des pics de pollution localisés massifs.

#### Le Rayon Spectral ($\rho$) et le Théorème de Perron-Frobenius
Le spectre d'une matrice, noté $\sigma(A)$, regroupe ses valeurs propres complexes $\lambda_i \in \mathbb{C}$ résolvant $\det(\lambda I - A) = 0$. Le **rayon spectral** $\rho(A)$ correspond à la borne supérieure du module des valeurs propres :
$$\rho(A) = \max_{\lambda \in \sigma(A)} |\lambda|$$

Puisque les coefficients $A_{ij}$ de notre matrice d'adjacence pondérée sont strictement non-négatifs ($A_{ij} \ge 0$), nous pouvons appliquer le **théorème de Perron-Frobenius**. Ce théorème requiert toutefois que la matrice d'adjacence $A$ soit **irréductible**. En théorie des graphes orientés, l'irréductibilité d'une matrice d'adjacence est équivalente à la forte connexité du graphe sous-jacent. C'est ici que s'établit la cohérence de notre chaîne de traitement : l'extraction de la plus grande composante fortement connexe (SCC) via l'algorithme de Tarjan détaillée au Chapitre 5 n'est pas une simple opération de filtrage topologique, mais constitue la condition mathématique nécessaire qui garantit l'irréductibilité de $A$. Sous cette condition, le théorème de Perron-Frobenius s'énonce comme suit :
1.  Le rayon spectral $\rho(A)$ est lui-même une valeur propre de $A$, simple et strictement positive ($\rho(A) > 0$).
2.  Il existe un vecteur propre à droite $v_{PF}$ associé à $\rho(A)$ dont toutes les composantes sont strictement positives ($v_{PF} > 0$), appelé vecteur de Perron-Frobenius.
3.  Cette valeur propre domine toutes les autres : $\forall \lambda \in \sigma(A) \setminus \{\rho(A)\}, \ |\lambda| \le \rho(A)$.

*Explication physique du rayon spectral :*
> Le rayon spectral de la matrice d'impédance $\rho(A)$ caractérise la **résistance globale au transit** du réseau routier. Plus $\rho(A)$ est grand, plus le réseau présente une impédance globale élevée (rues longues, étroites, ou à faibles vitesses limites), ce qui allonge les temps de parcours moyens. Le vecteur propre de Perron-Frobenius $v_{PF}$ quant à lui identifie les carrefours clés du réseau où les flux s'accumulent naturellement.

#### La Constante de Kreiss ($K$) et la dynamique de crise
Pour quantifier rigoureusement la sensibilité d'un réseau non-normal aux amplifications transitoires et modéliser son instabilité dynamique, nous introduisons la **constante de Kreiss** $K(A)$. Soit $A$ une matrice stable ($\rho(A) < 1$). La constante de Kreiss est définie par :
$$K(A) = \sup_{|z| > 1} (|z| - 1) \left\| (zI - A)^{-1} \right\|_2$$
où $\|\cdot\|_2$ désigne la norme matricielle induite (norme spectrale). Le théorème des matrices de Kreiss établit des bornes strictes reliant cette constante à l'amplification transitoire maximale de la puissance de la matrice :
$$K(A) \le \sup_{k \ge 0} \left\| A^k \right\|_2 \le e \cdot n \cdot K(A)$$
où $n$ est la dimension de la matrice.

*Explication physique de la constante de Kreiss :*
> La constante de Kreiss agit comme le **"détecteur de nervosité"** ou de fragilité structurelle de la ville. Elle mesure l'amplitude maximale que peut atteindre une onde de congestion locale avant que le réseau ne revienne à un état d'écoulement libre. Une constante de Kreiss élevée prévient le planificateur qu'une perturbation minime peut déclencher une crise de congestion systémique (effet domino) et paralyser le réseau par refoulement (*spillback*).

#### Les Normes de Hardy $H_2$ et $H_\infty$
En modélisant le réseau routier comme un filtre dynamique linéaire entrée-sortie (où l'entrée est le flux d'injection des véhicules et la sortie la congestion), nous évaluons sa robustesse via les normes $H_2$ et $H_\infty$ de sa fonction de transfert $T(z) = (zI - A)^{-1}$ :
1.  **La Norme $H_\infty$ (Pire scénario d'amplification)** :
    $$\|T\|_{H_\infty} = \sup_{|z| > 1} \left\| (zI - A)^{-1} \right\|_2 = \sup_{\theta \in [0, 2\pi]} \sigma_{max}\left( (e^{i\theta}I - A)^{-1} \right)$$
2.  **La Norme $H_2$ (Énergie de perturbation stockée)** :
    $$\|T\|_{H_2} = \left( \sum_{k=0}^{\infty} \left\| A^k \right\|_F^2 \right)^{1/2}$$

*Explication physique des normes de Hardy :*
> La norme $H_\infty$ caractérise le gain d'amplification maximal dans le **pire des scénarios**. Elle indique le niveau de congestion et de pollution inévitable que le réseau atteindra si la charge de trafic est maximale et localisée sur les axes les plus critiques. La norme $H_2$, quant à elle, mesure la **mémoire temporelle de la congestion**. Elle quantifie le temps nécessaire au réseau pour dissiper l'énergie cinétique accumulée et évacuer les véhicules après la fin d'une heure de pointe. Une ville à forte norme $H_2$ mettra beaucoup plus de temps à retrouver un écoulement fluide.

#### Théorie des perturbations de Kato et Loi de Contrôle
Dans le cadre de l'optimisation des réseaux urbains, une question centrale se pose : comment modifier la structure du graphe pour minimiser l'apparition des congestions et la pollution associée sans avoir à recalculer intégralement le spectre de la matrice d'adjacence (ce qui est extrêmement coûteux pour des réseaux de taille métropolitaine) ?

Pour répondre à cela, nous modélisons les modifications d'infrastructure comme des perturbations de la matrice d'adjacence pondérée $A$ sous la forme :
$$\delta A = \epsilon B$$
où $\epsilon \in \mathbb{R}^+$ est un paramètre d'échelle infinitésimal régissant l'intensité globale de la modification, et $B \in \mathbb{R}^{n \times n}$ désigne la **matrice de perturbation (ou matrice de contrôle topologique)**. Chaque élément $B_{ij}$ quantifie l'action d'aménagement local sur le tronçon orienté reliant le nœud $i$ au nœud $j$ :
- $B_{ij} > 0$ correspond à une dégradation locale (e.g. retrait d'une voie, piétonnisation, réduction de la vitesse limite) qui augmente l'impédance physique $A_{ij}$.
- $B_{ij} < 0$ correspond à une amélioration de capacité (e.g. ajout d'une voie, hausse de la vitesse réglementaire) qui diminue l'impédance physique.
- $B_{ij} = 0$ pour les liens inchangés.

En s'appuyant sur la **théorie des perturbations de Kato** (Kato, 1995), nous pouvons évaluer l'impact analytique d'une telle perturbation sur les valeurs propres $\lambda_i$ du système. Pour une valeur propre simple de $A$, ses dérivées de premier et second ordre par rapport à la perturbation sont données par :

1.  **Dérivée Première (Sensibilité linéaire)** :
    $$\lambda_i^{(1)} = \frac{w_i^T B v_i}{w_i^T v_i}$$
    où $v_i$ et $w_i$ désignent respectivement les vecteurs propres à droite et à gauche associés à $\lambda_i$.
2.  **Dérivée Seconde (Couplage non-linéaire du second ordre)** :
    $$\lambda_i^{(2)} = w_i^T B S_i B v_i$$
    Où $S_i$ représente la résolvante réduite définie par $S_i = \lim_{z \to \lambda_i} (zI - A)^{-1}(I - P_i)$, avec $P_i = \frac{v_i w_i^T}{w_i^T v_i}$ le projecteur spectral associé.

**Loi de contrôle topologique :**
L'objectif du planificateur urbain est de concevoir une stratégie d'aménagement optimale $B^*$ appartenant à l'espace des contrôles admissibles $\mathcal{B}$ pour minimiser le rayon spectral $\rho(A + \epsilon B)$ (et donc réduire l'impédance de transit globale et le risque de congestion sous charge). En exploitant le théorème de Perron-Frobenius, cette loi de contrôle s'exprime par le problème de minimisation sous contraintes suivant :
$$B^* = \arg\min_{B \in \mathcal{B}} \rho(A + \epsilon B) \approx \arg\min_{B \in \mathcal{B}} \left( \lambda_{PF} + \epsilon \frac{w_{PF}^T B v_{PF}}{w_{PF}^T v_{PF}} + \epsilon^2 w_{PF}^T B S_{PF} B v_{PF} \right)$$
où $\lambda_{PF}$, $v_{PF}$ et $w_{PF}$ désignent les valeurs et vecteurs propres dominants de Perron-Frobenius associés au graphe initial stable.

*Explication physique de la loi de contrôle et de Kato :*
> La loi de contrôle montre comment optimiser l'aménagement routier de manière chirurgicale. Le produit matriciel du premier ordre $w_{PF}^T B v_{PF} = \sum_{i,j} w_{PF, i} B_{ij} v_{PF, j}$ indique que l'impact d'une modification sur l'arête $(i, j)$ dépend du couplage entre la centralité de diffusion du nœud source (mesurée par la composante gauche $w_{PF, i}$) et l'attractivité du nœud cible (mesurée par la composante droite $v_{PF, j}$). Ainsi, pour maximiser l'impact d'un aménagement (rendre $B_{ij} < 0$), l'investissement doit être fait en priorité sur les tronçons reliant un nœud hautement distributeur (forte valeur propre gauche) à un nœud hautement récepteur (forte valeur propre droite).
> Le terme de second ordre intègre quant à lui les transferts de congestion : il empêche le déplacement simple du goulot d'étranglement vers des tronçons adjacents en pénalisant les perturbations qui surchargent la résolvante réduite $S_{PF}$.

L'espace des contrôles admissibles $\mathcal{B}$ est structuré par des contraintes budgétaires réelles ($\sum_{(i,j) \in E} |B_{ij}| \le C_{budget}$), géométriques locales ($B_{ij} \le B_{max}$), et patrimoniales/géographiques ($B_{ij} = 0$ sur les axes non modifiables).

#### Données Expérimentales d'Analyse Topologique et Spectrale
L'analyse systématique des réseaux routiers de notre base de données a permis d'extraire les caractéristiques topologiques et spectrales présentées dans les tableaux ci-dessous.

##### Tableau 1 : Caractéristiques Topologiques Générales des Villes

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

##### Tableau 2 : Métriques Spectrales de Non-Normalité (Matrices Non-Pondérées)

| city | non_normalness | spectral_radius | sigma_max | h2_norm | kreiss_constant |
| :--- | ---: | ---: | ---: | ---: | ---: |
| **nairobi** | 137.04 | 4.717 | 4.720 | 419.80 | 8.49 |
| **marseille** | 207.55 | 4.149 | 4.149 | 247.51 | 24.17 |
| **cairo** | 155.40 | 4.571 | 4.571 | 236.32 | 32.50 |
| **london** | 162.56 | 4.378 | 4.378 | 231.54 | 14.28 |
| **casablanca** | 149.26 | 5.545 | 5.545 | 202.30 | 17.89 |
| **berlin** | 134.11 | 4.604 | 4.604 | 196.47 | 15.32 |
| **amsterdam** | 115.82 | 4.301 | 4.301 | 185.33 | 12.01 |
| **lyon** | 98.66 | 3.987 | 3.987 | 164.55 | 9.42 |
| **los_angeles** | 124.62 | 4.254 | 4.254 | 155.88 | 11.23 |
| **madrid** | 159.09 | 4.149 | 4.149 | 122.05 | 29.93 |
| **geneva** | 123.09 | 4.000 | 4.000 | 149.58 | 19.39 |
| **paris** | 143.29 | 3.939 | 4.047 | 123.38 | 8.49 |
| **sydney** | 153.21 | 4.618 | 4.618 | 147.25 | 17.06 |
| **dubai** | 114.73 | 4.551 | 4.551 | 96.15 | 20.32 |
| **hanoi** | 145.88 | 5.289 | 5.289 | 124.62 | 26.54 |
| **strasbourg** | 105.81 | 4.015 | 4.015 | 87.52 | 14.28 |
| **buenos_aires** | 128.44 | 4.103 | 4.103 | 92.17 | 19.10 |
| **versailles** | 81.33 | 3.754 | 3.754 | 67.88 | 10.45 |
| **rio_de_janeiro** | 85.22 | 3.987 | 3.987 | 64.91 | 12.33 |
| **chamonix** | 45.16 | 3.551 | 3.551 | 35.88 | 5.48 |
| **monaco** | 35.62 | 3.120 | 3.120 | 25.44 | 4.21 |

### Section 3 : Le modèle d'intelligence artificielle XGBoost

#### Formulation mathématique de la fonction objective
L'algorithme XGBoost (*eXtreme Gradient Boosting*) minimise une fonction d'apprentissage objective régularisée à l'étape $t$ pour l'arbre $f_t$ :
$$\mathcal{L}^{(t)} = \sum_{i=1}^N l\left(y_i, \hat{y}_i^{(t-1)} + f_t(x_i)\right) + \Omega(f_t)$$
Où le terme de régularisation hybride L1/L2 est défini par :
$$\Omega(f_t) = \gamma T + \frac{1}{2} \lambda \sum_{j=1}^T w_j^2 + \alpha \sum_{j=1}^T |w_j|$$
XGBoost résout ce problème en appliquant un développement de Taylor au second ordre de la perte :
$$\mathcal{L}^{(t)} \approx \sum_{i=1}^N \left[ g_i f_t(x_i) + \frac{1}{2} h_i f_t^2(x_i) \right] + \gamma T + \frac{1}{2} \lambda \sum_{j=1}^T w_j^2$$
où $g_i$ (gradient) et $h_i$ (hessienne) désignent les dérivées première et seconde de la perte par rapport à la prédiction précédente :
$$g_i = \frac{\partial l\left(y_i, \hat{y}_i^{(t-1)}\right)}{\partial \hat{y}_i^{(t-1)}} \quad \text{et} \quad h_i = \frac{\partial^2 l\left(y_i, \hat{y}_i^{(t-1)}\right)}{\partial \left(\hat{y}_i^{(t-1)}\right)^2}$$

*Explication physique de XGBoost et de sa formulation :*
> L'utilisation du développement de Taylor de second ordre (intégrant à la fois le gradient $g_i$ et la hessienne $h_i$) confère à XGBoost une capacité unique à capter les interactions non-linéaires violentes. En dynamique routière, les transitions de phase (le passage brutal de la fluidité à la congestion complète lors d'un gridlock) sont des phénomènes hautement instables. Intégrer la dérivée seconde (la hessienne) permet au modèle d'apprentissage de comprendre l'accélération de la congestion et de corriger ses prédictions d'émissions de $CO_2$ de manière beaucoup plus stable et réactive que des méthodes de régression classiques.

#### L'espace à 43 descripteurs explicatifs
Le modèle IA estime la masse totale de $CO_2$ (en kg) émise sur le réseau à partir de 43 descripteurs explicatifs classés en 7 catégories :
1.  **Paramètres de Trafic & Charge (6 descripteurs) :** `nb_total_veh` (volume global de circulation, premier facteur d'effort), `duree_sim_s` (temps d'exposition routière), `nb_voitures` (base automobile), `nb_motos` (dominante asiatique), `nb_camions` (poids lourds à fort rejet unitaire), `nb_bus` (transports publics).
2.  **Taux d'Électrification Découplés (4 descripteurs) :** `pct_car_ev`, `pct_bus_ev`, `pct_truck_ev`, `pct_moto_ev`. Ces descripteurs agissent comme des modérateurs d'émissions.
3.  **Caractéristiques Topologiques Générales (9 descripteurs) :** `nodes` (taille du graphe), `edges` (capacité brute de stockage), `density` (densité de voirie), `avg_degree` (modularité des carrefours), `asymmetry_index` (contraintes de sens uniques), `sources_count`, `sinks_count`, `sources_ratio`, `sinks_ratio`.
4.  **Propriétés Spectrales Non-Pondérées (5 descripteurs) :** `non_normalness` (amplitude potentielle de l'amplification transitoire), `spectral_radius` (transit global), `sigma_max` (pire scénario de perturbation), `h2_norm` (temps d'évacuation de la congestion), `kreiss_constant` (instabilité structurelle aux crises).
5.  **Espace Multidimensionnel spectral Top 5 (10 descripteurs) :** Les 5 premières valeurs propres complexes $\lambda_1, \dots, \lambda_5$ (modularité structurelle, présence de goulots d'étranglement ou de quartiers isolés) et les 5 plus grandes valeurs singulières $\sigma_1, \dots, \sigma_5$ (mesurant la redondance des itinéraires alternatifs).
6.  **Propriétés Spectrales Pondérées d'Impédance (3 descripteurs) :** `spectral_radius_weighted`, `sigma_max_weighted` et `h2_norm_weighted` intégrant la longueur physique $L$, la vitesse autorisée $W$ et le nombre de voies $C$ via $A_{ij} = \frac{L_{ij}}{W_{ij} \cdot C_{ij}}$.
7.  **Origine Géographique par encodage One-Hot (6 descripteurs) :** `origin_Europe` (réseaux radiaux), `origin_Asia_Middle_East` (densités mixtes), `origin_Africa`, `origin_Oceania`, `origin_North_America` (grilles régulières), `origin_South_America`.

##### Tableau 3 : Performances Comparatives des Modèles (CO2 direct)

| Modèle | RMSE ($CO_2$ en kg) | MAE ($CO_2$ en kg) | Score $R^2$ (%) |
| :--- | :---: | :---: | :---: |
| **XGBoost (Direct)** | **15 888,62** | **13 343,48** | **95,03 %** |
| **Régression Ridge (L2)** | 30 255,52 | 28 579,07 | 81,99 % |
| **Random Forest** | 32 239,28 | 30 526,94 | 79,56 % |
| **MLP Regressor (Réseau de Neurones)** | 194 716,32 | 141 992,69 | -645,78 % |

##### Tableau 4 : Profil d'importance relative des variables explicatives (Top 10)

| Variable explicative | Importance relative dans XGBoost (%) |
| :--- | :---: |
| `nb_total_veh` | 31,64 % |
| `nb_voitures` | 17,24 % |
| `nb_motos` | 16,60 % |
| `edges` | 14,51 % |
| `nb_camions` | 12,22 % |
| `duree_sim_s` | 4,34 % |
| `nb_bus` | 1,70 % |
| `pct_moto_ev` | 0,87 % |
| `sigma_max_weighted` | 0,37 % |
| `origin_Europe` | 0,16 % |

\newpage

# CHAPITRE 3 : APPLICATIONS EMPIRIQUES, ÉTUDES DE CAS ET VALIDATION COMPARATIVE

### Section 1 : Analyse microscopique locale – Le jumeau numérique de Vinhomes Ocean Park (Hanoï)

Le complexe résidentiel et commercial de Vinhomes Ocean Park (VHOP), situé à la périphérie Est de la métropole de Hanoï, constitue une opportunité d'étude unique pour analyser la pénétration à grande échelle de l'électromobilité en milieu urbain hyper-dense. Notre recherche se focalise spécifiquement sur le corridor de l'avenue Sao Bien, un axe routier bidirectionnel structurant qui dessert l'entrée principale du centre commercial *Vincom Mega Mall*. 

Le site d'étude concentre deux infrastructures de service contiguës situées sur une voie latérale de desserte commerciale à faible capacité (largeur de voie de 3,5 mètres, limitée à deux voies de circulation unidirectionnelle après insertion depuis l'avenue principale) : une zone d'attente de taxis (GSM Taxi Waiting Zone, 16 places) et un hub de recharge ultra-rapide VinFast (V-Green Super-fast Charging Hub, 12 places en épi à 135 degrés). La voie d'accès est partagée, et le recul à 90 degrés nécessaire à l'extraction des bornes interrompt périodiquement l'écoulement de la voie adjacente. De plus, la forte présence des deux-roues motorisés engendre un phénomène de "tissage" permanent, les motos se faufilant dans les micro-intervalles spatiaux des voitures en manœuvre.

#### Modélisation stochastique de la recharge et initialisation par Warm-Start
Pour représenter fidèlement l'impact de la station de recharge, la durée de raccordement des véhicules électriques (*dwell time*) $d$ est modélisée par une loi normale tronquée calibrée selon quatre profils d'encombrement issus de nos observations terrain :
- **Profil Léger (Light) :** recharges d'appoint rapides. $d \sim \mathcal{N}(1050\text{ s}, 225^2\text{ s}^2)$ (17.5 min).
- **Profil Modéré (Moderate) :** benchmark standard VinFast. $d \sim \mathcal{N}(2100\text{ s}, 300^2\text{ s}^2)$ (35 min).
- **Profil Lourd (Heavy) :** recharges complètes ou partage de puissance (*power-sharing*). $d \sim \mathcal{N}(3600\text{ s}, 450^2\text{ s}^2)$ (60 min).
- **Profil Critique (Critical) :** saturation et indiscipline d'occupation (*overstaying*). $d \sim \mathcal{N}(5400\text{ s}, 900^2\text{ s}^2)$ (90 min).

Pour supprimer le biais transitoire du démarrage à vide (*cold-start*), nous avons conçu un mécanisme de **"Warm-Start" (démarrage à chaud)**. À l'instant $t=0$, le hub de recharge est pré-peuplé stochastiquement par des véhicules fantômes occupant 7 à 9 slots (scénario Midday) ou 11 à 12 slots (scénario Rush Hour/Holiday). Pour éviter un départ simultané massif, un temps d'occupation résiduel $t_{res, j}$ est affecté uniformément à chaque véhicule fantôme $j$ : $t_{res, j} \sim \mathcal{U}(300, 900)$ secondes.

#### Données réelles YOLOv8 et phénomène de "Holiday Reversal"
Les bus électriques (*VinBus*) opérant sur des lignes fixes sans charger au hub des véhicules légers, ils ont été statistiquement exclus des calculs de composition de flotte pour ne pas fausser l'analyse. Les observations révèlent trois profils de trafic distincts :
1.  **Regular Midday Baseline (Midi régulier) :** Volume moyen hors bus de 134,10 véhicules/10 min. Répartition dominée par les motos à 50,7 % (67,97 unités), suivies des EVs à 26,7 % (35,74 unités, portés par les taxis GSM) et des ICE à 22,7 % (30,38 unités).
2.  **Regular Evening Peak (Heure de pointe de semaine) :** Volume moyen hors bus de 227,67 véhicules/10 min (+70% de trafic). Les motos dominent à 62,8 % (143,06 unités), augmentant la friction cinématique latérale.
3.  **Holiday Reversal (Inversion de vacances) :** Lors des congés nationaux (30 avril et 1er mai), le trafic total baisse à 117,17 véhicules/10 min, mais la flotte s'inverse au profit des véhicules à 4 roues. Les motos chutent à 39,7 % (46,50 unités), tandis que les EVs grimpent à 40,0 % (46,83 unités) de la flotte totale, représentant **66,3 % du total des véhicules à 4 roues**. Les familles vietnamiennes privilégient les déplacements en taxis GSM et voitures électriques pour se rendre au pôle de loisirs.

##### Figure 1 : Répartition du fluide Midday (Midi Régulier vs Holiday Reversal)

![Répartition modale comparée du fluide de trafic lors d'un midi de semaine classique face à l'inversion modale observée en période de congés (Holiday Reversal)](images/traffic_composition_pie-Hanoi.png)

##### Figure 2 : Profils d'évolution temporelle des temps d'attente au hub

![Profils d'évolution temporelle des temps d'attente au hub sous les scénarios S0 à S5](images/daily_timeline_by_hour.png)

#### Évaluation des scénarios d'évolution et de mitigation (S0 - S5)
Pour planifier l'infrastructure à l'horizon 2030, nous avons simulé cinq scénarios sur le jumeau numérique SUMO :
- **S0 & S1 (2023) :** stables. Temps d'attente moyen au hub inférieur à 45 secondes.
- **S2 (Pic Holiday) :** Le hub s'engorge immédiatement. Une file d'attente de 4 à 6 EVs sature la voie de service, réduisant la vitesse locale à moins de 12 km/h.
- **S3a & S3b (Horizon 2028 - 60% d'occupation) :** S3b (Rush Hour) présente une congestion qui déborde sur la voie lente de l'avenue Sao Bien, avec un temps d'attente moyen au hub qui s'élève à 18,4 minutes.
- **S4a & S4b (Horizon 2030 - Saturation à 80%) :** Le système atteint son point de rupture complète. La voie de service est paralysée. La congestion remonte par effet cascade (*gridlock*) sur l'avenue Sao Bien. Le temps d'attente moyen explose à **45,2 minutes** et la vitesse globale s'effondre à **4,2 km/h**.
- **S5 (Politique de mitigation) :** Expansion du hub à 20 slots (+8 bornes de 150 kW DC) et aménagement d'une voie d'insertion dédiée pour les taxis. L'évaluation démontre le rétablissement de la fluidité : le temps d'attente moyen chute à **6,8 minutes** (-85 %) et la vitesse moyenne remonte à **21,5 km/h**.

### Section 2 : Expérimentation globale, inférence IA et validation comparative

#### Constitution du corpus d'apprentissage à grande échelle
Pour entraîner et valider le modèle XGBoost spectral, le protocole a collecté les données de **50 simulations métropolitaines d'échelle réaliste** exécutées sur six villes de morphologies cartographiques distinctes. Les variations systématiques portaient sur le volume cinématique (charge de congestion), la composition catégorielle de la flotte et les taux d'électrification catégoriels indépendants.

##### Figure 3 : Matrice de corrélation de Pearson entre les variables physiques et spectrales

![Matrice de corrélation de Pearson illustrant les dépendances linéaires mutuelles entre les 43 variables de notre jeu de données d'apprentissage multi-villes](images/correlation_heatmap.png)

##### Figure 4 : Sensibilité des émissions de CO₂ au volume de véhicules et à l'impédance spectrale

![Graphiques de corrélation physique représentant l'évolution des émissions de CO₂ en fonction du nombre total de véhicules (à droite) et du rayon spectral du réseau (à gauche), illustrant les non-linéarités physiques](images/co2_vs_spectral_radius.png)
![Graphiques de corrélation physique représentant l'évolution des émissions de CO₂ en fonction du nombre total de véhicules (à droite) et du rayon spectral du réseau (à gauche), illustrant les non-linéarités physiques](images/co2_vs_vehicles.png)

#### Limites matérielles et physiques de la simulation SUMO
L'analyse comparative met en évidence le goulot d'étranglement informatique que représente la simulation microscopique physique face à l'inférence instantanée de l'IA (0,2 seconde).

Le tableau suivant montre l'empreinte mémoire RAM de l'étape de routage (chargement du graphe XML via `sumolib`) en fonction de la taille du réseau :

##### Tableau 5 : Taille géométrique et occupation mémoire RAM (Python sumolib)

| Ville | Taille du fichier net.xml (Disque) | Occupation mémoire RAM (Python DOM) | Temps de chargement initial |
| :--- | :---: | :---: | :---: |
| **Versailles** | 6,6 Mo | ~110 Mo | < 1 s |
| **Paris** | 52 Mo | ~880 Mo | 4 s |
| **Madrid** | 184 Mo | ~3,1 Go | 18 s |
| **Los Angeles** | 533 Mo | ~8,9 Go | 55 s |
| **Hanoï** | 1 239 Mo | ~18,5 Go | 142 s |

Pour les réseaux de très grande taille comme Hanoï, l'empreinte mémoire dépasse la capacité physique de 16 Go de RAM des ordinateurs portables classiques. Le système d'exploitation active le mécanisme de **SWAP (pagination virtuelle sur disque)**, ce qui effondre la vitesse de calcul CPU (les temps de routage Dijkstra s'allongeant de quelques secondes à plusieurs dizaines de minutes) et bloque toute optimisation temps réel.

#### Évaluation de transfert (cross-city) sur une ville cible non entraînée
Pour valider la généralisation transversale du modèle, nous testons la prédiction directe sur une ville cible exclue de la base d'entraînement de l'IA. Soit $\vec{x}_{target}$ le vecteur des descripteurs spectraux et topologiques de cette ville test, extrait instantanément d'OpenStreetMap.

Le modèle projette ce vecteur comme une combinaison linéaire convexe de $k$ villes analogues présentes dans l'entraînement : $\vec{x}_{target} = \sum_{j=1}^k \alpha_j \vec{x}_j$, sous les contraintes $\sum \alpha_j = 1$ et $\alpha_j \ge 0$. Les coefficients $\alpha_j$ (les coordonnées barycentriques spectrales) sont obtenus en résolvant un problème d'optimisation quadratique de distance minimale :
$$\vec{\alpha}^* = \arg\min_{\vec{\alpha}} \left\| \vec{x}_{target} - \sum_{j=1}^k \alpha_j \vec{x}_j \right\|_2^2$$

L'évaluation de cette inférence IA est comparée à une simulation physique SUMO de référence (Ground Truth) exécutée sur cette même ville.

*   *[Espace réservé en italique pour la saisie des résultats quantitatifs de validation IA vs SUMO du candidat sur la ville cible (RMSE, MAE, R² de validation, écart relatif)]*
*   *[Espace réservé en italique pour l'insertion des graphiques de validation croisée (Figure 5 : Scatter Plot IA vs Ground Truth)]*

##### Figure 6 : Visualisation SIG de la ville test (Illustration de la cartographie des congestions)

![Visualisations SIG colorées du réseau routier après une simulation de pointe de 1 heure. Les segments routiers sont colorés du gris (fluide) au rouge (saturation complète / gridlock)](images/paris-heat_map_trafic.png)
![Visualisations SIG colorées du réseau routier après une simulation de pointe de 1 heure. Les segments routiers sont colorés du gris (fluide) au rouge (saturation complète / gridlock)](images/paris-heat_map-legend.png)

### Section 3 : Perspectives opérationnelles

#### La boucle d'optimisation hybride (IA-SUMO)
La complémentarité des deux approches développées dans ce mémoire ouvre la voie à un cadre d'optimisation urbaine hybride (IA-SUMO) alliant la rapidité de l'apprentissage machine et la précision de la simulation physique.
Dans ce schéma opérationnel :
1.  Le modèle prédictif basé sur l'IA (XGBoost) est utilisé en amont pour explorer rapidement de larges espaces de solutions (par exemple, tester des milliers d'implantations géométriques de voirie ou de localisations de hubs de recharge). L'IA évalue chaque configuration en une fraction de seconde, éliminant les scénarios inefficaces et sélectionnant les configurations optimales.
2.  Les scénarios retenus par le modèle prédictif sont ensuite injectés dans le jumeau numérique microscopique haute-fidélité (SUMO) pour affiner l'analyse locale (vérification des files d'attente au mètre près, comportement d'évitement des deux-roues, impact électrique précis).

#### Valorisation académique et publications associées
Les résultats de ce travail de recherche font l'objet d'une valorisation académique à travers la préparation de deux publications scientifiques de fin d'année :
1.  **Première Publication (co-écrite avec VinUniversity) :** *"Microscopic Traffic Flow and Emission Modeling of High-Power Electric Vehicle Charging Infrastructure in Hyper-Dense Master-Planned Communities: The Case of Sao Bien, Vinhomes Ocean Park."* (Présentation du protocole YOLOv8, de l'architecture du jumeau numérique SUMO et de l'évaluation des scénarios de densification).
2.  **Deuxième Publication (co-écrite avec l'École Hexagone) :** *"Topological Graph-Spectral Machine Learning for Real-Time Urban CO2 Emissions Prediction: Applying Kato's Perturbation Theory and Kreiss Constants to Non-Normal Urban Networks."* (Formalisation de la méthode de prédiction spectrale sur graphes non-symétriques, étude de la stabilité via la constante de Kreiss et performances de XGBoost).

\newpage

# BIBLIOGRAPHIE SCIENTIFIQUE ET ACADÉMIQUE

*   Agarwal, M., Maze, T. H., & Souleyrette, R. (2005). *Impacts of Weather on Urban Freeway Traffic Flow Characteristics and Facility Capacity*. Center for Transportation Research and Education, Iowa State University.
*   Boeing, G. (2017). *OSMnx: New methods for acquiring, constructing, analyzing, and visualizing complex street networks*. Computers, Environment and Urban Systems, 65, 126-139.
*   Braess, D. (1968). *Über ein Paradoxon aus der Verkehrsplanung*. Unternehmensforschung, 12, 258-268.
*   Easley, D., & Kleinberg, J. (2010). *Networks, Crowds, and Markets: Reasoning about a Highly Connected World*. Cambridge University Press.
*   Forrester, J. W. (1969). *Urban Dynamics*. Productivity Press.
*   Kato, T. (1995). *Perturbation Theory for Linear Operators* (Vol. 132). Springer Science & Business Media.
*   Krajzewicz, D., Erdmann, J., Behrisch, M., & Bieker, L. (2012). *Recent development and applications of SUMO - Simulation of Urban MObility*. International Journal on Advances in Systems and Measurements, 5(3&4), 128-138.
*   Kratzsch, V. et al. (2020). *HBEFA Version 4.1 – Handbook Emission Factors for Road Transport*. INFRAS.
*   Kreiss, H. O. (1962). *Über die Stabilitätsdefinition für Differenzengleichungen, die partielle Differentialgleichungen approximieren*. BIT Numerical Mathematics, 2(3), 153-181.
*   Mitchell, M. (2009). *Complexity: A Guided Tour*. Oxford University Press.
*   Thocle (2025). *Realistic Urban Traffic Generator using Decentralized Federated Learning for the SUMO simulator*. arXiv:2506.07980.
*   Trefethen, L. N., & Embree, M. (2005). *Spectra and Pseudospectra: The Behavior of Nonnormal Matrices and Operators*. Princeton University Press.

\newpage

# RÉFÉRENCES WEB ET INSTITUTIONNELLES (WEBOGRAPHIE)

*   Aimsun (2024). *Aimsun Next User Manual*. Aimsun SLU. [https://www.aimsun.com/](https://www.aimsun.com/)
*   Apur (2025). *Évolution des mobilités et du parc automobile dans la Métropole du Grand Paris au 1er Janvier 2025*. Atelier Parisien d'Urbanisme.
*   Avere-France (2025). *Baromètre national des infrastructures de recharge de véhicules électriques*. [https://www.avere-france.org/](https://www.avere-france.org/)
*   City of Paris (2024). *Rapport d'activité sur les déplacements et la circulation à Paris en 2023*. Mairie de Paris.
*   European Environment Agency (EEA) (2024). *Transport and Mobility: Transitioning to Sustainable Systems*. EEA Report. [https://www.eea.europa.eu/](https://www.eea.europa.eu/)
*   French Government (2026). *Bonus écologique et primes pour l'acquisition d'un véhicule électrique*. Service-Public.fr. [https://www.service-public.fr/](https://www.service-public.fr/)
*   Green SM (2025). *GSM: Green and Smart Mobility electric fleet expansion*. GSM Joint Stock Company. [https://www.green-sm.com/](https://www.green-sm.com/)
*   International Energy Agency (IEA) (2025). *Road Transport – Breakthrough Agenda Report 2025*. IEA. [https://www.iea.org/](https://www.iea.org/)
*   MATsim (2024). *Multi-Agent Transport Simulation (MATSim) Documentation*. MATsim Community. [https://www.matsim.org/](https://www.matsim.org/)
*   OECD (2024). *Urban Mobility and Decarbonisation*. Organisation for Economic Co-operation and Development. [https://www.oecd.org/](https://www.oecd.org/)
*   PTV Group (2024). *PTV Vissim User Manual: Microscopic Traffic Flow Simulation*. [https://www.ptvgroup.com/](https://www.ptvgroup.com/)
*   Streamlit Inc. (2020). *Streamlit: The fastest way to build and share data applications for machine learning*. [https://streamlit.io/](https://streamlit.io/)
*   SUMO (2024). *SUMO User Documentation*. German Aerospace Center (DLR). [https://sumo.dlr.de/](https://sumo.dlr.de/)
*   Texas A&M Transportation Institute (2021). *Urban Mobility Report*. Texas A&M University. [https://mobility.tamu.edu/](https://mobility.tamu.edu/)
*   United Nations, Department of Economic and Social Affairs (2018). *World Urbanization Prospects: The 2018 Revision*. United Nations. [https://www.un.org/](https://www.un.org/)
*   United Nations, Department of Economic and Social Affairs (2018). *Sustainable Urbanization is Key to Successful Development*. United Nations. [https://www.un.org/](https://www.un.org/)
*   VinBus (2021). *VinBus officially operates the first smart electric bus in Vietnam*. VinBus Ecology Transport Services. [https://vinbus.vn/](https://vinbus.vn/)
*   Vinhomes (2024). *Vinhomes Ocean Park: Urban Development and Master-Planned Communities*. Vinhomes Joint Stock Company. [https://oceanpark.vinhomes.vn/](https://oceanpark.vinhomes.vn/)
*   World Bank (2024). *Urban Development Overview*. World Bank Group. [https://www.worldbank.org/](https://www.worldbank.org/)

\newpage

# ANNEXES : TABLEAUX COMPLÉMENTAIRES DES RUNS DE SIMULATION MULTI-VILLES

### Tableau 6 : Extrait des indicateurs macroscopiques des simulations de référence

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

### Tableau 7 : Répartition des tonnages de $CO_2$ émis par classe de véhicule de la flotte

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

### Tableau 8 : Profil de performance informatique détaillé (secondes CPU)

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
