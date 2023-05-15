//
//  DashboardViewController.swift
//  Dominos
//
//  Created by Emerson Sampaio on 09/05/23.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController {
    
    var screen: DashboardView?
    
    override func loadView() {
        screen = DashboardView()
        view = screen
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
