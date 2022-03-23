//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var presentValue: UILabel!
    var inputOperand: String = ""
    var valueToBeCalculated: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapOperand(sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text else { return }
        inputOperand += buttonLabel
        presentValue.text = inputOperand
    }
    
    @IBAction func didTapOperator(sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text else { return }
        guard let labelText = presentValue.text else { return }
        let valueStack = "\(buttonLabel + " " + labelText)"
        valueToBeCalculated.append(valueStack)
        presentValue.text = "0"
    }
    
    @IBAction func didTapEqualSign() {
        var dd = ExpressionParser.parse(from: valueToBeCalculated.joined(separator: ""))
        let ss = dd.result()
        presentValue.text = ss.description
    }
    
    @IBAction func changeSign(sender: UIButton) {
        if let labelText = presentValue.text {
            let converteDouble = Double(labelText) ?? 0
            presentValue.text = String(converteDouble * -1)
        }
    }
    
    @IBAction func didTapAllClear(sender: UIButton) {
        valueToBeCalculated.removeAll()
        inputOperand = ""
        presentValue.text = "0"
    }
}
