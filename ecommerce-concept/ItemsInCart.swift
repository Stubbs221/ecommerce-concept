//
//  ItemsInCart.swift
//  ecommerce-concept
//
//  Created by MAC on 26.08.2022.
//

import Foundation

class ItemsInCart {
    static let shared = ItemsInCart()
    
    private var items = 0
    
    private init(){}
    
    func getItemsCount() -> Int {
        return items
    }
    
    func increaseItems() {
        items += 1
    }
    
    func decreaseItems() {
        if items > 0 {
            items -= 1
        }
    }
}
