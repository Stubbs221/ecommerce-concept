//
//  ProductDetailsView.swift
//  ecommerce-concept
//
//  Created by MAC on 24.08.2022.
//

import UIKit
import Kingfisher

protocol ProductDetailsViewInput {
    var output: ProductDetailsViewOutput? { get set }
    
    func updatePhoneData(with phoneData: ProductDetailsFetchResult)
    func updatePhoneData(with error: String)
}

protocol ProductDetailsViewOutput {
    func userSelectDismissProductDetailsView()
    func userSelectAddToCartButton()
    func userSelectOpenMyCartViewFromProductDetailsView()
    
}

class ProductDetailsView: UIViewController, ProductDetailsViewInput {
    
    var output: ProductDetailsViewOutput?
    
    var phoneData: ProductDetailsFetchResult? = nil
    var photoArray: [String] = ["Photo1", "Photo2"]
    var isBlueColorClicked: Bool = false
    var isFavorite: Bool = false
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    lazy var productDetailsHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Product Details"
        label.textColor = UIColor(named: "darkBlueColor")
        label.font = UIFont(name: "MarkPro-Medium", size: 18)
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "darkBlueColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "backIcon"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 10
        button.imageEdgeInsets = UIEdgeInsets(top: 11, left: 15, bottom: 12, right: 15)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var cartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "orangeColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "cartTabBarButton"), for: .normal)
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.layer.cornerRadius = 10
        button.imageEdgeInsets = UIEdgeInsets(top: 11, left: 12, bottom: 12, right: 11)
        button.addTarget(self, action: #selector(myCartButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var phoneImagesScrollView: UIScrollView = {
        
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(named: "backgroundWhiteColor")
        scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * photoArray.count - 34 , height: 350)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        
        
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 2
        pageControl.currentPageIndicatorTintColor = UIColor(named: "orangeColor")
        pageControl.pageIndicatorTintColor = UIColor(named: "darkBlueColor")
        pageControl.isEnabled = false
        return pageControl
    }()
    
    
    
    lazy var productDescriptionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.heightAnchor.constraint(equalToConstant: 490).isActive = true
        
        return view
    }()
    
    lazy var phoneNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = phoneData?.title
        label.font = UIFont(name: "MarkPro-Medium", size: 24)
        label.textColor = UIColor(named: "darkBlueColor")
        return label
    }()
    
    lazy var addToFavoriteButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "darkBlueColor")
        button.heightAnchor.constraint(equalToConstant: 37).isActive = true
        button.widthAnchor.constraint(equalToConstant: 37).isActive = true
        button.layer.cornerRadius = 10
        button.imageEdgeInsets = UIEdgeInsets(top: 11, left: 10, bottom: 11, right: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addToFavoriteTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var ratingStackView: UIStackView = {
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "starIcon")
            imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.translatesAutoresizingMaskIntoConstraints = true
            return imageView
        }()
        
        let imageView2: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "starIcon")
            imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.translatesAutoresizingMaskIntoConstraints = true
            return imageView
        }()
        
        let imageView3: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "starIcon")
            imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.translatesAutoresizingMaskIntoConstraints = true
            return imageView
        }()
        
        let imageView4: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "starIcon")
            imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.translatesAutoresizingMaskIntoConstraints = true
            return imageView
        }()
        
        let imageView5: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "starIcon")
            imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.translatesAutoresizingMaskIntoConstraints = true
            return imageView
        }()
        
        let imagesArray = [imageView,imageView2,imageView3,imageView4,imageView5]
        
        let stackView = UIStackView(arrangedSubviews: imagesArray)
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    
    lazy var shopButton: UIButton = {
        let button = UIButton()
        let senderNumber = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Shop", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
        button.setTitleColor(UIColor(named: "darkBlueColor"), for: .normal)
        button.addTarget(self, action: #selector(descriptionCategoryButtonPressed(_ :)), for: .touchUpInside)
        return button
    }()
    
    lazy var detailsButton: UIButton = {
        let button = UIButton()
        let senderNumber = 2
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Details", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro", size: 20)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.addTarget(self, action: #selector(descriptionCategoryButtonPressed(_ :)), for: .touchUpInside)
        return button
    }()
    
    lazy var featuresButton: UIButton = {
        let button = UIButton()
        let senderNumber = 3
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Features", for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro", size: 20)
        button.addTarget(self, action: #selector(descriptionCategoryButtonPressed(_ :)), for: .touchUpInside)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        return button
    }()
    
    lazy var underlineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor  = UIColor(named: "orangeColor")
        view.heightAnchor.constraint(equalToConstant: 3).isActive = true
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.layer.cornerRadius = 1
        return view
    }()

    
    lazy var hardwareStackView: UIStackView = {
        
        let processorView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
            view.widthAnchor.constraint(equalToConstant: 70).isActive = true
            
            let imageView: UIImageView = {
                let imageView = UIImageView()
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.image = UIImage(named: "processorIcon")
                imageView.contentMode = .scaleAspectFill
                imageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
                imageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
                return imageView
            }()
            
            let label: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = UIFont(name: "MarkPro", size: 13)
                label.textColor = UIColor.lightGray
                print("cpu name is \(self.phoneData?.cpu)")
                label.text = self.phoneData?.cpu
                
                return label
            }()
            view.addSubview(imageView)
            view.addSubview(label)
            
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 3)
                ])
            return view
        }()
        
        let cameraView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
            view.widthAnchor.constraint(equalToConstant: 70).isActive = true
            
            let imageView: UIImageView = {
                let imageView = UIImageView()
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.image = UIImage(named: "cameraIcon")
                imageView.contentMode = .scaleAspectFill
                imageView.heightAnchor.constraint(equalToConstant: 26).isActive = true
                imageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
                return imageView
            }()
            
            let label: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = UIFont(name: "MarkPro", size: 13)
                label.textColor = UIColor.lightGray
                label.text = phoneData?.camera
                return label
            }()
            view.addSubview(imageView)
            view.addSubview(label)
            
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5)
                ])
            return view
        }()
        
        let memoryView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
