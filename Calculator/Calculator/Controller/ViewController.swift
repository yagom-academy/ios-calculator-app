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
    
    @IBAction private func touchNumberButton(_ sender: UIButton) {
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
    
    @IBAction private func touchOperatorButton(_ sender: UIButton) {
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
    
    @IBAction private func touchResultButton(_ sender: UIButton) {
        guard operatorInput.text != "" else {
            return
        }
        
        addCalculatorItems()
        
        var formula = ExpressionParser.parse(from: totalInput)
        
        do {
            let calculationResult = try formula.result()
            applyNumberFormatter(calculationResult)
        } catch (let error) {
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
        
        resetOperatorInput()
        resetTotalInput()
        goToBottomOfScrollView()
    }
    
    @IBAction private func touchAllClearButton(_ sender: UIButton) {
        clearLastInput()
        resetNumberInput()
        resetOperatorInput()
        resetTotalInput()
    }
    
    @IBAction private func touchClearEntryButton(_ sender: UIButton) {
        resetNumberInput()
        
        totalInput == "" ? clearLastInput() : ()
        
    }
    
    @IBAction private func touchSignChangerButton(_ sender: UIButton) {
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
        guard let onceTrimmmedInput = removeComma() else {
            return nil
        }
        
        guard let twiceTrimmedInput = convertStringToDouble(onceTrimmmedInput) else {
            return nil
        }
        
        return twiceTrimmedInput
    }
    
    private func removeComma() -> String? {
        guard let text = numberInput.text else {
            return nil
        }
        
        let trimmedInput = text.replacingOccurrences(of: ",", with: "")
        
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
        
        guard let `operator` = operatorInput.text else {
            return
        }
        
        guard let number = numberInput.text else {
            return
        }
        
        let label = UILabel()
        label.isHidden = true
        label.text = `operator` + " " + number
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        let newInput = UIStackView(arrangedSubviews: [label])
        
        lastInput.addArrangedSubview(newInput)
        UIView.animate(withDuration: 0.0000001) {
            label.isHidden = false
        }
        
        guard let labelText = label.text else {
            return
        }
        
        let firstTrimmedInput = labelText.replacingOccurrences(of: " ", with: "")
        let secondTrimmedInput = firstTrimmedInput.replacingOccurrences(of: ",", with: "")
        totalInput += secondTrimmedInput
    }
    
    private func goToBottomOfScrollView() {
        scrollView.setContentOffset(CGPoint(x: 0,
                                            y: scrollView.contentSize.height - scrollView.bounds.height),
                                    animated: true)
    }
}
