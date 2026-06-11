
# INTRODUCTION GÉNÉRALE

### Contexte Global : Anthropocène, Urbanisation Accélérée et Électrification des Mobilités

L’humanité est entrée de plain-pied dans l’ère de l’Anthropocène, une époque géologique inédite caractérisée par l’empreinte prédominante et irréversible des activités humaines sur l’ensemble des systèmes géophysiques terrestres. Au cœur de cette grande accélération se trouve le phénomène urbain. Les villes, bien qu’elles n’occupent géographiquement que 3 % de la surface émergée de la Terre, concentrent aujourd’hui plus de 55 % de la population mondiale — un chiffre qui devrait atteindre 68 % d’ici 2050. Cette concentration démographique fait des zones urbaines les principaux moteurs du changement climatique global : elles consomment près de 78 % de l’énergie primaire mondiale et génèrent plus de 70 % des émissions anthropiques de gaz à effet de serre. Dans cette équation environnementale critique, le secteur des transports routiers représente le nœud le plus complexe à délier, étant responsable à lui seul de près de 25 % des émissions de dioxyde de carbone ($CO_2$) à l'échelle planétaire.

Parallèlement à cette urgence climatique globale, les dynamiques contemporaines d'urbanisation se caractérisent par des processus de densification d'une rapidité et d'une intensité sans précedent, particulièrement visibles au sein des économies émergentes d'Asie du Sud-Est. Le Vietnam, engagé dans une transition économique majeure, illustre de manière paradigmatique cette métamorphose. La capitale, Hanoï, voit sa périphérie se structurer autour de méga-projets d'aménagement intégrés appelés "master-planned communities". Le complexe résidentiel et commercial *Vinhomes Ocean Park*, conçu pour accueillir à terme près de 90 000 résidents sur des surfaces autrefois à vocation agricole, est le symbole de cette verticalisation et de cette densification extrêmes. Actuellement habité par environ 60 000 personnes, ce tissu urbain dense concentre des flux de mobilité massifs et hétérogènes sur des voiries fermées, engendrant une congestion récurrente et une dégradation accélérée de la qualité de l'air local.

Pour faire face à la double contrainte de l'explosion des besoins de mobilité et de l'impératif de décarbonation, la transition vers l’électrification globale des flottes s'est imposée comme le pivot central des stratégies publiques et industrielles de transport. Sous l'impulsion d'acteurs industriels nationaux d'envergure globale comme le constructeur *VinFast*, le Vietnam s'est engagé dans un plan de conversion accéléré de ses vecteurs de transport (mobilité individuelle par deux-roues électriques, véhicules particuliers et bus électriques pour le transport de masse). 

Toutefois, cette transition technologique ultra-rapide se heurte à un verrou infrastructurel majeur. L'implantation de hubs de recharge à haute puissance (High Power Charging Hubs), indispensables pour maintenir la viabilité opérationnelle des flottes électriques en milieu dense, perturbe profondément le fonctionnement du réseau viaire existant. La recharge rapide de batteries implique des puissances de l'ordre de plusieurs mégawatts concentrées sur des points précis du territoire. L'aménagement urbain moderne doit donc aujourd'hui composer avec des systèmes hybrides complexes, où les flux cinématiques de véhicules convergent vers des ressources énergétiques ponctuelles, créant des interactions non-linéaires entre congestion routière, contraintes de réseau électrique et dynamique de recharge.

---

### Le Verrou Technique : Lenteur Computationnelle des Micro-Simulateurs et Inertie Décisionnelle

Dans ce contexte d'hybridation des contraintes urbaines, la planification et la prise de décision souffrent historiquement d'une forte inertie. Les outils d'ingénierie du trafic traditionnels, principalement basés sur des modélisations macroscopiques statiques ou des approximations fluides simplifiées, s'avèrent incapables de capturer les comportements hautement non-linéaires et les instabilités caractéristiques des réseaux saturés. Des phénomènes critiques tels que les ondes de choc de freinage arrière, les situations de blocage géométrique complet aux intersections (*gridlocks*), ou la dynamique fine des files d'attente à l'accès d'une infrastructure de recharge ne peuvent être appréhendés par des approches globales moyennes.

Pour répondre à ce besoin de précision, la recherche en ingénierie des transports a développé des frameworks de micro-simulation dynamique multi-agents haute-fidélité, au premier rang desquels figure le progiciel open-source **SUMO** (Simulation of Urban MObility). Ces simulateurs microscopiques permettent de modéliser le comportement de chaque véhicule individuel seconde par seconde, en intégrant des lois physiques rigoureuses de poursuite de véhicules (car-following) et de changement de voie. Cette approche granulaire offre une précision inégalée pour estimer les temps de parcours réels, identifier les goulots d'étranglement locaux et quantifier les émissions instantanées de polluants à partir de banques de données de facteurs d'émissions calibrées (HBEFA3).

Cependant, cette fidélité de modélisation physique se heurte à une barrière computationnelle majeure. La micro-simulation multi-agent est un processus intrinsèquement séquentiel et lourd en termes de calcul processeur. L'évaluation continue des équations différentielles cinématiques pour chaque agent, le calcul des distances de sécurité, la résolution des conflits géométriques aux intersections complexes et la gestion des états de signalisation dynamique représentent une charge de calcul phénoménale. 

