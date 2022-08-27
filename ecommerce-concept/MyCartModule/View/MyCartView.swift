//
//  MyCartView.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit
import Kingfisher


protocol MyCartViewInput {
    var output: MyCartViewOutput? { get set }
    
    
    func updateCartData(with cartData: CartData)
    func updateCartData(with error: String)
}

protocol MyCartViewOutput {
    
    
    func userSelectDismissView(itemsInCart: Int)
    
}

class MyCartView: UIViewController, MyCartViewInput {
    func updateCartData(with cartData: CartData) {
        self.cartData = cartData
        setupUI()
        self.totalMoneyLabel.text = "$" + String(cartData.totalPrice) + " us"
        self.deliveryCostLabel.text = cartData.delivery
    }
    
    func updateCartData(with error: String) {
        print(error)
    }
    
    
    var output: MyCartViewOutput? // ref to presenter
    var cartData: CartData?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let itemsInView = (Int(amountLabelOfSecondPhone.text ?? "") ?? 0) + (Int(amountLabelOfFirstPhone.text ?? "") ?? 0)
        if itemsInView > ItemsInCart.shared.getItemsCount() {
            for i in (ItemsInCart.shared.getItemsCount())..<itemsInView {
                ItemsInCart.shared.increaseItems()
            }
        } else {
            for i in itemsInView..<(ItemsInCart.shared.getItemsCount()) {
                ItemsInCart.shared.decreaseItems()
            }
        }
    }
    
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
    
    lazy var addAddressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Add address"
        label.font = UIFont(name: "MarkPro-Medium", size: 18)
        label.textColor = UIColor(named: "darkBlueColor")
        return label
    }()
    
    lazy var findMyGeoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "orangeColor")
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "geoIconWhite"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.imageEdgeInsets = UIEdgeInsets(top: 9, left: 12, bottom: 10, right: 11)
        return button
    }()
    
    lazy var myCartLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My Cart"
        label.font = UIFont(name: "MarkPro-Bold", size: 40)
        label.textColor = UIColor(named: "darkBlueColor")
        return label
    }()
    
    lazy var myCartInnerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkBlueColor")
        view.heightAnchor.constraint(equalToConstant: 750).isActive = true
        view.layer.cornerRadius = 30
        return view
    }()
    
    lazy var firstPhoneView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkBlueColor")
        view.heightAnchor.constraint(equalToConstant: 90).isActive = true
        view.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.cornerRadius = 5
            imageView.backgroundColor = .white
            guard let url = URL(string: cartData?.basket[0].imageURLString ?? "" ) else { return imageView }
            imageView.kf.setImage(with: url)
            imageView.layer.masksToBounds = true
            imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
            return imageView
        }()
        
        let phoneNameLabel: UILabel = {
            let label = UILabel()
            label.text = cartData?.basket[0].title
            label.numberOfLines = 2
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: "MarkPro-Medium", size: 20)
            label.textColor = .white
            return label
        }()
        
        let phonePriceLabel: UILabel = {
            let label = UILabel()
            label.text = "$" + String(cartData?.basket[0].price ?? 1) + ".00"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: "orangeColor")
            label.font = UIFont(name: "MarkPro-Medium", size: 20)
            return label
        }()
        
        let changeAmountView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(named: "grayBlueColor")
            view.heightAnchor.constraint(equalToConstant: 70).isActive = true
            view.widthAnchor.constraint(equalToConstant: 28).isActive = true
            view.layer.cornerRadius = 14
            
            
            
            
            
            view.addSubview(decreaseAmountButtonTwo)
            view.addSubview(increaseAmountButtonTwo)
            view.addSubview(amountLabelOfFirstPhone)
            
            NSLayoutConstraint.activate([
                amountLabelOfFirstPhone.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                amountLabelOfFirstPhone.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                decreaseAmountButtonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                decreaseAmountButtonTwo.bottomAnchor.constraint(equalTo: amountLabelOfFirstPhone.topAnchor, constant: -3),
                increaseAmountButtonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                increaseAmountButtonTwo.topAnchor.constraint(equalTo: amountLabelOfFirstPhone.bottomAnchor, constant: 4)])
            return view
        }()
        
        lazy var deleteItemButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "deleteItemIcon"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 20).isActive = true
            button.widthAnchor.constraint(equalToConstant: 20).isActive = true
            return button
        }()
        
        view.addSubview(imageView)
        view.addSubview(phoneNameLabel)
        view.addSubview(phonePriceLabel)
        view.addSubview(changeAmountView)
        view.addSubview(deleteItemButton)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)])
        
        NSLayoutConstraint.activate([
            phoneNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            phoneNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            phoneNameLabel.trailingAnchor.constraint(equalTo: changeAmountView.leadingAnchor, constant: -3)])
        
        NSLayoutConstraint.activate([
            phonePriceLabel.leadingAnchor.constraint(equalTo: phoneNameLabel.leadingAnchor),
            phonePriceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)])
        
        NSLayoutConstraint.activate([
            changeAmountView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            changeAmountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)])
        
        NSLayoutConstraint.activate([
            deleteItemButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            deleteItemButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        return view
    }()
    
    lazy var secondPhoneView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "darkBlueColor")
        view.heightAnchor.constraint(equalToConstant: 90).isActive = true
        view.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.layer.cornerRadius = 5
            imageView.backgroundColor = .white
            guard let url = URL(string: cartData?.basket[1].imageURLString ?? "" ) else { return imageView }
            imageView.kf.setImage(with: url)
            imageView.contentMode = .scaleAspectFill
            imageView.layer.masksToBounds = true
            imageView.heightAnchor.constraint(equalToConstant: 90).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
            return imageView
        }()
        
        let phoneNameLabel: UILabel = {
            let label = UILabel()
            label.text = cartData?.basket[1].title
            label.numberOfLines = 2
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: "MarkPro-Medium", size: 20)
            label.textColor = .white
            return label
        }()
        
        let phonePriceLabel: UILabel = {
            let label = UILabel()
            label.text = "$" + String(cartData?.basket[1].price ?? 1) + ".00"
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor(named: "orangeColor")
            
            label.font = UIFont(name: "MarkPro-Medium", size: 20)
            return label
        }()
        
        let changeAmountView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(named: "grayBlueColor")
            view.heightAnchor.constraint(equalToConstant: 70).isActive = true
            view.widthAnchor.constraint(equalToConstant: 28).isActive = true
            view.layer.cornerRadius = 14
        
            view.addSubview(decreaseAmountButtonOne)
            view.addSubview(increaseAmountButtonOne)
            view.addSubview(amountLabelOfSecondPhone)
            
            NSLayoutConstraint.activate([
                amountLabelOfSecondPhone.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                amountLabelOfSecondPhone.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                decreaseAmountButtonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                decreaseAmountButtonOne.bottomAnchor.constraint(equalTo: amountLabelOfSecondPhone.topAnchor, constant: -3),
                increaseAmountButtonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                increaseAmountButtonOne.topAnchor.constraint(equalTo: amountLabelOfSecondPhone.bottomAnchor, constant: 4)])
            return view
        }()
        
        lazy var deleteItemButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "deleteItemIcon"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 20).isActive = true
            button.widthAnchor.constraint(equalToConstant: 20).isActive = true
            return button
        }()
        
        view.addSubview(imageView)
        view.addSubview(phoneNameLabel)
        view.addSubview(phonePriceLabel)
        view.addSubview(changeAmountView)
        view.addSubview(deleteItemButton)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor)])
        
        NSLayoutConstraint.activate([
            phoneNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            phoneNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            phoneNameLabel.trailingAnchor.constraint(equalTo: changeAmountView.leadingAnchor, constant: -3)])
        
        NSLayoutConstraint.activate([
            phonePriceLabel.leadingAnchor.constraint(equalTo: phoneNameLabel.leadingAnchor),
            phonePriceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        NSLayoutConstraint.activate([
            changeAmountView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            changeAmountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)])
        
        NSLayoutConstraint.activate([
            deleteItemButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            deleteItemButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        return view
    }()
    
    lazy var amountLabelOfFirstPhone: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MarkPro-Medium", size: 20)
        label.textColor = UIColor.white
        return label
    }()
    
    let decreaseAmountButtonOne: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "decreaseIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 11).isActive = true
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        button.widthAnchor.constraint(equalToConstant: 11).isActive = true
        button.addTarget(self, action: #selector(decreaseItemsInCartByOne(_:)), for: .touchUpInside)
        return button
    }()
    
    let increaseAmountButtonOne: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "increaseIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 11).isActive = true
        button.widthAnchor.constraint(equalToConstant: 11).isActive = true
        button.addTarget(self, action: #selector(increaseItemsInCartByOne(_:)), for: .touchUpInside)
        return button
    }()
    
    let decreaseAmountButtonTwo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "decreaseIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 11).isActive = true
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        button.widthAnchor.constraint(equalToConstant: 11).isActive = true
        button.addTarget(self, action: #selector(decreaseItemsInCartByOne(_:)), for: .touchUpInside)
        return button
    }()
    
    let increaseAmountButtonTwo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "increaseIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 11).isActive = true
        button.widthAnchor.constraint(equalToConstant: 11).isActive = true
        button.addTarget(self, action: #selector(increaseItemsInCartByOne(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var amountLabelOfSecondPhone: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MarkPro-Medium", size: 20)
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var firstLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        view.backgroundColor = UIColor(named: "grayBlueColor")
        return view
    }()
    
    lazy var secondLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        view.backgroundColor = UIColor(named: "grayBlueColor")
        return view
    }()
    
    lazy var totalTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.textColor = .white
        label.font = UIFont(name: "MarkPro", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var deliveryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivery"
        label.textColor = .white
        label.font = UIFont(name: "MarkPro", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var totalMoneyLabel: UILabel = {
        let label = UILabel()
        label.text = "$0000 us"
        label.font = UIFont(name: "MarkPro-Bold", size: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var deliveryCostLabel: UILabel = {
        let label = UILabel()
        label.text = "Free"
        label.font = UIFont(name: "MarkPro-Bold", size: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var checkOutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "orangeColor")
        button.layer.cornerRadius = 10
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.widthAnchor.constraint(equalToConstant: 340).isActive = true
        button.setTitle("Checkout", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "MarkPro-Bold", size: 20)
        return button
    }()
  
    
}
