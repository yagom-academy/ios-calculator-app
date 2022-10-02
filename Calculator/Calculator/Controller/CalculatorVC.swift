//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

final class CalculatorVC: UIViewController {
    
    private var totalFormulaString: String = ""
    private var currentNumber: String = ""
    
    @IBOutlet private weak var calculationFormulaScroll: UIScrollView!
    @IBOutlet private weak var operatorLabel: UILabel!
    @IBOutlet private weak var operandLabel: UILabel!
    @IBOutlet private weak var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetAllUI()
    }
    
    private func resetAllUI() {
        mainStackView.subviews.forEach { $0.removeFromSuperview()
        }
        operatorLabel.text = ""
        operandLabel.text = "0"
        currentNumber = ""
        totalFormulaString = ""
    }
    
    @IBAction private func touchUpNumberButton(_ sender: UIButton) {
        if operandLabel.text?.first == "0" {
            operandLabel.text?.removeFirst()
        }
        currentNumber.append(sender.titleLabel?.text ?? "")
        
        if currentNumber.contains(".") {
            guard let integerPart = currentNumber.components(separatedBy: ".").first,
                  let fractionPart = currentNumber.components(separatedBy: ".").last else {
                return
            }
            operandLabel.text = numberFormatter(number: integerPart) + "." + fractionPart
        } else {
            operandLabel.text = numberFormatter(number: currentNumber)
        }
    }
    
    @IBAction private func touchUpDotButton(_ sender: UIButton) {
        if currentNumber.contains(".") {
            return
        } else if operandLabel.text == "0" {
            currentNumber = "0."
        } else {
            currentNumber.append(sender.titleLabel?.text ?? "")
        }
        
        if currentNumber.last == "." {
            operandLabel.text = "\(numberFormatter(number: currentNumber))."
        } else {
            operandLabel.text = numberFormatter(number: currentNumber)
        }
    }
    
    @IBAction private func touchUpAcButton(_ sender: UIButton) {
        resetAllUI()
    }
    
    @IBAction private func touchUpCeButton(_ sender: UIButton) {
        currentNumber = ""
        operandLabel.text = "0"
    }
    
    @IBAction private func touchUpConvertPlusMinusButton(_ sender: UIButton) {
        if operandLabel.text == "0" {
            return
        } else if currentNumber.first == "-" {
            currentNumber.remove(at: currentNumber.startIndex)
        } else {
            currentNumber = "-\(currentNumber)"
        }
        operandLabel.text = currentNumber
    }
    
    @IBAction private func touchUpOperatorButton(_ sender: UIButton) {
        if operandLabel.text == "0" {
            operatorLabel.text = sender.titleLabel?.text
        } else {
            makeFormulaStackView()
            scrollToBottom()
            if totalFormulaString.isEmpty {
                totalFormulaString.append(currentNumber)
            } else {
                totalFormulaString.append(operatorLabel.text ?? "")
                totalFormulaString.append(currentNumber)
            }
            operatorLabel.text = sender.titleLabel?.text
            currentNumber = ""
            operandLabel.text = "0"
        }
    }
    
    private func makeFormulaStackView() {
        let operatorLabel = makeLabel(text: operatorLabel.text)
        let operandLabel = makeLabel(text: operandLabel.text)
        let formulaStackView: UIStackView
        
        if totalFormulaString.isEmpty {
            formulaStackView = UIStackView(arrangedSubviews: [operandLabel])
        } else {
            formulaStackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
        }
        formulaStackView.spacing = 8
        mainStackView.addArrangedSubview(formulaStackView)
    }
    
    private func makeLabel(text: String?) -> UILabel {
        let label: UILabel = UILabel()
        label.text = text
        label.textColor = .white
        return label
    }
    
    private func scrollToBottom() {
        view.layoutIfNeeded()
        calculationFormulaScroll.setContentOffset(
            CGPoint(x: 0,
                    y: calculationFormulaScroll.contentSize.height
                    - calculationFormulaScroll.bounds.height),
            animated: true)
    }
    
    @IBAction private func touchUpEqualButton(_ sender: UIButton) {
        if totalFormulaString.isEmpty == false {
            totalFormulaString += operatorLabel.text ?? ""
            totalFormulaString += currentNumber
            makeFormulaStackView()
            scrollToBottom()
            var formula = ExpressionParser.parse(from: totalFormulaString)
            let result = formula.result()
            if result.isInfinite || result.isNaN {
                operandLabel.text = "NaN"
            } else {
                operandLabel.text = numberFormatter(number: String(result))
            }
            totalFormulaString = ""
        }
    }
    
    private func numberFormatter(number: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let decimalNumber = Double(number) else {
            return number
        }
        return numberFormatter.string(from: NSNumber(value: decimalNumber))!
    }
}
