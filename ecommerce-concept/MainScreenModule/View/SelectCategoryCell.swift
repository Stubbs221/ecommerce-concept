//
//  SelectCategoryCell.swift
//  ecommerce-concept
//
//  Created by MAC on 24.08.2022.
//

import UIKit

class SelectCategoryCell: UICollectionViewCell {
    
    static let identificator = "categoryCell"
    
    var isPressed: Bool = false
   
    lazy var roundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    lazy var categoryImage: UIImageView = {
            let image = UIImageView()

        image.contentMode = .scaleAspectFit
            image.translatesAutoresizingMaskIntoConstraints = false
            image.heightAnchor.constraint(equalToConstant: 31).isActive = true
            image.widthAnchor.constraint(equalToConstant: 31).isActive = true
            return image
        }()
        
    lazy var categoryLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: "MarkPro", size: 12)
            label.text = ""
            label.textColor = UIColor(named: "darkBlueColor")
            return label
        }()
        


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(categoryLabel)
        contentView.addSubview(roundView)
        roundView.addSubview(categoryImage)
        contentView.backgroundColor = UIColor(named: "backgroundWhiteColor")
        
        roundView.layer.masksToBounds = false
        roundView.layer.shadowRadius = 4
        roundView.layer.shadowColor = UIColor.black.cgColor
        roundView.layer.shadowOpacity = 0.1
        roundView.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        NSLayoutConstraint.activate([
            roundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            roundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryImage.centerXAnchor.constraint(equalTo: roundView.centerXAnchor),
            categoryImage.centerYAnchor.constraint(equalTo: roundView.centerYAnchor),
            categoryLabel.topAnchor.constraint(equalTo: roundView.bottomAnchor, constant: 10),
            categoryLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
