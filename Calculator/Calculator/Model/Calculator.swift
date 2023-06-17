//
//  Calculator.swift
//  Calculator
//
//  Created by kyungmin, EtialMoon on 2023/06/17.
//

import UIKit

struct Calculator {
    var calculatorData = CalculatorData()
    private(set) var isOperationReady = true
    
    private let numberFormatter = {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        return numberFormatter
    }()
    
    func numberButtonLogic(_ operandText: String, _ labelText: String) -> String {
        if operandText.isZero {
            return labelText
        } else if operandText.count < 20 {
            let newLabelText = operandText + labelText
            return makeFormattedNumber(for: newLabelText.replacingOccurrences(of: ",", with: ""))
        } else {
            return operandText
        }
    }
    
    func zeroButtonLogic(_ operandText: String, _ labelText: String) -> String {
        if operandText.isZero {
            return "0"
        } else {
            return operandText + labelText
        }
    }
    
    func dotButtonLogic(_ operandText: String, _ labelText: String) -> String {
        if operandText.isFraction {
            return operandText
        } else {
            return operandText + labelText
        }
    }
    
    mutating func operatorButtonLogic(_ operatorText: String, _ operandText: String, _ labelText: String, _ formulaStackView: UIStackView) -> String {
        var operandText = operandText
        operandText.removeTrailingDot()
        
        isOperationReady = true
        
        if operandText.isZero {
            return labelText
        } else {
            formulaStackView.addArrangedSubview(makePartialFormulaStackView(operatorText, makeFormattedNumber(for: operandText)))
            
            calculatorData.addFormulaString(operatorText, operandText)
            return labelText
        }
    }
    
    mutating func equalButtonLogic(_ operatorText: String, _ operandText: String, _ formulaStackView: UIStackView) throws -> String {
        guard isOperationReady else {
            throw CalculatorError.unReadyError
        }
        
        var operandText = operandText
        operandText.removeTrailingDot()
        
        if operandText.isZero {
            calculatorData.addFormulaString(operatorText, operandText)
        } else {
            formulaStackView.addArrangedSubview(makePartialFormulaStackView(operatorText, makeFormattedNumber(for: operandText)))
            calculatorData.addFormulaString(operatorText, operandText)
        }
        
        var formula = ExpressionParser.parse(from: calculatorData.formulaString)
        let result = try formula.result()
        
        calculatorData.resetFormulaString()
        isOperationReady = false
        
        return makeFormattedNumber(for: String(result))
    }
    
    func changeSignButtonLogic(_ operandText: String) -> String {
        var operandText = operandText

        if operandText.isZero {
            return operandText
        } else {
            operandText.convertSign()
            
            return operandText
        }
    }
    
    mutating func allClearButtonLogic() {
        calculatorData.resetFormulaString()
        
        isOperationReady = true
    }
    
    private func makeFormattedNumber(for input: String) -> String {
        return numberFormatter.string(for: Double(input)) ?? "0"
    }
    
    private func makePartialExpressionLabel(_ text: String?) -> UILabel {
        let label = UILabel()
        
        label.text = text
        label.textColor = .white
        label.font = label.font.withSize(20)

        return label
    }
    
    private func makePartialExpressionStackView() -> UIStackView {
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        return stackView
    }
    
    private func makePartialFormulaStackView(_ operatorText: String, _ operandText: String) -> UIStackView {
        let operatorLabel = makePartialExpressionLabel(operatorText)
        let operandLabel = makePartialExpressionLabel(operandText)
        let partialStackView = makePartialExpressionStackView()
        
        partialStackView.addArrangedSubview(operatorLabel)
        partialStackView.addArrangedSubview(operandLabel)
        
        return partialStackView
    }
}
