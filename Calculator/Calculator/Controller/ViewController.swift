//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operators: UILabel!
    @IBOutlet weak var operands: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    private var saveFormula = [String]()
    private let numberFormatter = NumberFormatter()
    private var isInputZero: Bool = false
    private var isResultValue: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearEntryText(isOperandClear: true, isOperatorClear: true)
    }
    
    func addSubView(_ `operator`: String, _ operand: String) -> UIStackView {
        let operatorLabel: UILabel = {
            let label = UILabel()
            
            label.text = `operator`
            label.textColor = .white
            
            return label
        }()
        
        let operandLabel: UILabel = {
            let label = UILabel()
            
            label.text = operand
            label.font = .preferredFont(forTextStyle: .title2)
            label.textColor = .white
            
            return label
        }()
        
        let subStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [operatorLabel,operandLabel])
            
            stackView.axis = .horizontal
            stackView.spacing = 8
            stackView.alignment = .bottom
            
            return stackView
        }()
        
        return subStackView
    }
    
    func addView(_ `operator`: String, _ operand: String) {
        stackView.addArrangedSubview(addSubView(`operator`, operand))
    }
    
    //MARK: - Button Action
    @IBAction func tappedOperandsButton(_ sender: UIButton) {
        guard let operand = sender.currentTitle, isResultValue == false else {
            return
        }
        
        if operand == "0" {
            isInputZero = true
        }
        
        if operand == "." && operands.text == "0" {
            operands.text = "0" + operand
        } else if let operandString = operands.text, operands.text != "0" {
            operands.text = operandString + operand
        } else {
            operands.text = operand
        }
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        if operands.text != "0" || isInputZero {
            settingFormula()
        }
        isResultValue = false
        operators.text = sender.currentTitle
        clearEntryText(isOperandClear: true, isOperatorClear: false)
    }
    
    @IBAction func tappedResultButton(_ sender: Any) {
        guard isResultValue == false else {
            return
        }
        settingFormula()
        
        var formula = ExpressionParser.parse(from: saveFormula.joined())
        let result = formula.result()
        isResultValue = true
        
        operands.text = formattingNumbers(result)
        saveFormula.removeAll()
        clearEntryText(isOperandClear: false, isOperatorClear: true)
    }
    
    @IBAction func tappedChangeMinusSignButton(_ sender: Any) {
        guard let operand = operands.text,
                operand != "0",
                let operandsNumber = (Double(operand)),
                isResultValue == false else {
            return
        }
        
        operands.text = formattingNumbers(operandsNumber * -1)
    }
    
    @IBAction func tappedClearButton(_ sender: Any) {
        clearEntryText(isOperandClear: true, isOperatorClear: false)
        isResultValue = false
    }
    
    @IBAction func tappedAllClearButton(_ sender: Any) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        clearEntryText(isOperandClear: true, isOperatorClear: true)
        isResultValue = false
    }
}

extension ViewController {
    private func settingFormula() {
        guard let operatorString = operators.text,
              let operandString = operands.text else {
            return
        }
        
        saveFormula.append("\(operatorString) ")
        saveFormula.append("\(operandString) ")
        addView(operatorString, operandString)
    }
    
    private func formattingNumbers(_ input: Double) -> String {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        numberFormatter.usesSignificantDigits = true
        
        return numberFormatter.string(from: Decimal(input) as NSNumber) ?? "NaN"
    }
    
    private func clearEntryText(isOperandClear: Bool, isOperatorClear: Bool) {
        if isOperandClear {
            operands.text = "0"
            isInputZero = false
        }
        if isOperatorClear {
            operators.text = ""
        }
    }
}

