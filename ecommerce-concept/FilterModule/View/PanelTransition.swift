//
//  PanelTransition.swift
//  ecommerce-concept
//
//  Created by Vasily Maslov on 03.09.2022.
//

import UIKit

class PanelTransition: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting ?? source)
//        return presentAnimation()
    }
}
