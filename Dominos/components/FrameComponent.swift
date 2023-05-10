//
//  FrameComponent.swift
//  Dominos
//
//  Created by Emerson Sampaio on 09/05/23.
//

import Foundation
import UIKit

class FrameComponent: UIView {
    
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 172, height: 100))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "pizza-white")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [
            UIColor(red: 30/255, green: 100/255, blue: 145/255, alpha: 0.01).cgColor,
            UIColor.blue.cgColor]
        
        gradientLayer.frame = CGRect(
            x: 0,
            y: imageView.frame.height,
            width: imageView.frame.width,
            height: 40
        )
        
        gradientLayer.masksToBounds = true
        gradientLayer.anchorPoint = CGPoint(x: 0.5, y: 1)
        imageView.layer.addSublayer(gradientLayer)
        return imageView
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15
        button.backgroundColor = DominoRed
        let plusImage = UIImage(systemName: "cart.fill.badge.plus")?.withTintColor(UIColor.white, renderingMode: .alwaysOriginal)
        button.setImage(plusImage, for: .normal)
        return button
    }()
    
    lazy var pizzaNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carne com Queijo"
        let font = UIFont(name: "arial-black", size: 10)
        label.font = font
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(logoImage)
        addSubview(addButton)
        addSubview(pizzaNameLabel)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: topAnchor),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            logoImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.widthAnchor.constraint(equalToConstant: 185),
            
            addButton.trailingAnchor.constraint(equalTo: logoImage.trailingAnchor, constant: -7),
            addButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: -25),
            addButton.heightAnchor.constraint(equalToConstant: 30),
            addButton.widthAnchor.constraint(equalToConstant: 30),
            
            pizzaNameLabel.leadingAnchor.constraint(equalTo: logoImage.leadingAnchor, constant: 15),
            pizzaNameLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: -15),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
