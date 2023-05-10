//
//  ViewController.swift
//  Dominos
//
//  Created by Emerson Sampaio on 08/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var login: LoginVIew?
    var screen: DashboardView?
    
    override func loadView() {
        login = LoginVIew()
        screen = DashboardView()
        
        view = login
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

