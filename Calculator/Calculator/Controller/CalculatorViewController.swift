//
//  Calculator - ViewController.swift
//  Created by Kiwi. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    var userInput: String = ""
    
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
        userInput.append(digit)
        print(userInput)
    }
    
    @IBAction func didTapDot(_ sender: UIButton) {
        let dot = sender.currentTitle!
        let textCurrentlyInDisply = operandLabel.text!
        
        if textCurrentlyInDisply.contains(Character(dot)) {
            return
        } else {
            operandLabel.text! = textCurrentlyInDisply + dot
        }
        userInput.append(dot)
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        let operators = sender.currentTitle!
        addInputStack()
        
        guard let lastCharacter = userInput.last else { return }
        guard let _ = Double(String(lastCharacter)) else { return }
        
        operatorLabel.text = operators
        operandLabel.text = "0"
        userNumberTapped = false
        userInput.append(operators)
    }
    
    @IBAction func didTapPlusMinusSignButton(_ sender: UIButton) {
        
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
}

