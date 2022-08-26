//
//  ProductDetailsView + SetupUI.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

extension ProductDetailsView {
    func setupUI() {
        view.backgroundColor = UIColor(named: "backgroundWhiteColor")
        
        view.addSubview(productDetailsHeaderLabel)
        view.addSubview(backButton)
        view.addSubview(cartButton)
        view.addSubview(phoneImagesScrollView)

        view.addSubview(productDescriptionView)
        productDescriptionView.addSubview(phoneNameLabel)
        productDescriptionView.addSubview(addToFavoriteButton)
        productDescriptionView.addSubview(ratingStackView)
        productDescriptionView.addSubview(shopButton)
        productDescriptionView.addSubview(detailsButton)
        productDescriptionView.addSubview(featuresButton)
        productDescriptionView.addSubview(underlineView)
        productDescriptionView.addSubview(hardwareStackView)
        productDescriptionView.addSubview(selectColorAndCapacityLabel)
        productDescriptionView.addSubview(brownColorButton)
        productDescriptionView.addSubview(blueColorButton)
        productDescriptionView.addSubview(minStorageCapacityButton)
        productDescriptionView.addSubview(maxStorageCapacityButton)
        productDescriptionView.addSubview(addToCartButton)
        productDescriptionView.addSubview(itemsInCartLabel)
        
        
        NSLayoutConstraint.activate([
            productDetailsHeaderLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            productDetailsHeaderLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 67)])
        
        NSLayoutConstraint.activate([
            cartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            cartButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 67)])
        
        NSLayoutConstraint.activate([
            itemsInCartLabel.topAnchor.constraint(equalTo: cartButton.topAnchor, constant: -8),
            itemsInCartLabel.trailingAnchor.constraint(equalTo: cartButton.trailingAnchor, constant: 8)])
        
        NSLayoutConstraint.activate([
            phoneImagesScrollView.topAnchor.constraint(equalTo: productDetailsHeaderLabel.bottomAnchor, constant: 20),
            phoneImagesScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            phoneImagesScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            phoneImagesScrollView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            productDescriptionView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -420),
            productDescriptionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productDescriptionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        NSLayoutConstraint.activate([
            phoneNameLabel.topAnchor.constraint(equalTo: productDescriptionView.topAnchor, constant: 30),
            phoneNameLabel.leadingAnchor.constraint(equalTo: productDescriptionView.leadingAnchor, constant: 40)])
        
        NSLayoutConstraint.activate([
            addToFavoriteButton.topAnchor.constraint(equalTo: productDescriptionView.topAnchor, constant: 30),
            addToFavoriteButton.trailingAnchor.constraint(equalTo: productDescriptionView.trailingAnchor, constant: -40)])
        
        NSLayoutConstraint.activate([
            ratingStackView.leadingAnchor.constraint(equalTo: productDescriptionView.leadingAnchor, constant: 40),
            ratingStackView.topAnchor.constraint(equalTo: phoneNameLabel.bottomAnchor, constant: 7)])
        
        NSLayoutConstraint.activate([
            shopButton.topAnchor.constraint(equalTo: ratingStackView.bottomAnchor, constant: 10),
            shopButton.leadingAnchor.constraint(equalTo: productDescriptionView.leadingAnchor, constant: 45)])
        
        NSLayoutConstraint.activate([
            detailsButton.topAnchor.constraint(equalTo: shopButton.topAnchor),
            detailsButton.centerXAnchor.constraint(equalTo: productDescriptionView.centerXAnchor)])
        
        NSLayoutConstraint.activate([
            featuresButton.topAnchor.constraint(equalTo: detailsButton.topAnchor),
            featuresButton.trailingAnchor.constraint(equalTo: productDescriptionView.trailingAnchor, constant: -40)])
        
        NSLayoutConstraint.activate([
            underlineView.leadingAnchor.constraint(equalTo: productDescriptionView.leadingAnchor, constant: 30),
            underlineView.topAnchor.constraint(equalTo: shopButton.bottomAnchor, constant: -1)])
        
        NSLayoutConstraint.activate([
            hardwareStackView.leadingAnchor.constraint(equalTo: productDescriptionView.leadingAnchor, constant: 30),
            hardwareStackView.trailingAnchor.constraint(equalTo: productDescriptionView.trailingAnchor, constant: -30),
            hardwareStackView.topAnchor.constraint(equalTo: underlineView.bottomAnchor, constant: 10),
            hardwareStackView.heightAnchor.constraint(equalToConstant: 50)])
        
        NSLayoutConstraint.activate([
            selectColorAndCapacityLabel.leadingAnchor.constraint(equalTo: productDescriptionView.leadingAnchor, constant: 30),
            selectColorAndCapacityLabel.topAnchor.constraint(equalTo: hardwareStackView.bottomAnchor, constant: 30)])
        
        NSLayoutConstraint.activate([
            brownColorButton.leadingAnchor.constraint(equalTo: productDescriptionView.leadingAnchor, constant: 35),
            brownColorButton.topAnchor.constraint(equalTo: selectColorAndCapacityLabel.bottomAnchor, constant: 15)])
        
        NSLayoutConstraint.activate([
            blueColorButton.leadingAnchor.constraint(equalTo: brownColorButton.trailingAnchor, constant: 20),
            blueColorButton.topAnchor.constraint(equalTo: brownColorButton.topAnchor)])
        
        NSLayoutConstraint.activate([
            minStorageCapacityButton.centerYAnchor.constraint(equalTo: brownColorButton.centerYAnchor),
            minStorageCapacityButton.leadingAnchor.constraint(equalTo: blueColorButton.trailingAnchor, constant: 80),
            maxStorageCapacityButton.centerYAnchor.constraint(equalTo: minStorageCapacityButton.centerYAnchor),
            maxStorageCapacityButton.leadingAnchor.constraint(equalTo: minStorageCapacityButton.trailingAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([
            addToCartButton.centerXAnchor.constraint(equalTo: productDescriptionView.centerXAnchor),
            addToCartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)])
    }
}
