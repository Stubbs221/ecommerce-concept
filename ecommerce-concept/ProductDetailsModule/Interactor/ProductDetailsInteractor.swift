//
//  ProductDetailsInteractor.swift
//  ecommerce-concept
//
//  Created by MAC on 24.08.2022.
//

import UIKit

protocol ProductDetailsInteractorInput {
    var output: ProductDetailsInteractorOutput? { get set }
}

protocol ProductDetailsInteractorOutput: AnyObject {
//    some funcs
}

final class ProductDetailsInteractor: ProductDetailsInteractorInput {
    weak var output: ProductDetailsInteractorOutput?
}
