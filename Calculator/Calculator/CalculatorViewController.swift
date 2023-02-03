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
    
    @IBAction func didTapACButton() {
        
    }
    
    @IBAction func didTapCEButton() {
        
    }
    
    @IBAction func didTapChangeSignButton() {
        guard calculateNumber != "0" else { return }
        
        guard let calculateNumberFirst = calculateNumber.first else { return }
        
        if calculateNumberFirst == "-" {
            calculateNumber.removeFirst()
        } else {
            calculateNumber.insert("-", at: calculateNumber.startIndex)
        }
        
        operandLabel.text = calculateNumber
    }
    
    @IBAction func didTapResultButton() {
        var formula = ExpressionParser.parse(from: calculatorString)
        
        let result = formula.result()
        operandLabel.text = numberFormatter.string(for: result)
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        guard isInOperand,
              Double(calculateNumber) != nil else { return }
        
        addToCalculateItem()
        
        operatorLabel.text = sender.currentTitle
        calculateSign = sender.currentTitle ?? ""
        
        operandLabel.text = "0"
        calculateNumber = "0"
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

