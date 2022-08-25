//
//  FilterModuleBuilder.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

class FilterModuleBuilder {
    static func buildFilterModule() -> UIViewController {
        let view = FilterView()
        let interactor = FilterInteractor()
        let router = FilterRouter()
        let presenter = FilterPresenter(view: view, router: router, interactor: interactor)
        
        interactor.output = presenter
        view.output = presenter
    
        router.rootViewController = view
        return view
    }
}
