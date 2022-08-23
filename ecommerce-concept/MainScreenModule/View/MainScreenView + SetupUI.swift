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
        view.addSubview(filterButton)
        view.addSubview(selectCategoryLabel)
        view.addSubview(viewAllLabel)
        
        
        NSLayoutConstraint.activate([
            geoLabelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            geoLabelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            geoLabelView.widthAnchor.constraint(equalToConstant: 200),
            geoLabelView.heightAnchor.constraint(equalToConstant: 35)
            ])
        
        NSLayoutConstraint.activate([
            filterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            filterButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 55)])
        
        NSLayoutConstraint.activate([
            selectCategoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            selectCategoryLabel.topAnchor.constraint(equalTo: geoLabelView.bottomAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([
            viewAllLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            viewAllLabel.topAnchor.constraint(equalTo: geoLabelView.bottomAnchor, constant: 30)])
    }
}
