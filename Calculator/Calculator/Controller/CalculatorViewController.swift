//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

enum NameSpace {
    static let maximumDigits = 20
    static let minus: Character = "-"
    
    static let emptyString = ""
    static let comma = ","
    static let dot = "."
    static let zero = "0"
}

final class CalculatorViewController: UIViewController {
    // MARK: - Properties
    
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    @IBOutlet private weak var currentNumberLabel: UILabel!
    
    @IBOutlet private weak var historyStackView: UIStackView!
    
    private var resultExpression = NameSpace.emptyString
    
    private var currentNumber = NameSpace.emptyString
    private var currentOperator = NameSpace.emptyString
    
    private var firstDecimalPointInCurrentNumber = true
    private var firstInputAfterCalculation = false
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = NameSpace.maximumDigits
        numberFormatter.roundingMode = .up
        return numberFormatter
    }()
    
    // MARK: - Life Cycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentOperatorLabel.text = NameSpace.emptyString
        currentNumberLabel.text = NameSpace.zero
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
        let numbers = Double(currentNumber.replacingOccurrences(of: NameSpace.comma, with: NameSpace.emptyString))
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
        
        if currentNumberLabel.text == NameSpace.zero ||
            firstInputAfterCalculation == true {
            currentNumberLabel.text = NameSpace.emptyString
            
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
            
            currentNumberLabel.text = NameSpace.zero
            
            resultExpression += currentOperator + currentNumber
            currentNumber = NameSpace.emptyString
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
        
        currentOperatorLabel.text = NameSpace.emptyString
        
        currentOperator = NameSpace.emptyString
        currentNumber = NameSpace.emptyString
        
        firstInputAfterCalculation = true
        firstDecimalPointInCurrentNumber = true
    }
    
    @IBAction private func acButtonTapped(_ sender: UIButton) {
        currentNumber = NameSpace.emptyString
        currentOperator = NameSpace.emptyString
        
        currentNumberLabel.text = NameSpace.zero
        currentOperatorLabel.text = NameSpace.emptyString
        
        resultExpression = NameSpace.emptyString
        
        historyStackView.subviews.forEach( { $0.removeFromSuperview() } )
    }

    @IBAction private func ceButtonTapped(_ sender: UIButton) {
        currentNumber = NameSpace.emptyString
        currentNumberLabel.text = NameSpace.zero
    }
    
    @IBAction private func switchPositiveNegativeButtonTapped(_ sender: UIButton) {
        if currentNumber == NameSpace.emptyString {
            return
        } else if currentNumber.first == NameSpace.minus {
            currentNumber.remove(at: currentNumber.startIndex)
        } else {
            currentNumber = String(NameSpace.minus) + currentNumber
        }
     
        currentNumberLabel.text = currentNumber
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard firstDecimalPointInCurrentNumber else { return }
        firstDecimalPointInCurrentNumber = false
        
        currentNumber += NameSpace.dot
        currentNumberLabel.text! += NameSpace.dot
    }
    
    private func updateCurrentNumberLabelWithFormat() {
        guard let numbersString = currentNumberLabel.text else {
            return
        }
        
        let numbersWithoutComma = numbersString.replacingOccurrences(of: NameSpace.comma, with: NameSpace.emptyString)
        
        guard let numbers = Double(numbersWithoutComma) else {
            return
        }
        
        currentNumberLabel.text = numberFormatter.string(for: numbers)
    }
}
