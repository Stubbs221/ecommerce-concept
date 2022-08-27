//
//  MainScreenView + Actions.swift
//  ecommerce-concept
//
//  Created by MAC on 27.08.2022.
//

import UIKit

extension MainScreenView {
    
    func updateHomeStore(with homeStore: [HomeStoreModel]) {
        self.homeStoreArray = homeStore
        print("fetching homeStore success")
        print(homeStoreArray[0].title)
        
        hotSalesScrollView.addSubview(addPage(pictureURL: homeStoreArray[0].pictureURL, title: homeStoreArray[0].title, isNew: homeStoreArray[0].isNew, subTitle: homeStoreArray[0].subTitle, position: 0))
        hotSalesScrollView.addSubview(addPage(pictureURL: homeStoreArray[1].pictureURL, title: homeStoreArray[1].title, isNew: homeStoreArray[1].isNew, subTitle: homeStoreArray[1].subTitle, position: 1))
        hotSalesScrollView.addSubview(addPage(pictureURL: homeStoreArray[2].pictureURL, title: homeStoreArray[2].title, isNew: homeStoreArray[2].isNew, subTitle: homeStoreArray[2].subTitle, position: 2))
    }
    
    func updateHomeStore(with error: String) {
        print(error)
    }
    
    func updateBestSeller(with bestSeller: [BestSellerModel]) {
        self.bestSellerArray = bestSeller
        print("fetching bestSeller success")
        bestSellerCollectionView.reloadData()
    }
    
    func updateBestSeller(with error: String) {
        print(error)
    }
    
    func userSelectOpenProductDetailViewThroughCollectionView() {
        output?.userSelectOpenProductDetailView()
    }
    
    @objc func filterButtonPressed() {
        output?.userSelectOpenFilter()
    }
    
    @objc func userSelectMyCart() {
        output?.userSelectOpenMyCartView()
    }
    
    func addPage(pictureURL: String, title: String, isNew: Bool, subTitle: String, position: CGFloat) -> UIView {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = UIColor(named: "backgroundWhiteColor")

        guard let url = URL(string: pictureURL) else { return UIView() }
        let title = title, isNew = isNew, subTitle = subTitle
        print(title)
        print(subTitle)
        
        let contentView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .white
            view.layer.cornerRadius = 20
            view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 34).isActive = true
            view.heightAnchor.constraint(equalToConstant: 200).isActive = true
            return view
        }()
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = title
            label.font = UIFont(name: "MarkPro-Bold", size: 26)
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let subTitleLabel: UILabel = {
            let label = UILabel()
            label.text = subTitle
            label.font = UIFont(name: "MarkPro", size: 12)
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let buyNowButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .white
            button.layer.cornerRadius = 5
            button.heightAnchor.constraint(equalToConstant: 25).isActive = true
            button.widthAnchor.constraint(equalToConstant: 100).isActive = true
            button.setTitle("Buy now!", for: .normal)
            button.setTitleColor(UIColor(named: "darkBlueColor"), for: .normal)
            button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 12)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let isNewLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = UIColor(named: "orangeColor")
            label.clipsToBounds = true
            label.text = "New"
            label.textAlignment = .center
            label.font = UIFont(name: "MarkPro-Bold", size: 11)
            label.textColor = .white
            label.layer.cornerRadius = 15
            label.heightAnchor.constraint(equalToConstant: 30).isActive = true
            label.widthAnchor.constraint(equalToConstant: 30).isActive = true
            return label
        }()
        
        let phoneImage: UIImageView = {
            let imageView = UIImageView()
            
            imageView.kf.setImage(with: url)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.layer.masksToBounds = true
            imageView.layer.cornerRadius = 20
            
            return imageView
        }()
        let screenWidth = UIScreen.main.bounds.width

        
        view.frame = CGRect(x: screenWidth * position - 0 * position, y: 0, width: screenWidth , height: 200)
        view.addSubview(contentView)
        contentView.addSubview(phoneImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(buyNowButton)
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        if isNew {
            view.addSubview(isNewLabel)
            
            NSLayoutConstraint.activate([
                isNewLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                isNewLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25)])
        }
        
        NSLayoutConstraint.activate([
            phoneImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            phoneImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            phoneImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            phoneImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 70)])
        
        NSLayoutConstraint.activate([
            buyNowButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            buyNowButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -35)])
        
        NSLayoutConstraint.activate([
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5)])

        return view
    }
    
}
