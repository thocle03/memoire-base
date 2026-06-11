
\newpage

# INTRODUCTION GÉNÉRALE

### Contexte Global : Anthropocène, Urbanisation Accélérée et Électrification des Mobilités

L’humanité est entrée de plain-pied dans l’ère de l’Anthropocène, une époque géologique inédite caractérisée par l’empreinte prédominante et irréversible des activités humaines sur l’ensemble des systèmes géophysiques terrestres. Au cœur de cette grande accélération se trouve le phénomène urbain. Les villes, bien qu’elles n’occupent géographiquement que 3 % de la surface émergée de la Terre, concentrent aujourd’hui plus de 55 % de la population mondiale — un chiffre qui devrait atteindre 68 % d’ici 2050. Cette concentration démographique fait des zones urbaines les principaux moteurs du changement climatique global : elles consomment près de 78 % de l’énergie primaire mondiale et génèrent plus de 70 % des émissions anthropiques de gaz à effet de serre. Dans cette équation environnementale critique, le secteur des transports routiers représente le nœud le plus complexe à délier, étant responsable à lui seul de près de 25 % des émissions de dioxyde de carbone ($CO_2$) à l'échelle planétaire.

Parallèlement à cette urgence climatique globale, les dynamiques contemporaines d'urbanisation se caractérisent par des processus de densification d'une rapidité et d'une intensité sans précedent, particulièrement visibles au sein des économies émergentes d'Asie du Sud-Est. Le Vietnam, engagé dans une transition économique majeure, illustre de manière paradigmatique cette métamorphose. La capitale, Hanoï, voit sa périphérie se structurer autour de méga-projets d'aménagement intégrés appelés "master-planned communities". Le complexe résidentiel et commercial *Vinhomes Ocean Park*, conçu pour accueillir à terme près de 90 000 résidents sur des surfaces autrefois à vocation agricole, est le symbole de cette verticalisation et de cette densification extrêmes. Actuellement habité par environ 60 000 personnes, ce tissu urbain dense concentre des flux de mobilité massifs et hétérogènes sur des voiries fermées, engendrant une congestion récurrente et une dégradation accélérée de la qualité de l'air local.

Pour faire face à la double contrainte de l'explosion des besoins de mobilité et de l'impératif de décarbonation, la transition vers l’électrification globale des flottes s'est imposée comme le pivot central des stratégies publiques et industrielles de transport. Sous l'impulsion d'acteurs industriels nationaux d'envergure globale comme le constructeur *VinFast*, le Vietnam s'est engagé dans un plan de conversion accéléré de ses vecteurs de transport (mobilité individuelle par deux-roues électriques, véhicules particuliers et bus électriques pour le transport de masse). 

Toutefois, cette transition technologique ultra-rapide se heurte à un verrou infrastructurel majeur. L'implantation de hubs de recharge à haute puissance (High Power Charging Hubs), indispensables pour maintenir la viabilité opérationnelle des flottes électriques en milieu dense, perturbe profondément le fonctionnement du réseau viaire existant. La recharge rapide de batteries implique des puissances de l'ordre de plusieurs mégawatts concentrées sur des points précis du territoire. L'aménagement urbain moderne doit donc aujourd'hui composer avec des systèmes hybrides complexes, où les flux cinématiques de véhicules convergent vers des ressources énergétiques ponctuelles, créant des interactions non-linéaires entre congestion routière, contraintes de réseau électrique et dynamique de recharge.


### Le Verrou Technique : Lenteur Computationnelle des Micro-Simulateurs et Inertie Décisionnelle

Dans ce contexte d'hybridation des contraintes urbaines, la planification et la prise de décision souffrent historiquement d'une forte inertie. Les outils d'ingénierie du trafic traditionnels, principalement basés sur des modélisations macroscopiques statiques ou des approximations fluides simplifiées, s'avèrent incapables de capturer les comportements hautement non-linéaires et les instabilités caractéristiques des réseaux saturés. Des phénomènes critiques tels que les ondes de choc de freinage arrière, les situations de blocage géométrique complet aux intersections (*gridlocks*), ou la dynamique fine des files d'attente à l'accès d'une infrastructure de recharge ne peuvent être appréhendés par des approches globales moyennes.

Pour répondre à ce besoin de précision, la recherche en ingénierie des transports a développé des frameworks de micro-simulation dynamique multi-agents haute-fidélité, au premier rang desquels figure le progiciel open-source **SUMO** (Simulation of Urban MObility). Ces simulateurs microscopiques permettent de modéliser le comportement de chaque véhicule individuel seconde par seconde, en intégrant des lois physiques rigoureuses de poursuite de véhicules (car-following) et de changement de voie. Cette approche granulaire offre une précision inégalée pour estimer les temps de parcours réels, identifier les goulots d'étranglement locaux et quantifier les émissions instantanées de polluants à partir de banques de données de facteurs d'émissions calibrées (HBEFA3).

Cependant, cette fidélité de modélisation physique se heurte à une barrière computationnelle majeure. La micro-simulation multi-agent est un processus intrinsèquement séquentiel et lourd en termes de calcul processeur. L'évaluation continue des équations différentielles cinématiques pour chaque agent, le calcul des distances de sécurité, la résolution des conflits géométriques aux intersections complexes et la gestion des états de signalisation dynamique représentent une charge de calcul phénoménale. 

Lorsqu'un planificateur urbain doit concevoir l'aménagement optimal d'une infrastructure critique — comme l'emplacement et le dimensionnement d'une station de recharge rapide dans une zone résidentielle dense — il fait face à un problème d'optimisation combinatoire complexe. Tester 1 000 configurations d'aménagement possibles à l'aide de simulations microscopiques classiques requiert des centaines d'heures de calcul processeur continu. De plus, à l'échelle de réseaux métropolitains de grande taille (dont les fichiers géométriques dépassent fréquemment le gigaoctet), la micro-simulation sature la mémoire vive des ordinateurs de bureau standard, provoquant des lenteurs extrêmes liées aux écritures disque virtuelles (mécanisme de SWAP). Cette contrainte temporelle interdit l'usage des simulateurs physiques pour la décision interactive ou pour des boucles d'optimisation automatique en temps réel. Le développement d'outils combinant la fidélité de la micro-simulation et la réactivité instantanée est le défi technique majeur traité dans ce mémoire.


### Double Objectif de la Recherche et Positionnement Académique

Afin de briser ce verrou technologique sans consentir à des simplifications dégradant la pertinence scientifique des résultats, ce mémoire de fin d'étude se structure autour d'un double objectif méthodologique complémentaire. Nous proposons de dépasser la frontière traditionnelle entre la précision lente locale et l'approximation rapide globale en articulant nos recherches selon deux axes distincts et synergiques.

