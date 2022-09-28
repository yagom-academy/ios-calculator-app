//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var inputNumberLabel: UILabel!
    @IBOutlet weak private var inputOperatorLabel: UILabel!
    
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
    
    @IBAction private func touchUpCalculateButton(sender: UIButton) {
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

