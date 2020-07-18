//
//  AutenticationViewController.swift
//  MyGames
//
//  Created by Frederyk Antunnes on 17/07/20.
//  Copyright © 2020 Douglas Frari. All rights reserved.
//

import UIKit

class AutenticationViewController: UIViewController {

    @IBOutlet var containerView: UIView!
    
    private lazy var portraitController: UIViewController? = {
        return UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "portrait")
    }()
    
    private lazy var landscapeController: UIViewController? = {
           return UIStoryboard(name: "LoginLandscape", bundle: nil).instantiateViewController(withIdentifier: "landscape")
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//                let onBoarding = OnBoardingViewController(nibName: "OnBoarding", bundle: nil)
//                self.present(onBoarding, animated: true, completion: nil)
        
        self.present(OnBoardingViewController(), animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        if newCollection.verticalSizeClass == .regular {
            addChildController(child: portraitController)
            
        } else {
            addChildController(child: landscapeController)
            
        }
    }

}

private extension AutenticationViewController{
    
    func addChildController(child: UIViewController?) {
        guard let child = child else {
            return
        }
        containerView.addSubview(child.view)
        configureChildConstraints(child: child)
    }
    
    func configureChildConstraints(child: UIViewController?){
        child?.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        child?.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        child?.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        child?.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    func configureNavigation(){
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    
}
