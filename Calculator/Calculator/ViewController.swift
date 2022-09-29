//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var inputNumberLabel: UILabel!
    @IBOutlet weak private var inputOperatorLabel: UILabel!
    @IBOutlet weak private var historyInputOperatorLabel: UILabel!
    @IBOutlet weak private var historyInputNumberLabel: UILabel!
    @IBOutlet weak private var historyInputScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addZero(inputText: String, zero: String) {
        if inputText == Literal.numberZero.value {
            return
        } else {
            inputNumberLabel.text = inputText + "\(zero)"
        }
    }
    
    private func addPoint(inputText: String, point: Character) {
        if inputText.filter({ $0 == point }).count >= 1 {
            return
        } else {
            inputNumberLabel.text = inputText + String(point)
        }
    }
    
    private func addNumber(inputText: String, number: String) {
        if inputText == Literal.numberZero.value {
            inputNumberLabel.text = "\(number)"
        } else {
            inputNumberLabel.text = inputText + "\(number)"
        }
    }
    
    private func invertNumber(inputText: String) {
        if inputText.prefix(1) != Literal.subtraction.value {
            
        }
    }
    
    private func makeHistoryInputLabel(inputText: String) -> UILabel {
        var inputLabel: UILabel {
            let inputLabel = UILabel()
            
            inputLabel.text = inputText
            inputLabel.translatesAutoresizingMaskIntoConstraints = false
            return inputLabel
        }
        
        return inputLabel
    }
    
    private func makeHistoryStactView(operatorLabel: UILabel, operandLabel: UILabel) -> UIStackView {
        var stackView: UIStackView {
            let stactView = UIStackView()
            
            stactView.translatesAutoresizingMaskIntoConstraints = false
            stactView.axis = .horizontal
            stactView.alignment = .fill
            stactView.distribution = .equalSpacing
            stactView.spacing = 8
            stactView.addArrangedSubview(operatorLabel)
            stactView.addArrangedSubview(operandLabel)
            return stactView
        }
        
        return stackView
    }
    
    private func showResult() {
        
    }
    
    private func addOperator(inputText: String, operatorValue: String) {
        if inputText == Literal.numberZero.value {
            return
        }
        //old
//        historyInputOperatorLabel.text = inputOperatorLabel.text
//        historyInputNumberLabel.text = inputText
        
        //new
        guard let operatorText = inputOperatorLabel.text else {
            return
        }
        
        let operatorLabel = makeHistoryInputLabel(inputText: operatorText)
        let operandLabel = makeHistoryInputLabel(inputText: inputText)
        let stackView = makeHistoryStactView(operatorLabel: operatorLabel, operandLabel: operandLabel)
        historyInputScrollView.addSubview(stackView)
        
        inputNumberLabel.text = Literal.numberZero.value
        inputOperatorLabel.text = operatorValue
    }
    
    @IBAction private func touchUpCalculatorButton(sender: UIButton) {
        guard let id = sender.restorationIdentifier,
              let inputText = inputNumberLabel.text else {
            return
        }
        
        switch id {
        case Literal.AC.buttonID:
            return
        case Literal.CE.buttonID:
            inputNumberLabel.text = Literal.numberZero.value
        case Literal.numberInvertion.buttonID:
//            if inputText == Literal.numberZero.value { return }
//            if inputText.prefix(1) != Literal.subtraction.value {
//                inputNumberLabel.text = "(" + Literal.subtraction.value + inputText + ")"
//            }
            return
        case Literal.division.buttonID:
            addOperator(inputText: inputText, operatorValue: Literal.division.value)
        case Literal.multiplication.buttonID:
            addOperator(inputText: inputText, operatorValue: Literal.multiplication.value)
        case Literal.subtraction.buttonID:
            addOperator(inputText: inputText, operatorValue: Literal.subtraction.value)
        case Literal.addition.buttonID:
            addOperator(inputText: inputText, operatorValue: Literal.addition.value)
        case Literal.result.buttonID:
            return
        default:
            return
        }
    }
    
    @IBAction private func touchUpNumberButton(sender: UIButton) {
        guard let id = sender.restorationIdentifier,
              let inputText = inputNumberLabel.text else {
            return
        }
        
        switch id {
        case Literal.numberDoubleZero.buttonID:
            addZero(inputText: inputText , zero: Literal.numberDoubleZero.value)
        case Literal.numberZero.buttonID:
            addZero(inputText: inputText, zero: Literal.numberZero.value)
        case Literal.numberPoint.buttonID:
            addPoint(inputText: inputText, point: Character(Literal.numberPoint.value))
        case Literal.numberOne.buttonID:
            addNumber(inputText: inputText, number: Literal.numberOne.value)
        case Literal.numberTwo.buttonID:
            addNumber(inputText: inputText, number: Literal.numberTwo.value)
        case Literal.numberThree.buttonID:
            addNumber(inputText: inputText, number: Literal.numberThree.value)
        case Literal.numberFour.buttonID:
            addNumber(inputText: inputText, number: Literal.numberFour.value)
        case Literal.numberFive.buttonID:
            addNumber(inputText: inputText, number: Literal.numberFive.value)
        case Literal.numberSix.buttonID:
            addNumber(inputText: inputText, number: Literal.numberSix.value)
        case Literal.numberSeven.buttonID:
            addNumber(inputText: inputText, number: Literal.numberSeven.value)
        case Literal.numberEight.buttonID:
            addNumber(inputText: inputText, number: Literal.numberEight.value)
        case Literal.numberNine.buttonID:
            addNumber(inputText: inputText, number: Literal.numberNine.value)
        default:
            return
        }
    }
}

