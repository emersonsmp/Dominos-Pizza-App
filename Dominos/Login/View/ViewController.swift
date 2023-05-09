//
//  ViewController.swift
//  Dominos
//
//  Created by Emerson Sampaio on 08/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    var screen: LoginVIew?
    
    override func loadView() {
        screen = LoginVIew()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

