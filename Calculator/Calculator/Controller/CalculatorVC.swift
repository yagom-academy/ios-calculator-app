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
    
    private var firstInputAfterCalculation = false
    
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
        numberLabel.text = currentNumber
        numberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        inputItemStackView.addArrangedSubview(operatorSignLabel)
        inputItemStackView.addArrangedSubview(numberLabel)
        
        inputItemStackView.isHidden = true
        inputHistoryStackView.addArrangedSubview(inputItemStackView)
        
        UIStackView.animate(withDuration: 0.3) {
            inputItemStackView.isHidden = false
        }
    }
    
    @IBAction private func numberButtonTapped(_ sender: UIButton) {
        if numberInputLabel.text == "0" || firstInputAfterCalculation == true {
            numberInputLabel.text = ""
            firstInputAfterCalculation = false
        }
        
        numberInputLabel?.text! += sender.currentTitle!
        currentNumber += sender.currentTitle!
        printStatus()
    }
    
    @IBAction private func operatorButtonTapped(_ sender: UIButton) {
        operatorInputLabel.text = sender.currentTitle
 
        if !currentNumber.isEmpty {
            insertCurrentItemIntoHistory()
            numberInputLabel?.text! = "0"
            
            resultExpression += currentOperator + currentNumber
            
            currentOperator = sender.currentTitle!
            currentNumber = ""
        } else {
            currentOperator = sender.currentTitle!
        }
        
        printStatus()
    }
    
    @IBAction private func equalButtonTapped(_ sender: UIButton) {
        do {
            if !currentOperator.isEmpty && !currentNumber.isEmpty {
                resultExpression += currentOperator + currentNumber
                let result = try ExpressionParser.parse(from: resultExpression).result()
                insertCurrentItemIntoHistory()
                operatorInputLabel.text = ""
                currentOperator = ""
                currentNumber = ""
                numberInputLabel.text = String(result)
                firstInputAfterCalculation = true
            }
        } catch CalculatorError.dividedByZero {
            numberInputLabel.text = CalculatorError.dividedByZero.description
        } catch {
            numberInputLabel.text = "error"
        }
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
    
    func printStatus() {
        print("total: \(resultExpression)")
        print("currentOperator: \(currentOperator)")
        print("currentNumber: \(currentNumber)")
    }
}
