//
//  Calculator - ViewController.swift
//  Created by Kiwi. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    var userInput: String = ""
    var userInputNumber: String = ""
    
    private var userNumberTapped = false
    
    @IBOutlet weak var inputStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userInput.isEmpty, operandLabel.text == "0", digit == "0" || digit == "00" {
            return
        }
        
        if inputStackView.subviews.isEmpty == false, operatorLabel.text!.isEmpty {
            removeStack()
            operandLabel.text! = ""
            userInputNumber = ""
        }
        
        if operandLabel.text! == "NaN" {
            removeStack()
            operandLabel.text! = ""
            userInputNumber = ""
        }
        
        if userInput.isEmpty == false, digit == "0" {
            userNumberTapped = false
        }
        
        if userNumberTapped {
            operandLabel.text! += digit
        }
        else if operandLabel.text!.contains(".") {
            userNumberTapped = true
        } else {
            operandLabel.text! = digit
        }
        
        if operandLabel.text!.contains(",") {
            operandLabel.text! = operandLabel.text!.replacingOccurrences(of: ",", with: "")
        }
        
        let validNumber = makeDouble(number: operandLabel.text!)
        let number = doNumberFormatter(number: validNumber)
        
        operandLabel.text = number
        userNumberTapped = true
        userInputNumber.append(digit)
    }
    
    @IBAction func didTapDot(_ sender: UIButton) {
        let dot = sender.currentTitle!
        let textCurrentlyInDisply = operandLabel.text!
        
        if textCurrentlyInDisply.contains(Character(dot)) {
            return
        } else if operandLabel.text == "0" {
            operandLabel.text = "0."
            userInputNumber.append(contentsOf: "0")
            userNumberTapped = true
        } else {
            operandLabel.text! = textCurrentlyInDisply + dot
        }
        
        userInputNumber.append(dot)
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        let operators = sender.currentTitle!
        
        guard let lastCharacter = userInputNumber.last else { return }
        guard let _ = Double(String(lastCharacter)) else { return }
        
        addInputStack()
        operatorLabel.text = operators
        operandLabel.text = "0"
        userNumberTapped = false
        userInput.append(contentsOf: userInputNumber)
        userInput.append(contentsOf: " ")
        userInput.append(operators)
        userInput.append(contentsOf: " ")
        userInputNumber = ""
        print(userInput)
    }
    
    @IBAction func didTapPlusMinusSignButton(_ sender: UIButton) {
        if operandLabel.text == "0" {
            return
        }
        
        if operandLabel.text!.hasPrefix("-") {
            operandLabel.text = String(operandLabel.text!.dropFirst())
            userInputNumber = String(userInputNumber.dropFirst())
        } else {
            operandLabel.text = "-" + operandLabel.text!
            userInputNumber = "-" + userInputNumber
        }
    }
    
    @IBAction func removeAllButton(_ sender: UIButton) {
        userInput = ""
        userInputNumber = ""
        setupViews()
        removeStack()
        userNumberTapped = false
    }
    
    @IBAction func removeCurrentNumberButton(_ sender: UIButton) {
        operandLabel.text = "0"
        userInputNumber = ""
        userNumberTapped = false
    }
    
    private func generateStackLabels() -> (UILabel, UILabel)? {
        guard let `operator` = operatorLabel.text,
              let number = operandLabel.text else {
            return nil
        }
        let operatorStackLabel = UILabel()
        let numberStackLabel = UILabel()
        
        operatorStackLabel.textColor = .white
        operatorStackLabel.text = `operator`
        
        numberStackLabel.textColor = .white
        numberStackLabel.text = number
        
        return (operatorStackLabel, numberStackLabel)
    }
    
    private func generateStack() -> UIStackView? {
        guard let (operatorStackLabel, numberStackLabel) = generateStackLabels() else {
            return nil
        }
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .fill
        
        stack.addArrangedSubview(operatorStackLabel)
        stack.addArrangedSubview(numberStackLabel)
        
        return stack
    }
    
    private func addInputStack() {
        guard let stack = generateStack() else {
            return
        }
        
        inputStackView.addArrangedSubview(stack)
        scrollToBottom(scrollView)
    }
    
    private func scrollToBottom(_ scrollView: UIScrollView) {
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.frame.height), animated: false)
    }
    
    private func removeStack() {
        inputStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func makeDouble(number: String) -> Double {
        guard let validNumber = Double(number) else { return 0 }
        return validNumber
    }
    
    func doNumberFormatter(number:Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.maximumIntegerDigits = 20
        
        guard let formattedNumber = numberFormatter.string(from: number as NSNumber) else {
            return "NaN"
        }
        return formattedNumber
    }
    
    @IBAction func didTapCalculateButton(_ sender: UIButton) {
        if operatorLabel.text == "" {
            return
        }
        
        operatorLabel.text! = ""
        addInputStack()
        userInput.append(userInputNumber)
        do {
            var result = ExpressionParser.parse(from: userInput)
            var number = doNumberFormatter(number: try result.result())
            
            if number == "-0" {
                number = "0"
            }
            
            operandLabel.text = number
            userInput = ""
            userInputNumber = number.replacingOccurrences(of: ",", with: "")
            print(userInputNumber)
        } catch OperatorError.divideZero {
            operandLabel.text = "NaN"
            userInput = ""
        } catch OperatorError.wrongFormula {
            operandLabel.text = "NaN"
            userInput = ""
        } catch {
            return
        }
    }
    
}

