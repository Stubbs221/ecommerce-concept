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
    var hotSalesArray: [String] = ["Iphone", "Samsung", "Xiaomi"]
    var timer = Timer()
    
    var yOffset: CGFloat = 0
    
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
        scrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * hotSalesArray.count - 34 * 3, height: 200)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.addSubview(addPage(title: hotSalesArray[0], position: 0))
        scrollView.addSubview(addPage(title: hotSalesArray[1], position: 1))
        scrollView.addSubview(addPage(title: hotSalesArray[2], position: 2))
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
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
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
    
    func addPage(title: String, position: CGFloat) -> UIView {
        let label = UILabel()
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 20

        print(title)
        label.text = title
        label.textAlignment = .center
        label.textColor = UIColor(named: "orangeColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        let screenWidth = UIScreen.main.bounds.width
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        view.frame = CGRect(x: screenWidth * position - 34 * position, y: 0, width: screenWidth - 34, height: 200)
        return view
    }
    
    
    
    
    
}

extension MainScreenView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width * 2)
    }
    
}
//extension MainScreenView: MainScreenViewInput {
//    var output: MainScreenViewInput?
//
//
//}
