//
//  MainScreenView.swift
//  ecommerce-concept
//
//  Created by MAC on 22.08.2022.
//

import UIKit
import Kingfisher

protocol MainScreenViewInput {
    var output: MainScreenViewOutput? { get set }
    
    var bestSellerArray: [BestSellerModel] { get set }
    func userSelectOpenProductDetailViewThroughCollectionView()

    func updateHomeStore(with homeStore: [HomeStoreModel])
    func updateHomeStore(with error: String)
    func updateBestSeller(with bestSeller: [BestSellerModel])
    func updateBestSeller(with error: String)
}

protocol MainScreenViewOutput {
    
    func userSelectOpenFilter()
    func userSelectOpenProductDetailView()
    func userSelectOpenMyCartView()
    
}

class MainScreenView: UIViewController, MainScreenViewInput {
    
    var homeStoreArray: [HomeStoreModel] = []
    var bestSellerArray: [BestSellerModel] = []
    
    var output: MainScreenViewOutput?
    
    var timer = Timer()
    
//    MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        itemsInCartLabel.text = String(ItemsInCart.shared.getItemsCount())
        ItemsInCart.shared.getItemsCount() == 0 ? (itemsInCartLabel.isHidden = true) :  (itemsInCartLabel.isHidden = false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true, block: { [ weak self ] _ in
            guard let self = self else { return }
            let scrollWidth = self.hotSalesScrollView.bounds.width
            let currentXOffset = self.hotSalesScrollView.contentOffset.x
            
            let lastXPos = currentXOffset + scrollWidth
            if lastXPos != self.hotSalesScrollView.contentSize.width {
                print("Scroll")
                self.hotSalesScrollView.setContentOffset(CGPoint(x: lastXPos, y: 0), animated: true)
            } else {
                print("Scroll to start")
                self.hotSalesScrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
//    MARK: UI Elements
    
    lazy var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(named: "backgroundWhiteColor")
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = UIColor(named: "backgroundWhiteColor")

        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
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
        button.addTarget(self, action: #selector(filterButtonPressed), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 16),
            button.widthAnchor.constraint(equalToConstant: 14)])
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
    
    lazy var searchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 19
        view.heightAnchor.constraint(equalToConstant: 38).isActive = true
        view.widthAnchor.constraint(equalToConstant: 290).isActive = true
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        
        
        
        let magnifyingGlassIcon: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "magnifyingGlassIcon")
            imageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
            return imageView
        }()
        
