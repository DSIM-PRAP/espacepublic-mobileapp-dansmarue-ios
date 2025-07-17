//
//  Constants.swift
//  DansMaRue
//
//  Created by Xavier NOEL on 29/03/2017.
//  Copyright © 2017 VilleDeParis. All rights reserved.
//

import UIKit

func env<T>(dev development: T, stg staging: T, prod production:T) -> T {
    var v: T!
    
    #if ENVIRONMENT_DEBUG
        v = development
    #elseif ENVIRONMENT_STAGING
        v = staging
    #else // Live
        v = production
    #endif
    
    return v
}

struct Constants {
     
    
    static let fontDmr = "Montserrat"
    static let prefix93 = "93"
    
    struct Services {
        
        static let langPays = "FR/fr"
        static let emailServiceFait = ["@paris.fr", "@derichebourg.com"]
        
        static let apiBaseUrl = env(dev: "",
                                            stg: "",
                                            prod: "")
        static let apiUrl = ""

        static let apiBaseUrlEquipement = env(dev: "",
                                    stg: "",
                                    prod: "")
        
        static let authBaseUrl = env(dev: "",
                                            stg: "",
                                            prod: "")
        
        static let authorization = env(
            dev: "",
            stg: "",
            prod: "")
        
        static let apiKeyGMS = env(dev: "",
                                   stg: "",
                                   prod: "")
        
        static let urlForgetPassword = ""
        static let urlRegiserCompteParisien = ""
        static let urlDisplayProfile = ""
        static let urlCGU = "https://plainecommune.fr/conditions-generales-utilisation-applications-et-formulaire/"
        static let urlConfidentialité = "https://plainecommune.fr/outils/mentions-legales-et-donnees/"
    }
    
    struct Maps {
        static let parisLatitude = 48.935528
        static let parisLongitude = 2.356937
        static let zoomLevel: Float = 12.0
        static let zoomLevel_50m : Float = 17.0
    }
    
    struct Key {
        static let categorieVersion = "categorieVersion"
        static let categorieList = "categorieList"
        static let categorieItems = "categorieItems"
        static let categorieIdSelect = "categorieIdSelect"
        
        static let categorieEquipementVersion = "categorieEquipementVersion"
        static let categorieEquipementItems = "categorieEquipementItems"
        
        static let newAnomalie = "newAnomalie"
        static let anomalieBrouillonList = "anomalieBrouillonList"
        
        static let priorityList = "priorityList"
        static let priorityId = "priorityId_"
        
        static let deviceToken = "deviceToken"
        
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let email = "email"
        static let password = "password"
        static let isAgent = "isAgent"
        static let hasAlreadyBeenConnected = "hasAlreadyBeenConnected"
        
        // Constant equipement
        static let equipementVersion = "equipementVersion"
        static let typeEquipementList = "typeEquipementList"
        
        static let separatorAdresseCoordonate = "***"

    }
    
    struct NoticationKey {
        static let typeAnomalieChanged = "TypeAnomalieChanged"
        static let photo1Changed = "Photo1Changed"
        static let photo2Changed = "Photo2Changed"
        static let priorityChanged = "PriorityChanged"
        static let descriptiveChanged = "DescriptiveChanged"
        static let anomaliesChanged = "AnomaliesChanged"
        static let addressNotification = "addressNotification"
        
        static let pushNotification = "pushNotification"
    }
    
    struct Image {
        static let noImage = "no_image"
        static let createAnomalie = "create_anomalie"
        static let searchAnomalie = "search_anomalie"
        static let createAnomalieSelected = "create_anomalie_selected"
        static let follow = "follow"
        static let followSelected = "follow_selected"
        static let followDisabled = "follow_disabled"
        static let unfollow = "unfollow"
        static let unfollowSelected = "unfollow_selected"
        static let congratulate = "felicite"
        static let congratulateSelected = "felicite_selected"
        static let congratulateDisabled = "felicite_disabled"
        static let iconGeolocation = "icon_geo_location"
        static let addAnomalie = "add_anomalie"
        static let pinRose = "pin_rose_ios"
        static let anoDoneOther = "ano_done_other"
        static let anoOther = "ano_other"
        static let pinNoir = "pin_noir_ios"
        static let iconCheckPink = "icon_check_pink"
        static let iconCheckGrey = "icon_check_grey"
        static let iconCamera = "icon_camera"
        static let iconExit = "icon_exit"
        static let iconBack = "icon_back"
        static let thumbsUp = "icon_thumbsUp"
        static let iconBackChevron = "icon_back_chevron"
        static let iconChevron = "icon_chevron"
        static let illustration1 = "Illustration1.png"
        static let illustration2 = "Illustration2.png"
        static let illustration3 = "Illustration3.png"
        static let mapMenuSelected = "map_menu_selected"
        static let profilMenuSelected = "profil_menu_selected"
        static let iconEdit = "icon_edit"
        static let iconMonCompte = "monCompte"
        static let ramen = "image_12159"
        static let favoriteUncheck = "favorite_uncheck"
        static let favoriteCheck = "favorite_check"
        static let favoritePlus = "favorite_plus"
        static let favorite = "favorite"
        
