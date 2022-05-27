//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var numberInput: UILabel!
    @IBOutlet private weak var operatorInput: UILabel!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var lastInput: UIStackView!
    
    private var totalInput: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearLastInput()
        resetNumberInput()
        resetOperatorInput()
        resetTotalInput()
    }
    
    @IBAction private func numberButtonDidTapped(_ sender: UIButton) {
        guard lastInput.arrangedSubviews.count <= 0 || operatorInput.text != "" else {
            clearLastInput()
            
            numberInput.text = sender.currentTitle
            return
        }
        
        let digit = sender.currentTitle
        
        guard var text = numberInput.text else {
            return
        }
        
        guard digit != "." || text.filter({ $0 == "." }).count < 1 else {
            return
        }
        
        guard let unwrappedDigit: String = digit else {
            return
        }
            
        text += unwrappedDigit
        numberInput.text = text

        
        guard text.contains(".") == false else {
            return
        }
        
        guard let convertedNumberInput = convertNumberInput() else {
            return
        }
        
        applyNumberFormatter(convertedNumberInput)
    }
    
    @IBAction private func operatorButtonDidTapped(_ sender: UIButton) {
        guard numberInput.text != "0" || lastInput.arrangedSubviews.count > 0 else {
            return
        }
        
        guard let text = numberInput.text else {
            return
        }
        
        guard Double(text) != 0.0 else {
            operatorInput.text = sender.currentTitle
            return
        }
        
        if operatorInput.text == "" && lastInput.arrangedSubviews.count > 0 {
            clearLastInput()
        }
        
        addCalculatorItems()
        operatorInput.text = sender.currentTitle
        resetNumberInput()
        goToBottomOfScrollView()
    }
    
    @IBAction private func resultButtonDidTapped(_ sender: UIButton) {
        guard operatorInput.text != "" else {
            return
        }
        
        addCalculatorItems()
        
        var formula = ExpressionParser.parse(from: totalInput)
        
        do {
            let calculationResult = try formula.result()
            applyNumberFormatter(calculationResult)
        } catch (let calculationError) {
            handleError(calculationError)
        }
        
        resetOperatorInput()
        resetTotalInput()
        goToBottomOfScrollView()
    }
    
    func handleError(_ error: Error) {
        switch error {
        case CalculatorError.dividedByZero:
            numberInput.text = CalculatorError.dividedByZero.localizedDescription
        case CalculatorError.notEnoughOperands:
            numberInput.text = CalculatorError.notEnoughOperands.localizedDescription
        case CalculatorError.notEnoughOperators:
            numberInput.text = CalculatorError.notEnoughOperators.localizedDescription
        case CalculatorError.emptyQueues:
            numberInput.text = CalculatorError.emptyQueues.localizedDescription
        case CalculatorError.invalidOperator:
            numberInput.text = CalculatorError.invalidOperator.localizedDescription
        default:
            numberInput.text = "unknown error"
        }
    }
    
    @IBAction private func allClearButtonDidTapped(_ sender: UIButton) {
        clearLastInput()
        resetNumberInput()
        resetOperatorInput()
        resetTotalInput()
    }
    
    @IBAction private func clearEntryButtonDidTapped(_ sender: UIButton) {
        resetNumberInput()
        
        totalInput == "" ? clearLastInput() : ()
        
    }
    
    @IBAction private func signChangerButtonDidTapped(_ sender: UIButton) {
        guard let convertedNumberInput = convertNumberInput() else {
            return
        }
        
        guard convertedNumberInput != 0 else {
            return
        }
        
        numberInput.text = String(-convertedNumberInput)
        
        guard let newConvertedNumberInput = convertNumberInput() else {
            return
        }
        
        applyNumberFormatter(newConvertedNumberInput)
    }
    
    private func resetNumberInput() {
        numberInput.text = "0"
    }
    
    private func resetOperatorInput() {
        operatorInput.text = ""
    }
    
    private func resetTotalInput() {
        totalInput = ""
    }
    
    private func clearLastInput() {
        lastInput.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func convertNumberInput() -> Double? {
        guard let text = numberInput.text else {
            return nil
        }
        
        let onceTrimmmedInput = removeComma(text)

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
    
    private func applyNumberFormatter(_ number : Double) {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.maximumIntegerDigits = 20
        
        guard let formattedResult = numberFormatter.string(from: number as NSNumber) else {
            return
        }
        
        numberInput.text = formattedResult
    }
    
    private func addCalculatorItems() {
        guard let convertedNumberInput = convertNumberInput() else {
            return
        }
        
        applyNumberFormatter(convertedNumberInput)
        
        let label = makeUILabel()
        let newInput = UIStackView(arrangedSubviews: [label])

        lastInput.addArrangedSubview(newInput)
        
        let labelText = unwrapLabelText(label)
        let firstTrimmedInput = removeWhitespaces(labelText)
        let secondTrimmedInput = removeComma(firstTrimmedInput)
        totalInput += secondTrimmedInput
    }
    
    private func unwrapLabelText(_ label: UILabel) -> String {
        guard let labelText = label.text else {
            return "비어있음"
        }
        
        return labelText
    }
    
    private func unwrapOperatorInput() -> String {
        guard let `operator` = operatorInput.text else {
            return "비어있음"
        }
        
        return `operator`
    }
    
    private func unwrapNumberInput() -> String {
        guard let number = numberInput.text else {
            return "비어있음"
        }
        
        return number
    }
    
    private func makeUILabel() -> UILabel {
        let `operator` = unwrapOperatorInput()
        let number = unwrapNumberInput()
        let label = UILabel()
        
        label.isHidden = false
        label.text = `operator` + " " + number
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }
    
//    private func addTrimmedInputToTotalInput(_ input: String) {
//        let firstTrimmedInput = removeWhitespaces(input)
//        let secondTrimmedInput = removeComma(firstTrimmedInput)
//
//        totalInput += secondTrimmedInput
//    }
    
    private func removeWhitespaces(_ input: String) -> String {
        let trimmedInput = input.replacingOccurrences(of: " ", with: "")
        
        return trimmedInput
    }
    
    private func goToBottomOfScrollView() {
        scrollView.setContentOffset(CGPoint(x: 0,
                                            y: scrollView.contentSize.height - scrollView.bounds.height),
                                    animated: true)
    }
}
