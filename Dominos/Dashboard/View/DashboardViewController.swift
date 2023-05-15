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
        screen?.orderButton.addTarget(self, action: #selector(orderButtonTapped), for: .primaryActionTriggered)
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIBarButtonItem(title: "Voltar", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButton
    }
    
    @objc func orderButtonTapped(sender: UIButton) {
        let orderVC = PizzaSelectionViewController()
        
        navigationController?.pushViewController(orderVC, animated: true)
    }
}
