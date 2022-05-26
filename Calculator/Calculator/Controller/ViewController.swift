//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var subtractionButton: UIButton!
    @IBOutlet weak var additionButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    
    private var numbers = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapKeypadButton(_ sender: UIButton) {
        guard let number = numberButtons.firstIndex(of: sender) else { return }
        let newInputNumbers = Keypad.convertNumber(number)
        checkInputNumbers(text: newInputNumbers)
        inputNumberLabel.text = numbers
    }
    
    @IBAction func tapOperatorsButton(_ sender: UIButton) {
        switch sender {
        case additionButton:
            operatorLabel.text = String(Operator.add.symbol)
        case subtractionButton:
            operatorLabel.text = String(Operator.subtract.symbol)
        case multiplicationButton:
            operatorLabel.text = String(Operator.multiply.symbol)
        case divisionButton:
            operatorLabel.text = String(Operator.divide.symbol)
        default:
            return
        }
    }
    
    
    func updateLable(text: String) {
        inputNumberLabel.text = numbers
    }
    
    func checkInputNumbers(text: String) {
        if numbers.contains(".") && text == "." {
            return
        }
        
        if (numbers == "" || numbers == "0") && (text == "0" || text == "00") {
            numbers = "0"
        } else if numbers == "" && text == "." {
            numbers = "0."
        } else if numbers == "0" && text != "."{
            numbers = text
        } else {
            numbers += text
        }
    }
}
