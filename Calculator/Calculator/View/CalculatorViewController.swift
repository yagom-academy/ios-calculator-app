//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

//- MARK: View Properties

final class CalculatorViewController: UIViewController {
    @IBOutlet private weak var operandsLabel: UILabel?
    @IBOutlet private weak var operatorsLabel: UILabel?
    @IBOutlet private weak var formulaStackView: UIStackView?
    @IBOutlet private weak var savedValueScrollView: UIScrollView?
    
    private var isInputedValue: Bool {
        formulaStackView?.isEmpty == false && operatorsLabel?.text?.isEmpty == true
    }
    
    private var isContainedDot: Bool {
        operandsLabel?.text?.contains(CalculatorOtherSigns.dot.rawValue) == true
    }
    
    private var isDefaultState: Bool {
        (operandsLabel?.text == CalculatorState.zero.value && formulaStackView?.isEmpty == true)
    }
}

//- MARK: View LifeCycle

extension CalculatorViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefalut()
    }
}

//- MARK: IBAction

private extension CalculatorViewController {
    @IBAction func operandsDidTapped(_ operands: UIButton) {
        guard let value = operands.currentTitle else {
            return
        }
        
        self.inputOperand(value)
    }
    
    @IBAction func operatorsDidTapped(_ operators: UIButton) {
        guard let value = operators.currentTitle,
              isDefaultState == false else {
            operatorsLabel?.text = operators.currentTitle
            return
        }
        
        self.inputOperator(value)
    }
    
    @IBAction func calculatorSignTapped(_ signs: UIButton) {
        guard let sign = CalculatorOtherSigns(rawValue: signs.currentTitle ?? "") else {
            return
        }
        
        switch sign {
        case .dot:
            guard let oldValue = operandsLabel?.text,
                  !oldValue.contains(CalculatorOtherSigns.dot.rawValue) else {
                return
            }
            operandsLabel?.text = oldValue + CalculatorOtherSigns.dot.rawValue
            
        case .doubleZero:
            guard let oldValue = operandsLabel?.text,
                  !oldValue.elementsEqual(CalculatorState.zero.value),
                  checkLimitedDigits(oldValue) else {
                return
            }
            operandsLabel?.text = oldValue + CalculatorOtherSigns.doubleZero.rawValue
            
        case .clearEntry:
            operandsLabel?.text = CalculatorState.zero.value
            
        case .allClear:
            setDefalut()
            
        case .plusMinus:
            setToggle(for: CalculatorState.minus.value)
            
        case .result:
            result()
        }
    }
}

//- MARK: ScrollView & StackView

private extension CalculatorViewController {
    func makeExpression() -> String {
        var expression: String = CalculatorState.empty.value
        
        formulaStackView?
            .arrangedSubviews
            .compactMap { $0 as? UIStackView }
            .forEach { subStackView in
                guard let operatorLabel = subStackView.arrangedSubviews[0] as? UILabel,
                      let operandLabel = subStackView.arrangedSubviews[1] as? UILabel,
                      let operatorText = operatorLabel.text,
                      let operandText = operandLabel.text else {
                    expression = CalculatorState.empty.value
                    return
                }
                
                expression += " \(operatorText) "
                expression += operandText.replacingOccurrences(of: ",", with: CalculatorState.empty.value)
            }

        return expression
    }
}

//- MARK: private funtions

private extension CalculatorViewController {
    func setDefalut() {
        operandsLabel?.text = CalculatorState.zero.value
        operatorsLabel?.text = CalculatorState.empty.value
        formulaStackView?.removeSubView()
    }
    
    func inputOperand(_ newValue: String) {
        if isInputedValue {
            formulaStackView?.removeSubView()
            operandsLabel?.text = CalculatorState.empty.value
        }
    
        guard let oldValue = operandsLabel?.text,
              checkLimitedDigits(oldValue) else {
            return
        }
        
        let result = oldValue + newValue
        
        if isContainedDot {
            operandsLabel?.text = result
            return
        }
    
        operandsLabel?.text = result
            .replacingOccurrences(of: ",", with: CalculatorState.empty.value)
            .doubleValue()
            .setDoubleFormatter()
    }
    
    func inputOperator(_ value: String) {
        if operandsLabel?.text == CalculatorState.zero.value || operandsLabel?.text == CalculatorState.nan.value {
            return
        }
        addStackView()
        savedValueScrollView?.focusBottom()
        
        operatorsLabel?.text = value
        operandsLabel?.text = CalculatorState.zero.value
    }
    
    func checkLimitedDigits(_ data: String) -> Bool {
        if (isContainedDot) {
            let integer = data.split(with: Character(CalculatorOtherSigns.dot.rawValue))[0]
            return integer.count < 20
        } else {
            return data.count < 20
        }
    }
    
    func setToggle(for minus: String) {
        guard let oldValue = operandsLabel?.text,
              let removeCommaValue = oldValue.replacingOccurrences(of: ",", with: CalculatorState.empty.value) as? String,
              let operand = (removeCommaValue.doubleValue() * -1).setDoubleFormatter() as? String,
              !operand.elementsEqual(CalculatorState.zero.value.minusValue()) else {
            return
        }
        
        operandsLabel?.text = operand
    }
    
    func result() {
        guard operatorsLabel?.text != CalculatorState.empty.value else {
            return
        }
        addStackView()
        
        let expressionParser = ExpressionParser.parse(from: makeExpression())
        let formula = expressionParser.result()
        
        operandsLabel?.text = formula.setDoubleFormatter()
    }
    
    func addStackView() {
        let newSubview = CalculatorStackView(operatorText: operatorsLabel?.text, operandText: operandsLabel?.text)
        formulaStackView?.addArrangedSubview(newSubview)
        savedValueScrollView?.focusBottom()
    }
}
