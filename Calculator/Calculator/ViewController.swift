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
    var allOperation: [String] = []
    
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
            addNumberAndOperator(currentOperatorLabel.text ?? "", currentNumberLabbel.text ?? "")
        }
        
        currentOperatorLabel.text = sender.currentTitle
    }
    
    @IBAction func clickDotButton(_ sender: UIButton) {
        if ((currentNumberLabbel.text?.contains(".")) == false) {
            touchedNumber += sender.currentTitle ?? ""
            let currentNumberLabbelText = currentNumberLabbel.text ?? ""
            currentNumberLabbel.text = currentNumberLabbelText + "."
        }
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
        //입력된 숫자가 0인 경우 부호를 표시하지 않음!
        if touchedNumber.hasPrefix("-") == true {
            touchedNumber.remove(at: touchedNumber.startIndex)
        } else {
            touchedNumber.insert("-", at: touchedNumber.startIndex)
        }
        currentNumberLabbel.text = touchedNumber
    }
    
    @IBAction func clickAC(_ sender: UIButton) {
        operationRecord.subviews.forEach { $0.removeFromSuperview() }
        touchedNumber = "0"
        currentNumberLabbel.text = "0"
    }

    @IBAction func clickCalculateButton(_ sender: UIButton) {
        addNumberAndOperator(currentOperatorLabel.text ?? "", currentNumberLabbel.text ?? "")
        let mergedAllOperation = allOperation.joined(separator: " ")
        var formula = ExpressionParser.parse(form: mergedAllOperation)
        let result = formula.result()
        
        currentOperatorLabel.text = ""
        currentNumberLabbel.text = changeDecimalFormat("\(result)")
        touchedNumber = "\(result)"
        allOperation = []
    }
    
    func changeDecimalFormat(_ text: String) -> String {
        let numberFomatter = NumberFormatter()
        numberFomatter.numberStyle = .decimal
        numberFomatter.usesSignificantDigits = true
        numberFomatter.maximumSignificantDigits = 20
        numberFomatter.roundingMode = .halfUp
        let number = numberFomatter.number(from: text) ?? 0
        
        let changedNumber = numberFomatter.string(from: number) ?? ""
        return changedNumber
    }
    
    func addNumberAndOperator(_ currentOperator: String, _ currentNumber: String) {
        let newStack = UIStackView()
        newStack.translatesAutoresizingMaskIntoConstraints = false
        newStack.axis = .horizontal
        newStack.alignment = .fill
        newStack.distribution = .fill
        newStack.spacing = 8
        
        let operatorLabel = UILabel()
        operatorLabel.textColor = .white
        operatorLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title3)
        
        let numberLabel = UILabel()
        numberLabel.textColor = .white
        numberLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title3)
        
        numberLabel.text = changeDecimalFormat(currentNumber)
        operatorLabel.text = currentOperator
        newStack.addArrangedSubview(operatorLabel)
        newStack.addArrangedSubview(numberLabel)
        operationRecord.addArrangedSubview(newStack)
        
        if allOperation.isEmpty == false {
            allOperation.append(currentOperator)
        }
        allOperation.append(currentNumber)
        
        touchedNumber = "0"
        currentNumberLabbel.text = "0"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 뷰가 로드 될 때 화면을 초기화 하는 함수 따로 만들기
    }

}

