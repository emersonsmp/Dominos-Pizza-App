//
//  LoginView.swift
//  Dominos
//
//  Created by Emerson Sampaio on 08/05/23.
//

import Foundation
import UIKit

let dominoBlue = UIColor(red: 30/255, green: 100/255, blue: 145/255, alpha: 1.0)
let DominoRed = UIColor(red: 227/255, green: 6/255, blue: 19/255, alpha: 1.0)

class LoginVIew: UIView {
    
    lazy var logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo-with-name")
        return imageView
    }()
    
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Bem-Vindo"
        let font = UIFont(name: "Montserrat-Black", size: 26)
        label.font = font
        label.textColor = .white
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Faça o login para pedir"
        let font = UIFont(name: "arial-black", size: 14)
        label.font = font
        label.textColor = .white
        return label
    }()
    
    lazy var mailTextField: UITextField = {
        let mail = UITextField()
        mail.translatesAutoresizingMaskIntoConstraints = false
        mail.attributedPlaceholder = NSAttributedString(
            string: "E-mail ou número de telefone",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        
        mail.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: mail.frame.height))
        mail.leftViewMode = .always
        
        mail.layer.cornerRadius = 12
        mail.backgroundColor = .white
        return mail
    }()
    
    lazy var passTextField: UITextField = {
        let pass = UITextField()
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.attributedPlaceholder = NSAttributedString(
            string: "Senha",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray,
                         NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
        
        pass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: pass.frame.height))
        pass.leftViewMode = .always
        
        pass.layer.cornerRadius = 12
        pass.backgroundColor = .white
        return pass
    }()
    
    lazy var buttonLogin: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = DominoRed
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "arial-black", size: 18)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        return button
    }()
    
    lazy var buttonRegister: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = dominoBlue
        button.setTitle("Criar conta", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "arial-black", size: 18)
        
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        
        return button
    }()
    
    lazy var forgoutPassLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Esqueci minha senha"
        label.font = UIFont(name: "arial-black", size: 14)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        passTextField.delegate = self
        mailTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldShouldReturn))
        addGestureRecognizer(tapGesture)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginVIew {
    
    func setup(){
        let dominoBlue = dominoBlue
        backgroundColor = dominoBlue
        
        addSubview(logoImage)
        addSubview(welcomeLabel)
        addSubview(descriptionLabel)
        addSubview(mailTextField)
        addSubview(passTextField)
        addSubview(buttonLogin)
        addSubview(buttonRegister)
        addSubview(forgoutPassLabel)
    }
    
    func layout(){
        NSLayoutConstraint.activate([
        
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 200),
            logoImage.widthAnchor.constraint(equalToConstant: 400),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 8),
            welcomeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 16),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            mailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            mailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            mailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            mailTextField.heightAnchor.constraint(equalToConstant: 60),

            passTextField.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 16),
            passTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            passTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            passTextField.heightAnchor.constraint(equalToConstant: 60),

            buttonLogin.topAnchor.constraint(equalTo: passTextField.bottomAnchor, constant: 32),
            buttonLogin.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonLogin.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buttonLogin.heightAnchor.constraint(equalToConstant: 50),

            buttonRegister.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 16),
            buttonRegister.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            buttonRegister.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            buttonRegister.heightAnchor.constraint(equalToConstant: 50),

            forgoutPassLabel.topAnchor.constraint(equalTo: buttonRegister.bottomAnchor, constant: 16),
            forgoutPassLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}

extension LoginVIew: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mailTextField.endEditing(true)
        passTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