        static let maxWith: CGFloat = 800
        static let compressionQuality: CGFloat = 0.85
        static let draftPhoto1 = "photo1.jpg"
        static let draftPhoto2 = "photo2.jpg"
        
        // Equipement
        static let iconEspacePublic = "TypeEspacePublic"
    }
    
    struct AlertBoxTitle {
        
        static let adresseInvalide = "Adresse invalide"
        static let searchAnomaly = "Rechercher une anomalie"
        static let locationDisabled = "Localisation désactivée"
        static let parametres = "Paramètres"
        static let annuler = "Annuler"
        static let reglages = "Réglages"
        static let modificationPreferences = "Modification des préférences"
        static let erreur = "Erreur"
        static let attention = "Attention"
        static let non = "Non"
        static let oui = "Oui"
        static let ok = "OK"
        static let restezInforme = "Restez informé.e"
        static let valider = "Valider"
        static let reessayer = "Réessayer"
        static let grantPhoto = "\(Bundle.main.displayName) veut accéder à la caméra"
        static let adresseHorsParis = "Adresse hors Plaine commune"
        static let publier = "Publier"
        static let complementAdresseFacultatif = "Complément d'adresse (facultatif)"
        static let complementAdresse = "Complément d'adresse"
        static let information = "Information"
    }
    
    struct AlertBoxMessage {
        
        static let adresseInvalide = "Vous êtes actuellement géolocalisé en dehors de Plaine Commune. L’application bienVU permet de signaler des anomalies uniquement dans Plaine Commune."
        static let locationDisabled = "Pour utiliser le suivi, veuillez activer le GPS dans Paramètres > \nConfidentialité > Services de localisation."
        static let followMalfunction = "Vous suivez maintenant ce signalement."
        static let unfollowMalfunction = "Vous ne suivez plus ce signalement."
        static let congratulate = "Merci d'avoir transmis vos félicitations aux agents ! "
        static let modificationPreferences = "Pour modifier les préférences, utilisez le menu Réglages."
        static let erreur = "Erreur d'authentification. \nVeuillez corriger"
        static let authenticationOk = "Authentification réussie"
        static let attention = "Vous n’avez pas finalisé votre déclaration d’anomalie. \nSouhaitez-vous enregistrer un brouillon ?"
        static let noConnexion = "Vous n'avez aucune connexion."
        static let anomalieResolue = "Vous signalez cette anomalie comme résolue."
        static let erreurChargementTypes = "Suite à un problème réseau, les données nécessaires à la création de votre demande n'ont pas pu être récupérées.\n Merci de recommencer ultérieurement"
        static let errorSaveLabel = "\nL\'application bienVU est actuellement en maintenance.\n\nMerci d\'essayer ultérieurement.\n\n Un brouillon a été sauvegardé dans votre espace"
        static let grantPhoto = "Veuillez accorder l'autorisation d'utiliser la caméra pour pouvoir prendre des photos."
        static let solvedMalfunction = "Vous déclarez ce signalement comme résolu."
        static let optinAutorisation = "Autorisez vous l'application à transmettre vos données de localisation et votre identifiant de téléphone"
        static let majDisponible = "Une nouvelle version de l'application est disponible sur l'App Store. Souhaitez-vous l'installer ?"
        static let majObligatoire = "Une nouvelle version majeure de l'application est disponible sur le PlayStore. Il est impératif de la mettre à jour pour continuer à utiliser l'application. Merci de l'installer."
        static let numRueObligatoire = "Pour une meilleure prise en charge de l'anomalie, veuillez compléter l'adresse avec un numéro de rue"
        static let erreurChargementEquipement = "Suite à un problème réseau, les données nécessaires à la récupération des équipements n'ont pas pu etre chargées"
        static let adresseHorsParis = "Impossible d'ajouter une adresse hors Plaine commune aux favoris"
        static let maintenance = "\nL'application bienVU est actuellement en maintenance.\n\nMerci d'essayer ultérieurement."
        static let searchAnomaly = "Renseigner ci-dessous le numéro exact de l’anomalie"
        static let errorHorsTerritoire = "\nL\'adresse est située en dehors du territoire."
    }
    
