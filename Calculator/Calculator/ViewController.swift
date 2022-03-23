//
//  Calculator - ViewController.swift
//  Created by Red
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentNumberLabbel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var operationRecord: UIStackView!
    var touchedNumber: String = "0"
    
    @IBAction func clickNumberButton(_ sender: UIButton) {
        if currentNumberLabbel.text == "0" {
            touchedNumber = sender.currentTitle ?? ""
        } else {
            touchedNumber += sender.currentTitle ?? ""
        }
        currentNumberLabbel.text = touchedNumber
    }
    
    @IBAction func clickOperatorButton(_ sender: UIButton) {
        addNumberAndOperator(currentOperatorLabel.text ?? "", currentNumberLabbel.text ?? "")
        
        currentOperatorLabel.text = sender.currentTitle
    }
    
    @IBAction func clickDotButton(_ sender: UIButton) {
        if ((currentNumberLabbel.text?.contains(".")) == false) {
            touchedNumber += sender.currentTitle ?? ""
            currentNumberLabbel.text = touchedNumber
        }
    }
    
    @IBAction func clickZeroButton(_ sender: UIButton) {
        if currentNumberLabbel.text == "0" {
            touchedNumber = "0"
        } else {
            touchedNumber += sender.currentTitle ?? ""
            currentNumberLabbel.text = touchedNumber
        }
    }
    
    @IBAction func clickPlusMimusSign(_ sender: UIButton) {
        if touchedNumber.hasPrefix("-") == true {
            touchedNumber.remove(at: touchedNumber.startIndex)
        } else {
            touchedNumber.insert("-", at: touchedNumber.startIndex)
        }
        currentNumberLabbel.text = touchedNumber
    }
    
    func addNumberAndOperator(_ currentOperator: String, _ currentNumber: String) {
        let newStack = UIStackView()
        newStack.translatesAutoresizingMaskIntoConstraints = false
        newStack.axis = .horizontal
        newStack.alignment = .fill
        newStack.distribution = .fill
        newStack.spacing = 8
        
        let numberLabel = UILabel()
        numberLabel.textColor = .white
        numberLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title3)
        
        let operatorLabel = UILabel()
        operatorLabel.textColor = .white
        operatorLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title3)
        
        numberLabel.text = currentNumber
        operatorLabel.text = currentOperator
        newStack.addArrangedSubview(operatorLabel)
        newStack.addArrangedSubview(numberLabel)
        operationRecord.addArrangedSubview(newStack)
        
        touchedNumber = "0"
        currentNumberLabbel.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