//            view.backgroundColor = .blue
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
            view.widthAnchor.constraint(equalToConstant: 70).isActive = true
            
            let imageView: UIImageView = {
                let imageView = UIImageView()
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.image = UIImage(named: "memoryIcon")
                imageView.contentMode = .scaleAspectFill
                imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
                imageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
                return imageView
            }()
            
            let label: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = UIFont(name: "MarkPro", size: 13)
                label.textColor = UIColor.lightGray
                label.text = phoneData?.memory
                return label
            }()
            view.addSubview(imageView)
            view.addSubview(label)
            
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5)
                ])
            return view
        }()
        
        let flashMemoryView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
//            view.backgroundColor = .blue
            view.heightAnchor.constraint(equalToConstant: 50).isActive = true
            view.widthAnchor.constraint(equalToConstant: 70).isActive = true
            
            let imageView: UIImageView = {
                let imageView = UIImageView()
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.image = UIImage(named: "storageCapacityIcon")
                imageView.contentMode = .scaleAspectFill
                imageView.heightAnchor.constraint(equalToConstant: 26).isActive = true
                imageView.widthAnchor.constraint(equalToConstant: 23).isActive = true
                return imageView
            }()
            
            let label: UILabel = {
                let label = UILabel()
                label.translatesAutoresizingMaskIntoConstraints = false
                label.font = UIFont(name: "MarkPro", size: 13)
                label.textColor = UIColor.lightGray
                label.text = phoneData?.maxSDCapacity
                return label
            }()
            view.addSubview(imageView)
            view.addSubview(label)
            
            NSLayoutConstraint.activate([
                imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5)
                ])
            return view
        }()
        
        
        let stackView = UIStackView(arrangedSubviews: [processorView, cameraView, memoryView, flashMemoryView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    lazy var selectColorAndCapacityLabel: UILabel = {
        let label = UILabel()
        label.text = "Select color and capacity"
        label.font = UIFont(name: "MarkPro-Medium", size: 18)
        label.textColor = UIColor(named: "darkBlueColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var brownColorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.setImage(UIImage(named: "checkmarkIcon"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 14, left: 11, bottom: 14, right: 12)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: "phoneBrownColor")
        button.addTarget(self, action: #selector(selectColorButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var blueColorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.imageEdgeInsets = UIEdgeInsets(top: 14, left: 11, bottom: 14, right: 12)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(named: "darkBlueColor")
        button.addTarget(self, action: #selector(selectColorButtonTapped(_:)), for: .touchUpInside)
        
        return button
    }()
    
    lazy var minStorageCapacityButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle((phoneData?.capacity[0] ?? "0") + " gb", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 15)
        button.backgroundColor = UIColor(named: "orangeColor")
        button.addTarget(self, action: #selector(selectCapacityButtonTapped(_:)), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 75).isActive = true
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    lazy var maxStorageCapacityButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle((phoneData?.capacity[1] ?? "0") + " gb", for: .normal)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 15)
        button.addTarget(self, action: #selector(selectCapacityButtonTapped(_:)), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.widthAnchor.constraint(equalToConstant: 75).isActive = true
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "orangeColor")
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.widthAnchor.constraint(equalToConstant: 370).isActive = true
        guard let price = phoneData?.price else { return button }
        button.setTitle("Add to Cart    $\(price)", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 23)
        return button
    }()
}

extension ProductDetailsView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width * 2)
    }
}
