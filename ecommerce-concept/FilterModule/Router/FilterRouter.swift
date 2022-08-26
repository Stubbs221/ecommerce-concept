//
//  FilterRouter.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

protocol FilterRouterInput {
    func dismissFilterView()
}

final class FilterRouter: FilterRouterInput {
    func dismissFilterView() {
        rootViewController?.dismiss(animated: true)
    }
    
    
    weak var rootViewController: UIViewController? 
}
