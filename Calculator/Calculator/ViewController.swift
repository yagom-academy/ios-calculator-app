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
    var touchedNumber: String = "0"
    var allOperations: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        clearAllHistory()
    }
}

// MARK: IBAction
extension ViewController {
    @IBAction func clickNumberButton(_ sender: UIButton) {
        if currentNumberLabbel.text == "0" {
            touchedNumber = sender.currentTitle ?? ""
        } else {
            touchedNumber += sender.currentTitle ?? ""
        }
        currentNumberLabbel.text = touchedNumber.changeDecimalFormat()
    }
    
    @IBAction func clickOperatorButton(_ sender: UIButton) {
        if touchedNumber != "0" {
            addNumberAndOperator(currentOperatorLabel.text ?? "", touchedNumber)
        }
        currentOperatorLabel.text = sender.currentTitle
    }
    
    @IBAction func clickDotButton(_ sender: UIButton) {
        guard let currentNumber = currentNumberLabbel.text,
                (currentNumber.contains(".") == false) else { return }
        touchedNumber += "."
        currentNumberLabbel.text = currentNumber + "."
    }
    
    @IBAction func clickZeroButton(_ sender: UIButton) {
        if currentNumberLabbel.text == "0" {
            touchedNumber = "0"
        } else if ((currentNumberLabbel.text?.contains(".")) == true) {
            let currentNumberLabbelText = currentNumberLabbel.text ?? ""
            let zeros = sender.currentTitle ?? ""
            currentNumberLabbel.text = currentNumberLabbelText + zeros
            touchedNumber += zeros
        } else {
            touchedNumber += sender.currentTitle ?? ""
            currentNumberLabbel.text = touchedNumber.changeDecimalFormat()
        }
    }
    
    @IBAction func clickPlusMimusSign(_ sender: UIButton) {
        if touchedNumber != "0" {
            if touchedNumber.hasPrefix("-") == true {
                touchedNumber.remove(at: touchedNumber.startIndex)
            } else {
                touchedNumber.insert("-", at: touchedNumber.startIndex)
            }
        }
        currentNumberLabbel.text = touchedNumber.changeDecimalFormat()
    }
    
    @IBAction func clickAC(_ sender: UIButton) {
        clearAllHistory()
        allOperations = []
    }
    
    @IBAction func clickEC(_ sender: UIButton) {
        if allOperations.isEmpty {
            clearAllHistory()
        } else {
            touchedNumber = "0"
            currentNumberLabbel.text = touchedNumber
        }
    }

    @IBAction func clickCalculateButton(_ sender: UIButton) {
        if allOperations.isEmpty != true {
            addNumberAndOperator(currentOperatorLabel.text ?? "", touchedNumber)
            let mergedAllOperation = allOperations.joined(separator: " ")
            var formula = ExpressionParser.parse(form: mergedAllOperation)
            let result = formula.result()
            
            currentOperatorLabel.text = ""
            currentNumberLabbel.text = String(result).changeDecimalFormat()
            touchedNumber = String(result).changeDecimalFormat().replacingOccurrences(of: ",", with: "")
            allOperations = []
        }
    }
}

// MARK: private funtion
private extension ViewController {
    func clearAllHistory() {
        operationRecord.subviews.forEach { $0.removeFromSuperview() }
        touchedNumber = "0"
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
        allOperations.append(currentNumber)
        
        touchedNumber = "0"
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