Le premier axe vise à démontrer l'efficacité et la rigueur de la micro-simulation microscopique pour l'évaluation chirurgicale d'infrastructures locales complexes. En partant de réseaux routiers authentiques modélisés sous forme de graphes topologiques orientés, nous développons des jumeaux numériques multi-agents dynamiques intégrant des physiques de déplacement avancées et des modèles de combustion/émissions validés (HBEFA3). Ce premier volet se concentre sur l'acquisition de données réelles et la calibration physique fine du comportement cinématique des véhicules face aux infrastructures de recharge rapide.

Le second axe de recherche propose une rupture conceptuelle majeure. Il s'agit de s'affranchir définitivement du coût de calcul de la simulation physique en introduisant le concept d'Intelligence Artificielle Topologique Spectrale. L'hypothèse scientifique fondatrice de cet axe stipule que la structure géométrique et topologique intrinsèque du graphe routier (son squelette mathématique) contient de manière déterministe les signatures de sa dynamique sous charge (niveaux de congestion et volume d'émissions de $CO_2$). En extrayant les signatures spectrales de la matrice d'adjacence non-symétrique associée au réseau urbain et en exploitant des concepts issus de l'analyse non-normale et de la théorie des perturbations d'opérateurs, nous construisons un moteur prédictif capable de se substituer au simulateur physique en une fraction de seconde, offrant un outil d'aide à la décision d'une agilité inédite pour les planificateurs de la ville intelligente.


### Annonce Détaillée de la Structure du Mémoire

Pour exposer cette recherche avec toute la rigueur universitaire requise, ce mémoire est structuré selon le plan logique suivant :

La **Première Partie** est dédiée à la collecte et à l'analyse des données de terrain. Elle décrit le protocole d'observation mis en œuvre à Vinhomes Ocean Park (Hanoï) pour acquérir la vérité terrain de la mobilité sous forte densité, présente les technologies de vision par ordinateur utilisées pour la détection des flottes hétérogènes, et détaille le processus d'audit de données qui a révélé des biais systématiques de détection ainsi que les dynamiques de trafic spécifiques observées lors des périodes de congés.

La **Deuxième Partie** pose les fondations techniques et théoriques de nos modèles. D'une part, elle détaille le fonctionnement interne du simulateur SUMO, notamment les équations cinématiques de poursuite de véhicules (modèle de Krauß) et les étapes algorithmiques de préparation des réseaux routiers (calcul des composantes fortement connexes et filtrage des micro-trajets). D'autre part, elle présente le formalisme de l'analyse spectrale des graphes asymétriques et de la théorie des perturbations d'opérateurs qui constituent la signature mathématique exploitée par notre modèle d'intelligence artificielle prédictive.

La **Troisième Partie** confronte ces outils théoriques à des applications concrètes. Elle présente en premier lieu l'étude de cas localisée du hub de recharge de Sao Bien à Hanoï, modélisant les dynamiques de files d'attente et le comportement stochastique des sessions de recharge. En second lieu, elle déploie un cadre expérimental global pour tester la généricité de notre moteur de simulation sur six réseaux urbains mondiaux de morphologies contrastées, comparant les exigences computationnelles (temps CPU, empreinte mémoire RAM) de la micro-simulation physique face à notre modèle d'intelligence artificielle spectral.


\newpage

# PREMIÈRE PARTIE : ACQUISITION DES DONNÉES, PROTOCOLE DE COLLECTE ET CONTEXTES DE MOBILITÉ



## Chapitre 1 : Contexte démographique et modélisation de la transition électrique

### Le paradigme des villes intelligentes et de la décarbonation des systèmes de transport

La transition vers la ville intelligente ("Smart City") ne se résume pas à l'intégration superficielle de technologies de communication au sein de l'espace urbain ; elle constitue une réponse structurelle à l'impératif de décarbonation. Dans l'architecture d'une métropole moderne, les systèmes de transport représentent l'un des principaux réservoirs d'optimisation carbone. Les politiques publiques traditionnelles, basées sur l'expansion continue des capacités de voirie, ont montré leurs limites en se heurtant au phénomène de demande induite. La décarbonation requiert donc une approche combinée : la transition technologique des moteurs thermiques vers des systèmes de propulsion électrique, et l'optimisation dynamique des flux pour minimiser les pertes énergétiques associées à la congestion.

Cette restructuration des systèmes de transport impose de repenser la relation entre l'espace routier et le réseau d'alimentation en énergie. Alors que le ravitaillement en carburant fossile s'effectuait via un réseau de distribution décentralisé et déconnecté du trafic immédiat (stations-services hors voirie principale), l'électrification ancre le ravitaillement au cœur du flux de circulation. Les bornes de recharge s'insèrent dans le domaine public, sur les places de stationnement ou les voies de desserte commerciale. Cette hybridation physique transforme chaque point de recharge en un nœud d'attraction cinématique, modifiant localement la trajectoire des véhicules et perturbant l'écoulement des flux environnants.


### Le cadre d'étude vietnamien : Vinhomes Ocean Park (VHOP) et sa cinétique de croissance

Le développement rapide de l'Asie du Sud-Est s'accompagne d'une transition urbaine caractérisée par la construction de villes nouvelles planifiées en périphérie des centres historiques. Au Vietnam, ce modèle trouve son illustration dans le projet *Vinhomes Ocean Park* (VHOP), un complexe multifonctionnel de 420 hectares situé à l'est de Hanoï. Conçu initialement comme une cité satellite résidentielle pour soulager la pression démographique du district historique de Hoan Kiem, VHOP a été dimensionné pour accueillir une population nominale de 90 000 habitants.

Cependant, la cinétique d'occupation de VHOP a dépassé les prévisions initiales. En 2023, le nombre de résidents permanents a franchi le seuil des 60 000 personnes, et les projections démographiques révisées indiquent que le site pourrait accueillir à terme plus de 200 000 résidents d'ici 2030 en raison de l'attractivité des infrastructures scolaires, médicales et commerciales intégrées. 

Cette croissance démographique accélérée se traduit par une pression sans précédent sur les infrastructures routières locales. En 2023, la population active présente sur site ne représentait que 30 % à 33 % de la capacité finale projetée. L'analyse des flux actuels montre que le réseau routier interne, bien que moderne, approche déjà de la saturation lors des heures de pointe. Anticiper le comportement de ce réseau face à un triplement de la densité de population constitue une problématique critique pour éviter la paralysie fonctionnelle de la communauté.


### L'intégration des flottes électriques (VinFast) et la problématique infrastructurelle des hubs de recharge

Au cœur de la stratégie de mobilité de Vinhomes Ocean Park se trouve l'écosystème électrique porté par le groupe *Vingroup*, à travers sa filiale automobile *VinFast* et sa filiale de recharge *V-Green*. L'électrification à VHOP ne relève pas d'une adoption individuelle lente, mais d'une intégration industrielle planifiée. Les transports en commun internes sont assurés par des bus électriques (*VinBus*), et la flotte de taxis opérant sur le site est constituée en majorité de véhicules électriques de la compagnie *GSM (Green and Smart Mobility)*. 

Pour soutenir cette flotte captive et inciter les résidents à abandonner le moteur thermique, un réseau de hubs de recharge rapide a été déployé. Le cas d'étude de Sao Bien se focalise sur la station de recharge installée en bordure du *Vincom Mega Mall*, l'un des centres d'attraction majeurs du complexe. Ce hub est équipé de 12 bornes de recharge ultra-rapides d'une puissance unitaire de 150 kW DC. 

L'intégration d'une telle infrastructure génère des contraintes opérationnelles sévères. D'une part, la demande électrique cumulée de la station peut atteindre 1,8 MW en période de pointe, imposant des contraintes de dimensionnement sur le réseau de distribution moyenne tension local. D'autre part, la géométrie d'accès à la station, configurée en stationnement en épi à 135 degrés le long d'une voie de service étroite, crée des conflits d'usage. Les véhicules en attente de charge partagent la voirie avec la file des taxis en attente de clients pour le centre commercial, formant des goulots d'étranglement cinématiques dès que le taux d'occupation des bornes dépasse 75 %.


\newpage

## Chapitre 2 : Méthodologie de collecte de données terrain par vision par ordinateur

### L'infrastructure d'observation : Stratégie du 3ème étage (Vincom Mega Mall) et minimisation de l'occlusion

La collecte de données précises sur les flux de trafic en milieu urbain dense nécessite une méthodologie d'observation rigoureuse pour garantir la qualité des données d'entrée du jumeau numérique. Pour le site de Sao Bien, nous avons établi un poste d'observation temporaire au 3ème étage du *Vincom Mega Mall*, au niveau de la zone de restauration faisant face au corridor de circulation principal et au hub de recharge.

Ce positionnement en hauteur (angle d'observation incliné entre 30 et 45 degrés par rapport à l'horizontale) répond à une contrainte technique majeure : **la minimisation de l'occlusion visuelle**. 

Dans un contexte de trafic mixte caractéristique du Vietnam, où les flux comportent une part importante de deux-roues motorisés circulant de front avec des autobus et des SUV de gabarit important, une capture au niveau du sol souffre d'un biais de masquage systématique. Les véhicules volumineux (tels que les bus électriques) occultent totalement les motocyclistes et les petites voitures situés sur les voies intérieures ou dans les angles morts géométriques de la caméra. 

La perspective plongeante du 3ème étage permet d'obtenir une vue dégagée "pseudo-orthogonale" du réseau, garantissant que chaque trajectoire de véhicule reste visible tout au long du segment d'analyse, éliminant ainsi les pertes de suivi et améliorant la précision des comptages.


### Contraintes opérationnelles de prise de vue : Choix du format Portrait vs Paysage face aux obstacles géométriques

L'établissement de la ligne de visée depuis le 3ème étage du centre commercial a imposé des contraintes géométriques strictes liées à l'architecture du bâtiment. La présence de piliers de soutien en béton, de montants de fenêtres en aluminium et de vitrines de magasins obstruait une grande partie du champ visuel horizontal. 

L'analyse comparative des formats de capture a révélé les éléments suivants :
*   **Le format paysage (horizontal) :** Bien qu'adapté pour capturer la longueur du tronçon routier, il intégrait dans le cadre plusieurs obstacles physiques majeurs qui divisaient la zone d'intérêt en sous-sections disjointes, empêchant le suivi continu des trajectoires par l'algorithme de vision par ordinateur.
*   **Le format portrait (vertical) :** En orientant la caméra verticalement, nous avons pu aligner le champ de vision principal dans l'espace situé entre deux piliers consécutifs du bâtiment. Cette configuration a permis de cadrer de manière ininterrompue les trois zones critiques du corridor : la zone d'approche amont, la zone d'insertion du hub de recharge, et la zone de sortie vers le carrefour aval.

Le choix du format portrait a ainsi éliminé les pertes de suivi dynamique causées par les occultations architecturales fixes, assurant une continuité des données de trajectoire indispensable pour la calibration des temps de transit.


### Le pipeline de détection automatique et de classification de véhicules via YOLOv8

Pour automatiser l'extraction des données de trafic à partir des séquences vidéo haute définition capturées sur site, nous avons déployé un pipeline de traitement d'images basé sur le modèle de réseau de neurones convolutifs **YOLOv8** (You Only Look Once, version 8). 

Ce pipeline de vision par ordinateur fonctionne de la manière suivante :
1.  **Segmentation temporelle :** Les vidéos brutes sont découpées en segments homogènes de 10 minutes pour correspondre aux intervalles standards d'analyse de trafic.
2.  **Inférence et détection :** Le modèle YOLOv8, pré-entraîné sur le jeu de données COCO (Common Objects in Context) et optimisé pour la détection en temps réel, traite les trames vidéo avec un seuil de confiance de détection fixé à $0.50$. Pour chaque trame, l'algorithme génère des boîtes de délimitation (bounding boxes) autour des objets détectés.
3.  **Classification catégorielle :** Les objets détectés sont classés selon trois classes de véhicules pertinentes pour l'étude de la mobilité locale :
    *   *Standard Car* (véhicules particuliers équipés de moteurs thermiques).
    *   *Electric Vehicle* (véhicules électriques, identifiables par leur signature visuelle spécifique et leur plaque d'immatriculation bleue réservée aux VE au Vietnam).
    *   *Motorcycle* (deux-roues motorisés).
4.  **Suivi de trajectoire (Tracking) :** L'algorithme associe un identifiant unique à chaque boîte de délimitation à l'aide d'un filtre de Kalman et d'une matrice de coût basée sur le recouvrement spatial des boîtes (Intersection over Union - IoU) entre trames successives. Cela permet de compter le nombre exact de véhicules franchissant des lignes virtuelles de comptage définies sur chaque voie de circulation.


\newpage

## Chapitre 3 : Traitement, audit et correction des données de trafic brutes

### Analyse des biais de classification de l'IA et application du facteur de correction systématique

Malgré l'efficacité de l'architecture YOLOv8 pour la détection automatique, la phase d'audit qualité des données a mis en évidence un biais de classification systématique lors de l'analyse des flux de véhicules particuliers. En comparant les résultats de l'extraction automatisée à un comptage manuel de référence effectué sur 3 heures de vidéo, nous avons identifié une **surestimation constante de la classe des voitures de l'ordre de +30 %**.

L'analyse d'erreur a révélé que ce biais provenait de deux facteurs :
*   La confusion visuelle induite par les longs véhicules (SUV familiaux VinFast de type VF8 et VF9, mini-fourgonnettes et véhicules de livraison légers) qui, sous certains angles de vue inclinés, étaient fragmentés par l'algorithme en plusieurs boîtes de délimitation distinctes, générant de fausses détections multiples pour un unique véhicule physique.
*   L'occlusion partielle transitoire causée par le passage de bus électriques, qui masquaient puis révélaient des véhicules adjacents, poussant l'algorithme de suivi à réinitialiser l'identifiant du véhicule et à le comptabiliser une seconde fois.

Pour stabiliser le jeu de données et éliminer ce bruit de détection, nous avons intégré un **facteur de correction mathématique systématique de -30 %** appliqué à la classe des véhicules particuliers dans le pipeline de traitement des données. Cette correction a permis d'aligner les comptages automatisés sur les données physiques réelles validées manuellement.


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

Le volume élevé de deux-roues motorisés (63,6 %) sature l'espace de circulation. Les motos occupent les espaces inter-voies, créant des trajectoires complexes d'évitement pour les véhicules plus volumineux. Cette densité ralentit l'accès au hub de recharge, les véhicules électriques devant manœuvrer à travers un flux dense pour s'insérer dans les slots en épi.


### Phénoménologie du trafic observée : Le phénomène de "Holiday Reversal" et dynamiques de congestion locales

L'analyse des données de collecte a mis en lumière un comportement de trafic singulier lors des périodes de congés officiels (notamment les journées du 30 avril et du 1er mai, correspondant aux vacances nationales du Jour de la Réunification et de la Fête du Travail au Vietnam). Nous avons qualifié ce phénomène de **"Holiday Reversal"** (inversion de vacances).

Alors que les jours de semaine classiques présentent une domination nette des deux-roues motorisés (51 % à 64 % de la flotte), les jours fériés révèlent une structure inversée, dite "Car-Locked". Les observations enregistrées à 12h00 lors des vacances indiquent :
*   Une baisse significative de la proportion de motos, qui chute à **34,6 %** (soit 42,25 unités).
*   Une augmentation importante de la part des véhicules électriques, qui grimpe à **43,3 %** (soit 53,00 unités).
*   Une part stable de voitures thermiques à **19,4 %** (soit 23,75 unités).

Ce changement s'explique par deux facteurs d'usage : d'une part, les résidents privilégient les déplacements en voiture familiale pour se rendre dans les zones de loisirs et les centres commerciaux de VHOP ; d'autre part, la flotte de taxis électriques GSM intensifie son activité pour répondre à la demande des visiteurs externes. 

Pour le hub de recharge, cette configuration représente une situation critique : le taux d'occupation des bornes atteint 100 % de manière quasi-continue, et des files d'attente se forment sur la voie de service, bloquant le couloir d'accès au centre commercial et générant des ralentissements locaux significatifs.


\newpage

# DEUXIÈME PARTIE : FONDATIONS TECHNIQUES ET THÉORIQUES DES SYSTÈMES DE SIMULATION ET DE LA PRÉDICTION TOPOLOGIQUE



## Chapitre 4 : Le moteur de micro-simulation physique SUMO

### Abstraction topologique de la voirie (Nœuds, arêtes, connecteurs géométriques)

Le progiciel SUMO modélise les réseaux de transport sous forme de réseaux logiques basés sur la théorie des graphes orientés. Dans ce formalisme, chaque intersection physique est représentée par un nœud unique doté d'une géométrie polygonale décrivant sa surface de jonction. Les tronçons routiers reliant les nœuds sont modélisés par des arêtes, subdivisées en une ou plusieurs voies de circulation (*lanes*).

Chaque voie possède des attributs géométriques et comportementaux stricts :
*   Une polyligne tridimensionnelle décrivant son axe central.
*   Une largeur constante (généralement fixée à 3,2 mètres pour les voies urbaines standards).
*   Une liste de classes de véhicules autorisées (ex: `passenger`, `taxi`, `motorcycle`, `bus`, `delivery`).
*   Une vitesse limite supérieure déterminant la vitesse de référence des agents.

La transition entre deux arêtes consécutives s'effectue via des **connecteurs géométriques** (*connections*) définis à l'intérieur des nœuds. Ces connecteurs lient précisément une voie de l'arête d'approche à une voie de l'arête de sortie. Ils supportent les règles de priorité (ex: céder le passage, priorité absolue) et les configurations de signalisation dynamique (phases de feux), permettant au simulateur de calculer les trajectoires de croisement sans collision physique.


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
où $\eta$ est une variable aléatoire distribuée uniformément sur l'intervalle $[0, \sigma \cdot a \cdot \Delta t]$, le paramètre $\sigma \in [0, 1]$ caractérisant le degré d'inattention ou d'imperfection du conducteur.


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


### Routage dynamique : Filtre de distance minimale pour l'élimination des micro-trajets parasitaires

Lors de la phase de génération automatique de la demande de trafic (synthèse des trajets), les points d'origine et de destination sont distribués aléatoirement sur le graphe épuré. Pour éviter l'apparition de micro-trajets (déplacements de moins de 300 mètres reliant des intersections adjacentes), nous implémentons une contrainte de distance minimale lors de la phase de routage.

Soit un couple origine-destination $(o, d) \in V^2$ sélectionné pour générer le trajet d'un agent. Le trajet n'est validé et écrit dans le fichier final de demande que s'il satisfait la condition suivante :
$$D_{Euclidienne}(o, d) = \sqrt{(x_d - x_o)^2 + (y_d - y_o)^2} \ge 300 \text{ mètres}$$

Cette contrainte force le planificateur d'itinéraires à rejeter les trajets de très courte distance. En éliminant ces mouvements parasitaires qui se limitent à des phases d'insertion-sortie immédiates, le filtre garantit que l'ensemble de la flotte simulée s'insère dans les flux de transit principaux du réseau, interagissant de manière représentative avec la topologie globale de la voirie et la signalisation.


\newpage

## Chapitre 5 : Théorie mathématique du trafic et de la topologie spectrale

L'évaluation de la résilience et des émissions de carbone au sein d'un réseau viaire repose traditionnellement sur des modèles dynamiques microscopiques ou sur des approximations macroscopiques fluides. Bien que ces méthodes offrent une précision locale indéniable, elles souffrent d'une lenteur computationnelle rédhibitoire et n'offrent que peu d'indications théoriques a priori sur la vulnérabilité intrinsèque de la structure. Dans ce chapitre, nous développons un formalisme mathématique rigoureux qui extrait la "signature urbaine" d'une ville à travers l'analyse spectrale et non-normale de sa matrice d'adjacence. Ce cadre théorique permet de quantifier l'instabilité potentielle du trafic et d'identifier les fragilités topologiques structurelles avant même toute simulation cinématique.

### Formalisation matricielle du réseau viaire

Pour modéliser mathématiquement le réseau routier, nous le représentons sous la forme d'un graphe orienté et pondéré $G = (V, E)$, où :
*   $V = \{v_1, v_2, \dots, v_n\}$ désigne l'ensemble des nœuds ($n = |V|$), représentant les intersections physiques du réseau.
*   $E \subset V \times V$ désigne l'ensemble des arêtes orientées ($m = |E|$), modélisant les tronçons routiers à sens unique reliant ces intersections.

La connectivité et l'impédance physique du réseau sont codées dans la **matrice d'adjacence pondérée** $A \in \mathbb{R}^{n \times n}$. Contrairement aux graphes non orientés simples où la matrice d'adjacence est symétrique et binaire, la représentation réaliste d'un réseau urbain impose une double complexité :
1.  **Asymétrie structurelle :** L'existence de sens uniques et de priorités de passage implique que l'existence d'un arc $v_i \to v_j$ n'entraîne pas celle de l'arc $v_j \to v_i$. Ainsi, $A_{ij} \neq A_{ji}$.
2.  **Pondération physique :** Chaque coefficient $A_{ij}$ n'indique pas une simple connexion, mais est défini comme une fonction de la capacité physique du tronçon routier. Pour un tronçon reliant le nœud $i$ au nœud $j$, la pondération est donnée par :
    $$A_{ij} = \begin{cases} \frac{L_{ij} \cdot C_{ij}}{W_{ij}} & \text{si } (v_i, v_j) \in E \\ 0 & \text{sinon} \end{cases}$$
    où $L_{ij}$ représente la longueur du tronçon (en mètres), $C_{ij}$ le nombre de voies de circulation, et $W_{ij}$ la vitesse maximale autorisée (en m/s). Cette formulation permet d'intégrer les goulets d'étranglement géométriques directement dans les coefficients de la matrice.

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
L'absence de symétrie de cette matrice est évidente ($A_{ex} \neq A_{ex}^T$), ce qui introduit des propriétés spectrales spécifiques détaillées ci-après.

### Le concept de non-normalité et amplification transitoire

Un opérateur linéaire ou une matrice carrée $A$ est dit **normal** si et seulement s'il commute avec son adjoint, soit $A A^T = A^T A$. Dans le cas des réseaux routiers réels orientés, cette relation n'est jamais vérifiée : la matrice d'adjacence $A$ est intrinsèquement **non-normale** ($A A^T \neq A^T A$).

Cette non-normalité a des implications physiques profondes sur la dynamique du trafic. Pour une matrice normale, les vecteurs propres forment une base orthonormale de l'espace, et le comportement à court terme du système est entièrement dicté par ses valeurs propres. Si toutes les valeurs propres ont une partie réelle négative (ou un module inférieur à 1 en discret), toute perturbation décroît de manière monotone.

Dans un système non-normal, les vecteurs propres ne sont plus orthogonaux et peuvent devenir presque colinéaires. Par conséquent, même si toutes les valeurs propres indiquent une stabilité asymptotique à long terme ($\rho(A) < 1$), le système peut subir une **amplification transitoire massive** de l'état avant sa décroissance finale. Ce phénomène est connu sous le nom d'**effet coup de bélier** (*water hammer effect*) du trafic :
*   Une perturbation locale mineure (comme un retard de 10 secondes à un feu ou un ralentissement ponctuel) excite les modes non-orthogonaux du réseau.
*   Ces modes interfèrent de manière constructive à court terme, provoquant une amplification géométrique de la file d'attente.
*   Cette accumulation transitoire sature les intersections en amont par effet domino, paralysant temporairement une large zone urbaine et générant un pic d'émissions de $CO_2$ avant que le système ne parvienne à évacuer le flux.

### Le Rayon Spectral ($\rho$) et le Théorème de Perron-Frobenius

Le spectre d'une matrice d'adjacence $A$, noté $\sigma(A)$, est l'ensemble de ses valeurs propres $\lambda_i \in \mathbb{C}$ vérifiant l'équation caractéristique $\det(\lambda I - A) = 0$. Le **rayon spectral** $\rho(A)$ est défini comme le module de la plus grande valeur propre :
$$\rho(A) = \max_{\lambda \in \sigma(A)} |\lambda|$$

Puisque les coefficients $A_{ij}$ de notre matrice d'adjacence pondérée sont strictement non-négatifs ($A_{ij} \ge 0$), nous pouvons appliquer le **théorème de Perron-Frobenius**. Si le graphe $G$ est fortement connexe (ce qui est garanti par notre filtrage algorithmique de Tarjan), la matrice $A$ est irréductible. Le théorème stipule alors que :
1.  Le rayon spectral $\rho(A)$ est lui-même une valeur propre de $A$, simple et strictement positive ($\rho(A) > 0$).
2.  Il existe un vecteur propre à droite $v_{PF}$ associé à $\rho(A)$ dont toutes les composantes sont strictement positives ($v_{PF} > 0$), appelé vecteur de Perron-Frobenius.
3.  Cette valeur propre domine toutes les autres : $\forall \lambda \in \sigma(A) \setminus \{\rho(A)\}, \ |\lambda| \le \rho(A)$.

Physiquement, le rayon spectral $\rho(A)$ quantifie la capacité intrinsèque de transit du réseau. Un rayon spectral élevé indique la dominance d'un mode principal de circulation, caractéristique des villes fortement hiérarchisées dotées d'autoroutes urbaines ou de grands boulevards périphériques (par exemple, Paris ou Madrid). À l'inverse, un rayon spectral proche de 1 caractérise des réseaux hautement réguliers et distribués (type grille comme Berlin ou Los Angeles), où les flux n'ont pas d'axe de concentration obligatoire.

### La Constante de Kreiss ($K$) et la dynamique de crise

Pour quantifier rigoureusement la sensibilité d'un réseau non-normal aux amplifications transitoires et modéliser son instabilité dynamique, nous introduisons la **constante de Kreiss** $K(A)$. Soit $A$ une matrice stable ($\rho(A) < 1$). La constante de Kreiss est définie mathématiquement par la borne supérieure de la norme de son opérateur résolvant sur le disque unité :
$$K(A) = \sup_{|z| > 1} (|z| - 1) \left\| (zI - A)^{-1} \right\|$$
où $\|\cdot\|$ désigne la norme matricielle induite (généralement la norme spectrale $L_2$).

Le théorème des matrices de Kreiss établit des bornes strictes reliant cette constante à l'amplification transitoire maximale de la puissance de la matrice, décrivant l'évolution temporelle discrète d'une perturbation :
$$K(A) \le \sup_{k \ge 0} \left\| A^k \right\| \le e \cdot n \cdot K(A)$$
où $n$ est la dimension de la matrice.

En ingénierie du trafic, la constante de Kreiss agit comme un **détecteur de nervosité** ou de fragilité structurelle du réseau :
*   Si $K(A) \approx 1$, le réseau est robuste et se comporte comme un système normal. Les perturbations de trafic s'amortissent de manière monotone sans amplification.
*   Si $K(A) \gg 10$, le réseau présente une vulnérabilité critique. Une infime fluctuation de la demande ou un ralentissement local va induire une congestion transitoire disproportionnée. La pollution en $CO_2$, directement liée aux phases d'arrêt et de réaccélération des véhicules lors des embouteillages, devient extrêmement instable et subit des pics de pollution d'autant plus élevés que la constante de Kreiss est forte.

### Les Normes de Transfert $H_2$ et $H_\infty$

Afin de caractériser la réponse globale du réseau à des scénarios d'injection continue de trafic, nous modélisons la propagation de la congestion comme un système dynamique linéaire entrée-sortie. Soit la fonction de transfert du réseau $T(z) = (zI - A)^{-1}$. Nous évaluons cette dynamique via deux normes d'espaces de Hardy :

#### La Norme $H_\infty$ (Gain Maximal)
La norme $H_\infty$ représente la borne supérieure du gain d'énergie du système sur l'ensemble des fréquences complexes. Elle correspond au rayon du plus grand cercle de la résolvante et se définit par :
$$\|T\|_{H_\infty} = \sup_{|z| > 1} \left\| (zI - A)^{-1} \right\|_2 = \sup_{\theta \in [0, 2\pi]} \sigma_{max}\left( (e^{i\theta}I - A)^{-1} \right)$$
où $\sigma_{max}$ est la valeur singulière maximale. 

Physiquement, $\|T\|_{H_\infty}$ quantifie le **pire scénario de congestion possible** que la structure géométrique du réseau peut générer sous une charge harmonique. Elle représente le niveau d'émissions de $CO_2$ "de base" et inévitable inhérent à la simple géométrie des rues de la ville.

#### La Norme $H_2$ (Énergie Totale)
La norme $H_2$ mesure l'énergie totale dissipée par le système en réponse à une perturbation impulsionnelle unitaire (par exemple, un afflux soudain de véhicules à une intersection). Elle est définie par :
$$\|T\|_{H_2} = \left( \frac{1}{2\pi} \int_{0}^{2\pi} \text{Tr}\left( T(e^{i\theta}) T(e^{i\theta})^H \right) d\theta \right)^{1/2} = \left( \sum_{k=0}^{\infty} \left\| A^k \right\|_F^2 \right)^{1/2}$$
où $\|\cdot\|_F$ désigne la norme de Frobenius.

La norme $H_2$ reflète la **mémoire temporelle du réseau**. Une valeur $H_2$ élevée indique que la congestion mettra un temps considérable à s'évacuer après la fin de la perturbation originelle (par exemple, une persistance anormalement longue des embouteillages et des émissions associées bien après l'heure de pointe).

### Théorie des perturbations de Kato

Pour agir sur la robustesse du réseau et concevoir des politiques d'aménagement optimales (sens uniques, fermetures de voies, feux dynamiques), il est nécessaire de quantifier l'impact d'une modification structurelle locale sur les valeurs propres de la matrice d'adjacence. Nous exploitons pour cela la **théorie des perturbations des opérateurs linéaires** formalisée par Tosio Kato.

Soit la matrice d'adjacence nominale $A$ perturbée par une modification locale $\delta A$ proportionnelle à un paramètre réel $\epsilon$ :
$$A(\epsilon) = A + \epsilon B$$
où $B$ est la matrice de perturbation modélisant la création ou la suppression d'une liaison routière.

Pour une valeur propre $\lambda_i$ non dégénérée de la matrice $A$, associée au vecteur propre à droite $v_i$ et au vecteur propre à gauche $w_i$ (tels que $A v_i = \lambda_i v_i$ et $w_i^T A = \lambda_i w_i^T$), le développement perturbatif de $\lambda_i(\epsilon)$ s'écrit :
$$\lambda_i(\epsilon) = \lambda_i + \epsilon \lambda_i^{(1)} + \epsilon^2 \lambda_i^{(2)} + \mathcal{O}(\epsilon^3)$$

#### Dérivée Première des Valeurs Propres
La variation au premier ordre est donnée par la formule classique :
$$\lambda_i^{(1)} = \frac{w_i^T B v_i}{w_i^T v_i}$$

Cette dérivée première indique la direction de sensibilité immédiate. Elle permet de savoir si l'ajout d'une connexion (ou son renforcement) va stabiliser ou déstabiliser le réseau.

#### Dérivée Seconde des Valeurs Propres
Pour capturer les effets de second ordre et les couplages non-linéaires induits par la perturbation, nous utilisons la formule de Kato faisant intervenir la résolvante réduite $S_i$ :
$$\lambda_i^{(2)} = w_i^T B S_i B v_i$$
où $S_i$ désigne l'opérateur réduit associé à la valeur propre $\lambda_i$, défini par :
$$S_i = \lim_{z \to \lambda_i} (zI - A)^{-1} (I - P_i)$$
avec $P_i = \frac{v_i w_i^T}{w_i^T v_i}$ le projecteur spectral sur le sous-espace propre associé à $\lambda_i$.

L'accès à cette dérivée seconde est capital car la non-normalité de $A$ induit des variations fortement non-linéaires des valeurs propres sous perturbation.

#### Formulation d'une loi de contrôle de robustesse
En utilisant ces dérivées analytiques, nous formulons une **loi de contrôle géométrique** pour optimiser la robustesse du réseau routier. L'objectif est de trouver la perturbation optimale $B^*$ (sélectionnée parmi un ensemble de modifications topologiques admissibles $\mathcal{B}$) qui minimise la constante de Kreiss ou le rayon spectral dominant afin de maximiser la résilience du graphe :
$$B^* = \arg\min_{B \in \mathcal{B}} \rho(A + \epsilon B) \approx \arg\min_{B \in \mathcal{B}} \left( \lambda_{PF} + \epsilon \frac{w_{PF}^T B v_{PF}}{w_{PF}^T v_{PF}} + \epsilon^2 w_{PF}^T B S_{PF} B v_{PF} \right)$$

Cette formulation analytique évite d'avoir à recalculer le spectre complet pour chaque modification virtuelle, offrant un guide mathématique pour reconcevoir la signalisation ou le sens de circulation d'une ville de façon optimale et rationnelle.


\newpage

## Chapitre 6 : Le moteur d'intelligence artificielle prédictif

Pour dépasser le coût computationnel prohibitif des simulateurs physiques multi-agents comme SUMO, ce chapitre présente la conception et l'évaluation d'un métamodèle basé sur l'intelligence artificielle. En exploitant la "signature urbaine" spectrale et topologique développée au Chapitre 5, ce moteur prédictif estime de manière instantanée (de l'ordre de la milliseconde) les émissions globales de $CO_2$ sous charge de trafic, ouvrant la voie à des outils d'aide à la décision en temps réel pour l'aménagement du territoire.

