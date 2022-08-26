//
//  FilterView.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

protocol FilterViewInput {
    var output: FilterViewOutput? { get set }
}

protocol FilterViewOutput {
    func userSelectDismissFilterView()
}

class FilterView: UIViewController, FilterViewInput {
    
    
    var output: FilterViewOutput?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    lazy var filterHalfScreenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        return view
    }()
    
    lazy var closeFilterButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.backgroundColor = UIColor(named: "darkBlueColor")
        button.setImage(UIImage(named: "crossButtonIcon"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 13, left: 13, bottom: 13, right: 13)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var filterOptionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Filter options"
        label.textColor = UIColor(named: "darkBlueColor")
        label.font = UIFont(name: "MarkPro-Medium", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(named: "orangeColor")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "MarkPro-Medium", size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 90).isActive = true
        button.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var brandLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Medium", size: 20)
        label.textColor = UIColor(named: "darkBlueColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Brand"
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Medium", size: 20)
        label.textColor = UIColor(named: "darkBlueColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price"
        return label
    }()
    
    lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Medium", size: 20)
        label.textColor = UIColor(named: "darkBlueColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Size"
        return label
    }()
    
    lazy var brandDropDown: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.widthAnchor.constraint(equalToConstant: 360).isActive = true
        
        let label: UILabel = {
            let label = UILabel()
            label.text = "Samsung"
            label.font = UIFont(name: "MarkPro", size: 20)
            label.textColor = UIColor(named: "darkBlueColor")
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "arrowDownIcon")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            
            return imageView
        }()
        
        view.addSubview(label)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        return view
    }()
    
    lazy var priceDropDown: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.widthAnchor.constraint(equalToConstant: 360).isActive = true
        
        let label: UILabel = {
            let label = UILabel()
            label.text = "$300-$500"
            label.font = UIFont(name: "MarkPro", size: 20)
            label.textColor = UIColor(named: "darkBlueColor")
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "arrowDownIcon")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            
            return imageView
        }()
        
        view.addSubview(label)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        return view
    }()
    
    lazy var sizeDropDown: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.heightAnchor.constraint(equalToConstant: 40).isActive = true
        view.widthAnchor.constraint(equalToConstant: 360).isActive = true
        
        let label: UILabel = {
            let label = UILabel()
            label.text = "4.5 to 5.5 inches"
            label.font = UIFont(name: "MarkPro", size: 20)
            label.textColor = UIColor(named: "darkBlueColor")
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
        }()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "arrowDownIcon")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
            
            return imageView
        }()
        
        view.addSubview(label)
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        return view
    }()
    
    
    @objc func closeButtonPressed() {
        output?.userSelectDismissFilterView()
    }
    /*
     
     
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
