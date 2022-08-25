//
//  FilterInteractor.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

protocol FilterInteractorInput {
    var output: FilterInteractorOutput? { get set }
}

protocol FilterInteractorOutput: AnyObject {
//    maybe no funcs
}

final class FilterInteractor: FilterInteractorInput {
    weak var output: FilterInteractorOutput?
    
    
}