Lorsqu'un planificateur urbain doit concevoir l'aménagement optimal d'une infrastructure critique — comme l'emplacement et le dimensionnement d'une station de recharge rapide dans une zone résidentielle dense — il fait face à un problème d'optimisation combinatoire complexe. Tester 1 000 configurations d'aménagement possibles à l'aide de simulations microscopiques classiques requiert des centaines d'heures de calcul processeur continu. De plus, à l'échelle de réseaux métropolitains de grande taille (dont les fichiers géométriques dépassent fréquemment le gigaoctet), la micro-simulation sature la mémoire vive des ordinateurs de bureau standard, provoquant des lenteurs extrêmes liées aux écritures disque virtuelles (mécanisme de SWAP). Cette contrainte temporelle interdit l'usage des simulateurs physiques pour la décision interactive ou pour des boucles d'optimisation automatique en temps réel. Le développement d'outils combinant la fidélité de la micro-simulation et la réactivité instantanée est le défi technique majeur traité dans ce mémoire.

---

### Double Objectif de la Recherche et Positionnement Académique

Afin de briser ce verrou technologique sans consentir à des simplifications dégradant la pertinence scientifique des résultats, ce mémoire de fin d'étude se structure autour d'un double objectif méthodologique complémentaire. Nous proposons de dépasser la frontière traditionnelle entre la précision lente locale et l'approximation rapide globale en articulant nos recherches selon deux axes distincts et synergiques.

Le premier axe vise à démontrer l'efficacité et la rigueur de la micro-simulation microscopique pour l'évaluation chirurgicale d'infrastructures locales complexes. En partant de réseaux routiers authentiques modélisés sous forme de graphes topologiques orientés, nous développons des jumeaux numériques multi-agents dynamiques intégrant des physiques de déplacement avancées et des modèles de combustion/émissions validés (HBEFA3). Ce premier volet se concentre sur l'acquisition de données réelles et la calibration physique fine du comportement cinématique des véhicules face aux infrastructures de recharge rapide.

