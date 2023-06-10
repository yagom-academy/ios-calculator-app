//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var partOfFormulaStackView: UIStackView!
    @IBOutlet weak var formulaScrollView: UIScrollView!
    private var currentFormula = [String]()
    private var isZeroButtonTappedBefore = true
    private var isResultValue = false
    private var isDotUsed = false
    private var isOperatorButtonPushed = false
    private var isInitializeCurrentOperandLabel = false {
        didSet {
            if isInitializeCurrentOperandLabel {
                currentOperandLabel.text = "0"
            }
        }
    }
    private var isInitializeCurrentOperatorLabel = false {
        didSet {
            if isInitializeCurrentOperatorLabel {
                currentOperatorLabel.text = ""
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isInitializeCurrentOperandLabel = true
        isInitializeCurrentOperatorLabel = true
    }
    
    @IBAction func tappedOperandsButton(_ sender: UIButton) {
        guard let number = sender.currentTitle,
              let operandLabelText = currentOperandLabel.text,
              isResultValue == false,
              checkFutureOperand(operandLabelText + number) != "error" else {
            return
        }
        
        if operandLabelText == "0" {
            currentOperandLabel.text = number
        } else {
            currentOperandLabel.text = operandLabelText + number
        }
    }
    
    @IBAction func tappedDotButton(_ sender: UIButton) {
        guard isDotUsed == false,
              let operandLabelText = currentOperandLabel.text,
              isResultValue == false,
              checkFutureOperand(operandLabelText) != "error" else {
            return
        }
        
        isDotUsed = true
        currentOperandLabel.text = operandLabelText + "."
    }
    
    @IBAction func tappedZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" else {
            currentOperandLabel.text = "0"
            isZeroButtonTappedBefore = true
            return
        }
        
        guard checkFutureOperand(operandLabelText + "0") != "error",
              isResultValue == false else {
            return
        }
        
        currentOperandLabel.text = operandLabelText + "0"
    }
    
    @IBAction func tappedDoubleZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" else {
            currentOperandLabel.text = "0"
            isZeroButtonTappedBefore = true
            return
        }
        
        guard checkFutureOperand(operandLabelText + "00") != "error",
              isResultValue == false else {
            return
        }
        
        currentOperandLabel.text = operandLabelText + "00"
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let operand = currentOperandLabel.text,
              operand != "0" || isZeroButtonTappedBefore,
              let operandLabelText = currentOperandLabel.text,
              checkFutureOperand(operandLabelText) != "error" else {
            return
        }
        
        settingFormula()

        currentOperatorLabel.text = sender.currentTitle

        isOperatorButtonPushed = true
        isResultValue = false
        isZeroButtonTappedBefore = false
        isDotUsed = false
        isInitializeCurrentOperandLabel = true
    }
    
    @IBAction func tappedResultButton(_ sender: Any) {
        guard isResultValue == false,
              isOperatorButtonPushed == true else {
            return
        }
        settingFormula()
        
        var formula = ExpressionParser.parse(from: currentFormula.joined())
        
        let result = formula.result()
        isResultValue = true
        isZeroButtonTappedBefore = true
        
        currentOperandLabel.text = result.formatNumber()
        currentFormula.removeAll()
        isInitializeCurrentOperatorLabel = true
        isDotUsed = false
    }
    
    @IBAction func tappedChangeSignButton(_ sender: Any) {
        guard var operandLabelText = currentOperandLabel.text,
                operandLabelText != "0",
                checkFutureOperand(operandLabelText) != "error" else {
            return
        }
        
        if operandLabelText.contains("-") {
            operandLabelText = operandLabelText.filter{ $0 != "-" }
        } else {
            operandLabelText = "-" + operandLabelText
        }

        currentOperandLabel.text = operandLabelText
    }
    
    @IBAction func tappedClearButton(_ sender: Any) {
        isInitializeCurrentOperandLabel = true
        isResultValue = false
        isZeroButtonTappedBefore = false
        isDotUsed = false
    }
    
    @IBAction func tappedAllClearButton(_ sender: Any) {
        partOfFormulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        isInitializeCurrentOperandLabel = true
        isInitializeCurrentOperatorLabel = true
        isResultValue = false
        isZeroButtonTappedBefore = true
        isDotUsed = false
        isOperatorButtonPushed = false
    }
}

extension ViewController {
    private func settingFormula(isEndByPoint: Bool = false, isResultComma: Bool = false) {
        guard let operatorString = currentOperatorLabel.text,
              let operandString = currentOperandLabel.text else {
            return
        }
        print(presentFormula)
        currentFormula.append(presentFormula)
        addView(operatorString, checkFutureOperand(operandString))
    }
}

extension ViewController {
    func addSubView(_ `operator`: String, _ operand: String) -> UIStackView {
        let operatorLabel: UILabel = {
            let label = UILabel()
            
            label.text = `operator`
            label.textColor = .white
            
            return label
        }()
        
        let operandLabel: UILabel = {
            let label = UILabel()
            
            label.text = operand.filter { $0 != "," }
            label.font = .preferredFont(forTextStyle: .title2)
            label.textColor = .white
            
            return label
        }()
        
        let subStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [operatorLabel,operandLabel])
            
            stackView.spacing = 8
            stackView.alignment = .bottom
            
            return stackView
        }()
        
        return subStackView
    }
    
    func addView(_ `operator`: String, _ operand: String) {
        partOfFormulaStackView.addArrangedSubview(addSubView(`operator`, operand))
        
        formulaScrollView.layoutIfNeeded()
        formulaScrollView.setContentOffset(CGPoint(x: 0, y: formulaScrollView.contentSize.height - formulaScrollView.bounds.height), animated: true)
    }

}

extension ViewController {
    private func checkFutureOperand(_ input: String) -> String {
        guard let number = Double(input.filter { $0 != "," })?.formatNumber(),
              input.count <= 20 else {
            return "error"
        }
        
        return number
    }
    
    private var presentFormula: String {
        guard let numberText = currentOperandLabel.text,
              let operatorText = currentOperatorLabel.text else {
            return "NaN"
        }
        
        return "\(operatorText) \(checkFutureOperand(numberText).filter { $0 != "," }) "
    }
}
