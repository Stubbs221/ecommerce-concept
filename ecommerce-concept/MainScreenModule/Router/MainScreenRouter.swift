//
//  MainScreenRouter.swift
//  ecommerce-concept
//
//  Created by MAC on 22.08.2022.
//

import UIKit

protocol MainScreenRouterInput {
    func showFilterView()
    func showProductDetailsView()
    func showMyCartView()
}

final class MainScreenRouter: MainScreenRouterInput {
    func showProductDetailsView() {
        let vc = ProductDetailsModuleBuilder.buildProductDetailsModule()
        vc.modalPresentationStyle = .fullScreen
        rootViewController?.present(vc, animated: true, completion: nil)
    }
    
    func showFilterView() {
        let child = FilterModuleBuilder.buildFilterModule()
        
        let transition = PanelTransition()
        
        child.transitioningDelegate = transition
        child.modalPresentationStyle = .custom
        
        rootViewController?.present(child, animated: true)
        
//        let vc = FilterModuleBuilder.buildFilterModule()
//        vc.modalPresentationStyle = .overCurrentContext
//        rootViewController?.present(vc, animated: true, completion: nil)
    }
    
    func showMyCartView() {
        let vc = MyCartModuleBuilder.buildMyCartModule()
        vc.modalPresentationStyle = .fullScreen
        rootViewController?.present(vc, animated: true, completion: nil)
    }
    
    weak var rootViewController: UIViewController?
    
}
