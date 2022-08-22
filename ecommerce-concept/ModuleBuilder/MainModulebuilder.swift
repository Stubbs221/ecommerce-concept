//
//  MainModulebuilder.swift
//  ecommerce-concept
//
//  Created by MAC on 22.08.2022.
//

import UIKit

class MainModuleBuilder {
    static func buildMainModule() -> UIViewController {
        let view = MainScreenView()
        let interactor = MainScreenInteractor()
        let router = MainScreenRouter()
        let presenter = MainScreenPresenter(view: view, router: router, interactor: interactor)
        
        interactor.output = presenter
        view.output = presenter
        
        router.rootViewController = view
        return view
    }
}
