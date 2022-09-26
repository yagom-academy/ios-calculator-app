//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var formula: Formula?
    
    @IBOutlet weak private var operatorLabel: UILabel!
    @IBOutlet weak private var enteredNumberLabel: CalculatorNumberLabel!
    @IBOutlet private var operators: [UIButton]!
    @IBOutlet weak private var zeroButton: UIButton!
    @IBOutlet weak private var doubleZeroButton: UIButton!
    @IBOutlet weak private var dotButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func touchUpSignSwitchButton(sender: UIButton) {
        guard enteredNumberLabel.text != CalculatorText.zero else {
            return
        }
        enteredNumberLabel.switchSign()
    }
    
    @IBAction private func touchUpCEButton(sender: UIButton) {
        enteredNumberLabel.resetToZero()
        enteredNumberLabel.isResultOfFormula = false
    }
    
    @IBAction private func touchUpNumberButton(sender: UIButton) {
        guard let text = enteredNumberLabel.text,
              let number = sender.currentTitle else {
                  return
              }
        enterNumber(sender: sender,
                    current: text,
                    entered: number)
    }
    
    private func enterNumber(sender: UIButton, current text: String, entered number: String) {
        if enteredNumberLabel.isZero {
            switch sender {
            case zeroButton, doubleZeroButton:
                return
            case dotButton:
                enteredNumberLabel.text = text + number
            default:
                enteredNumberLabel.text = number
            }
        } else {
            if sender == dotButton,
               text.contains(CalculatorText.dot) {
                return
            } else {
                enteredNumberLabel.text = text + number
            }
        }
    }
}

