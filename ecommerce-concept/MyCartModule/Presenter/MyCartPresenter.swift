//
//  MyCartPresenter.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import Foundation

protocol MyCartPresenterInput {
    var output: MyCartPresenterOutput? { get set }
    
}

protocol MyCartPresenterOutput: AnyObject {
    
}

final class MyCartPresenter {
    
    weak var output: MyCartPresenterOutput?
    
    private let interactor: MyCartInteractorInput
    private let router: MyCartRouterInput
    private let view: MyCartViewInput
    
    init(view: MyCartViewInput,
         router: MyCartRouterInput,
         interactor: MyCartInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension MyCartPresenter: MyCartViewOutput {
    
}

extension MyCartPresenter: MyCartInteractorOutput {
    
}
