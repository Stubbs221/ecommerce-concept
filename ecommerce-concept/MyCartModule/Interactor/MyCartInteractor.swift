//
//  MyCartInteractor.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

protocol MyCartInteractorInput {
    var output: MyCartInteractorOutput? { get set }
}

protocol MyCartInteractorOutput: AnyObject {
//    some funcs
}

final class MyCartInteractor: MyCartInteractorInput {
    var output: MyCartInteractorOutput?
    
    
}
