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
    }
    
    func setUILabel() {
        mainOperatorLabel.text = Constant.empty
        mainResultLabel.text = Constant.zero
    }
    
    func setDefaultOperand() {
        mainResultLabel.text = Constant.zero
        currentOperand = Constant.defaultZero
    }

    @IBAction func tappedNumberPads(_ sender: UIButton) {
        let tappedNumber = sender.currentTitle
        guard let number = tappedNumber else { return }
        
        if currentOperand == Constant.defaultZero || currentOperand == Constant.zero {
            if number == Constant.doubleZero {
                return
            }
            currentOperand = number
        } else {
            currentOperand += number
        }
    }
    
    @IBAction func tappedOperatorPads(_ sender: UIButton) {

    }
    
    @IBAction func tappedCalculate(_ sender: UIButton) {
        
    }
    
    @IBAction func tappedDotPads(_ sender: UIButton) {

    }
    
    @IBAction func tappedChangePositiveNegative(_ sender: UIButton) {

    }
    
    @IBAction func tappedAllClear(_ sender: UIButton) {
        
    }
    
    @IBAction func tappedClearEntry(_ sender: UIButton) {

    }
}