### Objectif scientifique du métamodèle

La micro-simulation dynamique (SUMO) résout les équations cinématiques de poursuite de véhicules seconde par seconde pour chaque agent. Ce niveau de détail est nécessaire pour calibrer précisément les comportements locaux, mais il engendre un coût de calcul exponentiel avec la taille du réseau et la charge de véhicules. À l'échelle de réseaux métropolitains ou pour des études d'optimisation nécessitant l'évaluation de milliers de scénarios, cette lenteur limite fortement l'interactivité.

L'objectif de notre approche est de construire un métamodèle d'apprentissage supervisé capable d'apprendre la fonction de transfert implicite du simulateur physique :
$$f : \mathcal{X} \to \mathcal{Y}$$
où :
*   $\mathcal{X}$ est l'espace des caractéristiques structurelles et spectrales d'une ville complété par la charge de trafic appliquée.
*   $\mathcal{Y}$ représente les émissions totales de $CO_2$ (en kilogrammes) ou la vitesse moyenne globale (en m/s) générées par la simulation SUMO de référence (Ground Truth).

Une fois entraîné, ce métamodèle permet de court-circuiter l'étape de simulation physique en fournissant des prédictions immédiates avec une perte de précision minime.

### Architecture et mathématiques de XGBoost

Pour modéliser cette fonction complexe, nous avons sélectionné l'algorithme de boosting d'arbres de décision régularisé **XGBoost** (eXtreme Gradient Boosting). Cet algorithme construit de manière séquentielle un ensemble d'arbres de régression additifs.

