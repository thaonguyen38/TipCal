//
//  TipCal.swift
//  tippy
//
//  Created by main_user on 1/2/18.
//  Copyright © 2018 Thao Nguyen. All rights reserved.
//

import Foundation
class TipCalc {
    var tipAmount: Float = 0
    var amountBefore: Float = 0
    var tipPercentage: Float = 0
    var totalAmount: Float = 0
    var numberOfPeople: Int = 0
    var amountPerPerson: Float = 0
    init(amountBefore: Float, tipPercentage: Float, numberOfPeople: Int) {
        self.amountBefore = amountBefore
        self.tipPercentage = tipPercentage
        self.numberOfPeople = numberOfPeople
    }
    public func calculateTip () {
        if amountBefore == 0 {
            amountPerPerson = 0
        }
        tipAmount = amountBefore * tipPercentage
        totalAmount = tipAmount + amountBefore
        amountPerPerson = totalAmount/Float(numberOfPeople)
    }
}
