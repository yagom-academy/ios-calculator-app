//
//  Calculator - CalculatorViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {

    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    @IBOutlet weak var calculateStackView: UIStackView!
    @IBOutlet weak var calculateScrollView: UIScrollView!

    private var expression: [String] = []
    
    private let numberFormatter = NumberFormatter()
    
    private var isCalculated: Bool = false
    
    private var calculateOperand: String = "0" {
        didSet {
            operandLabel.text = calculateOperand
        }
    }
    
    private var calculateOperator: String = "" {
        didSet {
            operatorLabel.text = calculateOperator
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefault()
    }
    
    private func setDefault() {
        resetOperand()
        resetOperator()
    }
    
    @IBAction func didTapACButton() {
        calculateStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        resetOperand()
    }
    
    @IBAction func didTapCEButton() {
        if isCalculated {
            return
        }
        calculateOperand = "0"
    }
    
    @IBAction func didTapChangeSignButton() {
        guard calculateOperand != "0" else { return }
        
        guard let calculateNumberFirst = calculateOperand.first else { return }
        
        if calculateNumberFirst == "-" {
            calculateOperand.removeFirst()
        } else {
            calculateOperand = "-" + calculateOperand
        }
    }
    
    @IBAction func didTapResultButton() {
        guard calculateOperator != "" else { return }
        appendExpression(sign: calculateOperator, number: calculateOperand)
        addToCalculateItem(left: calculateOperator, right: calculateOperand)

        var formula = ExpressionParser.parse(from: expression.joined(separator: ""))
        
        let result = formula.result()
        
        if result.isNaN {
            calculateOperand = "NaN"
            resetOperator()
            isCalculated = true
        } else {
            calculateOperand = "\(result)"
            resetOperator()
            isCalculated = true
        }
        expression.removeAll()
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        guard let operatorSign = sender.currentTitle else { return }
        if calculateOperand == "0", calculateOperator == "" {
            return
        } else if calculateOperand == "0", calculateOperator != "" {
            calculateOperator = operatorSign
            return
        }
        
        if isCalculated {
            guard let calculatedNumber = operandLabel.text?
                                    .components(separatedBy: ",")
                                    .joined() else { return }
            
            appendExpression(sign: calculateOperator, number: calculatedNumber)
            addToCalculateItem(left: calculateOperator, right: calculatedNumber)
            scrollToBottom()
            
        } else {
            appendExpression(sign: calculateOperator, number: calculateOperand)
            addToCalculateItem(left: calculateOperator, right: calculateOperand)
            scrollToBottom()
        }
        
        
        isCalculated = false
        calculateOperator = operatorSign
        calculateOperand = "0"
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        if calculateNumber == "0" {
            switch number {
            case "0", "00":
                isInOperand = true
                return
            default:
                calculateNumber = number
            }
        } else {
            calculateNumber += number
        }
        
        operandLabel.text = calculateNumber
        isInOperand = true
    }
    
    @IBAction func didTapDotButton(_ sender: UIButton) {
        guard !calculateNumber.contains(".") else { return }
        
        calculateNumber += "."
        operandLabel.text = calculateNumber
    }
    
    private func setDefault() {
        operatorLabel.text = ""
        operandLabel.text = "0"
        calculateSign = ""
        calculateNumber = "0"
    }
    
    private func addToCalculateItem() {
        let stackView = makeHorizontalStackView()
        
        calculateStackView.addArrangedSubview(stackView)
    }
    
    private func makeHorizontalStackView() -> UIStackView {
        let operatorSign = UILabel()
        operatorSign.text = operatorLabel.text
        operatorSign.textColor = .white
        operatorSign.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let operandNumber = UILabel()
        operandNumber.text = operandLabel.text
        operandNumber.textColor = .white
        operandNumber.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.addArrangedSubview(operatorSign)
        stackView.addArrangedSubview(operandNumber)
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        return stackView
    }
}