Soit un jeu de données d'entraînement $\mathcal{D} = \{(x_i, y_i)\}_{i=1}^N$. À l'étape $t$, la prédiction du modèle pour l'échantillon $i$ s'écrit sous la forme additive :
$$\hat{y}_i^{(t)} = \hat{y}_i^{(t-1)} + f_t(x_i)$$
où $f_t \in \mathcal{F}$ représente la structure du nouvel arbre de décision ajouté au modèle à l'étape $t$.

La fonction de coût objective $\mathcal{L}^{(t)}$ à minimiser lors de l'apprentissage de ce $t$-ième arbre intègre une pénalité de régularisation stricte :
$$\mathcal{L}^{(t)} = \sum_{i=1}^N l\left(y_i, \hat{y}_i^{(t-1)} + f_t(x_i)\right) + \Omega(f_t)$$

#### Terme de régularisation $\Omega(f)$
Pour éviter le sur-apprentissage (overfitting), particulièrement sur des jeux de données de taille modérée, le terme de régularisation pénalise la complexité de l'arbre $f$ en fonction de son nombre de feuilles $T$ et des poids associés à ces feuilles $w \in \mathbb{R}^T$ (régularisation hybride L1/L2) :
$$\Omega(f_t) = \gamma T + \frac{1}{2} \lambda \sum_{j=1}^T w_j^2 + \alpha \sum_{j=1}^T |w_j|$$
où $\gamma$ contrôle le coût d'ajout d'une nouvelle feuille, tandis que $\lambda$ et $\alpha$ sont les coefficients de régularisation respectifs L2 (Ridge) et L1 (Lasso) appliqués aux scores des feuilles.

