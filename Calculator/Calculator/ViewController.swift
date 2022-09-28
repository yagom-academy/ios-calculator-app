//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var stringNumbers: String = ""
    
    @IBOutlet weak var operandsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var formula: Formula = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
        print(formula.result())
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        operandsLabel.text = "0"
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        if operandsLabel.text == "0" {
            stringNumbers += "\(String(sender.tag))"
            operandsLabel.text = "\(String(sender.tag))"
        } else {
            stringNumbers += "\(String(sender.tag))"
            operandsLabel.text = stringNumbers
        }
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        if operandsLabel.text != "0" {
            stringNumbers += "00"
            operandsLabel.text = stringNumbers
        } else if operandsLabel.text == "0" {
            operandsLabel.text = "0"
        }
    }
}

