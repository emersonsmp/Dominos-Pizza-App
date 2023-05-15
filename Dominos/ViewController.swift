//
//  ViewController.swift
//  Dominos
//
//  Created by Emerson Sampaio on 08/05/23.
//

import UIKit

class ViewController: UIViewController {
    var window: UIWindow?
    
//    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
//    @IBOutlet weak var loading: UIView!
    
    var login: LoginVIew?
    var screen: DashboardView?
    var screen2: PizzaSelectionView?
    var screen3: ButtonComponent?
    
    override func loadView() {
        login = LoginVIew()
        screen = DashboardView()
        screen2 = PizzaSelectionView()
        screen3 = ButtonComponent()
        
        login?.buttonLogin.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        view = login
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        activityIndicator.startAnimating()
    }
    
    @objc func signInTapped(sender: UIButton) {
            let homeVC = DashboardViewController()
            let viewControllers = [homeVC]
            self.navigationController?.setViewControllers(viewControllers, animated: true)
    }
}

