//
//  MyCartView + Actions.swift
//  ecommerce-concept
//
//  Created by MAC on 26.08.2022.
//

import UIKit

extension MyCartView {
    
    func updateCartData(with cartData: CartData) {
        self.cartData = cartData
        guard let urlOne = URL(string: cartData.basket[0].imageURLString) else { return }
        guard let urlTwo = URL(string: cartData.basket[1].imageURLString) else { return }
        firstPhoneImageView.kf.setImage(with: urlOne)
        secondPhoneimageView.kf.setImage(with: urlTwo)
        firstPhoneNameLabel.text = cartData.basket[0].title
        firstPhonePriceLabel.text = "$" + String(cartData.basket[0].price) + ".00"
        secondPhoneNameLabel.text = cartData.basket[1].title
        secondPhonePriceLabel.text = "$" + String(cartData.basket[1].price) + ".00"
        
      
        self.totalMoneyLabel.text = "$" + String(cartData.totalPrice) + " us"
        self.deliveryCostLabel.text = cartData.delivery
    }
    
    func updateCartData(with error: String) {
        print(error)
    }
    
    @objc func increaseItemsInCartByOne(_ sender: Any) {
        output?.userSelectIncraeseItemsInCartCount()
        guard let sender = sender as? UIButton else { return }
        if sender === increaseAmountButtonTwo {
            amountLabelOfFirstPhone.text = String((Int(amountLabelOfFirstPhone.text ?? "") ?? 0) + 1)
            return
        }
        amountLabelOfSecondPhone.text = String((Int(amountLabelOfSecondPhone.text ?? "") ?? 0) + 1)
    }
    
    @objc func decreaseItemsInCartByOne(_ sender: Any) {
        guard let itemsInCart = output?.userSelectReturnItemsInCartCount() else { return }
        if itemsInCart == 0 {
            return
        }
        output?.userSelectDecreaseItemsInCartCount()
        
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
