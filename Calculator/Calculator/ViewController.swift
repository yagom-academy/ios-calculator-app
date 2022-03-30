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
    @IBOutlet weak var operationRecordScrollView: UIScrollView!
    var allOperations: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        clearAllHistory()
    }
}

// MARK: IBAction
extension ViewController {
    @IBAction func clickNumberButton(_ sender: UIButton) {
        let currentNumber = currentNumberLabbel.text.bind()
        let buttonTitle = sender.currentTitle.bind()
        
        guard currentNumber.removeComma().count < 20 else { return }
        
        if currentNumber == "0" {
            currentNumberLabbel.text = buttonTitle
        } else {
            currentNumberLabbel.text = (currentNumber + buttonTitle).changeDecimalFormat()
        }
    }
    
    @IBAction func clickOperatorButton(_ sender: UIButton) {
        let currentNumber = currentNumberLabbel.text.bind()
        let currentOperator = currentOperatorLabel.text.bind()
        
        if currentNumber != "0" {
            addNumberAndOperator(currentOperator, currentNumber)
        }
        currentOperatorLabel.text = sender.currentTitle
    }
    
    @IBAction func clickDotButton(_ sender: UIButton) {
        let currentNumber = currentNumberLabbel.text.bind()
        
        guard currentNumber.contains(".") == false else { return }
        currentNumberLabbel.text = currentNumber + "."
    }
    
    @IBAction func clickZeroButton(_ sender: UIButton) {
        let currentNumber = currentNumberLabbel.text.bind()
        let zeros = sender.currentTitle.bind()
        
        guard currentNumber.removeComma().count < 20 else { return }
        
        if currentNumber.contains(".") == true {
            currentNumberLabbel.text = currentNumber + zeros
        } else {
            currentNumberLabbel.text = (currentNumber + zeros).changeDecimalFormat()
        }
    }
    
    @IBAction func clickPlusMimusSign(_ sender: UIButton) {
        var currentNumber = currentNumberLabbel.text.bind()
        
        guard currentNumber != "0" else { return }
        
        if currentNumber.hasPrefix("-") == true {
            currentNumber.removeFirst()
        } else {
            currentNumber.insert("-", at: currentNumber.startIndex)
        }
        currentNumberLabbel.text = currentNumber.changeDecimalFormat()
    }
    
    @IBAction func clickAC(_ sender: UIButton) {
        clearAllHistory()
        allOperations = []
    }
    
    @IBAction func clickEC(_ sender: UIButton) {
        if allOperations.isEmpty {
            clearAllHistory()
        } else {
            currentNumberLabbel.text = "0"
        }
    }

    @IBAction func clickCalculateButton(_ sender: UIButton) {
        let currentNumber = currentNumberLabbel.text.bind()
        let currentOperator = currentOperatorLabel.text.bind()
        
        if allOperations.isEmpty != true {
            addNumberAndOperator(currentOperator, currentNumber)
            let mergedAllOperation = allOperations.joined(separator: " ")
            var formula = ExpressionParser.parse(form: mergedAllOperation)
            let result = formula.result()
            
            currentOperatorLabel.text = ""
            currentNumberLabbel.text = String(result).changeDecimalFormat()
            allOperations = []
        }
    }
}

// MARK: private funtion
private extension ViewController {
    func clearAllHistory() {
        operationRecord.subviews.forEach { $0.removeFromSuperview() }
        currentNumberLabbel.text = "0"
        currentOperatorLabel.text = ""
    }
    
    func addNumberAndOperator(_ currentOperator: String, _ currentNumber: String) {
        let operatorLabel = makeLabel()
        let numberLabel = makeLabel()
        numberLabel.text = currentNumber.changeDecimalFormat()
        operatorLabel.text = currentOperator
        
        let logStackView = makeStackView([operatorLabel, numberLabel])
        operationRecord.addArrangedSubview(logStackView)
        view.layoutIfNeeded()
        let contentBottom = operationRecordScrollView.contentSize.height - operationRecordScrollView.frame.height
        operationRecordScrollView.setContentOffset(CGPoint(x: 0, y: contentBottom), animated: true)
        
        if allOperations.isEmpty == false {
            allOperations.append(currentOperator)
        }
        let numberWithoutComma = currentNumber.removeComma()
        allOperations.append(numberWithoutComma)
        
        currentNumberLabbel.text = "0"
    }
    
    func makeStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }
    
    func makeLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title3)
        return label
    }
}
