//
//  ProductDetailsRouter.swift
//  ecommerce-concept
//
//  Created by MAC on 24.08.2022.
//

import UIKit

protocol ProductDetailsRouterInput {
        func dismissProductDetailsView()
        func addToCartButtonSelected()
        func showMyCartView()
}

final class ProductDetailsRouter: ProductDetailsRouterInput {
    func showMyCartView() {
        let vc = MyCartModuleBuilder.buildMyCartModule()
        vc.modalPresentationStyle = .fullScreen
        rootViewController?.present(vc, animated: true)
    }
    
    func dismissProductDetailsView() {
        rootViewController?.dismiss(animated: true)
    }
    
    func addToCartButtonSelected() {
        
    }

    weak var rootViewController: UIViewController?
    
}
