//
//  TipCalViewController.swift
//  tippy
//
//  Created by main_user on 1/2/18.
//  Copyright © 2018 Thao Nguyen. All rights reserved.
//

import UIKit

class TipCalculatorViewController: UIViewController, UITextFieldDelegate {

    //MARK: - IBOutlet
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipPercentLabel: UILabel!
    @IBOutlet weak var numPeopleSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var amountPerPerson: UILabel!
    
    //MARK: - Properties
    var tipCalc = TipCalc(amountBefore: 0.00, tipPercentage: 0.15)
    
    //MARK: - View Controller Lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        billField.text = String(format: "$%0.2f", arguments: [tipCalc.amountBefore])
        tipPercentLabel.text = String(format: "Tip %d%%", arguments: [Int(tipCalc.tipPercentage*100)])
    }
    
    func calcTip(){
        tipCalc.tipPercentage = Float(tipPercentSlider.value)
        tipCalc.amountBefore = Float(billField.text!) ?? 0
        tipCalc.calculateTip()
        updateUI()
    }
    
    func updateUI() {
        resultLabel.text = String(format: "Total: $%0.2f Tip: $%0.2f", arguments: [tipCalc.totalAmount, tipCalc.tipAmount])
    }
    
    //MARK: - UIControl Events
    
    @IBAction func billFieldChanged(_ sender: Any) {
        calcTip()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == billField {
            textField.resignFirstResponder()
            calcTip()
        }
        return true
    }
    
    @IBAction func tipPercentSliderValueChanged(_ sender: Any) {
        tipPercentLabel.text! = String(format: "Tip: %02d%%", arguments: [Int(tipPercentSlider.value * 100)])
        calcTip()
    }
    
    @IBAction func numOfPeopleValueChanged(_ sender: Any) {
        let numberOfPeople = numPeopleSlider.value * 100
        numberOfPeopleLabel.text! = String(format: "Split: %d", arguments: [Int(numberOfPeople)])
        let splitPerPerson = tipCalc.totalAmount/Float(Int(numberOfPeople))
        amountPerPerson.text! = String(format: "Each Person: $%.2f", arguments: [splitPerPerson])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
