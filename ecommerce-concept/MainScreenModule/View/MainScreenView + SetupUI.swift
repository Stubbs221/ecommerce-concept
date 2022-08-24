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
        view.addSubview(selectCategoryCollectionView)
        view.addSubview(searchView)
        view.addSubview(scanQRButton)
        view.addSubview(hotSalesLabel)
        view.addSubview(seeMoreLabel)
        view.addSubview(hotSalesScrollView)
        view.addSubview(pageControl)
        view.addSubview(bestSellerLabel)
        view.addSubview(seeMoreSecondLabel)
        
        
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
        
        NSLayoutConstraint.activate([
            selectCategoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            selectCategoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectCategoryCollectionView.topAnchor.constraint(equalTo: selectCategoryLabel.bottomAnchor, constant: 20),
            selectCategoryCollectionView.heightAnchor.constraint(equalToConstant: 110)])
        
        NSLayoutConstraint.activate([
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            searchView.topAnchor.constraint(equalTo: selectCategoryCollectionView.bottomAnchor, constant: 30)])
        
        NSLayoutConstraint.activate([
            scanQRButton.topAnchor.constraint(equalTo: searchView.topAnchor),
            scanQRButton.leadingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: 12)])
        
        NSLayoutConstraint.activate([
            hotSalesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            hotSalesLabel.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([
            seeMoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            seeMoreLabel.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 30)])
        
        NSLayoutConstraint.activate([
            hotSalesScrollView.leadingAnchor.constraint(equalTo: hotSalesLabel.leadingAnchor),
            hotSalesScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            hotSalesScrollView.topAnchor.constraint(equalTo: hotSalesLabel.bottomAnchor, constant: 20),
            hotSalesScrollView.heightAnchor.constraint(equalToConstant: 200)])
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: hotSalesScrollView.bottomAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([
            bestSellerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            bestSellerLabel.topAnchor.constraint(equalTo: hotSalesScrollView.bottomAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([
            seeMoreSecondLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            seeMoreSecondLabel.topAnchor.constraint(equalTo: hotSalesScrollView.bottomAnchor, constant: 30)])
        
    }
}
