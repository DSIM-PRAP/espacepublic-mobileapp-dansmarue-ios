//
//  ModifyAddressViewController.swift
//  DansMaRue
//
//  Created by NTDC-Showroom on 23/03/2017.
//  Copyright © 2017 VilleDeParis. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class ModifyAddressViewController: UIViewController {

    
    //MARK: - Properties
    // Google SearchBar properties
    let addressNotification = Notification.Name(rawValue:Constants.NoticationKey.addressNotification)
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    
    // Equipements SeachBar properties
    var customSearchController: UISearchController?
    var equipementSearchController: EquipementSearchTableViewController?
    var typeEquipementSelected: TypeEquipement?

    weak var delegate : AddAnomalyViewController!

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Initialize searchBar en fonction du context
        if delegate.typeContribution == .indoor {
            if let selectedEquipement = delegate.selectedEquipement {
                self.typeEquipementSelected = ReferalManager.shared.getTypeEquipement(forId: selectedEquipement.parentId)
            }
            self.initializeCustomSearchBar()
        } else {
            self.initSearchBar()
        }
    }
    
    // MARK: - Other functions
    func initSearchBar() {
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        // Put the search bar in the navigation bar.
        if let searchBar = searchController?.searchBar {
            searchBar.sizeToFit()
            searchBar.placeholder = Constants.PlaceHolder.saisirAdresse
            
            searchBar.tintColor = UIColor.white
            searchBar.isTranslucent = false
            
            self.perform(#selector(searchBarFirstResponder), with: nil, afterDelay: 0.1)
            
            if #available(iOS 13.0, *) {
                searchController?.hidesNavigationBarDuringPresentation = true
                searchBar.searchTextField.backgroundColor=UIColor.white
                searchBar.searchTextField.tintColor=UIColor.black
                self.navigationItem.searchController = searchController
            } else {
                // Prevent the navigation bar from being hidden when searching.
                searchController?.hidesNavigationBarDuringPresentation = false
            }
            
            if #available(iOS 26.0, *) {
                configureSearchBarWhiteField(searchBar)
                
            }
            
            view.addSubview(searchBar)
        }
        
        // Active sur le filtre sur Paris uniquement
        MapsUtils.filterToParis(resultsViewController: self.resultsViewController!)
    }
    
    func initializeCustomSearchBar() {
        // Place the search bar view to the tableview headerview.
        if equipementSearchController == nil {
            let mapStoryboard = UIStoryboard(name: Constants.StoryBoard.map, bundle: nil)
            equipementSearchController = mapStoryboard.instantiateViewController(withIdentifier: "EquipementSearchTableViewController") as? EquipementSearchTableViewController
            
            equipementSearchController?.equipementDelegate = self
        }
        
        customSearchController = UISearchController(searchResultsController: equipementSearchController)
        customSearchController?.hidesNavigationBarDuringPresentation = false
        customSearchController?.searchBar.placeholder = self.typeEquipementSelected?.placeholder
        customSearchController?.searchBar.sizeToFit()
        
        equipementSearchController?.tableView.tableHeaderView = customSearchController?.searchBar
        customSearchController?.searchResultsUpdater = equipementSearchController
        
        view.addSubview((customSearchController?.searchBar)!)
        
        equipementSearchController?.equipements = ReferalManager.shared.getEquipements(forTypeEquipementId: (self.typeEquipementSelected?.typeEquipementId)!)!
        equipementSearchController?.equipements.sort(by: { $0.name.caseInsensitiveCompare($1.name) == .orderedAscending })
        equipementSearchController?.tableView.reloadData()
    }
    
    @objc func searchBarFirstResponder() {
        self.searchController?.searchBar.becomeFirstResponder()
    }
}


// Handle the user's selection.
extension ModifyAddressViewController: GMSAutocompleteResultsViewControllerDelegate {
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false
        
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(place.coordinate) { (response: GMSReverseGeocodeResponse?, error: Error?) in
            if let error = error {
                print("Nothing found: \(error.localizedDescription)")
                return
            }
            if let addressFound = response {
                let addressSelected:GMSAddress = addressFound.firstResult()!
                
                var numRue = ""
                var rue = ""
                var cp = ""
                
                for component in place.addressComponents! {
                    if component.types[0] == "street_number" {
                        numRue = component.name
                    }
                    if component.types[0] == "route" {
                        rue = component.name
                    }
                    if component.types[0] == "postal_code" {
                        cp = component.name
                    }
                }
                let adresse = numRue + " " + rue + ", " + cp + " Paris, France"
                addressSelected.setValue(adresse.components(separatedBy: ",")[0], forKey: "thoroughfare")
                
                self.delegate.changeAddress(newAddress: addressSelected)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                   _ = self.navigationController?.popViewController(animated: true)
                }                
            }
        }
        
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: Error){
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func configureSearchBarWhiteField(_ searchBar: UISearchBar)
    {
            let tf = searchBar.searchTextField
            tf.adjustsFontForContentSizeCategory = true
            // Lisibilité : texte et curseur foncés sur fond blanc
            tf.textColor = .black
            tf.tintColor  = .black
            tf.attributedPlaceholder = NSAttributedString(
                string: Constants.PlaceHolder.saisirAdresse,
                attributes: [
                    .foregroundColor: UIColor.darkGray,
                    .font: UIFont.preferredFont(forTextStyle: .caption2)
                ])

            tf.borderStyle = .none
            tf.layer.cornerRadius = 0
            tf.layer.masksToBounds = false

            let corner: CGFloat = 10
            let height: CGFloat = 36
            let size   = CGSize(width: corner * 2 + 2, height: height)
            let img = UIGraphicsImageRenderer(size: size).image { ctx in
                let rect = CGRect(origin: .zero, size: size)
                UIColor.white.setFill()
                UIBezierPath(roundedRect: rect, cornerRadius: corner).fill()
            }
            let insets = UIEdgeInsets(top: corner, left: corner, bottom: corner, right: corner)
            let whiteRounded = img.resizableImage(withCapInsets: insets, resizingMode: .stretch)

            searchBar.setSearchFieldBackgroundImage(whiteRounded, for: .normal)
            searchBar.setSearchFieldBackgroundImage(whiteRounded, for: .disabled)
            tf.backgroundColor = .clear
            searchBar.searchBarStyle = .prominent
        }
}


extension ModifyAddressViewController: EquipementDelegate {
    func didSelectEquipementAt(equipement: Equipement) {
        customSearchController?.isActive = false
        
        self.delegate.changeEquipement(newEquipement: equipement)
         _ = self.navigationController?.popViewController(animated: true)
    }
}
