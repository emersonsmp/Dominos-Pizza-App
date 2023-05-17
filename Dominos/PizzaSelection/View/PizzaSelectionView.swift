//
//  PizzaSelectionView.swift
//  Dominos
//
//  Created by Emerson Sampaio on 11/05/23.
//

import Foundation
import UIKit
import DropDown

var tasteDictionary: [String: String] = [ "Calabreza": "pizza-001", "Queijo": "pizza-002", "Jardineira": "pizza-003"]

let LEFT_BUTTON = 1
let RIGHT_BUTTON = 2

class PizzaSelectionView: UIView {
    
    let options = ["Tradicional", "Finíssima", "Massa Grossa"]
    let PizzaTastes = ["Calabreza", "Queijo", "Jardineira"]
    
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
    
    lazy var doughTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tipo de massa"
        let font = UIFont(name: "Montserrat-Black", size: 22)
        label.font = font
        label.textColor = dominoBlue
        return label
    }()
    
    lazy var Header: HeaderComponent = {
        let dropMenu = HeaderComponent()
        dropMenu.translatesAutoresizingMaskIntoConstraints = false
        dropMenu.layer.cornerRadius = 8
        dropMenu.layer.masksToBounds = true
        dropMenu.delegate = self
        return dropMenu
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
        return image
    }()
    
    lazy var rightPizzaImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
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
    
    lazy var addPizzaTasteLeftbutton: ChoosePizzaTasteButtonComponent = {
        let view = ChoosePizzaTasteButtonComponent()
        view.tag = LEFT_BUTTON
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:))))
        view.backgroundColor = DominoRed
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var addPizzaTasteRightbutton: ChoosePizzaTasteButtonComponent = {
        let view = ChoosePizzaTasteButtonComponent()
        view.tag = RIGHT_BUTTON
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(buttonTapped(_:))))
        view.backgroundColor = DominoRed
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var pizzaTastedropDown: DropDown = {
        let dropDown = DropDown()
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        dropDown.backgroundColor = dominoBlue
        dropDown.dataSource = PizzaTastes
        return dropDown
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    func setup(){
        backgroundColor = dominoBlue
    }
    
    func layout(){
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
        
        addSubview(addPizzaTasteLeftbutton)
        addSubview(addPizzaTasteRightbutton)
        
        NSLayoutConstraint.activate([
            pageTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 65),
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
            addToCartbutton.heightAnchor.constraint(equalToConstant: 50),
            
            addPizzaTasteLeftbutton.leadingAnchor.constraint(equalTo: backgroundPizzaImage.leadingAnchor, constant: -24),
            addPizzaTasteLeftbutton.centerYAnchor.constraint(equalTo: backgroundPizzaImage.centerYAnchor),
            addPizzaTasteLeftbutton.heightAnchor.constraint(equalToConstant: 40),
            addPizzaTasteLeftbutton.widthAnchor.constraint(equalToConstant: 100),

            addPizzaTasteRightbutton.trailingAnchor.constraint(equalTo: backgroundPizzaImage.trailingAnchor, constant: 24),
            addPizzaTasteRightbutton.centerYAnchor.constraint(equalTo: backgroundPizzaImage.centerYAnchor)
       ])
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

extension PizzaSelectionView {
    @objc private func buttonTapped(_ sender: UITapGestureRecognizer) {
        
        guard let button = sender.view else {
            return
        }
        
        if button.tag == LEFT_BUTTON {
            pizzaTastedropDown.anchorView = addPizzaTasteLeftbutton
            pizzaTastedropDown.bottomOffset = CGPoint(x: 0, y: 50)
            pizzaTastedropDown.selectionAction = {(index: Int, item: String) in
                guard let tasteLeft = tasteDictionary[item] else {
                    return
                }
                
                self.leftPizzaImage.image = UIImage(named: "\(tasteLeft)-left")
                self.addPizzaTasteLeftbutton.pizzaLabel.text = item
            }
            pizzaTastedropDown.show()
        }
        
        if button.tag == RIGHT_BUTTON {
            pizzaTastedropDown.anchorView = addPizzaTasteRightbutton
            pizzaTastedropDown.bottomOffset = CGPoint(x: 0, y: 50)
            pizzaTastedropDown.selectionAction = {(index: Int, item: String) in
                guard let tasteRight = tasteDictionary[item] else {
                    return
                }
                
                self.rightPizzaImage.image = UIImage(named: "\(tasteRight)-right")
                self.addPizzaTasteRightbutton.pizzaLabel.text = item
            }
            pizzaTastedropDown.show()
        }
    }
}
