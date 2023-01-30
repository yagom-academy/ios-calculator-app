//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let numberFormatter = NumberFormatter()
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    enum Sign {
        static let dot = "."
        static let blank = " "
        static let zero = "0"
        static let zeroZero = "00"
        static let one = "1"
        static let two = "2"
        static let three = "3"
        static let four = "4"
        static let five = "5"
        static let six = "6"
        static let seven = "7"
        static let eight = "8"
        static let nine = "9"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = -2
        numberFormatter.string(for: operandLabel.text)
    }
    
    func updateOperand(with number: String) {
        if operandLabel.text == Sign.zero {
            guard number != Sign.zeroZero else { return }
            operandLabel.text = number
        } else {
            operandLabel.text = (operandLabel.text ?? "") + number
        }
    }
    
    func updateDot(with dot: String) {
        if operandLabel.text == Sign.zero {
            return
        } else if operandLabel.text?.contains(Sign.dot) == true {
            return
        } else {
            operandLabel.text = (operandLabel.text ?? "") + dot
        }
    }
    
    func resetCalculator() {
        operandLabel.text = Sign.zero
        operatorLabel.text = Sign.blank
    }
    
    @IBAction func didTapNumberZero(_ sender: UIButton) {
        updateOperand(with: Sign.zero)
    }
    @IBAction func didTapNumberZeroZero(_ sender: UIButton) {
        updateOperand(with: Sign.zeroZero)
    }
    @IBAction func didTapDot(_ sender: UIButton) {
        updateDot(with: Sign.dot)
    }
    @IBAction func didTapNumberOne(_ sender: UIButton) {
        updateOperand(with: Sign.one)
    }
    @IBAction func didTapNumberTwo(_ sender: UIButton) {
        updateOperand(with: Sign.two)
    }
    @IBAction func didTapNumberThree(_ sender: UIButton) {
        updateOperand(with: Sign.three)
    }
    @IBAction func didTapNumberFour(_ sender: UIButton) {
        updateOperand(with: Sign.four)
    }
    @IBAction func didTapNumberFive(_ sender: UIButton) {
        updateOperand(with: Sign.five)
    }
    @IBAction func didTapNumberSix(_ sender: UIButton) {
        updateOperand(with: Sign.six)
    }
    @IBAction func didTapNumberSeven(_ sender: UIButton) {
        updateOperand(with: Sign.seven)
    }
    @IBAction func didTapNumberEight(_ sender: UIButton) {
        updateOperand(with: Sign.eight)
    }
    @IBAction func didTapNumberNine(_ sender: UIButton) {
        updateOperand(with: Sign.nine)
    }
    
    @IBAction func didTapACButton(_ sender: UIButton) {
        resetCalculator()
    }
}
