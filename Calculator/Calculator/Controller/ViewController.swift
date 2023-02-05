//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var OperatorLabel: UILabel!
    @IBOutlet weak var OperandsLabel: UILabel!
    @IBOutlet var containerStackView: UIStackView!
    @IBOutlet var scrollView: UIScrollView!
    
    private var isDotClicked: Bool = false
    private var currentLabelText: String = ""
    private var inputList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialValue()
    }
    
    @IBAction func operandsButtonTapped(_ sender: UIButton) {
        guard let inputNumber = sender.currentTitle else { return }
        
        switch inputNumber {
        case "0", "00":
            
            if currentLabelText.isEmpty {
                currentLabelText = "0"
                OperandsLabel.text = "0"
                return
            } else if currentLabelText == "0" {
                return
            }
            
            currentLabelText += inputNumber
            
        default: currentLabelText += inputNumber
        }
        OperandsLabel.text = formatNumber(currentLabelText)
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let formattedOperands = OperandsLabel.text,
              let operatorSign = sender.currentTitle else { return }
        
        if currentLabelText.isEmpty && formattedOperands == "0" {
            OperatorLabel.text = sender.currentTitle
            return
        }
        
        let operands = restorationNumber(formattedOperands)
        updateScrollView()
        inputList.append(operands)
        
        inputList.append(operatorSign)
        OperatorLabel.text = operatorSign
        currentLabelText.removeAll()
        OperandsLabel.text = "0"
    }
    
    private func updateScrollView() {
        let stackView = makeUIStackView()
        
        let operatorLabel = makeUILabel(text: OperatorLabel.text)
        let operandsLabel = makeUILabel(text: OperandsLabel.text)
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandsLabel)
        
        containerStackView.addArrangedSubview(stackView)
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height), animated: true)
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard currentLabelText.isEmpty == false,
              let operatorSign = OperatorLabel.text  else { return }
        
        guard inputList.isEmpty == false else { return }
        inputList.removeLast()
        inputList.append(operatorSign)
        
        updateScrollView()
        inputList.append(currentLabelText)
        
        let formulaBeforeParse = inputList.reduce("") { current, next in
            current + " " + next
        }
        
        var formula = ExpressionParser.parse(from: formulaBeforeParse)
        guard let result = formula.result(),
              result.isNaN == false  else {
            OperandsLabel.text = Double.nan.description
            isDotClicked = false
            
            inputList.removeAll()
            currentLabelText.removeAll()
            OperatorLabel.text = ""
            return
        }
        
        let intResult = Int(result)
        
        inputList.removeAll()
        currentLabelText.removeAll()
        OperatorLabel.text = ""
        
        
        if result == Double(intResult) {
            OperandsLabel.text = formatNumber(intResult.description)
            isDotClicked = false
        } else {
            OperandsLabel.text = formatNumber(result.description)
            isDotClicked = true
        }
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        inputList.removeAll()
        currentLabelText.removeAll()
        OperatorLabel.text?.removeAll()
        OperandsLabel.text?.removeAll()
        containerStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    @IBAction func clearCurrentButtonTapped(_ sender: UIButton) {
        currentLabelText.removeAll()
        OperandsLabel.text = "0"
    }
    
    @IBAction func changeSignButtonTapped(_ sender: UIButton) {
        guard var operands = OperandsLabel.text,
              operands != "0"  else { return }
        
        if operands.first == "-" {
            operands.removeFirst()
        } else {
            operands = "-" + operands
        }
        currentLabelText = operands
        OperandsLabel.text = operands
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard currentLabelText.isEmpty == false else {
            currentLabelText = "0."
            OperandsLabel.text = currentLabelText
            return
        }
        
        if isDotClicked == false {
            currentLabelText += "0."
            OperandsLabel.text = currentLabelText
            isDotClicked = true
        } else if isDotClicked == true {
            return
        }
    }
    
    private func formatNumber(_ stringNumber: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 6
        
        guard let number = Double(stringNumber) else { return "" }
        let formattedNumber = formatter.string(from: NSNumber(value: number))  ?? ""
        
        if isDotClicked == true {
            let numbers = stringNumber.split(with: ".")
            let formattedNumberWithDecimal = formattedNumber + "." + numbers[1]
            return formattedNumberWithDecimal
        }
    
        return formattedNumber
    }
    
    
    private func restorationNumber(_ formattedNumber: String) -> String {
        let result = formattedNumber.replacingOccurrences(of: ",", with: "")
        return result
    }
    
    private func checkIsItDecimal(number: Double) -> Bool {
        let intNumber = Int(number)
        
        if number == Double(intNumber) {
            return false
        } else {
            return true
        }
    }
    
    private func makeUILabel(text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        return label
    }
    
    private func makeUIStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .trailing
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }

    private func setupInitialValue() {
        OperandsLabel.text = "0"
    }
}