    struct LabelMessage {
        
        static let addAnomaly = "Ajouter une autre anomalie"
        static let searchAnomaly = "Rechercher"
        static let showAnomaly = "Voir les anomalies déjà signalées"
        static let preciserPosition = "Préciser la position de l'anomalie"
        static let otherAnomalieLabel = "Autres anomalies autour de moi"
        static let otherAnomalieEquipementLabel = "Autres anomalies dans l'équipement"
        static let noDraft = "Vous n'avez pas de brouillon"
        static let noNotSolved = "Vous n'avez pas encore signalé d'anomalie"
        static let noSolved = "Vous n'avez pas encore d'anomalie résolue"
        static let cgu = "CGU"
        static let cguText1 = "Les présentes dispositions ont pour objet de définir les conditions d’accès et d’utilisation des applications mobiles bienVU pour iOS, bienVU pour Android et du formulaire web dédié aux signalements géré par l’Etablissement Public Territorial Plaine Commune.<br>En  consultant le formulaire, l’application mobile et les informations qui y figurent, l’utilisateur accepte, sans aucune réserve, les conditions mentionnées ci-après.<br><br>"
        static let cguText2 = "I. Présentation générale<br>Les applications mobiles bienVU pour iOS, bienVU pour Android et le formulaire web (https://bienvu.plainecommune.fr) visent  à  améliorer  la  qualité  de  l’espace  public  du territoire  en favorisant  la  synergie  entre  les  usagers  de  l’espace  public  et  les  services  techniques territoriaux et leurs partenaires.<br>Les applications mobiles BienVU et le formulaire web sont conçus pour fonctionner sur le territoire de Plaine Commune. Ils utilisent certaines fonctionnalités de votre terminal (GPS et connexion 3G/4G) qui nécessitent une bonne connexion.<br>Afin d’assurer la remontée rapide, précise, fiable d’une anomalie sur l’espace public et faciliter sa prise en charge par les services territoriaux de Plaine Commune et leurs partenaires, il est demandé à l’utilisateur :<br>"
        static let cguText3="<ul><li>de choisir dans une nomenclature fermée la nature de l’anomalie,</li><li>de préciser l’adresse exacte en corrigeant éventuellement la géolocalisation proposée automatiquement en indiquant dès que possible un numéro et une rue,</li><li>de joindre une ou plusieurs photo(s) de l’anomalie,</li><li>d’ajouter une description complémentaire utile et courte (155 caractères maximum).</li></ul>"
        static let cguText4="Les  usagers  qui  souhaitent  suivre  le  traitement  de  l’anomalie  qu’ils  ont  signalée sont invités à donner leur adresse électronique. Ils reçoivent des informations sur cette adresse ainsi qu’un  lien  leur  permettant  d’accéder  à  une  page  de  suivi.<br>Cette adresse est pseudonomysée une fois l’anomalie résolue.<br>Elle n’apparait pas dans l’infocentre alimenté par les messages clôturés.<br>En  ne  donnant  pas  leur  adresse électronique,  les  usagers  renoncent  de  facto  à  être informés sur le suivi du traitement de l’anomalie qu’ils ont signalée.<br>Tous  les  usagers  qui  se  connectent  à  l’application  peuvent  identifier  les  anomalies enregistrées autour du point où ils se situent et confirmer, s’ils le souhaitent, la présence d’une anomalie.<br>Les informations transmises par les utilisateurs via le dispositif, application mobile ou formulaire web, doivent être considérées comme des documents de travail qui aideront l’EPT Plaine Commune et ses partenaires et prestataires à organiser leur activité. Ils déterminent au cas par cas les actions à mettre en place. <br>Ces  informations  n’engagent  donc  en  aucune  façon  Plaine Commune  et  ses partenaires à prendre des mesures dans un délai donné.<br>Plaine Commune  et  ses  partenaires  restent  libres  de  déterminer  les  actions  à  mettre  en place.<br>Les informations ne sont pas traitées de manière instantanée. Les situations présentant un caractère dangereux et nécessitant la mise en œuvre de mesures de protection rapides doivent continuer à faire l’objet d’une déclaration auprès des services d’urgence. Les applications mobiles et le formulaire web enregistrent la date et l’heure d’arrivée de l’anomalie et génère un numéro d’enregistrement. Au fur et à mesure de l’avancement du traitement, le dispositif conserve la liste des actions opérées sur  les anomalies ainsi que  les différents intervenants et les dates et heures de leurs interventions.<br>En  croisant  l’adresse  de  l’anomalie  et  sa  nature,  le dispositif  affecte  l'anomalie automatiquement au service technique ou au partenaire territorial compétent afin qu’il l’analyse et mette en œuvre si nécessaire une action correctrice.<br>Les agents peuvent requalifier la nature des anomalies qui auraient fait l’objet d’une erreur de nomenclature et modifier leur caractère d’urgence.<br>Les agents peuvent également rejeter les anomalies qui n’entrent pas dans le champ de compétence territorial, en particulier celles situées dans des espaces privés. Ils peuvent également rejeter les anomalies ne relevant pas de l’application. Ils peuvent enfin rejeter les  anomalies  pour  lesquelles  les  éléments  fournis  sont  inexploitables :  adresse  erronée, incompatibilité  entre  adresse  et  photographie,  photographie  floue  ne  permettant  pas  de qualifier l’anomalie.<br>Plaine Commune  s’efforce  d'assurer  une  disponibilité  maximale  et  continue  du  site. Toutefois,  Plaine Commune  ne  pourra  être  tenu  responsable  en  cas  de  défaillance technique ou d'indisponibilité du site, quelle qu’en soit la durée.<br>Pour des raisons de confidentialité et de respect des données personnelles, les photos incluses dans les déclarations d’anomalies comportant une personne identifiable seront supprimées. Les utilisateurs sont donc invités à centrer leurs photos sur les anomalies constatées tout en apportant des précisions utiles dans la zone description. Tout manquement à ces règles d’usage peut empêcher le traitement d’une anomalie ou provoquer son rejet. Si la description de l’anomalie n’est pas assez précise, il se peut, en effet, qu’elle ne puisse pas être traitée. Les utilisateurs sont donc invités à centrer leur photo sur l’anomalie constatée en évitant d’y inclure des personnes.<br>De même, les informations de la zone « Description » susceptibles de porter atteinte à des personnes physiques ou morales seront supprimées.<br><br>"
        static let cguText5="II. Photos,  commentaires  et  protection  des  données  à caractère personnel<br>II.1 Photos et commentaires<br>Les  données  publiées  sur  les applications mobiles et sur le formulaire web sont  fournies  uniquement  à  titre  d'information  et  n'ont aucun caractère légal.<br>Plaine Commune  et  ses  partenaires  déclinent  toute  responsabilité  pour  les  dommages pouvant résulter de l'utilisation ou de l’interprétation des informations publiées sur le site.<br>Plaine Commune et ses partenaires ne sont pas en mesure de garantir le caractère exact et complet  de  ces  informations  et,  de  ce  fait,  ne  peuvent  être  tenus  responsables  pour quelque  motif  que  ce  soit  de  toute  erreur  que  contiendrait  le  site  ou  des  dommages directs ou indirects que toute personne pourrait subir du fait de la consultation du site ou des informations publiées sur celui-là.<br>Les photos et commentaires introduits par l’utilisateur sont directement affichés sur les applications mobiles et sur le formulaire web sans validation préalable. L’utilisateur qui a communiqué ces informations/photos et renseigné   ses   coordonnées   reçoit un courriel de  confirmation  d’enregistrement automatisé.<br>Plaine Commune  et  ses  partenaires  ne  pourront  être  tenus  responsables  du contenu des photos et des commentaires. L’utilisateur qui communique des photos déclare qu’elles sont libres de droit  et  garantit  Plaine Commune  et  ses  partenaires  contre  tout recours portant sur les droits attachés aux photos communiquées.<br>Les photos et commentaires doivent respecter le droit des marques (pas de détournement de marque, pas de publicité) ainsi que la vie privée et le droit à l’image des personnes. Il est  donc  interdit  de  transmettre  des  photographies  sur  lesquelles  il  serait  possible  de reconnaître des personnes qu’elles soient seules ou en groupe, qu’il s’agisse de personnes privée ou d’agents municipaux. Il est interdit d’écrire un nom dans le champ commentaire.<br>De même il est interdit de transmettre des photographies d’objets qui pourraient être facilement  reliés  à  leur  propriétaire  (véhicule  comportant  un  marquage  spécifique, publicitaire en particulier, ou dont le numéro minéralogique est visible). Il en est de même pour  les  photographies  qui  apportent  des  éléments  sur  leur  ancien  propriétaire  (déchets comportant  le  nom  et/ou  l’adresse  du  déposant).  Dans  le  cas  où  l’anomalie  est indissociable  de l’objet  reconnaissable  (graffiti  sur  un  mur  privé  ou  une  devanture  de magasin) il convient de faire de sorte que la photographie fasse un gros plan sur l’anomalie pour limiter les possibilités d’identification du bien privé.<br>Les photographies présentes dans  le dispositif, application et site internet dédié à l’application, doivent être conformes à la bienséance. Il est  interdit  de  transmettre  des  photos  qui  seraient  de  nature  à  choquer  les  personnes susceptibles de les regarder.<br>Plaine Commune  se  réserve  le  droit  de  supprimer  des  photos  en  raison  de  leur  qualité technique  insuffisante,  de  leur  caractère  raciste,  pornographique,  violent,  extrémiste ou licencieux ou portant atteintes à la vie privée et/ou au droit à l’image de tiers. Le droit de suppression n’est pas réservé à quelques modérateurs mais attribué à la majorité de ceux qui ont accès à l’application afin que les photos interdites disparaissent le plus rapidement possible.<br>Plaine Commune supprimera aussi les commentaires qui présentent un caractère raciste, pornographique, violent, extrémiste ou licencieux ou qui portent atteintes à la vie privée (ex : citation d’un nom de tiers). Le droit de suppression n’est pas réservé à quelques modérateurs mais attribué à la majorité de ceux qui ont accès au dispositif, les applications mobiles et le formulaire web, afin que les commentaires interdits disparaissent la plus rapidement possible.<br>Les photographies et les commentaires ne peuvent en aucun cas être utilisés comme éléments de preuve dans le cadre de procédures juridiques ou disciplinaires à l’encontre de tiers. En revanche, Plaine Commune se réserve le droit de poursuivre ou faire poursuivre tout auteur de photo ou commentaire à caractère raciste, pornographique, violent, extrémiste ou licencieux ou qui portent atteintes à la vie privée et/ou au droit à l’image de tiers.<br><br>"
        static let cguText6="II.2 Protection des Données Personnelles"
        static let cguText7="Base légale, finalité du traitement de données et catégorie de données collectées<br>Les données personnelles collectées par Plaine Commune, Responsable de traitement, via l’application Bien Vu concourent à l’exercice de ses mission de service public, et notamment à la gestion et à l’entretien des voiries du territoire. Ce traitement de données a pour base légale la mission d’intérêt public poursuivie par Plaine Commune.<br><br>Par  l’envoi  d’une  fiche  \"anomalie\",  l’utilisateur  consent  au  traitement  informatisé  de toutes les données communiquées sur le formulaire.<br><br>Ces données seront utilisées et traitées que pour les besoins de la présente application, à savoir le signalement des anomalies constatées sur l’espace public, et ne seront en aucun cas réutilisées à des fins de sollicitations commerciales ou extérieures à la présente application.<br><br>Seules les données nécessaires au bon fonctionnement de cette application seront collectées : <br><br><ul><li>pour les usagers souhaitant suivre  le  traitement  de  l’anomalie  qu’ils  ont  signalé : nom, prénom, adresse mail.</li><li>pour les usagers ayant signalé une anomalie mais ne souhaitant pas suivre le traitement de celle-ci : aucune donnée ne sera collectée. Les connexions à l’application ne sont pas tracées et les adresses IP ne sont pas enregistrées.</li></ul><br><br>En  envoyant  une  fiche  \"anomalie\",  l’utilisateur  accepte  que  les  données  qu’il  a communiquées puissent être publiées par le biais de l’application et des sites web associés, sans que les responsables du traitement ne lui soient redevables d’aucune indemnité.<br><br>Destinataire des données collectées<br><br>Les données collectées via l’application ne seront accessibles qu’aux seuls services de Plaine Commune et prestataires ou partenaires en charge des interventions sur l’espace public de Plaine Commune.<br><br>Le traitement prévoit des échanges avec des prestataires externes. Dans un premier temps les  éléments  seront  envoyés  par courriel mais  dans  un  second  temps  les  prestataires  qui sont destinataires de nombreuses anomalies pourront avoir un accès distant à l’application ou à ses flux d’information (API).<br><br>Modalités et durée de conservation des données<br>Les données collectées seront stockées sur les serveurs de l’EPT Plaine Commune.<br><br>Elles ne seront conservées que pendant la durée strictement nécessaire au traitement des anomalies signalées. Une fois le dossier clôturé, les données seront supprimées. Les signalements pourront être conservés une fois anonymisés.<br><br>Sécurité des données<br>Plaine Commune, en sa qualité de Responsable de traitement, assure la protection, la sécurité et la confidentialité des données collectées.<br><br>Droit des usagers<br>Les usagers, utilisateurs de la présente application, disposent d’un droit d'accès, de rectification, d'effacement de ses données à caractère personnel.<br><br>Tout usager bénéficie, en effet, en application des dispositions du RGPD, du droit d’obtenir communication, rectification ou suppression des données à caractère personnel le concernant qui ont été conservées.<br><br>Pour exercer ce droit ou poser toute question relative à la collecte, le traitement et l'utilisation de des données à caractère personnel, les utilisateurs sont invités à adresser une demande en ce sens à : dpo@plainecommune.fr.<br><br><br>Partenaire éditeur de l’application : Accenture.<br><br>Responsable technique : Direction des systèmes d’information mutualisée de l’EPT Plaine Commune.<br><br>Autres participants : les sociétés prestataires et partenaires de Plaine Commune en charge de l’espace public.<br><br>Contacts : en cas de difficultés lors de l’utilisation de Bien Vu, l’utilisateur peut contacter Plaine Commune via la page de contact : https://plainecommune.fr/institution/contact/."
        static let about = "À Propos"
        static let aboutText = "L'application DansMaRue PARIS est un service de la Ville de Paris qui fonctionne uniquement à Paris. Elle utilise certaines fonctionnalités de votre smartphone (GPS et connexion 3G/4G) qui nécessitent une bonne connexion. Si vous rencontrez des difficultés techniques liées à l'usage de l'application, n'hésitez pas à nous en informer via l'adresse mail DansMaRue_App@paris.fr\n\nLes informations ne sont pas traitées de manière instantanée. Les situations présentant un caractère dangereux et nécessitant la mise en oeuvre de mesures de protection rapides doivent continuer à faire l'objet d'une déclaration auprès des services d'urgence."
        static let voirProfile = "Voir mon profil complet"
        static let type = "Type (obligatoire)"
        static let select = "Sélectionner"
        static let photo = "Photo (obligatoire)"
        static let ajouter = "Ajouter"
        static let description = "Description"
        static let saisirDetail = "Saisir plus de détails"
        static let priority = "Priorité"
        static let anomalieSolved = "Cette anomalie a été clôturée"
        static let anomalieInProgress = "Cette anomalie est en cours de résolution"
        static let bienvenue = "bienVU \n vous souhaite la BIENVENUE !"
        static let envoyerInfo = "ENVOYEZ LES BONNES INFORMATIONS !"
        static let restezEnContact = "SUIVRE et SIMPLIFIER vos SIGNALEMENTS !"
        static let textSlide1 = "Cette application a été conçue pour transmettre des anomalies identifiées dans votre rue, votre quartier, vos lieux de passage sur l'espace public. \n En 3 clics, \n contribuez à l'amélioration du cadre de vie en partageant des signalements avec nos services"
        static let textSlide2 = "Choisissez le bon type de signalement (graffiti, objet abandonné, défaut sur la route, éclairage en panne…) dans la nomenclature.\n En plus du positionnement sur la carte, vérifiez l’adresse exacte de l’anomalie, avec un numéro de rue. \n Joignez une ou deux photographies bien cadrées sur l’anomalie. \n Rajoutez une description complémentaire utile et courtoise."
        static let textSlide3 = "Vous pouvez renseigner votre adresse électronique pour être informé·e du traitement des anomalies signalées ; enregistrer vos adresses favorites pour effectuer des signalements plus rapidement ; vérifier sur la carte si d’autres signalements ont été effectués à proximité (pour éviter les doublons)."
        static let waitLabel = "Merci de patienter pendant la transmission des informations."
        static let typeFavoris = "Types favoris"
        static let adressesFavorites = "Adresses favorites"
        static let titreTypeAno = "Informations"
        
