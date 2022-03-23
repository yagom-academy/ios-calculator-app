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
    var touchedNumber: String = ""
    
    @IBAction func clickNumberButton(_ sender: UIButton) {
        touchedNumber += sender.currentTitle ?? ""
        currentNumberLabbel.text = touchedNumber
    }
    
    @IBAction func clickOperatorButton(_ sender: UIButton) {
        addNumberAndOperator(currentOperatorLabel.text ?? "", currentNumberLabbel.text ?? "")
        
        currentOperatorLabel.text = sender.currentTitle
        currentNumberLabbel.text = "0"
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
        
        touchedNumber = ""
        currentNumberLabbel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

