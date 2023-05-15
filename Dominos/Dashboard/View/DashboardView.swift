//
//  DashboardView.swift
//  Dominos
//
//  Created by Emerson Sampaio on 09/05/23.
//

import Foundation
import UIKit
import FSPagerView
import CoreLocation
import GoogleMaps

class DashboardView: UIView {
    
    var pizzas: [String] = ["pizza1","pizza2","pizza3","pizza4"]
    var banners: [String] = ["banner1","banner2","banner3","banner4", "banner5"]
    
    let margin: CGFloat = 16
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "domino-clear")
        return image
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
    
    lazy var pickImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "mappin")?.withTintColor(UIColor.white, renderingMode: .alwaysOriginal)
        return image
    }()
    
//    let locationManager = CLLocationManager()
    
    lazy var addressLabel: UILabel = {
        let address = UILabel()
        address.translatesAutoresizingMaskIntoConstraints = false
        address.text = "Av. Paulista, 2450"
        let font = UIFont(name: "arial-black", size: 12)
        address.font = font
        address.textColor = .white
        return address
    }()
    
    lazy var stateLabel: UILabel = {
        let address = UILabel()
        address.translatesAutoresizingMaskIntoConstraints = false
        address.text = "São Paulo, SP"
        let font = UIFont(name: "arial-black", size: 11)
        address.font = font
        address.textColor = .white
        return address
    }()
    
    lazy var pagerView: FSPagerView = {
        let pager = FSPagerView()
        pager.translatesAutoresizingMaskIntoConstraints = false
        pager.backgroundColor = .white
        pager.delegate = self
        pager.dataSource = self
        pager.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pager.layer.cornerRadius = 15
        pager.layer.masksToBounds = true
        return pager
    }()
    
    lazy var pagerControl: FSPageControl = {
        let pageControl = FSPageControl(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        pageControl.numberOfPages = banners.count
        pageControl.contentHorizontalAlignment = .center
        pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        pageControl.setStrokeColor(.gray, for: .normal)
        pageControl.setStrokeColor(dominoBlue, for: .selected)
        
        pageControl.setFillColor(.gray, for: .normal)
        pageControl.setFillColor(dominoBlue, for: .selected)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        return pageControl
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mais pedidos"
        let font = UIFont(name: "arial-black", size: 16)
        label.font = font
        label.textColor = dominoBlue
        return label
    }()
    
    lazy var viewTeste: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var framePizza1: FrameComponent = {
        let frame = FrameComponent()
        frame.translatesAutoresizingMaskIntoConstraints = false
        return frame
    }()
    
    lazy var framePizza2: FrameComponent = {
        let frame = FrameComponent()
        frame.translatesAutoresizingMaskIntoConstraints = false
        return frame
    }()
    
    lazy var framePizza3: FrameComponent = {
        let frame = FrameComponent()
        frame.translatesAutoresizingMaskIntoConstraints = false
        return frame
    }()
    
    lazy var framePizza4: FrameComponent = {
        let frame = FrameComponent()
        frame.translatesAutoresizingMaskIntoConstraints = false
        return frame
    }()
    
    lazy var orderButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = DominoRed
        button.setTitle("Novo Pedido", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "arial-black", size: 18)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.requestAlwaysAuthorization()
//        locationManager.startUpdatingLocation()
        
        backgroundColor = dominoBlue
        framePizza1.logoImage.image = UIImage(named: "pizza1")
        framePizza2.logoImage.image = UIImage(named: "pizza2")
        framePizza3.logoImage.image = UIImage(named: "pizza3")
        framePizza4.logoImage.image = UIImage(named: "pizza4")
        
        viewTeste.layer.cornerRadius = 20
        viewTeste.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        addSubview(logoImage)
        addSubview(perfilImage)
        addSubview(perfilLabel)
        addSubview(stateLabel)
        
        addSubview(pickImage)
        addSubview(addressLabel)
        
        addSubview(viewTeste)
        addSubview(pagerView)
        addSubview(pagerControl)
        addSubview(infoLabel)
        
        addSubview(framePizza1)
        addSubview(framePizza2)
        addSubview(framePizza3)
        addSubview(framePizza4)
        addSubview(orderButton)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            logoImage.heightAnchor.constraint(equalToConstant: 45),
            logoImage.widthAnchor.constraint(equalToConstant: 45),
            
            perfilImage.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            perfilImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            perfilImage.heightAnchor.constraint(equalToConstant: 25),
            perfilImage.widthAnchor.constraint(equalToConstant: 25),
            perfilLabel.topAnchor.constraint(equalTo: perfilImage.bottomAnchor),
            perfilLabel.centerXAnchor.constraint(equalTo: perfilImage.centerXAnchor),
            
            pickImage.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: -20),
            pickImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pickImage.heightAnchor.constraint(equalToConstant: 15),
            pickImage.widthAnchor.constraint(equalToConstant: 15),
            
            addressLabel.topAnchor.constraint(equalTo: pickImage.bottomAnchor),
            addressLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            stateLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 0),
            stateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            viewTeste.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            viewTeste.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewTeste.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewTeste.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            pagerView.topAnchor.constraint(equalTo: viewTeste.topAnchor, constant: 20),
            pagerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            pagerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -margin),
            pagerView.heightAnchor.constraint(equalToConstant: 130),
            
            pagerControl.bottomAnchor.constraint(equalTo: pagerView.bottomAnchor, constant: 20),
            pagerControl.centerXAnchor.constraint(equalTo: pagerView.centerXAnchor),
            pagerControl.heightAnchor.constraint(equalToConstant: 20),
            pagerControl.widthAnchor.constraint(equalToConstant: 200),
            
            infoLabel.topAnchor.constraint(equalTo: pagerView.bottomAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            
            framePizza1.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 25),
            framePizza1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            framePizza1.heightAnchor.constraint(equalToConstant: 120),

            framePizza2.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 25),
            framePizza2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            framePizza2.heightAnchor.constraint(equalToConstant: 120),

            framePizza3.topAnchor.constraint(equalTo: framePizza1.bottomAnchor, constant: 10),
            framePizza3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            framePizza3.heightAnchor.constraint(equalToConstant: 120),

            framePizza4.topAnchor.constraint(equalTo: framePizza1.bottomAnchor, constant: 10),
            framePizza4.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
            framePizza4.heightAnchor.constraint(equalToConstant: 120),
            
            orderButton.topAnchor.constraint(equalTo: framePizza4.bottomAnchor, constant: 30),
            orderButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
            orderButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -margin),
            orderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DashboardView: FSPagerViewDataSource {
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: banners[index])
        return cell
    }

    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return banners.count
    }
}

extension DashboardView: FSPagerViewDelegate {
    func pagerViewDidEndDecelerating(_ pagerView: FSPagerView) {
        let currentPage = pagerView.currentIndex
        let pageControl = pagerControl
        pageControl.currentPage = currentPage
    }
}

//extension DashboardView : CLLocationManagerDelegate{
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let location = locations.last else { return }
//
//        // Crie um objeto GMSGeocoder para obter o endereço a partir da localização atual
//        let geocoder = GMSGeocoder()
//        geocoder.reverseGeocodeCoordinate(location.coordinate) { response, error in
//            guard let address = response?.firstResult(), let lines = address.lines else { return }
//
//            // Atualize o rótulo com o endereço obtido
//            self.addressLabel.text = lines.joined(separator: "\n")
//        }
//    }
//}
