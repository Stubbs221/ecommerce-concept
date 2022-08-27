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
    
    var queue3 = DispatchQueue(label: "queue3", qos: .userInitiated, attributes: .concurrent)
    
    private let interactor: MyCartInteractorInput
    private let router: MyCartRouterInput
    private let view: MyCartViewInput
    
    
    init(view: MyCartViewInput,
         router: MyCartRouterInput,
         interactor: MyCartInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
        queue3.async {
            interactor.fetchCartData()
        }
        
    }
}

extension MyCartPresenter: MyCartViewOutput {
    func userSelectReturnItemsInCartCount() -> Int {
        interactor.returnItemsInCartCount() 
    }
    
    func userSelectIncraeseItemsInCartCount() {
        interactor.increaseItemsInCartCount()
    }
    
    func userSelectDecreaseItemsInCartCount() {
        interactor.decreaseItemsInCartCount()
    }
    
    func userSelectDismissView(itemsInCart: Int) {
        router.dismissMyCartView(itemsInCart: itemsInCart)
    }
}

extension MyCartPresenter: MyCartInteractorOutput {
    
    func interactorDidFetchCartData(with result: (Result<CartData, Swift.Error>)) {
        switch result {
        case .success(let cartDataFetchResult):
            view.updateCartData(with: cartDataFetchResult)
        case .failure:
            view.updateCartData(with: "Something went wrong")
        }
    }
}
