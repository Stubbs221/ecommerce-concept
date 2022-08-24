//
//  ProductDetailsView.swift
//  ecommerce-concept
//
//  Created by MAC on 24.08.2022.
//

import UIKit

protocol ProductDetailsViewInput {
    var output: ProductDetailsViewOutput? { get set }
}

protocol ProductDetailsViewOutput {
//    add cart icon, add add to cart button, phone data generator, add favorite button
}

class ProductDetailsView: UIViewController, ProductDetailsInteractorOutput {

    var output: ProductDetailsInteractorOutput?
    
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
