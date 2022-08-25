//
//  MyCartView.swift
//  ecommerce-concept
//
//  Created by MAC on 25.08.2022.
//

import UIKit

protocol MyCartViewInput {
    var output: MyCartViewOutput? { get set }
}

protocol MyCartViewOutput {
// change quantity of items to purchase
}

class MyCartView: UIViewController, MyCartViewInput {
    var output: MyCartViewOutput?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
