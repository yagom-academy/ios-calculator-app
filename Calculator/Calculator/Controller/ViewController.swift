//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var presentValue: UILabel!
    @IBOutlet weak var presentOperator: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    var inputOperand: String = ""
    var inputValues: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeHistory()
    }
    
    @IBAction func didTapOperand(sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text else { return }
        
        if inputOperand.count >= 16 {
            return
        }
        
        if inputOperand == "0" && buttonLabel == "0" {
            return
        }
        
        if inputOperand == "0" {
            inputOperand = buttonLabel
            presentValue.text = inputOperand
            return
        }
        
        if inputOperand.last == "." || inputOperand.last == "0" {
            inputOperand += buttonLabel
            presentValue.text = inputOperand
            return
        }
        
        inputOperand += buttonLabel
        presentValue.text = numberFormatter(number: inputOperand)
    }
    
    @IBAction func didTapOperator(sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text else { return }
        
        if inputOperand == "0" {
            return
        }
        
        if inputValues.isEmpty {
            let newStackView = makeStackView()
            newStackView.addArrangedSubview(makeLable(text: numberFormatter(number: inputOperand)))
            stackView.addArrangedSubview(newStackView)
            scrollView.scrollToBottom()
            inputValues.append(inputOperand)
            inputValues.append(buttonLabel)
            inputOperand = "0"
            presentValue.text = inputOperand
            presentOperator.text = buttonLabel
            return
        }
        
        if inputValues.isEmpty == false {
            let newStackView = makeStackView()
            newStackView.addArrangedSubview(makeLable(text: buttonLabel))
            newStackView.addArrangedSubview(makeLable(text: numberFormatter(number: inputOperand)))
            stackView.addArrangedSubview(newStackView)
            scrollView.scrollToBottom()
            inputValues.append(inputOperand)
            inputValues.append(buttonLabel)
            inputOperand = "0"
            presentValue.text = inputOperand
            presentOperator.text = buttonLabel
            return
        }
    }
    
    @IBAction func didTapDot(sender: UIButton) {
        guard let buttonLabel = sender.titleLabel?.text else { return }
        guard let lableText = presentValue.text else { return }
        
        if inputOperand.contains(".") {
            return
        }
        
        inputOperand += buttonLabel
        presentValue.text = lableText + buttonLabel
    }
    
    @IBAction func changeSign(sender: UIButton) {
        if inputOperand == "0" {
            return
        }
        
        let converteDouble = Double(inputOperand) ?? .zero
        inputOperand = String(converteDouble * -1)
        presentValue.text = numberFormatter(number: inputOperand)
    }
    
    @IBAction func didTapEqualSign() {
        let newStackView = makeStackView()
        newStackView.addArrangedSubview(makeLable(text: presentOperator.text ?? "NaN"))
        newStackView.addArrangedSubview(makeLable(text: inputOperand))
        stackView.addArrangedSubview(newStackView)
        scrollView.scrollToBottom()
        
        let valueToBeCalculated = inputValues.joined(separator: " ") + " " + inputOperand
        var fomula = ExpressionParser.parse(from: valueToBeCalculated)
        let result = String(fomula.result())
        presentValue.text = numberFormatter(number: result)
        presentOperator.text = ""
    }
    
    @IBAction func didTapAC() {
        removeHistory()
    }
    
    @IBAction func didTapCE() {
        inputOperand = "0"
        presentValue.text = inputOperand
    }
}

extension UIScrollView {
    func scrollToBottom() {
        self.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(bottomOffset, animated: true)
    }
}

extension ViewController {
    
    func removeHistory() {
        stackView.subviews.forEach{ (view) in view.removeFromSuperview() }
        presentValue.text = "0"
        presentOperator.text = ""
        inputOperand = "0"
        inputValues.removeAll()
    }
    
    private func numberFormatter(number: String) -> String {
        let convertedNumber = Double(number)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        guard let result = numberFormatter.string(for: convertedNumber) else { return "NaN" }
        return result
    }
    
    func makeLable(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        return label
    }
    
    func makeStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }
}