#### Approximation par développement de Taylor au second ordre
Pour optimiser rapidement cette fonction de coût non linéaire, XGBoost applique un développement de Taylor au second ordre autour de la prédiction précédente $\hat{y}_i^{(t-1)}$ :
$$\mathcal{L}^{(t)} \approx \sum_{i=1}^N \left[ l\left(y_i, \hat{y}_i^{(t-1)}\right) + g_i f_t(x_i) + \frac{1}{2} h_i f_t^2(x_i) \right] + \gamma T + \frac{1}{2} \lambda \sum_{j=1}^T w_j^2$$
où $g_i$ et $h_i$ désignent respectivement les dérivées première (gradient) et seconde (hessienne) de la fonction de perte par rapport à la prédiction courante :
$$g_i = \frac{\partial l\left(y_i, \hat{y}_i^{(t-1)}\right)}{\partial \hat{y}_i^{(t-1)}} \quad \text{et} \quad h_i = \frac{\partial^2 l\left(y_i, \hat{y}_i^{(t-1)}\right)}{\partial \left(\hat{y}_i^{(t-1)}\right)^2}$$

En regroupant les termes par feuille $j$, le problème d'optimisation se ramène à la résolution analytique des poids optimaux des feuilles $w_j^*$, ce qui confère à XGBoost sa rapidité et sa robustesse face aux données bruitées ou de dimensions restreintes.

