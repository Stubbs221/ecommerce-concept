//
//  FilterPresenter.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import Foundation

protocol FilterPresenterInput {
    var output: FilterPresenterOutput? { get set }
}

protocol FilterPresenterOutput: AnyObject {
    
}

final class FilterPresenter {
    
    weak var output: FilterPresenterOutput?
    
    private let interactor: FilterInteractorInput
    private let router: FilterRouterInput
    private let view: FilterViewInput
    
    init(view: FilterViewInput, router: FilterRouterInput, interactor: FilterInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}


extension FilterPresenter: FilterViewOutput {
    
}

extension FilterPresenter: FilterInteractorOutput {
    
}
