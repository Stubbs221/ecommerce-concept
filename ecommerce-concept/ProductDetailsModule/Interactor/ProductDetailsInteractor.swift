//
//  ProductDetailsInteractor.swift
//  ecommerce-concept
//
//  Created by MAC on 24.08.2022.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol ProductDetailsInteractorInput {
    var output: ProductDetailsInteractorOutput? { get set }
    func fetchPhoneData()
    func returnItemsInCartCount() -> Int
    func increaseItemsInCart()
    
}

protocol ProductDetailsInteractorOutput: AnyObject {
    func interactorDidFetchPhoneData(with result: Result<ProductDetailsFetchResult, Swift.Error>)
    
}

final class ProductDetailsInteractor: ProductDetailsInteractorInput {
    
    
    weak var output: ProductDetailsInteractorOutput?
    
    let urlString = "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
    
    func fetchPhoneData() {
        print("Start fetching phoneData")
        guard let url = URL(string: urlString) else {
            self.output?.interactorDidFetchPhoneData(with: .failure(Error.invalidURL))
            return
        }
        AF.request(url).responseObject { (response: AFDataResponse<ProductDetailsFetchResult>) in
//            print("AF request was made on \(Thread.current) thread")
            switch response.result {
            case .success(let fetchResult):
                self.output?.interactorDidFetchPhoneData(with: .success(fetchResult))
            case .failure(let error):
                self.output?.interactorDidFetchPhoneData(with: .failure(error))
            }
        }
    }
    
    func returnItemsInCartCount() -> Int {
        ItemsInCart.shared.getItemsCount()
    }
    
    func increaseItemsInCart() {
        ItemsInCart.shared.increaseItems()
    }
    
}