### L'espace des descripteurs (Features) et Signature Urbaine

Le vecteur d'entrée $x_i \in \mathcal{X}$ fourni au modèle d'intelligence artificielle est structuré de manière à encapsuler la physique globale et la dynamique spectrale du réseau. Il comporte six descripteurs fondamentaux :
1.  **`total_vehicles` (La contrainte de charge) :** Le nombre total de véhicules injectés dans le réseau (de 5 000 à 30 000 agents). C'est la variable d'effort externe.
2.  **`n_nodes` (Complexité géométrique) :** Le nombre total de carrefours, traduisant le nombre de points de conflit potentiels.
3.  **`n_edges` (Capacité d'accueil) :** Le nombre de segments routiers du réseau.
4.  **`density` (Densité de maillage) :** Ratio caractérisant la connectivité physique globale et la disponibilité d'itinéraires alternatifs.
5.  **`kreiss_constant` (Instabilité de Kreiss - $K$) :** Variable spectrale caractérisant la sensibilité aux amplifications transitoires et aux ondes de choc de trafic (Chapitre 5).
6.  **`spectral_radius` (Rayon Spectral - $\rho$) :** Marqueur de l'asymétrie structurelle et de la hiérarchisation des corridors de transit (Chapitre 5).

L'intégration conjointe de descripteurs géométriques classiques et de descripteurs spectraux constitue la clé de voûte de notre modèle : les premiers fixent l'échelle du réseau tandis que les seconds informent l'IA sur son comportement dynamique en situation critique.

### Feature Importance et Sensibilité

Pour comprendre comment l'IA prend ses décisions, nous avons extrait l'importance relative des descripteurs (*Feature Importance*) via l'algorithme Random Forest :

```text
               IMPORTANCE DES DESCRIPTEURS DANS LA PRÉDICTION
  ========================================================================
  [total_vehicles]     |============================= 48% ============================|
  [density]            |======== 14% ========|
  [n_edges]            |======= 13% =======|
  [n_nodes]            |======= 13% =======|
  [kreiss_constant]    |==== 7% ====|
  [spectral_radius]    |=== 5% ===|
  ========================================================================
```

L'analyse de cette distribution révèle une répartition logique :
1.  **La Charge Spatiale (`total_vehicles` - 48%) :** Reste le facteur prédominant de dimensionnement de la pollution.
2.  **La Topologie Statique (`density`, `n_edges`, `n_nodes` - 40% cumulés) :** Définit l'échelle géométrique et le nombre de voies alternatives offertes au trafic.
3.  **La Signature Spectrale (`kreiss_constant`, `spectral_radius` - 12% cumulés) :** Bien que ce poids cumulé de 12% puisse sembler secondaire, il constitue la contribution scientifique majeure de notre modèle. Ces 12% agissent comme un **ajusteur de crise**. Lorsque deux villes présentent une charge et une taille similaires, ce sont uniquement ces indicateurs spectraux (Kreiss et rayon spectral) qui permettent à XGBoost de déterminer l'apparition d'un point de rupture et de moduler la prédiction d'émissions de $CO_2$ à la hausse pour refléter la congestion induite par la non-normalité topologique.

### Espace de transfert topologique : Généralisation Cross-City

Le défi ultime de ce moteur de prédiction réside dans sa capacité de généralisation transversale (*cross-city generalization*) : prédire les émissions d'une nouvelle ville pour laquelle nous ne disposons d'aucune simulation physique SUMO (par exemple, Nairobi), uniquement à partir de ses caractéristiques géométriques et spectrales.

Pour ce faire, nous formalisons l'apprentissage par transfert sous la forme d'une interpolation barycentrique au sein de l'espace des signatures spectrales. Soit $\vec{x}_{target}$ le vecteur des descripteurs spectraux et topologiques normalisés de la ville cible (Nairobi), extrait instantanément à partir de ses données OpenStreetMap. 

Nous exprimons ce vecteur comme une combinaison linéaire convexe des vecteurs de descripteurs de $k$ villes déjà simulées et présentes dans la base d'entraînement :
$$\vec{x}_{target} = \sum_{j=1}^k \alpha_j \vec{x}_j$$
sous les contraintes de fermeture convexe :
$$\sum_{j=1}^k \alpha_j = 1 \quad \text{et} \quad \alpha_j \ge 0 \quad \forall j \in \{1, \dots, k\}$$

Les coefficients de pondération $\alpha_j$ sont calculés en résolvant un problème d'optimisation quadratique de distance minimale dans l'espace des descripteurs normalisés :
$$\vec{\alpha}^* = \arg\min_{\vec{\alpha}} \left\| \vec{x}_{target} - \sum_{j=1}^k \alpha_j \vec{x}_j \right\|_2^2$$

Si le profil spectral de Nairobi se révèle proche de celui de Marseille (poids $\alpha_{Marseille} = 0.70$) et de celui de Berlin (poids $\alpha_{Berlin} = 0.30$), l'intelligence artificielle est en mesure de prédire la courbe d'émissions de la ville cible en exploitant les surfaces de décision non linéaires apprises sur ces analogues morphologiques. Cette méthode de généralisation s'affranchit entièrement de la simulation physique multi-agent lente, ramenant le temps d'évaluation d'un nouveau plan urbain de plusieurs heures à quelques microsecondes.


\newpage

# TROISIÈME PARTIE : APPLICATIONS EXPÉRIMENTALES ET VALIDATION COMPARATIVE



## Chapitre 7 : Étude de cas localisée – Le hub de recharge rapide de Sao Bien (Hanoï)

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
2.  **Distorsion statistique :** Intégrer les bus dans les calculs de répartition globale sous-estimerait l'importance relative de la flotte de voitures particulières et de taxis, qui constitue 100 % de la demande physique pesant sur le hub de recharge de Sao Bien. Les bus font donc l'objet d'un suivi analytique décorrélé (voir Annexe 3).

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

Le volume de trafic total global diminue légèrement pour atteindre **117,17 véhicules par tranche de 10 minutes** en moyenne (en raison du départ de la population ouvrière et étudiante de la ville), mais la composition de la flotte subit une mutation drastique :
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
Face au constat de rupture du scénario S4b, nous avons testé l'impact d'une décision d'aménagement urbain : l'expansion du hub de recharge à **20 slots (+8 bornes de 150 kW DC)** et la création d'une voie d'insertion dédiée pour la zone d'attente des taxis.
*   **Résultats :** L'évaluation sur le jumeau numérique SUMO démontre l'efficacité de cette politique de mitigation. L'augmentation de la capacité de traitement résorbe la file d'attente sur la voie de service. Le temps d'attente moyen pour accéder à une borne de recharge chute de 45,2 minutes à **6,8 minutes** (-85 %). Les manœuvres de sortie en épi, bien que toujours gênantes, ne bloquent plus le flux principal grâce à la voie d'évitement supplémentaire. La vitesse moyenne globale sur le corridor Sao Bien remonte à **21,5 km/h**, rétablissant un niveau de service (Level of Service - LOS) acceptable pour la communauté.

Ce cas d'étude démontre de manière empirique l'utilité du jumeau numérique microscopique comme outil d'aide à la décision publique pour planifier la transition énergétique des réseaux de transport urbain.



\newpage

## Chapitre 8 : Cadre d'expérimentation global et comparative des réseaux urbains

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
