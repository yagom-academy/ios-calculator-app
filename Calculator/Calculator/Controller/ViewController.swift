//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var formula: String = ""
    var numberFormatter = NumberFormatter()
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearLabel()
        setNumberFormatter()
    }
    
    @IBAction func TapOptionButton(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case "AC":
            clearLabel()
            clearFormula()
        case "CE":
            clearLabel()
        case "⁺⁄₋":
            break
        default:
            break
        }
    }
    
    @IBAction func TapOperatroButton(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        if self.formula == "" {
            self.formula += "\(operandsLabel.text!) "
            clearLabel()
        } else {
            self.formula += "\(operatorLabel.text!) \(operandsLabel.text!) "
            clearLabel()
        }
        
        if title == "=" {
            var formula = ExpressionParser.parse(from: self.formula)
            clearFormula()
            clearLabel()
            operandsLabel.text = numberFormatter.string(for: formula.result())
            return
        }
        
        operatorLabel.text = title
    }
    
    @IBAction func TapNumberButton(_ sender: UIButton) {
        guard let inputNumber = sender.currentTitle else { return }
        guard var operands = operandsLabel.text else { return }
        
        operands += inputNumber
        guard let Number = Double(operands) else { return }
        
        operandsLabel.text = numberFormatter.string(for: Number)
    }
    
    func clearLabel() {
        operandsLabel.text = "0"
        operatorLabel.text = ""
    }
    
    func clearFormula() {
        self.formula = ""
    }
    
    func setNumberFormatter() {
        numberFormatter.maximumFractionDigits = 19
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.numberStyle = .decimal
    }
    
}

