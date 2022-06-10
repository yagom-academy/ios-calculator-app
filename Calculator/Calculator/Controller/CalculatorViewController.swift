//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    // MARK: - Name Space
    private enum LogicConstraintConstants {
        static let maximumDigits = 20
    }
    
    private enum LogicConstants {
        static let emptyString = ""
        static let comma = ","
        static let minus: Character = "-"
    }
    
    private enum UIConstants {
        static let emptyString = ""
        static let zero = "0"
    }
    
    // MARK: - Properties
    
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    @IBOutlet private weak var currentNumberLabel: UILabel!
    
    @IBOutlet private weak var historyStackView: UIStackView!
    
    private var resultExpression = LogicConstants.emptyString
    
    private var currentNumber = LogicConstants.emptyString
    private var currentOperator = LogicConstants.emptyString
    
    private var firstDecimalPointInCurrentNumber = true
    private var firstInputAfterCalculation = false
    
    private let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = LogicConstraintConstants.maximumDigits
        numberFormatter.roundingMode = .up
        return numberFormatter
    }()
    
    // MARK: - Life Cycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentOperatorLabel.text = UIConstants.emptyString
        currentNumberLabel.text = UIConstants.zero
    }
}

// MARK: - Actions

extension CalculatorViewController {
    private func insertCurrentItemIntoHistoryStackView() {
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
        let numbers = Double(currentNumber.replacingOccurrences(of: LogicConstants.comma, with: LogicConstants.emptyString))
        numberLabel.text = numberFormatter.string(for: numbers)
        
        inputItemStackView.addArrangedSubview(operatorSignLabel)
        inputItemStackView.addArrangedSubview(numberLabel)
        
        inputItemStackView.isHidden = true
        historyStackView.addArrangedSubview(inputItemStackView)
        
        UIStackView.animate(withDuration: 0.3) {
            inputItemStackView.isHidden = false
        }
    }
    
    @IBAction private func numberButtonTapped(_ sender: UIButton) {
        guard let senderCurrentTitle = sender.currentTitle else {
            return
        }
        
        if currentNumberLabel.text == UIConstants.zero ||
            firstInputAfterCalculation == true {
            currentNumberLabel.text = UIConstants.emptyString
            
            firstInputAfterCalculation = false
        }
        
        currentNumberLabel.text! += senderCurrentTitle
        currentNumber += senderCurrentTitle
        
        updateCurrentNumberLabelWithFormat()
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        guard let senderCurrentTitle = sender.currentTitle else {
            return
        }
        
        currentOperatorLabel.text = senderCurrentTitle
 
        if !currentNumber.isEmpty {
            insertCurrentItemIntoHistoryStackView()
            
            currentNumberLabel.text = UIConstants.zero
            
            resultExpression += currentOperator + currentNumber
            currentNumber = LogicConstants.emptyString
        }
        
        currentOperator = senderCurrentTitle
        firstDecimalPointInCurrentNumber = true
    }
    
    @IBAction private func equalButtonTapped(_ sender: UIButton) {
        guard !currentOperator.isEmpty && !currentNumber.isEmpty else {
            return
        }
        
        resultExpression += currentOperator + currentNumber
        
        do {
            let result = try ExpressionParser.parse(from: resultExpression).result()
            currentNumberLabel.text = String(result)
        } catch CalculatorError.dividedByZero {
            currentNumberLabel.text = CalculatorError.dividedByZero.description
        } catch {
            currentNumberLabel.text = CalculatorError.emptyCalculatorItemQueue.description
        }
        
        insertCurrentItemIntoHistoryStackView()
        updateCurrentNumberLabelWithFormat()
        
        currentOperatorLabel.text = UIConstants.emptyString
        
        currentOperator = LogicConstants.emptyString
        currentNumber = LogicConstants.emptyString
        
        firstInputAfterCalculation = true
        firstDecimalPointInCurrentNumber = true
    }
    
    @IBAction private func acButtonTapped(_ sender: UIButton) {
        currentNumber = LogicConstants.emptyString
        currentOperator = LogicConstants.emptyString
        
        currentNumberLabel.text = UIConstants.zero
        currentOperatorLabel.text = UIConstants.emptyString
        
        resultExpression = LogicConstants.emptyString
        
        historyStackView.subviews.forEach( { $0.removeFromSuperview() } )
    }

    @IBAction private func ceButtonTapped(_ sender: UIButton) {
        currentNumber = LogicConstants.emptyString
        currentNumberLabel.text = UIConstants.zero
    }
    
    @IBAction private func switchPositiveNegativeButtonTapped(_ sender: UIButton) {
        if currentNumber == LogicConstants.emptyString {
            return
        } else if currentNumber.first == LogicConstants.minus {
            currentNumber.remove(at: currentNumber.startIndex)
        } else {
            currentNumber = String(LogicConstants.minus) + currentNumber
        }
     
        currentNumberLabel.text = currentNumber
    }
    
    @IBAction private func dotButtonTapped(_ sender: UIButton) {
        guard firstDecimalPointInCurrentNumber else { return }
        firstDecimalPointInCurrentNumber = false
        
        guard let dot = sender.currentTitle else {
            return
        }
        
        currentNumber += dot
        currentNumberLabel.text! += dot
    }
    
    private func updateCurrentNumberLabelWithFormat() {
        guard let numbersString = currentNumberLabel.text else {
            return
        }
        
        let numbersWithoutComma = numbersString.replacingOccurrences(of: LogicConstants.comma, with: LogicConstants.emptyString)
        
        guard let numbers = Double(numbersWithoutComma) else {
            return
        }
        
        currentNumberLabel.text = numberFormatter.string(for: numbers)
    }
}
