//
//  PizzaSelectionViewController.swift
//  Dominos
//
//  Created by Emerson Sampaio on 11/05/23.
//

import Foundation
import UIKit

class PizzaSelectionViewController: UIViewController {
    
    var screen: PizzaSelectionView?
    
    override func loadView() {
        screen = PizzaSelectionView()
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

