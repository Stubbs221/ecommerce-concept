//
//  MainScreenView + SetupUI.swift
//  ecommerce-concept
//
//  Created by MAC on 22.08.2022.
//

import UIKit

extension MainScreenView {
    func setupUI() {
        view.backgroundColor = UIColor(named: "backgroundWhiteColor")
        
        view.addSubview(geoLabelView)
        
        NSLayoutConstraint.activate([
            geoLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            geoLabelView.topAnchor.constraint(equalTo: view.topAnchor, constant: -120),
            geoLabelView.widthAnchor.constraint(equalToConstant: 200),
            geoLabelView.heightAnchor.constraint(equalToConstant: 35)
            ])
    }
}
