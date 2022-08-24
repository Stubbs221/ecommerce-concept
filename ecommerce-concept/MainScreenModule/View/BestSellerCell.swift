//
//  BestSellerCell.swift
//  ecommerce-concept
//
//  Created by MAC on 24.08.2022.
//

import UIKit

class BestSellerCell: UICollectionViewCell {
    
    static let identifier = "bestSellerCell"
    
    lazy var background: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        return view
    }()
    
    lazy var phoneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var isFavoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "favoriteButton"), for: .normal)
        button.layer.cornerRadius = 13
        button.backgroundColor = UIColor.white
        button.heightAnchor.constraint(equalToConstant: 26).isActive = true
        button.widthAnchor.constraint(equalToConstant: 26).isActive = true
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        button.layer.masksToBounds = false
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = CGSize(width: 2, height: 2)
        return button
    }()
    
    lazy var currentPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Bold", size: 16)
        label.text = "$1,000"
        label.textColor = UIColor(named: "darkBlueColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var discountPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Medium", size: 10)
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "$1,500")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        label.attributedText = attributeString
        label.textColor = UIColor.lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro", size: 10)
        label.textColor = UIColor(named: "darkBlueColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "iPhone 13 Pro Max"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(background)
        background.addSubview(phoneImageView)
        background.addSubview(isFavoriteButton)
        background.addSubview(currentPriceLabel)
        background.addSubview(discountPriceLabel)
        background.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: contentView.topAnchor),
            background.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)])
        
        NSLayoutConstraint.activate([
            phoneImageView.topAnchor.constraint(equalTo: background.topAnchor, constant: 10),
            phoneImageView.centerXAnchor.constraint(equalTo: background.centerXAnchor),
            phoneImageView.heightAnchor.constraint(equalToConstant: 170),
            phoneImageView.widthAnchor.constraint(equalToConstant: background.frame.width)])
        
        NSLayoutConstraint.activate([
            isFavoriteButton.topAnchor.constraint(equalTo: background.topAnchor, constant: 11),
            isFavoriteButton.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -11)])
        
        NSLayoutConstraint.activate([
            currentPriceLabel.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -5),
            currentPriceLabel.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 21)])
        
        NSLayoutConstraint.activate([
            discountPriceLabel.bottomAnchor.constraint(equalTo: currentPriceLabel.bottomAnchor),
            discountPriceLabel.leadingAnchor.constraint(equalTo: currentPriceLabel.trailingAnchor, constant: 10)])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: currentPriceLabel.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: currentPriceLabel.leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -15)])
        
        
        
        contentView.backgroundColor = UIColor(named: "backgroundWhiteColor")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
