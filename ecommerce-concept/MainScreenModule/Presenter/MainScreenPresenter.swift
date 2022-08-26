//
//  MainScreenPresenter.swift
//  ecommerce-concept
//
//  Created by MAC on 22.08.2022.
//

import UIKit
import ObjectMapper
import AlamofireObjectMapper
import Alamofire

protocol MainScreenPresenterInput {
    var output: MainScreenPresenterOutput? { get set }
}

protocol MainScreenPresenterOutput: AnyObject{
    
}

class MainScreenPresenter {
    
    weak var output: MainScreenPresenterOutput?
    
    private var interactor: MainScreenInteractorInput
    private var router: MainScreenRouterInput
    private var view: MainScreenViewInput
    
    init(view: MainScreenViewInput,
         router: MainScreenRouterInput,
         interactor: MainScreenInteractorInput) {
        self.view = view
        self.router = router
        self.interactor = interactor
        interactor.fetchStoreDate()
    }
}

extension MainScreenPresenter: MainScreenViewOutput {
    func userSelectOpenMyCartView() {
        router.showMyCartView()
    }
    
    func userSelectOpenProductDetailView() {
        router.showProductDetailsView()
    }
    
    func userSelectOpenFilter() {
        router.showFilterView()
    }
}

extension MainScreenPresenter: MainScreenInteractorOutput {
 
    func interactorDidFetchHomeStore(with result: Result<[HomeStoreModel], Swift.Error>) {
        switch result {
        case .success(let homeStoreFetchResult):
            view.updateHomeStore(with: homeStoreFetchResult)
        case .failure:
            view.updateHomeStore(with: "Something went wrong")
        }
    }
    
    func interactorDidFetchBestSeller(with result: Result<[BestSellerModel], Swift.Error>) {
        switch result {
        case .success(let bestSellerFetchResult):
            view.updateBestSeller(with: bestSellerFetchResult)
        case .failure:
            view.updateBestSeller(with: "Something went wrong")
        }
    }
}
