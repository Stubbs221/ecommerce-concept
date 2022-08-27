//
//  MainScreenInteractor.swift
//  ecommerce-concept
//
//  Created by MAC on 22.08.2022.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

protocol MainScreenInteractorInput {
    var output: MainScreenInteractorOutput? { get set }
    func fetchStoreDate()
}

protocol MainScreenInteractorOutput: AnyObject {
    func interactorDidFetchHomeStore(with result: (Result<[HomeStoreModel], Swift.Error>))
    func interactorDidFetchBestSeller(with result: (Result<[BestSellerModel], Swift.Error>))
}

final class MainScreenInteractor: MainScreenInteractorInput {
    
    
    weak var output: MainScreenInteractorOutput?
    
    let urlString = "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175"
    
    func fetchStoreDate() {
        print("Start fetching on thread \(Thread.current)")
        
        guard let url = URL(string: urlString) else {
            self.output?.interactorDidFetchHomeStore(with: .failure(Error.invalidURL))
            return
        }
        AF.request(url).responseObject { (response: AFDataResponse<MainScreenFetchResult>) in
            switch response.result {
            case .success(let fetchResult):
                print(fetchResult.homeStoreFetchResults[0].title)
                self.output?.interactorDidFetchHomeStore(with: .success(fetchResult.homeStoreFetchResults))
                self.output?.interactorDidFetchBestSeller(with: .success(fetchResult.bestSellerFetchResults))
            case .failure(let error):
                self.output?.interactorDidFetchBestSeller(with: .failure(error))
                self.output?.interactorDidFetchHomeStore(with: .failure(error))
            }
        }
    }
}
