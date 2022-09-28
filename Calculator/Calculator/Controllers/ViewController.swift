//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainOperatorLabel: UILabel!
    @IBOutlet weak var mainResultLabel: UILabel!
    
    @IBOutlet weak var historyScrollView: UIScrollView!
    @IBOutlet weak var historyStackView: UIStackView!
    
    var currentOperand: String = Constant.defaultZero
    var currentOperator: String = Constant.empty
    var calculateHistory: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUILabel()
        setClearCalculateHistory()
    }
    
    func setUILabel() {
        mainOperatorLabel.text = Constant.empty
        mainResultLabel.text = Constant.zero
    }
    
    func setDefaultOperand() {
        mainResultLabel.text = Constant.zero
        currentOperand = Constant.defaultZero
    }

    func setClearCalculateHistory() {
        historyStackView.subviews.forEach{ $0.removeFromSuperview() }
    }
    
    func updateMainResultLabel() {
        mainResultLabel.text = currentOperand
    }
    
    func makeHistoryStackViewLabel(item: String) -> UILabel {
        let label: UILabel = {
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            label.textAlignment = .right
            label.text = item
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        return label
    }
    
    func makeHistoryStackView(operatorLabel: UILabel, operandLabel: UILabel) -> UIStackView {
        let stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
            stackView.spacing = 8
            stackView.axis = .horizontal
            stackView.distribution = .fill
            stackView.alignment = .fill
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        return stackView
    }
    
    func updateCalculateHistory(currentOperator: String, currentOperand: String) {
        let operatorLabel = makeHistoryStackViewLabel(item: currentOperator)
        let operandLabel = makeHistoryStackViewLabel(item: currentOperand)
        let stackView = makeHistoryStackView(operatorLabel: operatorLabel, operandLabel: operandLabel)
        
        historyStackView.addArrangedSubview(stackView)
    }
    
    @IBAction func tappedNumberPads(_ sender: UIButton) {
        let tappedNumber = sender.currentTitle
        guard let number = tappedNumber else { return }
        
        if currentOperand == Constant.defaultZero || currentOperand == Constant.zero {
            if number == Constant.doubleZero || currentOperator == Constant.calculate {
                return
            }
            currentOperand = number
        } else {
            currentOperand += number
        }
        
        updateMainResultLabel()
    }
    
    @IBAction func tappedOperatorPads(_ sender: UIButton) {
        
        let tappedOperator = sender.currentTitle
        guard let operators = tappedOperator else { return }
        mainOperatorLabel.text = operators
        if currentOperator == Constant.calculate {
            currentOperand = Constant.zero
            currentOperator = operators
            mainResultLabel.text = Constant.zero
            return
        }
        
        if currentOperand == Constant.defaultZero {
            currentOperator = operators
            return
        }
        
        calculateHistory.append(currentOperator)
        calculateHistory.append(currentOperand)
        
        updateCalculateHistory(currentOperator: currentOperator, currentOperand: currentOperand)
        currentOperator = operators
        setDefaultOperand()
    }
    
    @IBAction func tappedCalculate(_ sender: UIButton) {
        if currentOperand == Constant.defaultZero || calculateHistory.isEmpty || currentOperator == Constant.calculate {
            return
        }
        
        updateCalculateHistory(currentOperator: currentOperator, currentOperand: currentOperand)
        
        calculateHistory.append(currentOperator)
        calculateHistory.append(currentOperand)
        
        var removeFirstHistory = calculateHistory
        removeFirstHistory.removeFirst()
        
        currentOperator = Constant.calculate
        mainOperatorLabel.text = Constant.empty
        
        let formula = ExpressionParser.parse(from: removeFirstHistory.joined())
        
        do {
            mainResultLabel.text = try String(formula.result())
            currentOperand = Constant.zero
        } catch CalculatorError.noneOperand {
            
        } catch CalculatorError.noneOperator {
            
        } catch {
            
        }
    }
    
    @IBAction func tappedDotPads(_ sender: UIButton) {
        if currentOperand.contains(Constant.dot) || currentOperand == Constant.defaultZero || currentOperator == Constant.calculate {
            return
        } else {
            currentOperand += Constant.dot
            updateMainResultLabel()
        }
    }
    
    @IBAction func tappedChangePositiveNegative(_ sender: UIButton) {
        if currentOperand == Constant.defaultZero || currentOperand == Constant.zero {
            return
        }
        
        if currentOperand.contains(Constant.negative) {
            currentOperand.removeFirst()
        } else {
            currentOperand = Constant.negative + currentOperand
        }
        
        updateMainResultLabel()
    }
    
    @IBAction func tappedAllClear(_ sender: UIButton) {
        setUILabel()
        setClearCalculateHistory()
        currentOperand = Constant.defaultZero
        currentOperator = Constant.empty
        calculateHistory.removeAll()
    }
    
    @IBAction func tappedClearEntry(_ sender: UIButton) {
        currentOperand = Constant.defaultZero
        mainResultLabel.text = Constant.zero
    }
}
