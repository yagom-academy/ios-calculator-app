//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var inputNumber = Number()
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var operatorLabel: UILabel!
    @IBOutlet var expressionStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = inputNumber.value
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        inputNumber.updateValue(with: sender.title(for: .normal)!)
        numberLabel.text = inputNumber.value
    }
    
    @IBAction func touchCEbutton(_ sender: UIButton) {
        inputNumber.reset()
        numberLabel.text = inputNumber.value
    }
    
    @IBAction func touchToggleSignButton(_ sender: UIButton) {
        inputNumber.toggleSign()
        numberLabel.text = inputNumber.value
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard numberLabel.text != "0" else {
            operatorLabel.text = sender.title(for: .normal)
            return
        }
        let `operator` = sender.title(for: .normal)
        let operand = inputNumber.value
    
        let stackView = UIStackView()
        var operatorlabel = UILabel()
        operatorlabel.text = `operator`
        operatorlabel.textColor = .white
        var operandlabel = UILabel()
        operandlabel.text = operand
        operandlabel.textColor = .white
        stackView.addArrangedSubview(operatorlabel)
        stackView.addArrangedSubview(operandlabel)
        stackView.spacing = 5
        stackView.alignment = .bottom
        expressionStack.addArrangedSubview(stackView)
        numberLabel.text = "0"
        inputNumber.reset()
        operatorLabel.text = `operator`
    }
}

