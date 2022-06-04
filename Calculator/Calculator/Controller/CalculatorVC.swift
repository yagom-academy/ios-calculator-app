//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorVC: UIViewController {
    // MARK: - Properties
    @IBOutlet private weak var operatorInputLabel: UILabel!
    @IBOutlet private weak var numberInputLabel: UILabel!
    
    @IBOutlet private weak var inputHistoryStackView: UIStackView!
    
    private var resultExpression = ""
    
    private var currentNumber = ""
    private var currentOperator = ""
    
    private var firstDecimalPointInCurrentNumber = true
    private var firstInputAfterCalculation = false
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.roundingMode = .up
        return numberFormatter
    }()
    
    // MARK: - Life Cycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operatorInputLabel.text = ""
        numberInputLabel.text = "0"
    }
}

// MARK: - Actions

extension CalculatorVC {
    private func insertCurrentItemIntoHistory() {
        let inputItemStackView = UIStackView()
        inputItemStackView.translatesAutoresizingMaskIntoConstraints = false
        inputItemStackView.axis = .horizontal
        inputItemStackView.alignment = .fill
        inputItemStackView.distribution = .fill
        inputItemStackView.spacing = 8
        
        let operatorSignLabel = UILabel()
        operatorSignLabel.translatesAutoresizingMaskIntoConstraints = false
        operatorSignLabel.textColor = .white
        operatorSignLabel.backgroundColor = .black
        operatorSignLabel.text = currentOperator
        operatorSignLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let numberLabel = UILabel()
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.textColor = .white
        numberLabel.backgroundColor = .black
        numberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        let numbers = Double(currentNumber.replacingOccurrences(of: ",", with: ""))
        numberLabel.text = numberFormatter.string(for: numbers)
        
        inputItemStackView.addArrangedSubview(operatorSignLabel)
        inputItemStackView.addArrangedSubview(numberLabel)
        
        inputItemStackView.isHidden = true
        inputHistoryStackView.addArrangedSubview(inputItemStackView)
        
        UIStackView.animate(withDuration: 0.3) {
            inputItemStackView.isHidden = false
        }
    }
    
    @IBAction private func numberButtonTapped(_ sender: UIButton) {
        guard let senderCurrentTitle = sender.currentTitle else {
            return
        }
        
        if numberInputLabel.text == "0" || firstInputAfterCalculation == true {
            numberInputLabel.text = ""
            firstInputAfterCalculation = false
        }
        
        numberInputLabel.text! += senderCurrentTitle
        currentNumber += senderCurrentTitle
        
        refreshCurrentNumberLabelToBeFormatted()
        
        printStatus()
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard let senderCurrentTitle = sender.currentTitle else {
            return
        }
        
        operatorInputLabel.text = senderCurrentTitle
 
        if !currentNumber.isEmpty {
            insertCurrentItemIntoHistory()
            numberInputLabel.text = "0"
            
            resultExpression += currentOperator + currentNumber
            
            currentOperator = senderCurrentTitle
            currentNumber = ""
        } else {
            currentOperator = senderCurrentTitle
        }
        
        printStatus()
        firstDecimalPointInCurrentNumber = true
    }
    
    @IBAction private func equalButtonTapped(_ sender: UIButton) {
        guard !currentOperator.isEmpty && !currentNumber.isEmpty else {
            return
        }
        
        resultExpression += currentOperator + currentNumber
        
        do {
            let result = try ExpressionParser.parse(from: resultExpression).result()
            numberInputLabel.text = String(result)
        } catch CalculatorError.dividedByZero {
            numberInputLabel.text = CalculatorError.dividedByZero.description
        } catch {
            numberInputLabel.text = "error"
        }
        
        insertCurrentItemIntoHistory()
        refreshCurrentNumberLabelToBeFormatted()
        
        operatorInputLabel.text = ""
        currentOperator = ""
        currentNumber = ""
        
        firstInputAfterCalculation = true
        firstDecimalPointInCurrentNumber = true
    }
    
    @IBAction private func acButtonTapped(_ sender: UIButton) {
        currentNumber = ""
        currentOperator = ""
        operatorInputLabel.text = ""
        numberInputLabel.text = "0"
        resultExpression = ""
        printStatus()
        
        inputHistoryStackView.subviews.forEach( { $0.removeFromSuperview() } )
    }

    @IBAction private func ceButtonTapped(_ sender: UIButton) {
        currentNumber = ""
        numberInputLabel.text = "0"
        printStatus()
    }
    
    @IBAction private func switchPositiveNegativeButtonTapped(_ sender: UIButton) {
        if currentNumber == "" {
            return
        } else if currentNumber.first == "-" {
            currentNumber.remove(at: currentNumber.startIndex)
        } else {
            currentNumber = "-" + currentNumber
        }
     
        numberInputLabel.text = currentNumber
        printStatus()
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard firstDecimalPointInCurrentNumber else { return }
        firstDecimalPointInCurrentNumber = false
        
        currentNumber += "."
        numberInputLabel.text! += "."
    }
    
    private func refreshCurrentNumberLabelToBeFormatted() {
        guard let numbersString = numberInputLabel.text else {
            return
        }
        
        let NumbersWithoutComma = numbersString.replacingOccurrences(of: ",", with: "")
        
        guard let numbers = Double(NumbersWithoutComma) else {
            return
        }
        
        numberInputLabel.text = numberFormatter.string(for: numbers)
    }
    
    func printStatus() {
        print("total: \(resultExpression)")
        print("currentOperator: \(currentOperator)")
        print("currentNumber: \(currentNumber)")
    }
}
