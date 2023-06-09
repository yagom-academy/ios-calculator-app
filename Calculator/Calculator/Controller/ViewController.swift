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
    private var isInputZero = true
    private var isResultValue = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearLabels()
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
        guard let operand = sender.currentTitle,
              let operandString = operands.text,
              isResultValue == false else {
            return
        }
        
        guard operand != "0" else {
            isInputZero = true
            return
        }
        
        if operandString == "0", operand != "." {
            operands.text = operand
        } else {
            operands.text = operandString + operand
        }
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let operand = operands.text,
              operand != "0" || isInputZero else {
            return
        }
        
        if operand.hasSuffix(".") {
            settingFormula(isEndByPoint: true)
        } else if isResultValue {
            settingFormula(isResultComma: true)
        } else {
            settingFormula()
        }

        operators.text = sender.currentTitle

        isResultValue = false
        isInputZero = false
        clearLabels(isOperatorClear: false)
    }
    
    @IBAction func tappedResultButton(_ sender: Any) {
        guard isResultValue == false else {
            return
        }
        settingFormula()
        
        var formula = ExpressionParser.parse(from: saveFormula.joined())
        let result = formula.result()
        isResultValue = true
        isInputZero = true
        
        operands.text = formattingNumbers(result)
        saveFormula.removeAll()
        clearLabels(isOperandClear: false)
    }
    
    @IBAction func tappedChangeMinusSignButton(_ sender: Any) {
        guard let operand = operands.text,
                operand != "0",
                let operandsNumber = (Double(operand)) else {
            return
        }
        
        operands.text = formattingNumbers(operandsNumber * -1)
    }
    
    @IBAction func tappedClearButton(_ sender: Any) {
        clearLabels(isOperatorClear: false)
        isResultValue = false
        isInputZero = false
    }
    
    @IBAction func tappedAllClearButton(_ sender: Any) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        clearLabels()
        isResultValue = false
        isInputZero = true
    }
}

extension ViewController {
    private func settingFormula(isEndByPoint: Bool = false, isResultComma: Bool = false) {
        guard let operatorString = operators.text,
              var operandString = operands.text else {
            return
        }

        if isEndByPoint {
            operandString = operandString.filter { $0 != "." }
        } else if isResultComma {
            operandString = operandString.filter { $0 != "," }
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
    
    private func clearLabels(isOperandClear: Bool = true, isOperatorClear: Bool = true) {
        if isOperandClear {
            operands.text = "0"
        }
        if isOperatorClear {
            operators.text = ""
        }
    }
}

