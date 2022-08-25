//
//  FilterView + SetupUI.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

extension FilterView {
    func setupUI() {
        view.addSubview(filterHalfScreenView)
        filterHalfScreenView.addSubview(closeFilterButton)
        filterHalfScreenView.addSubview(filterOptionsLabel)
        filterHalfScreenView.addSubview(doneButton)
        filterHalfScreenView.addSubview(brandLabel)
        filterHalfScreenView.addSubview(priceLabel)
        filterHalfScreenView.addSubview(sizeLabel)
        filterHalfScreenView.addSubview(brandDropDown)
        filterHalfScreenView.addSubview(priceDropDown)
        filterHalfScreenView.addSubview(sizeDropDown)
        
        NSLayoutConstraint.activate([
            filterHalfScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: UIScreen.main.bounds.height * 0.6 ),
            filterHalfScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterHalfScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        NSLayoutConstraint.activate([
            closeFilterButton.leadingAnchor.constraint(equalTo: filterHalfScreenView.leadingAnchor, constant: 24),
            closeFilterButton.topAnchor.constraint(equalTo: filterHalfScreenView.topAnchor, constant: 24)])
        
        NSLayoutConstraint.activate([
            filterOptionsLabel.centerXAnchor.constraint(equalTo: filterHalfScreenView.centerXAnchor),
            filterOptionsLabel.centerYAnchor.constraint(equalTo: closeFilterButton.centerYAnchor)])
        
        NSLayoutConstraint.activate([
            doneButton.trailingAnchor.constraint(equalTo: filterHalfScreenView.trailingAnchor, constant: -24),
            doneButton.topAnchor.constraint(equalTo: filterHalfScreenView.topAnchor, constant: 24)])
        
        NSLayoutConstraint.activate([
            brandLabel.topAnchor.constraint(equalTo: closeFilterButton.bottomAnchor, constant: 20),
            brandLabel.leadingAnchor.constraint(equalTo: closeFilterButton.leadingAnchor)])
        
        NSLayoutConstraint.activate([
            brandDropDown.leadingAnchor.constraint(equalTo: brandLabel.leadingAnchor),
            brandDropDown.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 5)])
        
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: brandLabel.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: brandDropDown.bottomAnchor, constant: 5)])
        
        NSLayoutConstraint.activate([
            priceDropDown.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            priceDropDown.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5)])
        
        NSLayoutConstraint.activate([
            sizeLabel.leadingAnchor.constraint(equalTo: brandLabel.leadingAnchor),
            sizeLabel.topAnchor.constraint(equalTo: priceDropDown.bottomAnchor, constant: 5)])
        
        NSLayoutConstraint.activate([
            sizeDropDown.leadingAnchor.constraint(equalTo: sizeLabel.leadingAnchor),
            sizeDropDown.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 5)])
            
    }
}
