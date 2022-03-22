//
//  Calculator - ViewController.swift
//  Created by DuDu
//

import UIKit

final class ViewController: UIViewController {
    private var currentNumber: String = ""
    
    @IBOutlet private var calculateLogStackView: UIStackView!
    
    @IBOutlet private var numberLabel: UILabel!
    @IBOutlet private var operatorLabel: UILabel!
    
    @IBOutlet private var oneZeroButton: UIButton!
    @IBOutlet private var twoZeroButton: UIButton!
    @IBOutlet private var oneButton: UIButton!
    @IBOutlet private var twoButton: UIButton!
    @IBOutlet private var threeButton: UIButton!
    @IBOutlet private var fourButton: UIButton!
    @IBOutlet private var fiveButton: UIButton!
    @IBOutlet private var sixButton: UIButton!
    @IBOutlet private var sevenButton: UIButton!
    @IBOutlet private var eightButton: UIButton!
    @IBOutlet private var nineButton: UIButton!
    
    @IBOutlet private var plusButton: UIButton!
    @IBOutlet private var minusButton: UIButton!
    @IBOutlet private var multiplyButton: UIButton!
    @IBOutlet private var divideButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
    }
    
    @IBAction private func numberButtonDidTapped(_ sender: UIButton) {
        let inputNumber = findNumber(of: sender)
        
        if ["00","0"].contains(inputNumber) && numberLabel.text == "0" {
            return
        }
        
        currentNumber += inputNumber
        numberLabel.text = currentNumber
    }
    
    @IBAction private func operatorButtonDidTapped(_ sender: UIButton) {
    }
    
    @IBAction private func dotButtonDidTapped(_ sender: Any) {
        if currentNumber.contains(".") {
            return
        }
        
        if currentNumber.isEmpty {
            currentNumber = "0"
        }
        
        currentNumber += "."
        numberLabel.text = currentNumber
    }
    
    @IBAction private func acButtonDidTapped(_ sender: Any) {
    }
    
    @IBAction private func ceButtonDidTapped(_ sender: Any) {
    }
    
    @IBAction private func signButtonDidTapped(_ sender: Any) {
        if numberLabel.text == "0" {
            return
        }
        
        guard let number = Double(currentNumber) else {
            return
        }
        
        if number < 0 {
            currentNumber.removeFirst()
        } else {
            currentNumber.insert("-", at: currentNumber.startIndex)
        }
        
        numberLabel.text = currentNumber
    }
    
    @IBAction private func calculateButtonDidTapped(_ sender: Any) {
    }
    
    private func findNumber(of button: UIButton) -> String {
        switch button {
        case oneZeroButton:
            return "0"
        case twoZeroButton:
            return "00"
        case oneButton:
            return "1"
        case twoButton:
            return "2"
        case threeButton:
            return "3"
        case fourButton:
            return "4"
        case fiveButton:
            return "5"
        case sixButton:
            return "6"
        case sevenButton:
            return "7"
        case eightButton:
            return "8"
        case nineButton:
            return "9"
        default:
            return ""
        }
    }
    
    private func findOperator(of button: UIButton) -> String? {
        switch button {
        case plusButton:
            return "+"
        case minusButton:
            return "-"
        case multiplyButton:
            return "×"
        case divideButton:
            return "÷"
        default:
            return ""
        }
    }
    
}

