//
//  ProductDetailsModuleBuilder.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

class ProductDetailsModuleBuilder {
    static func buildProductDetailsModule() -> UIViewController {
        let  view = ProductDetailsView()
        let interactor = ProductDetailsInteractor()
        let router = ProductDetailsRouter()
        let presenter = ProductDetailsPresenter(view: view, router: router, interactor: interactor)
        
        interactor.output = presenter
        view.output = presenter
        
        router.rootViewController = view
        return view
    }
}
