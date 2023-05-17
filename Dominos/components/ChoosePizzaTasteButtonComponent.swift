//
//  ChoosePizzaTasteButtonComponent.swift
//  Dominos
//
//  Created by Emerson Sampaio on 15/05/23.
//

import Foundation
import UIKit

class ChoosePizzaTasteButtonComponent: UIView {
    
    lazy var pizzaLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Sabor"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = DominoRed
        
        addSubview(pizzaLabel)
        
        NSLayoutConstraint.activate([
            pizzaLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            pizzaLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 40)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
