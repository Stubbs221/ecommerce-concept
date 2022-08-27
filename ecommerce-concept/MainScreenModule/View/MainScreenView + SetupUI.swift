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
            
        view.addSubview(mainScrollView)
        view.addSubview(customTabBar)
        mainScrollView.addSubview(contentView)
        
        mainScrollView.addSubview(geoLabelView)
        mainScrollView.addSubview(filterButton)
        mainScrollView.addSubview(selectCategoryLabel)
        mainScrollView.addSubview(viewAllLabel)
        mainScrollView.addSubview(selectCategoryCollectionView)
        mainScrollView.addSubview(searchView)
        mainScrollView.addSubview(scanQRButton)
        mainScrollView.addSubview(hotSalesLabel)
        mainScrollView.addSubview(seeMoreLabel)
        mainScrollView.addSubview(hotSalesScrollView)
        mainScrollView.addSubview(pageControl)
        mainScrollView.addSubview(bestSellerLabel)
        mainScrollView.addSubview(seeMoreSecondLabel)
        mainScrollView.addSubview(bestSellerCollectionView)
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: mainScrollView.topAnchor, constant: -45),
            contentView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 1250)
            ])
        
        NSLayoutConstraint.activate([
            geoLabelView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            geoLabelView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 44),
            geoLabelView.widthAnchor.constraint(equalToConstant: 200),
            geoLabelView.heightAnchor.constraint(equalToConstant: 35)
            ])
        
        NSLayoutConstraint.activate([
            filterButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            filterButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 55)])
        
        NSLayoutConstraint.activate([
            selectCategoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            selectCategoryLabel.topAnchor.constraint(equalTo: geoLabelView.bottomAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([
            viewAllLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            viewAllLabel.topAnchor.constraint(equalTo: geoLabelView.bottomAnchor, constant: 30)])
        
        NSLayoutConstraint.activate([
            selectCategoryCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            selectCategoryCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            selectCategoryCollectionView.topAnchor.constraint(equalTo: selectCategoryLabel.bottomAnchor, constant: 20),
            selectCategoryCollectionView.heightAnchor.constraint(equalToConstant: 110)])
        
        NSLayoutConstraint.activate([
            searchView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            searchView.topAnchor.constraint(equalTo: selectCategoryCollectionView.bottomAnchor, constant: 30)])
        
        NSLayoutConstraint.activate([
            scanQRButton.topAnchor.constraint(equalTo: searchView.topAnchor),
            scanQRButton.leadingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: 12)])
        
        NSLayoutConstraint.activate([
            hotSalesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            hotSalesLabel.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([
            seeMoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            seeMoreLabel.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 30)])
        
        NSLayoutConstraint.activate([
            hotSalesScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hotSalesScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hotSalesScrollView.topAnchor.constraint(equalTo: hotSalesLabel.bottomAnchor, constant: 20),
            hotSalesScrollView.heightAnchor.constraint(equalToConstant: 200)])
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: hotSalesScrollView.bottomAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([
            bestSellerLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            bestSellerLabel.topAnchor.constraint(equalTo: hotSalesScrollView.bottomAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([
            seeMoreSecondLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            seeMoreSecondLabel.topAnchor.constraint(equalTo: hotSalesScrollView.bottomAnchor, constant: 30)])
        
        NSLayoutConstraint.activate([
            bestSellerCollectionView.topAnchor.constraint(equalTo: bestSellerLabel.bottomAnchor, constant: 21),
            bestSellerCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bestSellerCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bestSellerCollectionView.heightAnchor.constraint(equalToConstant: 600)])
        
        NSLayoutConstraint.activate([
            customTabBar.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -81),
            customTabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customTabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customTabBar.heightAnchor.constraint(equalToConstant: 100)])
    }
}
