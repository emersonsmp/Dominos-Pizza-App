//
//  ViewController.swift
//  Dominos
//
//  Created by Emerson Sampaio on 08/05/23.
//

import UIKit

class ViewController: UIViewController {
    var window: UIWindow?
    
    var login: LoginVIew?
    var screen: DashboardView?
    
    override func loadView() {
        login = LoginVIew()
        screen = DashboardView()
        login?.buttonLogin.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        view = login
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func signInTapped(sender: UIButton) {
            let homeVC = DashboardViewController()
            let viewControllers = [homeVC]
            self.navigationController?.setViewControllers(viewControllers, animated: true)
    }
}

