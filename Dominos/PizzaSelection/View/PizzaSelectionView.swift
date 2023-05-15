//
//  PizzaSelectionView.swift
//  Dominos
//
//  Created by Emerson Sampaio on 11/05/23.
//

import Foundation
import UIKit
import DropDown

class PizzaSelectionView: UIView {
    
    let options = ["Tradicional", "Finíssima", "Massa Grossa"]
    
    lazy var pageTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Monte dua pizza"
        label.font = UIFont(name: "Montserrat-Black", size: 16)
        label.textColor = .white
        return label
    }()
    
    lazy var perfilImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.fill")?.withTintColor(UIColor.white, renderingMode: .alwaysOriginal)
        return image
    }()
    
    lazy var perfilLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Perfil"
        let font = UIFont(name: "arial-black", size: 12)
        label.font = font
        label.textColor = .white
        return label
    }()
    
    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        return view
    }()
    
    lazy var tamanhoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tamanho"
        label.font = UIFont(name: "Montserrat-Black", size: 22)
        label.textColor = dominoBlue
        return label
    }()
    
    lazy var DescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Selecione o tamanho da pizza"
        label.font = UIFont(name: "Arial", size: 14)
        label.textColor = dominoBlue
        
        return label
    }()
    
    lazy var headerButton: HeaderButtonComponent = {
        let button = HeaderButtonComponent()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.delegate = self
        return button
    }()

    lazy var Header: HeaderComponent = {
        let dropMenu = HeaderComponent()
        dropMenu.translatesAutoresizingMaskIntoConstraints = false
        dropMenu.layer.cornerRadius = 8
        dropMenu.layer.masksToBounds = true
        dropMenu.delegate = self
        return dropMenu
    }()
    
    lazy var doughTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tipo de massa"
        let font = UIFont(name: "Montserrat-Black", size: 22)
        label.font = font
        label.textColor = dominoBlue
        return label
    }()
    
    lazy var dropDown: DropDown = {
        let dropDown = DropDown()
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        dropDown.dataSource = options
        dropDown.anchorView = Header
        dropDown.bottomOffset = CGPoint(x: 0, y: Header.HeaderHeight)
        
        dropDown.selectionAction = {(index: Int, item: String) in
            self.Header.itemLabel.text = item
        }
        
        return dropDown
    }()
    
    lazy var backgroundPizzaImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "circle-dotted.png")
        return image
    }()
    
    lazy var leftPizzaImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pizza-001-left.png")
        return image
    }()
    
    lazy var rightPizzaImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "pizza-004-right.png")
        return image
    }()
    
    lazy var addToCartbutton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = DominoRed
        button.setTitle("Adicionar ao carrinho", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "arial-black", size: 18)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = dominoBlue

        addSubview(perfilImage)
        addSubview(perfilLabel)
        addSubview(pageTitleLabel)
        addSubview(view)
        addSubview(tamanhoLabel)
        addSubview(DescriptionLabel)
        addSubview(headerButton)
        
        addSubview(doughTypeLabel)
        addSubview(Header)
        addSubview(backgroundPizzaImage)
        
        addSubview(leftPizzaImage)
        addSubview(rightPizzaImage)
        addSubview(addToCartbutton)
        
        NSLayoutConstraint.activate([
            pageTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            pageTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            perfilImage.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            perfilImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            perfilImage.heightAnchor.constraint(equalToConstant: 25),
            perfilImage.widthAnchor.constraint(equalToConstant: 25),
            
            perfilLabel.topAnchor.constraint(equalTo: perfilImage.bottomAnchor),
            perfilLabel.centerXAnchor.constraint(equalTo: perfilImage.centerXAnchor),
            
            view.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tamanhoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            tamanhoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            DescriptionLabel.topAnchor.constraint(equalTo: tamanhoLabel.bottomAnchor, constant: 5),
            DescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            headerButton.topAnchor.constraint(equalTo: DescriptionLabel.bottomAnchor, constant: 20),
            headerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            headerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            doughTypeLabel.topAnchor.constraint(equalTo: headerButton.bottomAnchor, constant: 20),
            doughTypeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            doughTypeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            Header.topAnchor.constraint(equalTo: doughTypeLabel.bottomAnchor, constant: 20),
            Header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            Header.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            backgroundPizzaImage.topAnchor.constraint(equalTo: Header.bottomAnchor, constant: 24),
            backgroundPizzaImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            backgroundPizzaImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            backgroundPizzaImage.heightAnchor.constraint(equalToConstant: 270),
            
            //LEFT PIZZA
            leftPizzaImage.topAnchor.constraint(equalTo: backgroundPizzaImage.topAnchor, constant: -10),
            leftPizzaImage.leadingAnchor.constraint(equalTo: backgroundPizzaImage.leadingAnchor, constant: -10),
            leftPizzaImage.widthAnchor.constraint(equalToConstant: 150),
            leftPizzaImage.bottomAnchor.constraint(equalTo: backgroundPizzaImage.bottomAnchor, constant: 10),
            
            //RIGHT PIZZA
            rightPizzaImage.topAnchor.constraint(equalTo: backgroundPizzaImage.topAnchor,constant: -10),
            rightPizzaImage.trailingAnchor.constraint(equalTo: backgroundPizzaImage.trailingAnchor, constant: 10),
            rightPizzaImage.widthAnchor.constraint(equalToConstant: 150),
            rightPizzaImage.bottomAnchor.constraint(equalTo: backgroundPizzaImage.bottomAnchor, constant: 10),
            
            addToCartbutton.topAnchor.constraint(equalTo: backgroundPizzaImage.bottomAnchor, constant: 50),
            addToCartbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addToCartbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addToCartbutton.heightAnchor.constraint(equalToConstant: 50)
       ])
    }
    
    @objc func showDropDown() {
        dropDown.show()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PizzaSelectionView: HeaderButtonComponentDelegate{
    func didSelectButton(at index: Int) {
        
    }
}

extension PizzaSelectionView: HeaderComponentDelegate {
    func headerComponent(_ headerComponent: HeaderComponent, didSelectOption option: String) {
        dropDown.show()
    }
}
