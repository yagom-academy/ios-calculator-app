//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    // MARK: - IBOutlet
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var calculateItemsStack: UIStackView!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    // MARK: - Property
    
    var components: String = ""
    
    // MARK: - View State Method

    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    // MARK: - IBAction
    
    @IBAction func tapACButton(_ sender: Any) {
        clearAll()
    }

    @IBAction func tapCEButton(_ sender: Any) {
        clearEntry()
    }

    @IBAction func tapNEGButton(_ sender: Any) {
        toggleNegativeNumber()
    }

    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard formatNumber(of: Decimal(string: operandLabel.text ?? "")) != "0" else {
            return
        }
        
        appendCalculateItem()
        
        operatorLabel.text = sender.titleLabel?.text
        clearEntry()
    }

    @IBAction func tapNumberButton(_ sender: UIButton) {
        let operandLabelText = operandLabel.text?
            .components(separatedBy: ",")
            .joined()
        
        guard var operandLabelText, operandLabelText.count < 20 else {
            return
        }
        
        operandLabelText.append(sender.titleLabel?.text ?? "")
        let number = Decimal(string: operandLabelText)
        
        operandLabel.text = formatNumber(of: number)
    }

    @IBAction func tapZeroButton(_ sender: UIButton) {
        guard
            let operandLabelText = operandLabel.text,
            operandLabelText != "0" || operandLabelText.contains(".")
        else {
            return
        }
        
        operandLabel.text?.append(sender.titleLabel?.text ?? "")
    }

    @IBAction func tapDotButton(_ sender: UIButton) {
        guard
            let operandLabelText = operandLabel.text,
            !operandLabelText.contains(".")
        else {
            return
        }
        
        operandLabel.text?.append(".")
    }

    @IBAction func tapEqualsButton(_ sender: Any) {

    }

    // MARK: - Method
    
    func formatNumber(of number: Any?) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 15
        
        return numberFormatter.string(for: number)
    }
    
    func clearAll() {
        calculateItemsStack.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        
        clearOperator()
        clearEntry()
    }
    
    func clearOperator() {
        operatorLabel.text = nil
    }
    
    func clearEntry() {
        operandLabel.text = "0"
    }
    
    func toggleNegativeNumber() {
        guard var operandLabelText = operandLabel.text, operandLabelText != "0" else {
            return
        }
        
        if operandLabelText.contains("-") {
            operandLabelText.removeFirst()
        } else {
            operandLabelText = "-\(operandLabelText)"
        }
        
        operandLabel.text = operandLabelText
    }
    
    func appendCalculateItem() {
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        
        operatorLabel.textColor = .white
        operandLabel.textColor = .white
        
        operatorLabel.text = self.operatorLabel.text
        operandLabel.text = formatNumber(of: Decimal(string: self.operandLabel.text ?? ""))
        
        if operandLabel.text?.last == "." {
            operandLabel.text?.removeLast()
        }
        
        let calculateItemStack = UIStackView()
        calculateItemStack.axis = .horizontal
        calculateItemStack.spacing = 8.0
        calculateItemStack.addArrangedSubview(operatorLabel)
        calculateItemStack.addArrangedSubview(operandLabel)
        
        calculateItemsStack.addArrangedSubview(calculateItemStack)
        
        components.append(operatorLabel.text ?? "")
        components.append(operandLabel.text ?? "")
    }
}

