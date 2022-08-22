//
//  MainScreenInteractor.swift
//  ecommerce-concept
//
//  Created by MAC on 22.08.2022.
//

import UIKit

protocol MainScreenInteractorInput {
    var output: MainScreenInteractorOutput? { get set }
}

protocol MainScreenInteractorOutput: AnyObject {
//    some funcs
}

final class MainScreenInteractor: MainScreenInteractorInput {
    weak var output: MainScreenInteractorOutput?
    
    
}
