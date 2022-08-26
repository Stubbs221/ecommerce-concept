//
//  ProductDetailsView + Actions.swift
//  ecommerce-concept
//
//  Created by MAC on 26.08.2022.
//

import UIKit

extension ProductDetailsView {
    func updatePhoneData(with phoneData: ProductDetailsFetchResult) {
        
            self.phoneData = phoneData
        setupUI()
        phoneImagesScrollView.addSubview(addPage(photoStringURL: phoneData.imagesStringURL[0], position: 0))
        phoneImagesScrollView.addSubview(addPage(photoStringURL: phoneData.imagesStringURL[1], position: 1))
        print(phoneData.isFavorites)
        isFavorite = phoneData.isFavorites
        addToFavoriteButton.setImage(UIImage(named: (isFavorite ? "favoriteButtonClicked" : "favoriteTabBarButton" )), for: .normal)
        
            print(phoneData.cpu)
            
        
    }
    
    func updatePhoneData(with error: String) {
        print(error)
    }
    
    func addPage(photoStringURL: String, position: CGFloat) -> UIView {
        
        
        let view = UIView()
        guard  let url = URL(string: photoStringURL) else { return view}
        let photoView = UIImageView()
        photoView.kf.setImage(with: url)
        photoView.contentMode = .scaleAspectFit
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.backgroundColor = .white
        photoView.layer.cornerRadius = 20
        photoView.layer.masksToBounds = false
        photoView.layer.shadowRadius = 4
        photoView.layer.shadowOpacity = 0.2
        photoView.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = UIColor(named: "backgroundWhiteColor")

        print(title)
        
        let screenWidth = UIScreen.main.bounds.width
      
        view.addSubview(photoView)
        
        NSLayoutConstraint.activate([
            photoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            photoView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            photoView.widthAnchor.constraint(equalToConstant: 250),
            photoView.heightAnchor.constraint(equalToConstant: 320)
            ])
        view.frame = CGRect(x: screenWidth * position - 34 * position, y: 0, width: screenWidth, height: 350)
        return view
    }
    @objc func selectCapacityButtonTapped(_ sender: Any) {
        guard let sender = sender as? UIButton else { fatalError() }
        if sender === minStorageCapacityButton {
            minStorageCapacityButton.backgroundColor = UIColor(named: "orangeColor")
            minStorageCapacityButton.setTitleColor(UIColor.white, for: .normal)
            
            maxStorageCapacityButton.backgroundColor = .white
            maxStorageCapacityButton.setTitleColor(UIColor.systemGray, for: .normal)
            
        } else {
            maxStorageCapacityButton.backgroundColor = UIColor(named: "orangeColor")
            maxStorageCapacityButton.setTitleColor(UIColor.white, for: .normal)
            
            minStorageCapacityButton.backgroundColor = .white
            minStorageCapacityButton.setTitleColor(UIColor.systemGray, for: .normal)
        }
    }
    @objc func selectColorButtonTapped(_ sender: Any) {
        guard let sender = sender as? UIButton else { fatalError() }
        if sender === brownColorButton {
            brownColorButton.setImage(UIImage(named: "checkmarkIcon"), for: .normal)
            blueColorButton.setImage(nil, for: .normal)
        } else {
            blueColorButton.setImage(UIImage(named: "checkmarkIcon"), for: .normal)
            brownColorButton.setImage(nil, for: .normal)
        }
    }
    
    @objc func addToFavoriteTapped(_ sender: Any) {
        guard let sender = sender as? UIButton else { fatalError() }
        
        sender.setImage(UIImage(named: isFavorite ? "favoriteButton" :"favoriteButtonClicked" ), for: .normal)
        isFavorite = !isFavorite
    }
    
    @objc func backButtonTapped() {
        output?.userSelectDismissProductDetailsView()
    }
    
    @objc func myCartButtonTapped() {
        output?.userSelectOpenMyCartViewFromProductDetailsView()
    }
    
    @objc func descriptionCategoryButtonPressed(_ sender: Any) {
        guard let sender = sender as? UIButton else { fatalError() }
        guard let title = sender.titleLabel else { fatalError() }
        switch title.text {
        case "Shop":
            shopButton.setTitleColor(UIColor(named: "darkBlueColor"), for: .normal)
            shopButton.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
            UIView.animate(withDuration: 0.5) {
                self.underlineView.transform = CGAffineTransform(translationX: self.shopButton.frame.minX - self.underlineView.frame.width / 2, y: 0)
            }
            detailsButton.setTitleColor(UIColor.systemGray, for: .normal)
            detailsButton.titleLabel?.font = UIFont(name: "MarkPro", size: 20)
            featuresButton.setTitleColor(UIColor.systemGray, for: .normal)
            featuresButton.titleLabel?.font = UIFont(name: "MarkPro", size: 20)
        case "Details":
            detailsButton.setTitleColor(UIColor(named: "darkBlueColor"), for: .normal)
            UIView.animate(withDuration: 0.5) {
                self.underlineView.transform = CGAffineTransform(translationX: self.detailsButton.frame.minX - self.underlineView.frame.width / 2 + 5, y: 0)
            }
            detailsButton.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
            shopButton.setTitleColor(UIColor.systemGray, for: .normal)
            shopButton.titleLabel?.font = UIFont(name: "MarkPro", size: 20)
            featuresButton.setTitleColor(UIColor.systemGray, for: .normal)
            featuresButton.titleLabel?.font = UIFont(name: "MarkPro", size: 20)
        case "Features":
            featuresButton.setTitleColor(UIColor(named: "darkBlueColor"), for: .normal)
            UIView.animate(withDuration: 0.5) {
                self.underlineView.transform = CGAffineTransform(translationX: self.featuresButton.frame.midX - self.underlineView.frame.width + 20, y: 0)
            }
            featuresButton.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
            shopButton.setTitleColor(UIColor.systemGray, for: .normal)
            shopButton.titleLabel?.font = UIFont(name: "MarkPro", size: 20)
            detailsButton.setTitleColor(UIColor.systemGray, for: .normal)
            detailsButton.titleLabel?.font = UIFont(name: "MarkPro", size: 20)
        default: print("default")
        }
        
        
    }
    
}
