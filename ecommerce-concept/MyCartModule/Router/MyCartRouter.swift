//
//  MyCartRouter.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

protocol MyCartRouterInput {
    func dismissMyCartView()
}

final class MyCartRouter: MyCartRouterInput {
    func dismissMyCartView() {
        rootViewController?.dismiss(animated: true)
    }
    
    
    weak var rootViewController: UIViewController?
}
