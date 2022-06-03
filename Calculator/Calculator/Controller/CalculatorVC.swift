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
    
    // MARK: - Life Cycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operatorInputLabel.text = ""
        numberInputLabel.text = "0"
    }
}

// MARK: - Actions

extension CalculatorVC {
    @objc func insertCurrentItemIntoHistory() {
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
        if numberInputLabel.text == "0" {
            numberInputLabel.text = ""
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
    
    func printStatus() {
        print("total: \(resultExpression)")
        print("currentOperator: \(currentOperator)")
        print("currentNumber: \(currentNumber)")
    }
}

