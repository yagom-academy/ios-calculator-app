//
//  Calculator - ViewController.swift
//  Created by DuDu
//

import UIKit

final class ViewController: UIViewController {
    private var currentNumber: String = ""
    private var expression: [String?] = []
    private var isInputExist: Bool = false
    private var isCalculateValue: Bool = false
    
    @IBOutlet private var logScrollView: UIScrollView!
    @IBOutlet private var calculateLogStackView: UIStackView!
    
    @IBOutlet private var numberLabel: UILabel!
    @IBOutlet private var operatorLabel: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
    }
    
    @IBAction private func numberButtonDidTapped(_ sender: UIButton) {
        if numberLabel.text == "NaN" {
            return
        }
        
        if isCalculateValue {
            isCalculateValue = false
            acButtonDidTapped(nil)
        }
        
        let inputNumber = sender.titleLabel?.text
        
        if ["00","0"].contains(inputNumber) && numberLabel.text == "0" {
            isInputExist = true
            return
        }
        
        isInputExist = true
        currentNumber += inputNumber ?? ""
        numberLabel.text = currentNumber
    }
    
    @IBAction private func operatorButtonDidTapped(_ sender: UIButton?) {
        if numberLabel.text == "NaN" {
            return
        }
        
        if isInputExist == false {
            operatorLabel.text = sender?.titleLabel?.text
            return
        }
        
        isCalculateValue = false
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .trailing
        stackView.spacing = 10
        
        let numberLogLabel = UILabel()
        numberLogLabel.text = numberLabel.text
        numberLogLabel.textColor = .white
        
        let operatorLogLabel = UILabel()
        operatorLogLabel.text = operatorLabel.text
        operatorLogLabel.textColor = .white
        
        stackView.addArrangedSubview(operatorLogLabel)
        stackView.addArrangedSubview(numberLogLabel)
        
        calculateLogStackView.addArrangedSubview(stackView)
        logScrollView.scroll()
        
        expression.append(operatorLabel.text)
        expression.append(numberLabel.text)
    
        isInputExist = false
        currentNumber = ""
        operatorLabel.text = sender?.titleLabel?.text
        numberLabel.text = "0"
    }
    
    @IBAction private func dotButtonDidTapped(_ sender: Any) {
        if numberLabel.text == "NaN" {
            return
        }
        
        if currentNumber.contains(".") {
            return
        }
        
        if isCalculateValue {
            return
        }
        
        if currentNumber.isEmpty {
            currentNumber = "0"
        }
        
        currentNumber += "."
        numberLabel.text = currentNumber
    }
    
    @IBAction private func acButtonDidTapped(_ sender: Any?) {
        expression.removeAll()
        currentNumber = ""
        numberLabel.text = "0"
        operatorLabel.text = ""
        isInputExist = false
        
        calculateLogStackView.arrangedSubviews.forEach { subView in
            subView.removeFromSuperview()
        }
    }
    
    @IBAction private func ceButtonDidTapped(_ sender: Any) {
        if numberLabel.text == "NaN" {
            return
        }
        
        currentNumber = ""
        numberLabel.text = "0"
        isInputExist = false
    }
    
    @IBAction private func signButtonDidTapped(_ sender: Any) {
        if numberLabel.text == "0" {
            return
        }
        
        guard let number = Double(currentNumber) else {
            return
        }
        
        if number < 0 {
            currentNumber.removeFirst()
        } else {
            currentNumber.insert("-", at: currentNumber.startIndex)
        }
        
        numberLabel.text = currentNumber
    }
    
    @IBAction private func calculateButtonDidTapped(_ sender: Any) {
        if expression.isEmpty {
            return
        }
        
        operatorButtonDidTapped(nil)
        
        let expressionString = expression.compactMap{$0}.joined(separator: " ")
        expression.removeAll()
        
        do {
            let calculateResult = try ExpressionParser.parse(from: expressionString).result()
            numberLabel.text = "\(calculateResult)"
            currentNumber = ""
            isCalculateValue = true
            isInputExist = true
        } catch {
            numberLabel.text = "NaN"
            currentNumber = ""
        }
    }
    
}

