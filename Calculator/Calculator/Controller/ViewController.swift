//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operators: UILabel!
    @IBOutlet weak var operands: UILabel!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    private var saveFormula = [String]()
    
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
            let stackView = UIStackView()
            
            stackView.axis = .horizontal
            stackView.spacing = 8
            stackView.alignment = .bottom
            stackView.addArrangedSubview(operatorLabel)
            stackView.addArrangedSubview(operandLabel)
            
            return stackView
        }()
        
        return subStackView
    }
    
    func addView(_ `operator`: String, _ operand: String) {
        stackView.addArrangedSubview(addSubView(`operator`, operand))
    }
    
    //MARK: - Button Action
    @IBAction func tappedOperandsButton(_ sender: UIButton) {
        guard let operand = sender.currentTitle else {
            return
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
        guard let `operator` = sender.currentTitle else {
            return
        }
        
        if operands.text != "0" {
            settingFormula()
        }
        operators.text = `operator`
        clearEntryText(isOperandClear: true, isOperatorClear: false)
    }
    
    @IBAction func tappedResultButton(_ sender: Any) {
        settingFormula()
        
        var formula = ExpressionParser.parse(from: saveFormula.joined())
        let result = formula.result()
        
        operands.text = formattingNumbers(result)
        saveFormula = []
        clearEntryText(isOperandClear: false, isOperatorClear: true)
        
    }
    
    @IBAction func tappedChangeMinusSignButton(_ sender: Any) {
        guard let operand = operands.text, let operandsNumber = (Double(operand)) else {
            return
        }
        
        operands.text = formattingNumbers(operandsNumber * -1)
    }
    
    @IBAction func tappedClearButton(_ sender: Any) {
        clearEntryText(isOperandClear: true, isOperatorClear: false)
    }
    
    @IBAction func tappedAllClearButton(_ sender: Any) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        clearEntryText(isOperandClear: true, isOperatorClear: true)
    }
}

extension ViewController {
    private func settingFormula() {
        guard let operatorString = operators.text, let operandString = operands.text else { return }
        
        saveFormula.append("\(operatorString) ")
        saveFormula.append("\(operandString) ")
        addView(operatorString, operandString)
    }
    
    private func formattingNumbers(_ input: Double) -> String {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.roundingMode = .halfUp
        numberFormatter.alwaysShowsDecimalSeparator = false
        
        return numberFormatter.string(from: input as NSNumber) ?? "NaN"
    }
    
    private func clearEntryText(isOperandClear: Bool, isOperatorClear: Bool) {
        if isOperandClear {
            operands.text = "0"
        }
        if isOperatorClear {
            operators.text = ""
        }
    }
}

