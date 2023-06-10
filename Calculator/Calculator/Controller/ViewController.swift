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
    private let numberFormatter = NumberFormatter()
    private var isZeroButtonTappedBefore = true
    private var isResultValue = false
    private var isDotUsed = false
    private var isInitializeCurrentOperandLabel = false {
        didSet {
            if oldValue == false {
                currentOperandLabel.text = "0"
                isInitializeCurrentOperandLabel = false
            }
        }
    }
    private var isInitializeCurrentOperatorLabel = false {
        didSet {
            if oldValue == false {
                currentOperatorLabel.text = ""
                isInitializeCurrentOperatorLabel = false
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
              isResultValue == false else {
            return
        }
        
        if operandLabelText == "0" {
            currentOperandLabel.text = number
        } else {
            currentOperandLabel.text = operandLabelText + number
        }
    }
    
    @IBAction func tappedDotButton(_ sender: UIButton) {
        guard isDotUsed, let operandLabelText = currentOperandLabel.text else {
            return
        }
        
        currentOperandLabel.text = operandLabelText + "."
    }
    
    @IBAction func tappedZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text, operandLabelText != "0" else {
            currentOperandLabel.text = "0"
            isZeroButtonTappedBefore = true
            return
        }
        
        currentOperandLabel.text = operandLabelText + "0"
    }
    
    @IBAction func tappedDoubleZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text, operandLabelText != "0" else {
            currentOperandLabel.text = "0"
            isZeroButtonTappedBefore = true
            return
        }
        
        currentOperandLabel.text = operandLabelText + "00"
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let operand = currentOperandLabel.text,
              operand != "0" || isZeroButtonTappedBefore else {
            return
        }
        
        if operand.hasSuffix(".") {
            settingFormula(isEndByPoint: true)
        } else if isResultValue {
            settingFormula(isResultComma: true)
        } else {
            settingFormula()
        }

        currentOperatorLabel.text = sender.currentTitle

        isResultValue = false
        isZeroButtonTappedBefore = false
        isInitializeCurrentOperandLabel = true
    }
    
    @IBAction func tappedResultButton(_ sender: Any) {
        guard isResultValue == false else {
            return
        }
        settingFormula()
        
        var formula = ExpressionParser.parse(from: currentFormula.joined())
        let result = formula.result()
        isResultValue = true
        isZeroButtonTappedBefore = true
        
        currentOperandLabel.text = formattingNumbers(result)
        currentFormula.removeAll()
        isInitializeCurrentOperatorLabel = true
    }
    
    @IBAction func tappedChangeMinusSignButton(_ sender: Any) {
        guard let operand = currentOperandLabel.text,
                operand != "0",
                let operandsNumber = (Double(operand)) else {
            return
        }
        
        currentOperandLabel.text = formattingNumbers(operandsNumber * -1)
    }
    
    @IBAction func tappedClearButton(_ sender: Any) {
        isInitializeCurrentOperandLabel = true
        isResultValue = false
        isZeroButtonTappedBefore = false
    }
    
    @IBAction func tappedAllClearButton(_ sender: Any) {
        partOfFormulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        initializeLabels()
        isResultValue = false
        isZeroButtonTappedBefore = true
    }
}

extension ViewController {
    private func settingFormula(isEndByPoint: Bool = false, isResultComma: Bool = false) {
        guard let operatorString = currentOperatorLabel.text,
              var operandString = currentOperandLabel.text else {
            return
        }

        if isEndByPoint {
            operandString = operandString.filter { $0 != "." }
        } else if isResultComma {
            operandString = operandString.filter { $0 != "," }
        }
        
        currentFormula.append("\(operatorString) ")
        currentFormula.append("\(operandString) ")
        addView(operatorString, operandString)
    }
    
    private func formattingNumbers(_ input: Double) -> String {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        numberFormatter.usesSignificantDigits = true
        
        return numberFormatter.string(from: Decimal(input) as NSNumber) ?? "NaN"
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
        partOfFormulaStackView.addArrangedSubview(addSubView(`operator`, operand))
        
        formulaScrollView.layoutIfNeeded()
        formulaScrollView.setContentOffset(CGPoint(x: 0, y: formulaScrollView.contentSize.height - formulaScrollView.bounds.height), animated: true)
    }

}
