//
//  ProductDetailsPresenter.swift
//  ecommerce-concept
//
//  Created by MAC on 24.08.2022.
//

import Foundation

protocol ProductDetailsPresenterInput {
    var output: ProductDetailsPresenterOutput? { get set }
}

protocol ProductDetailsPresenterOutput {
    
}

final class ProductDetailsPresenter {
    
    weak var output: ProductDetailsInteractorOutput?
    
    private let interactor: ProductDetailsInteractorInput
    private let router: ProductDetailsRouterInput
    private let view: ProductDetailsViewInput
    
    init(view: ProductDetailsViewInput,
         router: ProductDetailsRouterInput,
         interactor: ProductDetailsInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension ProductDetailsPresenter: ProductDetailsViewOutput {
    
}

extension ProductDetailsPresenter: ProductDetailsInteractorOutput {
    
}
