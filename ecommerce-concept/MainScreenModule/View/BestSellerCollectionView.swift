//
//  BestSellerCollectionView.swift
//  ecommerce-concept
//
//  Created by MAC on 24.08.2022.
//

import UIKit
import Kingfisher

class BestSellerCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    var mainScreenView: MainScreenViewInput
    
    init(vc: MainScreenViewInput) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        self.mainScreenView = vc
        super.init(frame: .zero, collectionViewLayout: layout)
        self.backgroundColor = UIColor(named: "backgroundWhiteColor")
        delegate = self
        dataSource = self
        register(BestSellerCell.self, forCellWithReuseIdentifier: BestSellerCell.identifier)
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.bestSellerMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 10, left: Constants.leftDistanceToView, bottom: 10, right: Constants.rightDistanceToView)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: BestSellerCell.identifier, for: indexPath) as? BestSellerCell else { fatalError() }
        if !mainScreenView.bestSellerArray.isEmpty {
            guard let url = URL(string: mainScreenView.bestSellerArray[indexPath.row].pictureURL) else { return cell }
            print(url)
            cell.phoneImageView.kf.setImage(with: url)
            cell.titleLabel.text = mainScreenView.bestSellerArray[indexPath.row].title
            cell.discountPriceLabel.text = "$ " + String(mainScreenView.bestSellerArray[indexPath.row].discountPrice)
            cell.currentPriceLabel.text = "$ " + String(mainScreenView.bestSellerArray[indexPath.row].priceWithoutDiscount)
            cell.isFavorite = mainScreenView.bestSellerArray[indexPath.row].isFavorites
            if mainScreenView.bestSellerArray[indexPath.row].isFavorites {
                cell.isFavoriteButton.setImage(UIImage(named: "favoriteButtonClicked"), for: .normal)
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainScreenView.userSelectOpenProductDetailViewThroughCollectionView()
    }
    
    struct Constants {
        static let leftDistanceToView: CGFloat = 17
        static let rightDistanceToView: CGFloat = 17
        static let bestSellerMinimumLineSpacing: CGFloat = 10
        static let bestSellerItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.bestSellerMinimumLineSpacing / 2) / 2)
    }
}
