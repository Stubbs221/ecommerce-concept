//
//  MyCartView + Actions.swift
//  ecommerce-concept
//
//  Created by MAC on 26.08.2022.
//

import UIKit

extension MyCartView {
    @objc func increaseItemsInCartByOne(_ sender: Any) {
        ItemsInCart.shared.increaseItems()
        guard let sender = sender as? UIButton else { return }
        if sender === increaseAmountButtonTwo {
            amountLabelOfFirstPhone.text = String((Int(amountLabelOfFirstPhone.text ?? "") ?? 0) + 1)
            return
        }
        amountLabelOfSecondPhone.text = String((Int(amountLabelOfSecondPhone.text ?? "") ?? 0) + 1)
    }
    
    @objc func decreaseItemsInCartByOne(_ sender: Any) {
        if ItemsInCart.shared.getItemsCount() == 0 {
            return
        }
        ItemsInCart.shared.decreaseItems()
        
        guard let sender = sender as? UIButton else { return }
        if sender === decreaseAmountButtonTwo {
            if (Int(amountLabelOfFirstPhone.text ?? "") ?? 0) == 0 { return }
            amountLabelOfFirstPhone.text = String((Int(amountLabelOfFirstPhone.text ?? "") ?? 0) - 1)
            return
        }
        if (Int(amountLabelOfSecondPhone.text ?? "") ?? 0) == 0 { return }
        amountLabelOfSecondPhone.text = String((Int(amountLabelOfSecondPhone.text ?? "") ?? 0) - 1)
    }
    @objc func backButtonTapped() {
        output?.userSelectDismissView(itemsInCart: 0)
    }
}
