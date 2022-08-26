//
//  MainScreenModel.swift
//  ecommerce-concept
//
//  Created by MAC on 26.08.2022.
//

import Foundation
import ObjectMapper

struct MainScreenFetchResult: Mappable {
    
    var homeStoreFetchResults: [HomeStoreModel] = []
    var bestSellerFetchResults: [BestSellerModel] = []
    
    init?(map: Map) { }
    
    init?(homeStore: [HomeStoreModel], bestSeller: [BestSellerModel]) {
        self.homeStoreFetchResults = homeStore
        self.bestSellerFetchResults = bestSeller
    }
    
    mutating func mapping(map: Map) {
        homeStoreFetchResults <- map["home_store"]
        bestSellerFetchResults <- map["best_seller"]
    }
}

struct HomeStoreModel: Mappable {
    
    var phoneId: Int = 0
    var isNew: Bool = false
    var title: String = ""
    var subTitle: String = ""
    var pictureURL: String = ""
    var isBuy: Bool = false
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        phoneId <- map["id"]
        isNew <- map["is_new"]
        subTitle <- map["subtitle"]
        title <- map["title"]
        pictureURL <- map["picture"]
        isBuy <- map["is_buy"]
    }
}

struct BestSellerModel: Mappable {
    
    var phoneId: Int = 0
    var isFavorites: Bool = false
    var title: String = ""
    var priceWithoutDiscount: Int = 0
    var discountPrice: Int = 0
    var pictureURL: String = ""
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        phoneId <- map["id"]
        isFavorites <- map["is_favorites"]
        title <- map["title"]
        priceWithoutDiscount <- map["price_without_discount"]
        discountPrice <- map["discount_price"]
        pictureURL <- map["picture"]
    }
}

enum Error: Swift.Error {
    case invalidURL
    case noData
    case unknownAPIResponse
}
