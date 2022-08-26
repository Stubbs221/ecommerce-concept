//
//  ProductDetailsModel.swift
//  ecommerce-concept
//
//  Created by MAC on 26.08.2022.
//

import Foundation
import ObjectMapper

struct ProductDetailsFetchResult: Mappable {
    
    var cpu: String = ""
    var camera: String = ""
    var capacity: [String] = []
    var color: [String] = []
    var phoneID: String = ""
    var imagesStringURL: [String] = []
    var isFavorites: Bool = false
    var price: Int = 0
    var rating: Float = 0
    var maxSDCapacity: String = ""
    var memory: String = ""
    var title: String = ""
    
    init?(map: Map) { }
    
    mutating func mapping(map: Map) {
        cpu <- map["CPU"]
        camera <- map["camera"]
        capacity <- map["capacity"]
        color <- map["color"]
        phoneID <- map["id"]
        imagesStringURL <- map["images"]
        isFavorites <- map["isFavorites"]
        price <- map["price"]
        rating <- map["rating"]
        maxSDCapacity <- map["sd"]
        memory <- map["ssd"]
        title <- map["title"]
    }
    
}

