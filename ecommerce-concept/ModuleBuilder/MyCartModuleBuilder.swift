//
//  MyCartModuleBuilder.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

class MyCartModuleBuilder {
    static func buildMyCartModule() -> UIViewController {
        let view = MyCartView()
        let interactor = MyCartInteractor()
        let router = MyCartRouter()
        let presenter = MyCartPresenter(view: view, router: router, interactor:  interactor)
        
        interactor.output = presenter
        view.output = presenter
        
        router.rootViewController = view
        return view
    }
}
