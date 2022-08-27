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

protocol ProductDetailsPresenterOutput: AnyObject {
    
}

final class ProductDetailsPresenter {
    
    weak var output: ProductDetailsInteractorOutput?
    
    private let interactor: ProductDetailsInteractorInput
    private let router: ProductDetailsRouterInput
    private let view: ProductDetailsViewInput
    
    let queue2 = DispatchQueue(label: "queue1", qos: .userInitiated, attributes: .concurrent)
    
    init(view: ProductDetailsViewInput,
         router: ProductDetailsRouterInput,
         interactor: ProductDetailsInteractorInput) {
        self.interactor = interactor
        
        queue2.async {
            interactor.fetchPhoneData()
        }
        
        
        self.view = view
        self.router = router
    }
}

extension ProductDetailsPresenter: ProductDetailsViewOutput {
    func userSelectReturnItemsInCartCount() -> Int {
        interactor.returnItemsInCartCount()
    }
    
    func userSelectOpenMyCartViewFromProductDetailsView() {
        router.showMyCartView()
    }
    
    func userSelectDismissProductDetailsView() {
        router.dismissProductDetailsView()
    }
    
    func userSelectAddToCartButton() {
        interactor.increaseItemsInCart()
    }
    
    
}

extension ProductDetailsPresenter: ProductDetailsInteractorOutput {
    func interactorDidFetchPhoneData(with result: Result<ProductDetailsFetchResult, Swift.Error>) {
        switch result {
        case .success(let phoneDataFetchResult):
            view.updatePhoneData(with: phoneDataFetchResult)
        case .failure:
            view.updatePhoneData(with: "Something went wrong")
            
        }
    }
    
    
}
