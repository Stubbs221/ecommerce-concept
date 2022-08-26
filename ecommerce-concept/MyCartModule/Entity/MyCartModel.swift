//
//  MyCartModel.swift
//  ecommerce-concept
//
//  Created by MAC on 26.08.2022.
//

import Foundation
import ObjectMapper

struct CartData: Mappable {
   
    var basket: [PhoneModel] = []
    var delivery: String = ""
    var totalPrice: Int = 0
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        basket <- map["basket"]
        delivery <- map["delivery"]
        totalPrice <- map["total"]
    }
}

struct PhoneModel: Mappable {
    
    var imageURLString: String = ""
    var price: Int = 0
    var title: String = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        imageURLString <- map["images"]
        price <- map["price"]
        title <- map["title"]
    }
    
}
