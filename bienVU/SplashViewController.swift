//
//  SplashViewController.swift
//  bienVU
//
//  Created by aurelie.clement on 04/11/2025.
//  Copyright © 2025 VilleDeParis. All rights reserved.
//
import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Vérification accessibilité BO
        RestApiManager.sharedInstance.isDMROnline { [weak self] isOnline in
            
            print("Test isDMROnline : \(isOnline ? "En ligne" : "Hors ligne")")
            guard let self = self else { return }

            DispatchQueue.main.async {
                if !isOnline {
                    // Affiche l'alerte de maintenance
                    self.showMaintenanceAlert()
                } else {
                    
                    self.routeUser()
                }
            }
        }
    }

    private func showMaintenanceAlert() {
        let alert = UIAlertController(
            title: Constants.AlertBoxTitle.information,
            message: Constants.AlertBoxMessage.maintenance,
            preferredStyle: .alert
        )
        let okBtn = UIAlertAction(title: "Ok", style: .default) { _ in
       
        }
        alert.addAction(okBtn)
        self.present(alert, animated: true, completion: nil)
    }

   
    private func routeUser() {
            let hasAlreadyBeenConnected = UserDefaults.standard.bool(forKey: "hasAlreadyBeenConnected")

            if !hasAlreadyBeenConnected {
                
                let welcomeStoryboard = UIStoryboard(name: Constants.StoryBoard.welcome, bundle: nil)
                let welcomeViewController = welcomeStoryboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
                welcomeViewController.modalPresentationStyle = .fullScreen
                
                self.navigationController?.addChild(welcomeViewController)
                self.present(welcomeViewController, animated: true, completion: nil)
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = storyboard.instantiateInitialViewController()
                mainVC?.modalPresentationStyle = .fullScreen
                self.present(mainVC!, animated: true, completion: nil)
        
            }
        }

}
