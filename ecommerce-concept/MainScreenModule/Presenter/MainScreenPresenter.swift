//
//  MainScreenPresenter.swift
//  ecommerce-concept
//
//  Created by MAC on 22.08.2022.
//

import Foundation

protocol MainScreenPresenterInput {
    var output: MainScreenPresenterOutput? { get set }
}

protocol MainScreenPresenterOutput: AnyObject{
    
}

final class MainScreenPresenter {
    
    weak var output: MainScreenPresenterOutput?
    
    private let interactor: MainScreenInteractorInput
    private let router: MainScreenRouterInput
    private let view: MainScreenViewInput
    
    init(view: MainScreenViewInput,
         router: MainScreenRouterInput,
         interactor: MainScreenInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension MainScreenPresenter: MainScreenViewOutput {
    
}

extension MainScreenPresenter: MainScreenInteractorOutput {
    
}