        // Label Equipement
        static let anomalieCountLabel = " anomalies signalées"
        static let anomalieCountOneLabel = " anomalie signalée"
        static let defaultTypeContributionLabel = "Anomalie sur l'espace public"
        static let typeContributionLabel = "Contribuer pour ..."
        static let equipementSearchNotFound = "L'adresse fournie ne correspond à aucun bâtiment public"

        // VoiceOver
        static let followAnomaly = "Suivre l'anomalie"
        static let unfollowAnomaly = "Ne plus suivre l'anomalie"
        static let congratulateAnomaly = "Féliciter les agents"
        static let deletePhoto = "Supprimer la photo"
        static let reduceBottomSheet = "Réduire la liste des anomalies"
        
        // Favoris
        static let addAdresseFavorite = "Ajout une adresses aux favoris"
        static let removeAdresseFavorite = "Supprimer une adresses aux favoris"
    }
    
    struct TitleButton {
        static let deconnecter = "Se déconnecter"
        static let connecter = "Se connecter"
        static let publier = "Publier"
        static let connexion = "Connexion"
        static let prendrePhoto = "Prendre une photo"
        static let choisirAlbum = "Choisir dans l'album"
        static let feliciter = "Féliciter"
        static let monCompte = "Mon Paris"
        static let declarerCommeResolue = "Déclarer comme résolue"
        static let allow = "Autoriser"
        static let refuse = "Refuser"
        static let close = "Fermer"
    }
    
