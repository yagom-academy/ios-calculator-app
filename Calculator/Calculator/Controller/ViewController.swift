//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var presentValue: UILabel!
    var valueToBeCalculated: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapOperand(sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text else { return }
        presentValue.text = buttonLabel
    }
    
    @IBAction func didTapOperator(sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text else { return }
        guard let labelText = presentValue.text else { return }
        let valueStack = "\(buttonLabel + " " + labelText)"
        valueToBeCalculated.append(valueStack)
    }
    
    @IBAction func changeSign(sender: UIButton) {
        if let labelText = presentValue.text {
            let converteDouble = Double(labelText) ?? 0
            presentValue.text = String(converteDouble * -1)
        }
    }
    
    @IBAction func didTapAllClear(sender: UIButton) {
        valueToBeCalculated.removeAll()
        presentValue.text = "0"
    }
}
