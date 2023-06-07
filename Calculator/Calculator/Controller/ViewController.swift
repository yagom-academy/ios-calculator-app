//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var formula: String = ""
    let numberFormatter = NumberFormatter()
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearLabel()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.usesSignificantDigits = true
    }
    
    @IBAction func TapOperatorButton(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        addFormula()
        
        operatorLabel.text = title
    }
    
    @IBAction func TapEqualButton(_ sender: UIButton) {
        addFormula()
        
        var formula = ExpressionParser.parse(from: self.formula)
        let result = numberFormatter.string(for: formula.result())
        
        operandsLabel.text = result
        clearFormula()
    }
    
    @IBAction func TapNumberButton(_ sender: UIButton) {
        guard let inputNumber = sender.currentTitle,
              let operands = operandsLabel.text?.replacingOccurrences(of: ",", with: ""),
              let num = Double(operands + inputNumber),
              let result = numberFormatter.string(for: num) else { return }
        
        operandsLabel.text = result
    }
    
    @IBAction func TapDecimalPointButton(_ sender: UIButton) {
        guard let inputNumber = sender.currentTitle,
              let operands = operandsLabel.text else { return }
        
        let result = operands + inputNumber
        
        operandsLabel.text = result
    }
    
    @IBAction func TapACButton(_ sender: UIButton) {
        clearLabel()
        clearFormula()
    }
    
    @IBAction func TapCEButton(_ sender: UIButton) {
        clearLabel()
    }
    
    @IBAction func TapChangeSignButton(_ sender: UIButton) {
        
    }
    
    func addFormula() {
        if self.formula == "" && operandsLabel.text != "0"  {
            self.formula += "\(operandsLabel.text!) "
            clearLabel()
        } else if operandsLabel.text != "0" {
            self.formula += "\(operatorLabel.text!) \(operandsLabel.text!) "
            clearLabel()
        }
    }
    
    func clearLabel() {
        operandsLabel.text = "0"
        operatorLabel.text = ""
    }
    
    func clearFormula() {
        self.formula = ""
    }
    
    func setNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.usesSignificantDigits = true
    }
    
}

