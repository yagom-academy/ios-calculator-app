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
    var allOperation: [String] = []

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
        currentNumberLabbel.text = changeDecimalFormat(touchedNumber)
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
            currentNumberLabbel.text = changeDecimalFormat(touchedNumber)
        }
    }
    
    @IBAction func clickPlusMimusSign(_ sender: UIButton) {
        if touchedNumber == "0" {
        } else if touchedNumber.hasPrefix("-") == true {
            touchedNumber.remove(at: touchedNumber.startIndex)
        } else {
            touchedNumber.insert("-", at: touchedNumber.startIndex)
        }
        currentNumberLabbel.text = changeDecimalFormat(touchedNumber)
    }
    
    @IBAction func clickAC(_ sender: UIButton) {
        clearAllHistory()
    }
    
    @IBAction func clickEC(_ sender: UIButton) {
        if allOperation.isEmpty {
            clearAllHistory()
        } else {
            touchedNumber = "0"
            currentNumberLabbel.text = touchedNumber
        }
    }

    @IBAction func clickCalculateButton(_ sender: UIButton) {
        if allOperation.isEmpty != true {
            addNumberAndOperator(currentOperatorLabel.text ?? "", touchedNumber)
            let mergedAllOperation = allOperation.joined(separator: " ")
            var formula = ExpressionParser.parse(form: mergedAllOperation)
            let result = formula.result()
            
            currentOperatorLabel.text = ""
            currentNumberLabbel.text = changeDecimalFormat("\(result)")
            touchedNumber = changeDecimalFormat("\(result)").replacingOccurrences(of: ",", with: "")
            allOperation = []
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
    
    func changeDecimalFormat(_ text: String) -> String {
        guard text != "nan" else { return "NaN" }
        let numberFomatter = NumberFormatter()
        numberFomatter.numberStyle = .decimal
        
        let number = numberFomatter.number(from: text) ?? 0
        
        let changedNumber = numberFomatter.string(from: number) ?? ""
        return changedNumber
    }
    
    func addNumberAndOperator(_ currentOperator: String, _ currentNumber: String) {
        let operatorLabel = makeLabel()
        let numberLabel = makeLabel()
        numberLabel.text = changeDecimalFormat(currentNumber)
        operatorLabel.text = currentOperator
        
        let logStackView = makeStackView([operatorLabel, numberLabel])
        operationRecord.addArrangedSubview(logStackView)
        view.layoutIfNeeded()
        let contentBottom = operationRecordScrollView.contentSize.height - operationRecordScrollView.frame.height
        operationRecordScrollView.setContentOffset(CGPoint(x: 0, y: contentBottom), animated: true)
        
        if allOperation.isEmpty == false {
            allOperation.append(currentOperator)
        }
        allOperation.append(currentNumber)
        
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
