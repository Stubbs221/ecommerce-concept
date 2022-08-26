//
//  MyCartModel.swift
//  ecommerce-concept
//
//  Created by MAC on 26.08.2022.
//

import Foundation
import ObjectMapper

struct CartData: Mappable {
   
    
    var basket: [PhoneModels] = []
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
