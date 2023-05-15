//
//  HeaderButtonComponent.swift
//  Dominos
//
//  Created by Emerson Sampaio on 11/05/23.
//

import Foundation
import UIKit

protocol HeaderButtonComponentDelegate: AnyObject {
    func didSelectButton(at index: Int)
}

class HeaderButtonComponent: UIView {
    
    var selectedButtonIndex: Int?
    weak var delegate: HeaderButtonComponentDelegate?
    
    lazy var buttonLeft: ButtonComponent = {
        let button = ButtonComponent()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.pizzaSizeLabel.text = "Pequena"
        button.slicesLabel.text = "4 fatias"
        button.tag = 1
        return button
    }()
    
    lazy var buttonCenter: ButtonComponent = {
        let button = ButtonComponent()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.pizzaSizeLabel.text = "Média"
        button.slicesLabel.text = "6 fatias"
        button.tag = 2
        return button
    }()
    
    lazy var buttonRight: ButtonComponent = {
        let button = ButtonComponent()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.pizzaSizeLabel.text = "Grande"
        button.slicesLabel.text = "8 fatias"
        button.tag = 3
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 25
        backgroundColor = .systemGray3
        
        buttonCenter.isSelected = true
        
        buttonLeft.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:))))
        buttonCenter.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:))))
        buttonRight.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:))))
        
        addSubview(buttonLeft)
        addSubview(buttonCenter)
        addSubview(buttonRight)
        
        NSLayoutConstraint.activate([
            buttonLeft.topAnchor.constraint(equalTo: topAnchor),
            buttonLeft.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonLeft.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            buttonCenter.topAnchor.constraint(equalTo: topAnchor),
            buttonCenter.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonCenter.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            buttonRight.topAnchor.constraint(equalTo: topAnchor),
            buttonRight.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonRight.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 320, height: 50)
    }
    
    @objc private func buttonTapped(_ sender: UITapGestureRecognizer) {
        guard let button = sender.view as? ButtonComponent else {
            return
        }
        
        buttonLeft.isSelected = false
        buttonCenter.isSelected = false
        buttonRight.isSelected = false
        
        button.isSelected = true
        
        delegate?.didSelectButton(at: button.tag)
    }
    
}
