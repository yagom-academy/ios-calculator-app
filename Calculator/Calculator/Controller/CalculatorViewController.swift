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
        
        if operandLabel.text == "0", digit == "0" || digit == "00" {
            return
        }
        
        if operandLabel.text!.count >= 20 {
            return
        }
        
        if userNumberTapped {
            let textCurrentlyInDisply = operandLabel.text!
            operandLabel.text! = textCurrentlyInDisply + digit
        }
        else if operandLabel.text!.contains(".") {
            userNumberTapped = true
        } else {
            operandLabel.text! = digit
        }
        
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
        
        guard operandLabel.text != "0" else { return }
        guard let lastCharacter = userInputNumber.last else { return }
        guard let _ = Double(String(lastCharacter)) else { return }
        
        addInputStack()
        operatorLabel.text = operators
        operandLabel.text = "0"
        userNumberTapped = false
        userInput.append(contentsOf: userInputNumber)
        userInput.append(operators)
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
}

