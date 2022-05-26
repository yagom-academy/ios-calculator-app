//
//  Calculator - ViewController.swift
//  Created by Kiwi. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    private var userNumberTapped = false
    
    @IBOutlet weak var inputStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        operandLabel.text = "0"
        operatorLabel.text = ""
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if operandLabel.text == "0", digit == "0" || digit == "00" {
            return
        }
        
        if operandLabel.text!.count >= 20 {
            return
        }
        
        if userNumberTapped {
            let textCurrentlyInDisply = operandLabel.text!
            operandLabel.text! = textCurrentlyInDisply + digit
        }
        else if operandLabel.text!.contains(".") {
            userNumberTapped = true
        }
        else {
            operandLabel.text! = digit
        }
        userNumberTapped = true
    }
    
    @IBAction func didTapDot(_ sender: UIButton) {
        let dot = sender.currentTitle!
        let textCurrentlyInDisply = operandLabel.text!
        
        if textCurrentlyInDisply.contains(Character(dot)) {
            return
        } else {
            operandLabel.text! = textCurrentlyInDisply + dot
        }
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        let operators = sender.currentTitle!
        operatorLabel.text = operators
    }
}

