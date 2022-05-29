//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var currentNumberLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
    @IBOutlet private weak var receivedInputsScrollView: UIScrollView!
    @IBOutlet private weak var receivedInputsStackView: UIStackView!
    
    private var currentNumber: String = "0"
    private var currentOperator: String = ""
    private var snippets: [(`operator`: String, operand: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshNumberLabel()
        refreshOperatorLabel()
    }
    
    private func refreshNumberLabel() {
        let newNumber = currentNumber.formatAsNumber()
        
        DispatchQueue.main.async {
            self.currentNumberLabel.text = newNumber
        }
    }
    
    private func refreshOperatorLabel() {
        DispatchQueue.main.async {
            self.currentOperatorLabel.text = self.currentOperator
        }
    }
    
    private func addIndividualInput(operation operatorData: String, with operandData: String) {
        let individualInputStackView = IndividualInputStackView(operatorData: operatorData, operandData: operandData)
        DispatchQueue.main.async {
            self.receivedInputsStackView.addArrangedSubview(individualInputStackView)
        }
    }
    
    private func clearStackView() {
        DispatchQueue.main.async {
            self.receivedInputsStackView.subviews.forEach {
                $0.removeFromSuperview()
            }
        }
    }
    
    private func scrollDownScrollView() {
        let bottomOffset = CGPoint(x: 0, y: receivedInputsScrollView.contentSize.height - receivedInputsScrollView.bounds.height)
        
        receivedInputsScrollView.setContentOffset(bottomOffset, animated: false)
    }
    
    private func translateOperator(_ symbol: String) -> String {
        switch symbol {
        case "+":
            return "+"
        case "–":
            return "–"
        case "×":
            return "*"
        case "÷":
            return "/"
        default:
            return ""
        }
    }
    
    @IBAction private func pressNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        switch currentNumber {
        case CalculatorExceptionCase.nan.rawValue,
            CalculatorExceptionCase.error.rawValue:
            return
        case CalculatorExceptionCase.zero.rawValue:
            currentNumber = number
        default:
            currentNumber += number
        }
        
        refreshNumberLabel()
    }
    
    @IBAction private func pressOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
        
        switch currentNumber {
        case "0":
            if snippets.isNotEmpty {
                currentOperator = `operator`
            }
        case "NaN", "Err":
            return
        default:
            let operatorNow = translateOperator(currentOperator)
            snippets.append((operatorNow, currentNumber))
            addIndividualInput(operation: currentOperator, with: currentNumber)
            currentOperator = `operator`
            currentNumber = "0"
        }
        
        refreshNumberLabel()
        refreshOperatorLabel()
        scrollDownScrollView()
    }
    
    @IBAction private func pressEqualButton(_ sender: UIButton) {
        guard currentNumber != "NaN",
              currentNumber != "Err",
              currentOperator.isNotEmpty else {
            return
        }
        
        let operatorNow = translateOperator(currentOperator)
        snippets.append((operatorNow, currentNumber))
        addIndividualInput(operation: currentOperator, with: currentNumber)
        
        var totalString = ""
        snippets.forEach {
            totalString += $0.`operator`
            totalString += $0.operand
        }
        
        let formula = ExpressionParser.parse(from: totalString)
        
        do {
            let result = try formula.result()
            currentNumber = String(result)
        } catch CalculatorError.dividedByZero {
            currentNumber = "NaN"
        } catch {
            currentNumber = "Err"
        }
        currentOperator = ""
        
        refreshNumberLabel()
        refreshOperatorLabel()
        scrollDownScrollView()
    }
    
    @IBAction private func pressCEButton(_ sender: UIButton) {
        guard currentNumber != "NaN",
              currentNumber != "Err" else {
            return
        }
        
        currentNumber = "0"
        if currentOperator == "" {
            snippets.removeAll()
            clearStackView()
        }
        
        refreshNumberLabel()
    }
    
    @IBAction private func pressACButton(_ sender: UIButton) {
        snippets.removeAll()
        currentNumber = "0"
        currentOperator = ""
        
        refreshNumberLabel()
        refreshOperatorLabel()
        clearStackView()
    }
    
    @IBAction private func pressInvertButton(_ sender: UIButton) {
        guard currentNumber != "0" else {
            return
        }
        
        currentNumber = "-" + currentNumber
        
        refreshNumberLabel()
    }
}