        let searchTextField: UITextField = {
            let textField = UITextField()
            let attributedPlaceHolder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.font: UIFont(name: "MarkPro", size: 15), NSAttributedString.Key.foregroundColor: UIColor.systemGray])
            textField.attributedPlaceholder = attributedPlaceHolder
            textField.font = UIFont(name: "MarkPro", size: 15)
            textField.textColor = UIColor(named: "darkBlueColor")
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.heightAnchor.constraint(equalToConstant: 20).isActive = true
            textField.widthAnchor.constraint(equalToConstant: 180).isActive = true
            textField.textAlignment = .left
            return textField
        }()
        
        view.addSubview(magnifyingGlassIcon)
        view.addSubview(searchTextField)
        
        NSLayoutConstraint.activate([
            magnifyingGlassIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            magnifyingGlassIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            searchTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: magnifyingGlassIcon.trailingAnchor, constant: 15)])
        
        return view
    }()
    
    lazy var itemsInCartLabel: UILabel = {
        let label = UILabel()
        label.text = String(ItemsInCart.shared.getItemsCount())
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        label.textColor = .white
        label.heightAnchor.constraint(equalToConstant: 16).isActive = true
        label.widthAnchor.constraint(equalToConstant: 16).isActive = true
        label.font = UIFont(name: "MarkPro-Medium", size: 10)
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8
        return label
    }()
    
    lazy var scanQRButton: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "orangeColor")
        view.layer.cornerRadius = 19
        view.heightAnchor.constraint(equalToConstant: 38).isActive = true
        view.widthAnchor.constraint(equalToConstant: 38).isActive = true
        
        let qrImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "scanQRButton")
            imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        view.addSubview(qrImage)
        NSLayoutConstraint.activate([
            qrImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            qrImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        return view
    }()
    
    lazy var hotSalesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hot Sales"
        label.textColor = UIColor(named: "darkBlueColor")
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        return label
    }()
    
    lazy var seeMoreLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "orangeColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "see more"
        label.font = UIFont(name: "MarkPro", size: 15)
        return label
    }()
    
    lazy var hotSalesScrollView: UIScrollView = {
        
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(named: "backgroundWhiteColor")
        scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * 3 , height: 200)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        

        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = UIColor(named: "orangeColor")
        pageControl.pageIndicatorTintColor = UIColor(named: "darkBlueColor")
        pageControl.isEnabled = false
        return pageControl
    }()
    
    lazy var bestSellerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Best Seller"
        label.textColor = UIColor(named: "darkBlueColor")
        label.font = UIFont(name: "MarkPro-Bold", size: 25)
        return label
    }()
    
    lazy var seeMoreSecondLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "orangeColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "see more"
        label.font = UIFont(name: "MarkPro", size: 15)
        return label
    }()
    
    lazy var bestSellerCollectionView: BestSellerCollectionView = {
        let collectionView = BestSellerCollectionView(vc: self)
        return collectionView
    }()
    
    lazy var customTabBar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "darkBlueColor")
        view.layer.cornerRadius = 40
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let dotImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = UIImage(named: "roundDotIcon")
            return imageView
        }()
        
        let explorerLabel: UILabel = {
            let label = UILabel()
            label.text = "Explorer"
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: "MarkPro-Bold", size: 19)
            return label
        }()
        
        let cartButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.contentMode = .scaleAspectFill
            button.setImage(UIImage(named: "cartTabBarButton"), for: .normal)
            button.addTarget(self, action: #selector(userSelectMyCart), for: .touchUpInside)
            return button
        }()
        
        let favoriteButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.contentMode = .scaleToFill
            button.setImage(UIImage(named: "favoriteTabBarButton"), for: .normal)
            return button
        }()
        
        let profileButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.contentMode = .scaleAspectFill
            button.setImage(UIImage(named: "UserTabBarButton"), for: .normal)
            return button
        }()
        
        view.addSubview(dotImageView)
        view.addSubview(explorerLabel)
        view.addSubview(cartButton)
        view.addSubview(favoriteButton)
        view.addSubview(profileButton)
        view.addSubview(itemsInCartLabel)
        
        NSLayoutConstraint.activate([
            dotImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -10),
            dotImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            dotImageView.widthAnchor.constraint(equalToConstant: 10),
            dotImageView.heightAnchor.constraint(equalToConstant: 10)])
        
        NSLayoutConstraint.activate([
            explorerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -10),
            explorerLabel.leadingAnchor.constraint(equalTo: dotImageView.trailingAnchor, constant: 10)])
        
        NSLayoutConstraint.activate([
            cartButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -10),
            cartButton.leadingAnchor.constraint(equalTo: explorerLabel.trailingAnchor, constant: 40),
            cartButton.heightAnchor.constraint(equalToConstant: 22),
            cartButton.widthAnchor.constraint(equalToConstant: 22)])
        
        NSLayoutConstraint.activate([
            favoriteButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -10),
            favoriteButton.leadingAnchor.constraint(equalTo: cartButton.trailingAnchor, constant: 49),
            favoriteButton.heightAnchor.constraint(equalToConstant: 21),
            favoriteButton.widthAnchor.constraint(equalToConstant: 22)])
        
        NSLayoutConstraint.activate([
            profileButton.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -10),
            profileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -65),
            profileButton.heightAnchor.constraint(equalToConstant: 22),
            profileButton.widthAnchor.constraint(equalToConstant: 22)])
        
        NSLayoutConstraint.activate([
            itemsInCartLabel.topAnchor.constraint(equalTo: cartButton.topAnchor, constant: -8),
            itemsInCartLabel.trailingAnchor.constraint(equalTo: cartButton.trailingAnchor, constant: 8)])
        return view
    }()
    
}

extension MainScreenView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
