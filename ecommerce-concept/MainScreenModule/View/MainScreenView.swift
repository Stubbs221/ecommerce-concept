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
            geoIconImageView.trailingAnchor.constraint(equalTo: geoLabel.leadingAnchor, constant: -11),
            arrowDown.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            arrowDown.leadingAnchor.constraint(equalTo: geoLabel.trailingAnchor, constant: 8)])
        
        return view
    }()
    
    lazy var filterButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    lazy var selectCategoryViewAllView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var categoryCollectionCarouselView: UICollectionView = {
        let collectionView = UICollectionView()
        
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
