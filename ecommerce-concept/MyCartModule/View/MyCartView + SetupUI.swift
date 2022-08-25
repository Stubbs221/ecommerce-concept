//
//  MyCartView + SetupUI.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

extension MyCartView {
    func setupUI() {
        view.backgroundColor = UIColor(named: "backgroundWhiteColor")
        
        view.addSubview(backButton)
        view.addSubview(addAddressLabel)
        view.addSubview(findMyGeoButton)
        view.addSubview(myCartLabel)
        view.addSubview(myCartInnerView)
        myCartInnerView.addSubview(firstPhoneView)
        myCartInnerView.addSubview(secondPhoneView)
        myCartInnerView.addSubview(firstLineView)
        myCartInnerView.addSubview(secondLineView)
        myCartInnerView.addSubview(totalTitleLabel)
        myCartInnerView.addSubview(deliveryTitleLabel)
        myCartInnerView.addSubview(totalMoneyLabel)
        myCartInnerView.addSubview(deliveryCostLabel)
        myCartInnerView.addSubview(checkOutButton)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 67)])
        
        NSLayoutConstraint.activate([
            findMyGeoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            findMyGeoButton.topAnchor.constraint(equalTo: backButton.topAnchor)])
        
        NSLayoutConstraint.activate([
            addAddressLabel.trailingAnchor.constraint(equalTo: findMyGeoButton.leadingAnchor, constant: -13),
            addAddressLabel.centerYAnchor.constraint(equalTo: findMyGeoButton.centerYAnchor)])
        
        NSLayoutConstraint.activate([
            myCartLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            myCartLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 50)])
        
        NSLayoutConstraint.activate([
            myCartInnerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myCartInnerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myCartInnerView.topAnchor.constraint(equalTo: myCartLabel.bottomAnchor, constant: 50)])
        
        NSLayoutConstraint.activate([
            firstPhoneView.leadingAnchor.constraint(equalTo: myCartInnerView.leadingAnchor, constant: 33),
            firstPhoneView.topAnchor.constraint(equalTo: myCartInnerView.topAnchor, constant: 80)])
        
        NSLayoutConstraint.activate([
            secondPhoneView.leadingAnchor.constraint(equalTo: myCartInnerView.leadingAnchor, constant: 33),
            secondPhoneView.topAnchor.constraint(equalTo: firstPhoneView.bottomAnchor, constant: 45)])
        
        NSLayoutConstraint.activate([
            firstLineView.leadingAnchor.constraint(equalTo: myCartInnerView.leadingAnchor),
            firstLineView.trailingAnchor.constraint(equalTo: myCartInnerView.trailingAnchor),
            firstLineView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -220)
        ])
        
        NSLayoutConstraint.activate([
            totalTitleLabel.leadingAnchor.constraint(equalTo: myCartInnerView.leadingAnchor, constant: 55),
            totalTitleLabel.topAnchor.constraint(equalTo: firstLineView.topAnchor, constant: 15)])
        
        NSLayoutConstraint.activate([
            deliveryTitleLabel.leadingAnchor.constraint(equalTo: totalTitleLabel.leadingAnchor),
            deliveryTitleLabel.topAnchor.constraint(equalTo: totalTitleLabel.bottomAnchor, constant: 12)])
        
        NSLayoutConstraint.activate([
            totalMoneyLabel.leadingAnchor.constraint(equalTo: myCartInnerView.trailingAnchor, constant: -120),
            totalMoneyLabel.topAnchor.constraint(equalTo: totalTitleLabel.topAnchor)])
        
        NSLayoutConstraint.activate([
            deliveryCostLabel.leadingAnchor.constraint(equalTo: totalMoneyLabel.leadingAnchor),
            deliveryCostLabel.topAnchor.constraint(equalTo: deliveryTitleLabel.topAnchor)])
        
        NSLayoutConstraint.activate([
            secondLineView.leadingAnchor.constraint(equalTo: myCartInnerView.leadingAnchor),
            secondLineView.trailingAnchor.constraint(equalTo: myCartInnerView.trailingAnchor),
            secondLineView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -125)
        ])
        
        NSLayoutConstraint.activate([
            checkOutButton.centerXAnchor.constraint(equalTo: myCartInnerView.centerXAnchor),
            checkOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44)])
    }
}
