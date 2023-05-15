//
//  HeaderComponent.swift
//  Dominos
//
//  Created by Emerson Sampaio on 11/05/23.
//

import Foundation
import UIKit

protocol HeaderComponentDelegate: AnyObject {
    func headerComponent(_ headerComponent: HeaderComponent, didSelectOption option: String)
}

class HeaderComponent: UIView {
    
    let HeaderHeight: CGFloat = 50
    
    weak var delegate: HeaderComponentDelegate?
    var openHeader: Bool = false
    
    lazy var itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Selecione um item"
        label.font = UIFont(name: "Arial-Black", size: 14)
        label.textColor = dominoBlue
        return label
    }()
    
    lazy var icon: UIImageView = {
        let ico = UIImageView()
        ico.translatesAutoresizingMaskIntoConstraints = false
        ico.image = UIImage(systemName: "arrowtriangle.down.fill")?.withTintColor(dominoBlue, renderingMode: .alwaysOriginal)
        backgroundColor = .systemGray3
        return ico
    }()

    lazy var view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray3
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showDropDown)))
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(view)
        view.addSubview(icon)
        view.addSubview(itemLabel)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.heightAnchor.constraint(equalToConstant: 40),

            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            icon.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            icon.heightAnchor.constraint(equalToConstant: 10),
            icon.widthAnchor.constraint(equalToConstant: 10),
            
            itemLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            itemLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 50)
    }
    
    @objc func showDropDown() {
        openHeader = !openHeader
        
        if openHeader {
            icon.image = UIImage(systemName: "arrowtriangle.down.fill")?.withTintColor(dominoBlue, renderingMode: .alwaysOriginal)
        }else {
            icon.image = UIImage(systemName: "arrowtriangle.up.fill")?.withTintColor(dominoBlue, renderingMode: .alwaysOriginal)
        }
        
        delegate?.headerComponent(self, didSelectOption: "Opção selecionada")
    }
}
