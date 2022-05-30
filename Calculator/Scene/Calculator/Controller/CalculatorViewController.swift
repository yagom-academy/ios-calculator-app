//
//  Calculator - CalculatorViewController.swift
//  Created by bonf. 
//  Copyright © yagom. All rights reserved.
// 
import UIKit
import Foundation

class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var expressionStackView: UIStackView!
    @IBOutlet weak var operatorInput: UILabel!
    @IBOutlet weak var numberInput: UILabel!
    
    private var totalCalculation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText("0")
        clearStackView()
    }
    
    @IBAction private func numberButtonDidTapped(_ sender: UIButton) {
        updateNumberInput(sender)
    }
    
    private func updateNumberInput(_ sender: UIButton) {
        guard let number = checkNumber(sender) else {
            return
        }
        
        guard let formattedNumber = formatNumber(number) else {
            return
        }
        
        setNumber(formattedNumber)
    }
    
    private func checkNumber(_ sender: UIButton) -> String? {
        guard let firstConditionPassedText = isAdditionalNumberInput(sender) else {
            return nil
        }
        
        guard let secondConditionPassedText = isUsingComma(sender, firstConditionPassedText) else {
            return nil
        }
        
        return secondConditionPassedText
    }
    
    private func isAdditionalNumberInput(_ sender: UIButton) -> String? {
        guard let text = numberInput.text else {
            return nil
        }
        
        guard isNotAdditionalNumberInputAfterResultHasBeenShown(sender) else {
            return nil
        }
        return text
    }
    
    private func isNotAdditionalNumberInputAfterResultHasBeenShown(_ sender: UIButton) -> Bool {
        guard expressionStackView.arrangedSubviews.count <= 0 || operatorInput.text != "" else {
            clearStackView()
            numberInput.text = sender.currentTitle
            return false
        }
        return true
    }
    
    private func isUsingComma(_ sender: UIButton, _ text: String) -> String? {
        guard isCommaButtonNotTappedTwice(sender: sender, number: text) else {
            return nil
        }
        
        guard let newText = addNewNumber(sender, text) else {
            return nil
        }
        
        guard newText.contains(".") == false else {
            return nil
        }
        
        return newText
    }
    
    private func isCommaButtonNotTappedTwice(sender: UIButton, number: String) -> Bool {
        guard sender.currentTitle != "." || number.filter({ $0 == "." }).count < 1 else {
            return false
        }
        
        return true
    }
    
    private func addNewNumber(_ sender: UIButton, _ number: String) -> String? {
        guard let currentDigit: String = sender.currentTitle else {
            return nil
        }
        
        let newNumber: String
        newNumber = number + currentDigit
        numberInput.text = newNumber
        
        return numberInput.text
    }
    
    private func formatNumber(_ number: String) -> String? {
        guard let formattedNumber = formatNumberForBeingRecognizedAsNumber(number) else {
            return nil
        }
        
        guard let reFormattedNumber = formatNumberForExposure(formattedNumber) else {
            return nil
        }
        
        return reFormattedNumber
    }
    
    private func formatNumberForBeingRecognizedAsNumber(_ number: String) -> Double? {
        let onceTrimmmedInput = removeComma(number)
        
        guard let twiceTrimmedInput = convertStringToDouble(onceTrimmmedInput) else {
            return nil
        }
        
        return twiceTrimmedInput
    }
    
    private func removeComma(_ input: String) -> String {
        let trimmedInput = input.replacingOccurrences(of: ",", with: "")
        
        return trimmedInput
    }
    
    private func convertStringToDouble(_ input: String) -> Double? {
        guard let trimmedInput = Double(input) else {
            return nil
        }
        
        return trimmedInput
    }
    
    private func setNumber(_ number : String) {
        numberInput.text = number
    }
    
    private func formatNumberForExposure(_ number: Double) -> String? {
        let numberFormatter = setNumberFormatter()
        
        guard let formattedNumber = numberFormatter.string(from: number as NSNumber) else {
            return nil
        }
        
        return formattedNumber
    }
    
    private func setNumberFormatter() -> NumberFormatter {
        let numberFormatter = NumberFormatter()
            
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.maximumIntegerDigits = 20
        
        return numberFormatter
    }
    
    @IBAction private func operatorButtonDidTapped(_ sender: UIButton) {
        guard numberInput.text != "NAN" else { return }
        guard let formattableValue = numberInput.text else { return }
        let numericalValue = formattableValue.filter { $0 != ","}
        
        guard numericalValue != "0" else {
            //            if numberOfCalculation == 1 {
            //                return
            //            }
            operatorInput.text = sender.currentTitle
            return
        }
        
        removeZeroHasDot(numericalValue)
        
        addStackView()
        inputToCalculation(numericalValue)
        operatorInput.text = sender.currentTitle
        numberInput.text = "0"
        holdScrollDown()
    }
    
    @IBAction private func resultButtonDidTapped(_ sender: UIButton) {
        guard numberInput.text != "NAN" else { return }
        guard operatorInput.text != "" else { return }
        
        inputToCalculation(numberInput.text!)
        
        do {
            addStackView()
            var a = ExpressionParser.parse(from: totalCalculation)
            let result = try a.result()
            changeFormat("\(result)")
            totalCalculation = ""
            holdScrollDown()
            //        } catch CalculatorError.lackOfInput {
            //            clearStackView()
            //            setLabelText("0")
            //        } catch DevideError.insufficientOperator {
            //            clearStackView()
            //            setLabelText("0")
            //        } catch DevideError.devideZero {
            //            clearStackView()
            //            setLabelText("NAN")
        } catch {
            print(Error.self)
        }
    }
    
    @IBAction private func changeValueButtonDidTapped(_ sender: UIButton) {
        let changeValue = sender.currentTitle
        if changeValue == "AC" {
            clearStackView()
            setLabelText("0")
        } else if changeValue == "CE" {
            numberInput.text = "0"
        } else {
            guard let value = numberInput.text else { return }
            checkNegativeNumber(value)
        }
    }
    
    private func setLabelText(_ text: String) {
        operatorInput.text = ""
        numberInput.text = text
        totalCalculation = ""
    }
    
    private func checkInvalidValue(_ text: String) -> Bool {
        if text == "0" || text == "NAN" || text == "-0" {
            return true
        }
        return false
    }
    
    private func hasDot(_ value: String) -> Bool {
        if value.contains(".") {
            return false
        } else {
            return true
        }
    }
    
    private func removeZeroHasDot(_ text: String) {
        var numericalValue = text
        if !hasDot(numericalValue) {
            while numericalValue.last == "0" {
                numericalValue.removeLast()
            }
            if numericalValue.last == "."{
                numericalValue.removeLast()
            }
            numberInput.text = numericalValue
        }
    }
    
    private func inputToCalculation(_ text: String) {
        //        if numberOfCalculation > 1 {
        //            totalCalculation += " \(operatorInput.text!) \(text)"
        //        } else {
        //            totalCalculation += "\(text)"
        //        }
    }
    
    private func checkNegativeNumber(_ text: String) {
        guard text != "0" else { return }
        guard text != "NAN" else { return }
        guard text.first == "-" else {
            numberInput.text = "-\(text)"
            return
        }
        numberInput.text = text.filter { $0 != "-" }
        return
    }
    
    private func removeZeroOfDouble(_ text: String) -> String {
        var value = text
        while value.last == "0" {
            value.removeLast()
        }
        if value.last == "."{
            value.removeLast()
        }
        return value
    }
    
    private func holdScrollDown() {
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height -
                                   scrollView.bounds.size.height)
        scrollView.setContentOffset(bottomOffset, animated: true)
        scrollView.layoutSubviews()
    }
    
    private func changeFormat(_ format: String) {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: Double(format))!
        operatorInput.text = ""
        numberInput.text = "\(result)"
    }
    
    private func clearStackView() {
        expressionStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func addStackView() {
        let operatorLabel = createLabel()
        operatorLabel.text = operatorInput.text
        let operandLabel = createLabel()
        operandLabel.text = numberInput.text
        let stack = createStackView([operatorLabel, operandLabel])
        expressionStackView.addArrangedSubview(stack)
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        return label
    }
    
    private func createStackView(_ labels: [UILabel]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.addArrangedSubview(labels[0])
        stackView.addArrangedSubview(labels[1])
        return stackView
    }
}