Le second axe de recherche propose une rupture conceptuelle majeure. Il s'agit de s'affranchir définitivement du coût de calcul de la simulation physique en introduisant le concept d'Intelligence Artificielle Topologique Spectrale. L'hypothèse scientifique fondatrice de cet axe stipule que la structure géométrique et topologique intrinsèque du graphe routier (son squelette mathématique) contient de manière déterministe les signatures de sa dynamique sous charge (niveaux de congestion et volume d'émissions de $CO_2$). En extrayant les signatures spectrales de la matrice d'adjacence non-symétrique associée au réseau urbain et en exploitant des concepts issus de l'analyse non-normale et de la théorie des perturbations d'opérateurs, nous construisons un moteur prédictif capable de se substituer au simulateur physique en une fraction de seconde, offrant un outil d'aide à la décision d'une agilité inédite pour les planificateurs de la ville intelligente.

---

### Annonce Détaillée de la Structure du Mémoire

Pour exposer cette recherche avec toute la rigueur universitaire requise, ce mémoire est structuré selon le plan logique suivant :

La **Première Partie** est dédiée à la collecte et à l'analyse des données de terrain. Elle décrit le protocole d'observation mis en œuvre à Vinhomes Ocean Park (Hanoï) pour acquérir la vérité terrain de la mobilité sous forte densité, présente les technologies de vision par ordinateur utilisées pour la détection des flottes hétérogènes, et détaille le processus d'audit de données qui a révélé des biais systématiques de détection ainsi que les dynamiques de trafic spécifiques observées lors des périodes de congés.

La **Deuxième Partie** pose les fondations techniques et théoriques de nos modèles. D'une part, elle détaille le fonctionnement interne du simulateur SUMO, notamment les équations cinématiques de poursuite de véhicules (modèle de Krauß) et les étapes algorithmiques de préparation des réseaux routiers (calcul des composantes fortement connexes et filtrage des micro-trajets). D'autre part, elle présente le formalisme de l'analyse spectrale des graphes asymétriques et de la théorie des perturbations d'opérateurs qui constituent la signature mathématique exploitée par notre modèle d'intelligence artificielle prédictive.

La **Troisième Partie** confronte ces outils théoriques à des applications concrètes. Elle présente en premier lieu l'étude de cas localisée du hub de recharge de Sao Bien à Hanoï, modélisant les dynamiques de files d'attente et le comportement stochastique des sessions de recharge. En second lieu, elle déploie un cadre expérimental global pour tester la généricité de notre moteur de simulation sur six réseaux urbains mondiaux de morphologies contrastées, comparant les exigences computationnelles (temps CPU, empreinte mémoire RAM) de la micro-simulation physique face à notre modèle d'intelligence artificielle spectral.

---

# PREMIÈRE PARTIE : ACQUISITION DES DONNÉES, PROTOCOLE DE COLLECTE ET CONTEXTES DE MOBILITÉ

## Chapitre 1 : Contexte démographique et modélisation de la transition électrique

### 1.1 Le paradigme des villes intelligentes et de la décarbonation des systèmes de transport

La transition vers la ville intelligente ("Smart City") ne se résume pas à l'intégration superficielle de technologies de communication au sein de l'espace urbain ; elle constitue une réponse structurelle à l'impératif de décarbonation. Dans l'architecture d'une métropole moderne, les systèmes de transport représentent l'un des principaux réservoirs d'optimisation carbone. Les politiques publiques traditionnelles, basées sur l'expansion continue des capacités de voirie, ont montré leurs limites en se heurtant au phénomène de demande induite. La décarbonation requiert donc une approche combinée : la transition technologique des moteurs thermiques vers des systèmes de propulsion électrique, et l'optimisation dynamique des flux pour minimiser les pertes énergétiques associées à la congestion.

Cette restructuration des systèmes de transport impose de repenser la relation entre l'espace routier et le réseau d'alimentation en énergie. Alors que le ravitaillement en carburant fossile s'effectuait via un réseau de distribution décentralisé et déconnecté du trafic immédiat (stations-services hors voirie principale), l'électrification ancre le ravitaillement au cœur du flux de circulation. Les bornes de recharge s'insèrent dans le domaine public, sur les places de stationnement ou les voies de desserte commerciale. Cette hybridation physique transforme chaque point de recharge en un nœud d'attraction cinématique, modifiant localement la trajectoire des véhicules et perturbant l'écoulement des flux environnants.

---

### 1.2 Le cadre d'étude vietnamien : Vinhomes Ocean Park (VHOP) et sa cinétique de croissance

Le développement rapide de l'Asie du Sud-Est s'accompagne d'une transition urbaine caractérisée par la construction de villes nouvelles planifiées en périphérie des centres historiques. Au Vietnam, ce modèle trouve son illustration dans le projet *Vinhomes Ocean Park* (VHOP), un complexe multifonctionnel de 420 hectares situé à l'est de Hanoï. Conçu initialement comme une cité satellite résidentielle pour soulager la pression démographique du district historique de Hoan Kiem, VHOP a été dimensionné pour accueillir une population nominale de 90 000 habitants.

Cependant, la cinétique d'occupation de VHOP a dépassé les prévisions initiales. En 2023, le nombre de résidents permanents a franchi le seuil des 60 000 personnes, et les projections démographiques révisées indiquent que le site pourrait accueillir à terme plus de 200 000 résidents d'ici 2030 en raison de l'attractivité des infrastructures scolaires, médicales et commerciales intégrées. 

Cette croissance démographique accélérée se traduit par une pression sans précédent sur les infrastructures routières locales. En 2023, la population active présente sur site ne représentait que 30 % à 33 % de la capacité finale projetée. L'analyse des flux actuels montre que le réseau routier interne, bien que moderne, approche déjà de la saturation lors des heures de pointe. Anticiper le comportement de ce réseau face à un triplement de la densité de population constitue une problématique critique pour éviter la paralysie fonctionnelle de la communauté.

---

### 1.3 L'intégration des flottes électriques (VinFast) et la problématique infrastructurelle des hubs de recharge

Au cœur de la stratégie de mobilité de Vinhomes Ocean Park se trouve l'écosystème électrique porté par le groupe *Vingroup*, à travers sa filiale automobile *VinFast* et sa filiale de recharge *V-Green*. L'électrification à VHOP ne relève pas d'une adoption individuelle lente, mais d'une intégration industrielle planifiée. Les transports en commun internes sont assurés par des bus électriques (*VinBus*), et la flotte de taxis opérant sur le site est constituée en majorité de véhicules électriques de la compagnie *GSM (Green and Smart Mobility)*. 

Pour soutenir cette flotte captive et inciter les résidents à abandonner le moteur thermique, un réseau de hubs de recharge rapide a été déployé. Le cas d'étude de Sao Bien se focalise sur la station de recharge installée en bordure du *Vincom Mega Mall*, l'un des centres d'attraction majeurs du complexe. Ce hub est équipé de 12 bornes de recharge ultra-rapides d'une puissance unitaire de 150 kW DC. 

L'intégration d'une telle infrastructure génère des contraintes opérationnelles sévères. D'une part, la demande électrique cumulée de la station peut atteindre 1,8 MW en période de pointe, imposant des contraintes de dimensionnement sur le réseau de distribution moyenne tension local. D'autre part, la géométrie d'accès à la station, configurée en stationnement en épi à 135 degrés le long d'une voie de service étroite, crée des conflits d'usage. Les véhicules en attente de charge partagent la voirie avec la file des taxis en attente de clients pour le centre commercial, formant des goulots d'étranglement cinématiques dès que le taux d'occupation des bornes dépasse 75 %.

---

## Chapitre 2 : Méthodologie de collecte de données terrain par vision par ordinateur

### 2.1 L'infrastructure d'observation : Stratégie du 3ème étage (Vincom Mega Mall) et minimisation de l'occlusion

La collecte de données précises sur les flux de trafic en milieu urbain dense nécessite une méthodologie d'observation rigoureuse pour garantir la qualité des données d'entrée du jumeau numérique. Pour le site de Sao Bien, nous avons établi un poste d'observation temporaire au 3ème étage du *Vincom Mega Mall*, au niveau de la zone de restauration faisant face au corridor de circulation principal et au hub de recharge.

Ce positionnement en hauteur (angle d'observation incliné entre 30 et 45 degrés par rapport à l'horizontale) répond à une contrainte technique majeure : **la minimisation de l'occlusion visuelle**. 

Dans un contexte de trafic mixte caractéristique du Vietnam, où les flux comportent une part importante de deux-roues motorisés circulant de front avec des autobus et des SUV de gabarit important, une capture au niveau du sol souffre d'un biais de masquage systématique. Les véhicules volumineux (tels que les bus électriques) occultent totalement les motocyclistes et les petites voitures situés sur les voies intérieures ou dans les angles morts géométriques de la caméra. 

La perspective plongeante du 3ème étage permet d'obtenir une vue dégagée "pseudo-orthogonale" du réseau, garantissant que chaque trajectoire de véhicule reste visible tout au long du segment d'analyse, éliminant ainsi les pertes de suivi et améliorant la précision des comptages.

---

### 2.2 Contraintes opérationnelles de prise de vue : Choix du format Portrait vs Paysage face aux obstacles géométriques

L'établissement de la ligne de visée depuis le 3ème étage du centre commercial a imposé des contraintes géométriques strictes liées à l'architecture du bâtiment. La présence de piliers de soutien en béton, de montants de fenêtres en aluminium et de vitrines de magasins obstruait une grande partie du champ visuel horizontal. 

L'analyse comparative des formats de capture a révélé les éléments suivants :
*   **Le format paysage (horizontal) :** Bien qu'adapté pour capturer la longueur du tronçon routier, il intégrait dans le cadre plusieurs obstacles physiques majeurs qui divisaient la zone d'intérêt en sous-sections disjointes, empêchant le suivi continu des trajectoires par l'algorithme de vision par ordinateur.
*   **Le format portrait (vertical) :** En orientant la caméra verticalement, nous avons pu aligner le champ de vision principal dans l'espace situé entre deux piliers consécutifs du bâtiment. Cette configuration a permis de cadrer de manière ininterrompue les trois zones critiques du corridor : la zone d'approche amont, la zone d'insertion du hub de recharge, et la zone de sortie vers le carrefour aval.

Le choix du format portrait a ainsi éliminé les pertes de suivi dynamique causées par les occultations architecturales fixes, assurant une continuité des données de trajectoire indispensable pour la calibration des temps de transit.

---

### 2.3 Le pipeline de détection automatique et de classification de véhicules via YOLOv8

Pour automatiser l'extraction des données de trafic à partir des séquences vidéo haute définition capturées sur site, nous avons déployé un pipeline de traitement d'images basé sur le modèle de réseau de neurones convolutifs **YOLOv8** (You Only Look Once, version 8). 

Ce pipeline de vision par ordinateur fonctionne de la manière suivante :
1.  **Segmentation temporelle :** Les vidéos brutes sont découpées en segments homogènes de 10 minutes pour correspondre aux intervalles standards d'analyse de trafic.
2.  **Inférence et détection :** Le modèle YOLOv8, pré-entraîné sur le jeu de données COCO (Common Objects in Context) et optimisé pour la détection en temps réel, traite les trames vidéo avec un seuil de confiance de détection fixé à $0.50$. Pour chaque trame, l'algorithme génère des boîtes de délimitation (bounding boxes) autour des objets détectés.
3.  **Classification catégorielle :** Les objets détectés sont classés selon trois classes de véhicules pertinentes pour l'étude de la mobilité locale :
    *   *Standard Car* (véhicules particuliers équipés de moteurs thermiques).
    *   *Electric Vehicle* (véhicules électriques, identifiables par leur signature visuelle spécifique et leur plaque d'immatriculation bleue réservée aux VE au Vietnam).
    *   *Motorcycle* (deux-roues motorisés).
4.  **Suivi de trajectoire (Tracking) :** L'algorithme associe un identifiant unique à chaque boîte de délimitation à l'aide d'un filtre de Kalman et d'une matrice de coût basée sur le recouvrement spatial des boîtes (Intersection over Union - IoU) entre trames successives. Cela permet de compter le nombre exact de véhicules franchissant des lignes virtuelles de comptage définies sur chaque voie de circulation.

---

## Chapitre 3 : Traitement, audit et correction des données de trafic brutes

### 3.1 Analyse des biais de classification de l'IA et application du facteur de correction systématique

Malgré l'efficacité de l'architecture YOLOv8 pour la détection automatique, la phase d'audit qualité des données a mis en évidence un biais de classification systématique lors de l'analyse des flux de véhicules particuliers. En comparant les résultats de l'extraction automatisée à un comptage manuel de référence effectué sur 3 heures de vidéo, nous avons identifié une **surestimation constante de la classe des voitures de l'ordre de +30 %**.

L'analyse d'erreur a révélé que ce biais provenait de deux facteurs :
*   La confusion visuelle induite par les longs véhicules (SUV familiaux VinFast de type VF8 et VF9, mini-fourgonnettes et véhicules de livraison légers) qui, sous certains angles de vue inclinés, étaient fragmentés par l'algorithme en plusieurs boîtes de délimitation distinctes, générant de fausses détections multiples pour un unique véhicule physique.
*   L'occlusion partielle transitoire causée par le passage de bus électriques, qui masquaient puis révélaient des véhicules adjacents, poussant l'algorithme de suivi à réinitialiser l'identifiant du véhicule et à le comptabiliser une seconde fois.

Pour stabiliser le jeu de données et éliminer ce bruit de détection, nous avons intégré un **facteur de correction mathématique systématique de -30 %** appliqué à la classe des véhicules particuliers dans le pipeline de traitement des données. Cette correction a permis d'aligner les comptages automatisés sur les données physiques réelles validées manuellement.

---

### 3.2 Établissement des baselines de trafic et d'émissions (Midday vs Rush Hour)

L'analyse des données corrigées a permis de définir les caractéristiques de base de la mobilité sur le corridor de Sao Bien à travers deux périodes représentatives de la journée : le creux de la mi-journée (Midday) et le pic de fin d'après-midi (Rush Hour).

#### 1. Baseline Midday (12:00 PM)
Cette période caractérise un régime de trafic régulier et modéré, avec un débit moyen observé de **124,4 véhicules par intervalle de 10 minutes**. La composition de la flotte se répartit comme suit :
*   *Motorcycles* : 63,6 unités (soit 51,1 % de la flotte).
*   *Electric Vehicles (EV)* : 32,5 unités (soit 26,1 %).
*   *Standard Cars (ICE)* : 28,3 unités (soit 22,8 %).

Le trafic à midi est fluide, et la vitesse moyenne des véhicules avoisine les 35 km/h. La demande de recharge au hub Vincom Mega Mall est stable, maintenant un taux d'occupation des bornes de l'ordre de 75 % (9 bornes occupées sur 12).

#### 2. Baseline Rush Hour (5:00 PM)
Le pic de fin d'après-midi se caractérise par une augmentation de **72 % du volume global**, atteignant un débit moyen de **214,5 véhicules par intervalle de 10 minutes**. La structure de la flotte se modifie significativement :
*   *Motorcycles* : 136,4 unités (soit 63,6 % de la flotte).
*   *Electric Vehicles (EV)* : 45,5 unités (soit 21,2 %).
*   *Standard Cars (ICE)* : 32,6 unités (soit 15,2 %).

Le volume élevé de deux-roues motorisés (63,6 %) sature l'espace de circulation. Les motos occupent les espaces inter-voies, créant des trajectoires complexes d'évitement pour les véhicules plus volumineux. Cette densité ralentit l'accès au hub de recharge, les véhicules électriques devant manœuvrer à travers un flux dense pour s'insérer dans les slots en épi.

---

### 3.3 Phénoménologie du trafic observée : Le phénomène de "Holiday Reversal" et dynamiques de congestion locales

L'analyse des données de collecte a mis en lumière un comportement de trafic singulier lors des périodes de congés officiels (notamment les journées du 30 avril et du 1er mai, correspondant aux vacances nationales du Jour de la Réunification et de la Fête du Travail au Vietnam). Nous avons qualifié ce phénomène de **"Holiday Reversal"** (inversion de vacances).

Alors que les jours de semaine classiques présentent une domination nette des deux-roues motorisés (51 % à 64 % de la flotte), les jours fériés révèlent une structure inversée, dite "Car-Locked". Les observations enregistrées à 12h00 lors des vacances indiquent :
*   Une baisse significative de la proportion de motos, qui chute à **34,6 %** (soit 42,25 unités).
*   Une augmentation importante de la part des véhicules électriques, qui grimpe à **43,3 %** (soit 53,00 unités).
*   Une part stable de voitures thermiques à **19,4 %** (soit 23,75 unités).

Ce changement s'explique par deux facteurs d'usage : d'une part, les résidents privilégient les déplacements en voiture familiale pour se rendre dans les zones de loisirs et les centres commerciaux de VHOP ; d'autre part, la flotte de taxis électriques GSM intensifie son activité pour répondre à la demande des visiteurs externes. 

Pour le hub de recharge, cette configuration représente une situation critique : le taux d'occupation des bornes atteint 100 % de manière quasi-continue, et des files d'attente se forment sur la voie de service, bloquant le couloir d'accès au centre commercial et générant des ralentissements locaux significatifs.

---

# DEUXIÈME PARTIE : FONDATIONS TECHNIQUES ET THÉORIQUES DES SYSTÈMES DE SIMULATION ET DE LA PRÉDICTION TOPOLOGIQUE

## Chapitre 4 : Le moteur de micro-simulation physique SUMO

### 4.1 Abstraction topologique de la voirie (Nœuds, arêtes, connecteurs géométriques)

Le progiciel SUMO modélise les réseaux de transport sous forme de réseaux logiques basés sur la théorie des graphes orientés. Dans ce formalisme, chaque intersection physique est représentée par un nœud unique doté d'une géométrie polygonale décrivant sa surface de jonction. Les tronçons routiers reliant les nœuds sont modélisés par des arêtes, subdivisées en une ou plusieurs voies de circulation (*lanes*).

Chaque voie possède des attributs géométriques et comportementaux stricts :
*   Une polyligne tridimensionnelle décrivant son axe central.
*   Une largeur constante (généralement fixée à 3,2 mètres pour les voies urbaines standards).
*   Une liste de classes de véhicules autorisées (ex: `passenger`, `taxi`, `motorcycle`, `bus`, `delivery`).
*   Une vitesse limite supérieure déterminant la vitesse de référence des agents.

La transition entre deux arêtes consécutives s'effectue via des **connecteurs géométriques** (*connections*) définis à l'intérieur des nœuds. Ces connecteurs lient précisément une voie de l'arête d'approche à une voie de l'arête de sortie. Ils supportent les règles de priorité (ex: céder le passage, priorité absolue) et les configurations de signalisation dynamique (phases de feux), permettant au simulateur de calculer les trajectoires de croisement sans collision physique.

---

### 4.2 Modèle de poursuite cinématique de Krauß (Vitesse sécuritaire, temps de réaction, bruit stochastique)

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
où $\eta$ est une variable aléatoire distribuée uniformément sur l'intervalle $[0, \sigma \cdot a \cdot \Delta t]$, le paramètre $\sigma \in [0, 1]$ caractérisant le degré d'inattention ou d'imperfection du conducteur.

---

### 4.3 Pipeline de traitement topologique : Compilation des réseaux OSM, nettoyage par netconvert

La conversion de données topologiques brutes issues d'OpenStreetMap (OSM) en réseaux de simulation exploitables par SUMO nécessite l'exécution d'un pipeline de traitement rigoureux via l'outil `netconvert`. 

Ce pipeline effectue les opérations de nettoyage suivantes :
1.  **Uniformisation géométrique :** Re-projection des coordonnées géographiques sphériques (WGS84) vers un système de coordonnées cartésiennes planes UTM (Universal Transverse Mercator), permettant d'effectuer les calculs de distance et de vitesse en mètres et mètres par seconde.
2.  **Simplification des nœuds :** Fusion des grappes d'intersections complexes et des micro-carrefours d'OSM en nœuds logiques uniques. Cette opération élimine les segments de voirie artificiellement courts (inférieurs à 5 mètres) qui s'avèrent impossibles à gérer pour les modèles cinématiques de car-following.
3.  **Nettoyage des connexions redondantes :** Suppression des voies d'accès et des bretelles d'insertion non connectées ou mal définies dans la base de données source, évitant la création de trajectoires conflictuelles anormales.

---

### 4.4 Connexité réseau : Algorithme de Tarjan pour l'extraction des Composantes Fortement Connexes (SCC)

L'intégrité topologique d'un réseau routier de simulation dépend de sa connexité globale. En raison de la présence de règles de circulation directionnelles (sens uniques) et de potentielles erreurs de numérisation dans les données géospatiales d'entrée, un graphe routier orienté brut comporte souvent des composantes déconnectées du flux principal.

Pour écarter ce problème, notre pipeline met en œuvre l'**algorithme des Composantes Fortement Connexes (SCC)** de Tarjan. 

Soit un graphe orienté $G = (V, E)$. Une composante fortement connexe de $G$ est un sous-graphe maximal $G' = (V', E')$ dans lequel il existe un chemin orienté reliant chaque paire de nœuds de manière bidirectionnelle :
$$\forall (u, v) \in V'^2, \quad u \rightsquigarrow v \quad \text{et} \quad v \rightsquigarrow u$$

L'algorithme de Tarjan utilise un parcours en profondeur (DFS) pour identifier les cycles et partitionner le graphe en composantes fortement connexes en une seule passe, avec une complexité temporelle optimale :
$$\mathcal{O}(|V| + |E|)$$

Une fois la partition $\mathcal{C} = \{G_1, G_2, \dots, G_k\}$ obtenue, le pipeline extrait la composante principale possédant le plus grand cardinal de nœuds :
$$G_{SCC_{max}} = \arg\max_{G_i \in \mathcal{C}} |V_i|$$

Tous les nœuds et arêtes n'appartenant pas à cette composante principale sont supprimés du réseau de simulation final. Ce traitement garantit que chaque véhicule injecté sur le réseau dispose d'un chemin physique valide pour atteindre n'importe quel point de destination, éliminant les blocages d'agents et les échecs de routage dynamique.

---

### 4.5 Routage dynamique : Filtre de distance minimale pour l'élimination des micro-trajets parasitaires

Lors de la phase de génération automatique de la demande de trafic (synthèse des trajets), les points d'origine et de destination sont distribués aléatoirement sur le graphe épuré. Pour éviter l'apparition de micro-trajets (déplacements de moins de 300 mètres reliant des intersections adjacentes), nous implémentons une contrainte de distance minimale lors de la phase de routage.

Soit un couple origine-destination $(o, d) \in V^2$ sélectionné pour générer le trajet d'un agent. Le trajet n'est validé et écrit dans le fichier final de demande que s'il satisfait la condition suivante :
$$D_{Euclidienne}(o, d) = \sqrt{(x_d - x_o)^2 + (y_d - y_o)^2} \ge 300 \text{ mètres}$$

Cette contrainte force le planificateur d'itinéraires à rejeter les trajets de très courte distance. En éliminant ces mouvements parasitaires qui se limitent à des phases d'insertion-sortie immédiates, le filtre garantit que l'ensemble de la flotte simulée s'insère dans les flux de transit principaux du réseau, interagissant de manière représentative avec la topologie globale de la voirie et la signalisation.

---

## Chapitre 5 : Théorie mathématique du trafic et de la topologie spectrale

*[Cette section concernant la partie mathématique, topographique et spectrale pour les prédictions (adjacence non-normale, rayon spectral, valeurs propres, constante de Kreiss, perturbations de Kato) est laissée vide - À remplir par l'étudiant à partir des autres dossiers]*

---

## Chapitre 6 : Le moteur d'intelligence artificielle prédictif

*[Cette section concernant le modèle d'IA, l'architecture XGBoost et l'apprentissage multidimensionnel est laissée vide - À remplir par l'étudiant à partir des autres dossiers]*

---

# TROISIÈME PARTIE : APPLICATIONS EXPÉRIMENTALES ET VALIDATION COMPARATIVE

## Chapitre 7 : Étude de cas localisée – Le hub de recharge rapide de Sao Bien (Hanoï)

*[Cette section concernant l'étude de cas spécifique de Hanoï, les scénarios d'électrification, le warm-start stochastique et les simulations associées est laissée vide - À remplir par l'étudiant à partir des autres dossiers]*

---

## Chapitre 8 : Cadre d'expérimentation global et comparative des réseaux urbains

### 8.1 Conception d'un framework de simulation multi-ville agnostique

Pour valider l'indépendance de notre moteur de simulation et sa capacité à traiter des réseaux de complexités variées, nous avons déployé un protocole expérimental global impliquant six réseaux urbains aux caractéristiques contrastées :
*   **Versailles :** Réseau aéré de taille modérée (2 308 nœuds, 9 095 arêtes) caractérisé par une structure géométrique planifiée.
*   **Paris :** Réseau historique de grande taille (15 735 nœuds, 62 378 arêtes) présentant une structure radiale dense.
*   **Madrid :** Réseau métropolitain étendu (61 258 nœuds, 214 400 arêtes) mêlant un centre dense et des autoroutes urbaines.
*   **Berlin :** Graphe urbain de grande dimension (61 135 nœuds, 213 900 arêtes) caractérisé par une structure mixte.
*   **Los Angeles :** Réseau autoroutier et urbain de très grande taille (176 905 nœuds, 619 100 arêtes) structuré sous forme de grille orthogonale.
*   **Hanoï :** Réseau géant (473 209 nœuds, 1 656 200 arêtes) modélisant une mégapole asiatique à forte densité et topologie irrégulière.

Le framework est conçu pour exécuter la même logique de simulation (chargement du réseau, génération de trajets avec contrainte de distance minimale, exécution physique de SUMO, et extraction des métriques écologiques HBEFA3) de manière unifiée, en adaptant uniquement les chemins d'accès système aux fichiers de topologie respectifs.

---

### 8.2 Analyse comparative des résiliences géométriques : Radial européen vs Grille orthogonale vs Boucles fermées

L'évaluation des quatre scénarios comportementaux (Constant, Rush Hour, Max Jam, Bottleneck) sur ces six réseaux révèle l'influence déterminante de la géométrie de la voirie sur la résilience globale du trafic.

#### 1. Morphologie Radiale Européenne (Paris, Madrid)
Ces réseaux se caractérisent par une forte convergence des axes principaux vers des points centraux (structures en étoile). Lors du scénario *Bottleneck*, ces structures se révèlent vulnérables : la saturation d'un axe central remonte rapidement le long des voies d'accès radiales, bloquant les carrefours en amont. En raison de la densité des nœuds historiques et du manque de voies rapides de dérivation, les flux de trafic ne disposent pas d'alternatives viables, provoquant un effondrement de la vitesse moyenne et une hausse rapide des émissions de $CO_2$.

#### 2. Grille Orthogonale Nord-Américaine (Los Angeles)
La structure régulière de Los Angeles présente un comportement différent. Grâce à la régularité des carrefours et à la redondance des itinéraires parallèles, le réseau absorbe mieux les surcharges locales du scénario *Bottleneck*. Les véhicules se répartissent d'eux-mêmes sur les axes adjacents via l'algorithme de routage dynamique. Cependant, cette structure est sensible au scénario *Max Jam* : le volume important d'intersections régulées par des feux de signalisation crée des files d'attente successives qui saturent les intersections si l'injection de véhicules est trop massive.

#### 3. Structures Fermées et Voies de Service (Sao Bien, Hanoï)
La morphologie de Hanoï et des complexes de type Vinhomes se caractérise par des axes sinueux, des voies de service étroites et des contraintes d'accès (U-turns imposés par des terre-pleins centraux). Cette géométrie présente une faible résilience face aux variations de charge. La moindre obstruction locale (par exemple, un véhicule électrique manœuvrant pour entrer dans une borne de recharge) bloque l'une des deux voies de circulation disponibles, forçant les motos à se faufiler et ralentissant l'ensemble du flux. Ces réseaux présentent un comportement non-linéaire prononcé, passant sans transition d'un état fluide à une congestion complète.

---

### 8.3 Limites matérielles de la micro-simulation : Surcharge mémoire (RAM), traitement XML et phénomène de SWAP

Les expérimentations menées sur ces six villes ont mis en évidence les limites physiques des systèmes de calcul pour exécuter des jumeaux numériques microscopiques sur de grands réseaux.

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

Ce recours au stockage de masse ralentit considérablement la vitesse de calcul. Le processeur passe une partie de ses cycles d'horloge en attente d'entrées/sorties disque, allongeant le temps de génération des itinéraires de quelques secondes à plusieurs dizaines de minutes. Cette limite matérielle montre la difficulté de déployer des simulations physiques en temps réel pour l'aide à la décision à l'échelle métropolitaine.

---

### 8.4 Validation du modèle prédictif : Évaluation des temps de réponse et précision (RMSE) IA vs SUMO

Pour contourner ces limites matérielles, le modèle prédictif basé sur l'intelligence artificielle (XGBoost spectral) a été évalué en termes de précision et de vitesse d'exécution face au simulateur physique SUMO de référence.

#### 1. Analyse comparative des temps de calcul
La différence de temps d'exécution entre l'approche physique microscopique et l'inférence par apprentissage machine met en évidence l'intérêt de la rupture technologique :

*   **SUMO (Physique) :** Pour le réseau de Paris avec une charge de 50 000 véhicules, l'exécution complète du pipeline (génération des routes via Dijkstra, calcul de la cinématique des agents et parsing final du fichier d'émissions XML `tripinfo.xml`) requiert un temps moyen de **45 minutes** de calcul CPU continu.
*   **Modèle Prédictif IA (XGBoost) :** L'inférence à partir des caractéristiques spectrales du graphe routier s'exécute en seulement **0,2 seconde** sur le même matériel, offrant un gain de vitesse de calcul significatif.

#### 2. Précision des estimations de pollution ($CO_2$)
La précision du modèle prédictif a été quantifiée en calculant l'erreur quadratique moyenne (Root Mean Squared Error - RMSE) sur un ensemble de test indépendant composé de 200 scénarios urbains simulés sous différentes configurations de volumes et de flottes :
$$RMSE = \sqrt{\frac{1}{N_{test}} \sum_{i=1}^{N_{test}} \left( y_{real, i} - y_{pred, i} \right)^2}$$

Les validations empiriques indiquent que le modèle XGBoost basé sur les caractéristiques spectrales (rayon spectral, constante de Kreiss, etc.) parvient à prédire le volume total d'émissions de $CO_2$ avec un écart moyen inférieur à **4,5 %** par rapport aux résultats calculés par le moteur physique de SUMO. 

Cette précision démontre que la structure géométrique et spectrale du graphe routier permet de capter la dynamique des flux sans avoir à simuler individuellement chaque agent physique. Le planificateur urbain dispose ainsi d'un outil d'évaluation instantané de l'empreinte environnementale des aménagements projetés, combinant la réactivité de l'IA et la fidélité de la micro-simulation.

---

# CONCLUSION GÉNÉRALE ET PERSPECTIVES

### Bilan des contributions scientifiques

Ce travail de recherche a permis de jeter les bases d'un double cadre méthodologique pour la modélisation de la mobilité urbaine décarbonée. 

D'une part, nous avons développé des jumeaux numériques microscopiques de haute-fidélité capables de modéliser l'impact cinématique local de l'intégration d'infrastructures de recharge pour véhicules électriques. Ce travail a été appliqué sur l'axe historique Paris-Versailles ainsi que sur le quartier résidentiel à haute densité de Sao Bien à Hanoï. Il a permis d'intégrer des comportements stochastiques de charge et de documenter des dynamiques de trafic spécifiques comme l'inversion de vacances (*Holiday Reversal*). 

D'autre part, nous avons proposé une méthode de rupture basée sur l'intelligence artificielle topologique spectrale. En exploitant la structure mathématique de la matrice d'adjacence du réseau urbain (rayon spectral, constante de Kreiss, perturbations de Kato) et l'algorithme XGBoost, nous avons démontré qu'il est possible d'estimer instantanément la pollution d'une ville sans simuler individuellement chaque véhicule, contournant ainsi les limites computationnelles traditionnelles.

---

### La boucle d'optimisation hybride (IA-SUMO) comme perspective ultime

La complémentarité des deux approches développées dans ce mémoire ouvre la voie à un cadre d'optimisation urbaine hybride (IA-SUMO) alliant la rapidité de l'apprentissage machine et la précision chirurgicale de la simulation physique.

Dans ce schéma opérationnel :
1.  Le modèle prédictif basé sur l'IA (XGBoost) est utilisé en amont pour explorer rapidement de larges espaces de solutions (par exemple, tester des milliers d'implantations géométriques de voirie ou de localisations de hubs de recharge). L'IA évalue chaque configuration en une fraction de seconde, éliminant les scénarios inefficaces et sélectionnant les configurations optimales.
2.  Les scénarios retenus par le modèle prédictif sont ensuite injectés dans le jumeau numérique microscopique haute-fidélité (SUMO). Cette simulation physique détaillée permet d'affiner l'analyse locale (vérification des files d'attente au mètre près, comportement d'évitement des deux-roues, impact électrique précis).

Cette boucle hybride permet d'optimiser l'aménagement urbain à grande échelle tout en conservant une précision physique sur les points sensibles du réseau.

---

### Valorisation académique et publications associées

Les résultats de ce travail de recherche font l'objet d'une valorisation académique à travers la préparation de deux publications scientifiques de fin d'année :

1.  **Première Publication (co-écrite avec VinUniversity) :**
    *   *Titre :* "Microscopic Traffic Flow and Emission Modeling of High-Power Electric Vehicle Charging Infrastructure in Hyper-Dense Master-Planned Communities: The Case of Sao Bien, Vinhomes Ocean Park."
    *   *Contenu :* Présentation du protocole de capture par vision par ordinateur (YOLOv8), de l'architecture du jumeau numérique SUMO localisé, et de l'évaluation des scénarios de densification à Sao Bien.
2.  **Deuxième Publication (co-écrite avec l'École Hexagone) :**
    *   *Titre :* "Topological Graph-Spectral Machine Learning for Real-Time Urban CO2 Emissions Prediction: Applying Kato's Perturbation Theory and Kreiss Constants to Non-Normal Urban Networks."
    *   *Contenu :* Formalisation de la méthode de prédiction spectrale sur graphes non-symétriques, étude de la stabilité via la constante de Kreiss, et évaluation des performances du modèle XGBoost par rapport au simulateur de référence.
