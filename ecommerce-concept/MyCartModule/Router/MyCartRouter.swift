//
//  MyCartRouter.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

protocol MyCartRouterInput {
    func dismissMyCartView(itemsInCart: Int)
}

final class MyCartRouter: MyCartRouterInput {
    func dismissMyCartView(itemsInCart: Int) {
        rootViewController?.dismiss(animated: true)
    }
    
    weak var rootViewController: UIViewController?
}
