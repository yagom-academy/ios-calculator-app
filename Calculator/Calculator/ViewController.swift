//
//  Calculator - ViewController.swift
//  Created by unchain123
//
// 

import UIKit

class ViewController: UIViewController {
    
    var userIsInTheMiddleOfTyping = false
    var valueStack: String = ""
    
    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var expressionView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func makeNewStackView() {
        
        let subExpressionStackView = UIStackView()
        let subOperandsLabel = UILabel()
        let subOperatorLabel = UILabel()
        
        subExpressionStackView.axis = .horizontal
        subOperandsLabel.textColor = .white
        subOperatorLabel.textColor = .white
        
        if operatorLabel == nil {
            subOperandsLabel.text = operandsLabel.text
            operandsLabel.text = "0"
        } else {
            subOperandsLabel.text = operandsLabel.text
            subOperatorLabel.text = operatorLabel.text
            operandsLabel.text = "0"
        }
        
        subExpressionStackView.addArrangedSubview(subOperatorLabel)
        subExpressionStackView.addArrangedSubview(subOperandsLabel)
        expressionView.addArrangedSubview(subExpressionStackView)
    }
    
    func makeResultLabel() {
        let newStackView = UIStackView()
        let newOperandsLabel = UILabel()
        let newOperatorLabel = UILabel()
        
        newStackView.axis = .horizontal
        newOperandsLabel.textColor = .white
        newOperatorLabel.textColor = .white
        
        newOperandsLabel.text = operandsLabel.text
        newOperatorLabel.text = operatorLabel.text
        
        newStackView.addArrangedSubview(newOperatorLabel)
        newStackView.addArrangedSubview(newOperandsLabel)
        expressionView.addArrangedSubview(newStackView)
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle, let currentLabel = operandsLabel.text else {
            return
        }
        
        if currentLabel.contains(".") && buttonTitle == "." {
            return
        } else if userIsInTheMiddleOfTyping {
            operandsLabel.text? += buttonTitle
            valueStack += buttonTitle
        } else {
            operandsLabel.text = buttonTitle
            valueStack += buttonTitle
        }
        
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        guard let operatorButtonTitle = sender.currentTitle else {
            return
        }
        if userIsInTheMiddleOfTyping {
            makeNewStackView()
            operatorLabel.text = operatorButtonTitle
            valueStack += " \(operatorButtonTitle) "
        } else {
            operatorLabel.text = operatorButtonTitle
            valueStack = String(valueStack.dropLast(3))
            valueStack += " \(operatorButtonTitle) "
            return
        }
        
        userIsInTheMiddleOfTyping = false
    }
    
    @IBAction func didTapEqualButton(_ sender: UIButton) {
        if let result = try? ExpressionPaser.parse(from: valueStack).result() {
            operandsLabel.text = convertToDecimal(result)
            makeResultLabel()
        }
        
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction func didTapAllClearButton(_ sender: UIButton) {
        expressionView.subviews.forEach { madeUIView in
            madeUIView.removeFromSuperview()
        }
        operandsLabel.text = "0"
        operatorLabel.text?.removeAll()
        valueStack = ""
        userIsInTheMiddleOfTyping = false
    }
    
    @IBAction func didTabclearEntryButton(_ sender: UIButton) {
        if let lastIndex = valueStack.last, Double(String(lastIndex)) != nil {
            operandsLabel.text = String((operandsLabel.text ?? "0").dropLast())
        } else {
            return
        }
        
        if operandsLabel.text == "" {
            operandsLabel.text = "0"
        }
        
        valueStack = String(valueStack.dropLast())
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction func didTapToggleButton(_ sender: UIButton) {
        guard let presentNumber = operandsLabel.text, presentNumber != "0" else {
            return
        }
        
        checkIncludeHyphen(to: presentNumber)
        
        let valueStackArray = valueStack.split(with: " ").dropLast().reduce("", +)
        valueStack = valueStackArray + (operandsLabel.text ?? "")
    }
    
    override func viewWillLayoutSubviews() {
        let bottomOffSet =
        CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height)
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(bottomOffSet, animated: true)
    }
    
    private func convertToDecimal(_ number: Double) -> String {
        var valueStorage = ""
        let format = NumberFormatter()
        format.numberStyle = .decimal
        format.maximumSignificantDigits = 20
        format.roundingMode = .up
        
        if let value = format.string(for: number) {
            valueStorage = value
        }
        return valueStorage
    }
    
    private func checkIncludeHyphen(to presentNumber: String) {
        if presentNumber.contains("−") {
            operandsLabel.text = presentNumber.filter { element -> Bool in
                if element == "−" {
                    return false
                }
                return true
            }
            return
        }
        operandsLabel.text = "−" + presentNumber
    }
}



