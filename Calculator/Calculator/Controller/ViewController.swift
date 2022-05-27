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
        updateNumberInput(sender)
    }
    
    private func updateNumberInput(_ sender: UIButton) {
        guard let number = checkNumber(sender) else {
            return
        }
        
        guard let formattedNumber = formatNumberForBeingRecognizedAsNumber(number) else {
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
        guard lastInput.arrangedSubviews.count <= 0 || operatorInput.text != "" else {
            clearLastInput()
            
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
    
    private func setNumber(_ number : Double) {
        guard let formattedNumber = formatNumberForExposure(number) else {
            return
        }
        
        numberInput.text = formattedNumber
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
            setNumber(calculationResult)
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
        // 변환 과정
        guard let number = numberInput.text else {
            return
        }
        
        guard let formattedNumber = formatNumberForBeingRecognizedAsNumber(number) else {
            return
        }
        
        // 조건 체크
        guard formattedNumber != 0 else {
            return
        }
        
        // 부호 바꾸기
        let text = String(-formattedNumber)
        
        // 변환 과정
        guard let formattedText = formatNumberForBeingRecognizedAsNumber(text) else {
            return
        }
        
        // update
        setNumber(formattedText)
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
    
    
    
    private func addCalculatorItems() {
        guard let number = numberInput.text else {
            return
        }
        
        guard let formattedNumber = formatNumberForBeingRecognizedAsNumber(number) else {
            return
        }
        
        setNumber(formattedNumber)
        
        guard let label = makeUILabel() else {
            return
        }
        let newInput = UIStackView(arrangedSubviews: [label])

        lastInput.addArrangedSubview(newInput)
        
        guard let labelText = label.text else {
            return
        }
        
        let firstTrimmedInput = removeWhitespaces(labelText)
        let secondTrimmedInput = removeComma(firstTrimmedInput)
        totalInput += secondTrimmedInput
    }
    
    private func makeUILabel() -> UILabel? {
        guard let `operator` = operatorInput.text else {
            return nil
        }
        
        guard let number = numberInput.text else {
            return nil
        }
    
        let label = UILabel()
        
        label.isHidden = false
        label.text = `operator` + " " + number
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        
        return label
    }
    
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


