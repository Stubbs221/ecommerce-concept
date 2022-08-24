//
//  MainScreenView.swift
//  ecommerce-concept
//
//  Created by MAC on 22.08.2022.
//

import UIKit

protocol MainScreenViewInput {
    var output: MainScreenViewOutput? { get set }
}

protocol MainScreenViewOutput {
//    add choose category button func , hot sales view generator, bestseller collectioin view, filteer button and view
}

class MainScreenView: UIViewController, MainScreenViewInput {
    

    var output: MainScreenViewOutput?
    
    lazy var geoLabelView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        let geoIconImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "geoPinIcon")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let geoLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Zihuatanejo, Gro"
            label.font = UIFont(name: "MarkPro-Medium", size: 15)
            label.textColor = UIColor(named: "darkBlueColor")
            return label
        }()
        
        let arrowDown: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "arrowDownIcon")
            return imageView
        }()
        
        view.addSubview(geoIconImageView)
        view.addSubview(geoLabel)
        view.addSubview(arrowDown)
        
        NSLayoutConstraint.activate([
            geoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            geoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            geoIconImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            geoIconImageView.heightAnchor.constraint(equalToConstant: 16),
            geoIconImageView.widthAnchor.constraint(equalToConstant: 12),
            geoIconImageView.trailingAnchor.constraint(equalTo: geoLabel.leadingAnchor, constant: -11),
            arrowDown.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            arrowDown.leadingAnchor.constraint(equalTo: geoLabel.trailingAnchor, constant: 8),
            arrowDown.widthAnchor.constraint(equalToConstant: 10),
            arrowDown.heightAnchor.constraint(equalToConstant: 5)])
        
        return view
    }()
    
    lazy var filterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "filterButtonIcon"), for: .normal)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 14),
            button.widthAnchor.constraint(equalToConstant: 12)])
        return button
    }()
    
    lazy var selectCategoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select Category"
        label.textColor = UIColor(named: "darkBlueColor")
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        return label
    }()
    
    lazy var viewAllLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "orangeColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "view all"
        label.font = UIFont(name: "MarkPro", size: 15)
        return label
    }()
    
    lazy var selectCategoryCollectionView: UICollectionView = {
        let collectionView = SelectCategoryCollectionView()
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
}

//extension MainScreenView: MainScreenViewInput {
//    var output: MainScreenViewInput?
//
//
//}
