//
//  ButtonComponent.swift
//  Dominos
//
//  Created by Emerson Sampaio on 11/05/23.
//

import Foundation
import UIKit

class ButtonComponent: UIView {
    
    var isSelected: Bool = false {
        didSet {
            backgroundColor = isSelected ? dominoBlue : .systemGray3
            pizzaSizeLabel.textColor = isSelected ? .systemGray3 : dominoBlue
            slicesLabel.textColor = isSelected ? .systemGray3 : dominoBlue
        }
    }
    
    lazy var pizzaSizeLabel: UILabel = {
        let pizzaSizeLabel = UILabel()
        pizzaSizeLabel.text = "Pequena"
        pizzaSizeLabel.textColor = dominoBlue
        pizzaSizeLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        pizzaSizeLabel.translatesAutoresizingMaskIntoConstraints = false
        return pizzaSizeLabel
    }()
    lazy var slicesLabel: UILabel = {
        let slicesLabel = UILabel()
        slicesLabel.text = "6 fatias"
        slicesLabel.textColor = dominoBlue
        slicesLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        slicesLabel.translatesAutoresizingMaskIntoConstraints = false
        return slicesLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 110, height: 40)
    }
    
    private func setup() {
        layer.cornerRadius = 25
        backgroundColor = .systemGray3
        
        addSubview(pizzaSizeLabel)
        addSubview(slicesLabel)
        
        NSLayoutConstraint.activate([
            pizzaSizeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            pizzaSizeLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            slicesLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            slicesLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10)
        ])
    }
}
