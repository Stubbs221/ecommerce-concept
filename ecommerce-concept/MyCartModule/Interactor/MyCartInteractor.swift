//
//  MyCartInteractor.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol MyCartInteractorInput {
    var output: MyCartInteractorOutput? { get set }
    func fetchCartData()
}

protocol MyCartInteractorOutput: AnyObject {
    func interactorDidFetchCartData(with result: (Result<CartData, Swift.Error>))
}

final class MyCartInteractor: MyCartInteractorInput {
 
    
    var output: MyCartInteractorOutput?
    
    let urlString = "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"
    
    func fetchCartData() {
        print("Start fetching cart data")
        guard let url = URL(string: urlString) else {
            self.output?.interactorDidFetchCartData(with: .failure(Error.invalidURL))
            return
        }
        
        AF.request(url).responseObject { (response: AFDataResponse<CartData>) in
            switch response.result {
            case .success(let fetchResult):
                self.output?.interactorDidFetchCartData(with: .success(fetchResult))
            case .failure(let error):
                self.output?.interactorDidFetchCartData(with: .failure(error))
            }
        }
    }
}