    struct PlaceHolder {
        static let saisirAdresse = "Où est située l'anomalie ?"
        static let password = "Mot de passe"
        static let mail = "Mail"
        static let email = "Email"
        static let searchType = "Chercher un type"
    }
    
    struct StoryBoard {
        
        static let compteParisien = "CompteParisien"
        static let addAnomaly = "AddAnomaly"
        static let detailAnomaly = "AnomalyDetail"
        static let map = "Map"
        static let profile = "Profile"
        static let thanks = "Thanks"
        static let popupPhoto = "PopupPhoto"
        static let priority = "Priority"
        static let typeAnomalie = "TypeAnomalie"
        static let description = "DescriptiveAnomaly"
        static let welcome = "Welcome"
        static let typeContribution = "TypeContribution"
        static let manageFavorites = "ManageFavorites"
        static let manageAddress = "ManageAddress"
        static let messageTypeAno = "MessageTypeAno"
    }
    
    struct ViewControllerIdentifier {
        
        static let compteParisien = "CompteParisien"
        static let addAnomaly = "AddAnomalyViewController"
        static let detailAnomaly = "AnomalyDetailViewController"
        static let bottomSheet = "BottomSheetViewController"
        static let map = "MapViewController"
        static let profileAbout = "ProfileAboutViewController"
        static let profileCgu = "ProfileCGUViewController"
        static let profileDetail = "ProfileDetailViewController"
        static let modifyAddress = "modifyAddress"
        static let thanks = "Thanks"
        static let mail = "Mail"
        static let popupPhoto = "popupPhoto"
        static let welcome = "WelcomeSliderViewController"
        static let typeContribution = "TypeContributionViewController"
        static let messageTypeAno = "MessageTypeAnoViewController"

    }
    struct TabBarTitle {
        static let carte = "Carte"
        static let monEspace = "Mon espace"
        
    }
    
    enum ProfilTableView {
        static let profil = 0
        static let preferences = 1
        static let cgu = 2
        static let confidentialite = 3
        static let aPropos = 4
    }
    
    enum AccessibilityLabel {
        static let favoriteAdressButton = "Vos adresses favorites"
        static let favoriteTypesButton = "Vos types favorites"
        static let backButton = "Retour"
        static let editAddress = "Modifier l'adresse"
        static let typeTitle = "Type"
    }
    
    enum AccessibilityHint {
        static let searchBarHint = "Saisissez l'adresse de l'anomalie, champ à autocomplétion activable à partir de la saisie du premier caractère"
        static let searchBarTypeHint = "Saisissez le type de l'anomalie, champ à autocomplétion activable à partir de la saisie de trois caractères"
    }
    
}
