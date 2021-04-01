//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var zeroButton: NumberButton!
    @IBOutlet weak var dotButton: NumberButton!
    @IBOutlet weak var oneButton: NumberButton!
    @IBOutlet weak var twoButton: NumberButton!
    @IBOutlet weak var threeButton: NumberButton!
    
    private var decimalMode = true
    private var decimalCalculator = DecimalCalculator()
    private var binaryCalculator = BinaryCalculator()
    
    @IBOutlet weak var numberField: UILabel!
    
    @IBAction func touchUpNumber(_ sender: UIButton) {
        numberField.text?.append(sender.currentTitle!)
    }
    
    @IBAction func touchUpOperator(_ sender: Any) {
    }
    
    @IBAction func touchUpToggleSign(_ sender: Any) {
        do {
            if decimalMode {
                let minusedInput = try decimalCalculator.formatInput(numberField.text!) * -1
                numberField.text = try decimalCalculator.formatResult(of: minusedInput)
            } else {
                let minusedInput = try binaryCalculator.formatInput(numberField.text!) * -1
                numberField.text = try binaryCalculator.formatResult(of: minusedInput)
            }
        } catch {
            return
        }
    }
    
    @IBAction func touchUpToggleMode(_ sender: Any) {
        decimalMode.toggle()
        dotButton.isHidden.toggle()
        twoButton.isHidden.toggle()
        threeButton.isHidden.toggle()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        numberField.text?.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
