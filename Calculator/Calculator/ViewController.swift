//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let zero = "0"
    let empty = ""
    var stringNumbers: String = ""
    var stringOperators: String = ""
    @IBOutlet weak var recentNumbersStackView: UIStackView!
    
    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var formula: Formula = Formula(operands: CalculatorItemQueue(), operators: CalculatorItemQueue())
        print(formula.result())
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        stringOperators = empty
        operatorLabel.text = stringOperators
        operandsLabel.text = zero
        recentNumbersStackView.arrangedSubviews.forEach{
            recentNumbersStackView.removeArrangedSubview($0)
        }
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        operandsLabel.text = zero
    }
    
    @IBAction func touchUpPositiveNegativeButton(_ sender: UIButton) {
        if !stringNumbers.contains("-") {
            stringNumbers = "-\(stringNumbers)"
            operandsLabel.text = stringNumbers
        } else {
            stringNumbers.removeFirst()
            operandsLabel.text = stringNumbers
        }
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        if operandsLabel.text == zero {
            stringNumbers = sender.titleLabel?.text ?? ""
            operandsLabel.text = stringNumbers
        } else {
            stringNumbers += sender.titleLabel?.text ?? ""
            operandsLabel.text = stringNumbers
        }
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        if operandsLabel.text != zero {
            stringNumbers += "00"
            operandsLabel.text = stringNumbers
        }
    }
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        if stringNumbers.last != "." && !stringNumbers.contains(".") && stringNumbers == zero {
            stringNumbers += "."
            operandsLabel.text = stringNumbers
        }
    }
}

