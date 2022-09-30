//
//  Calculator - ViewController.swift
//  Created by dragon. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var stackCalculation = ""
    var finalCalculation = ""
    var checkSign = ""
    var formula: Formula?
    
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculatorStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    @IBAction func ACButton(_ sender: UIButton) {
        initCalculator()
    }
    
    @IBAction func CEButton(_ sender: UIButton) {
    }
    
    @IBAction func changeSignButton(_ sender: UIButton) {
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
    }
    
    @IBAction func subtractButton(_ sender: UIButton) {
    }
    
    @IBAction func addButton(_ sender: UIButton) {
    }
    
    @IBAction func resultButton(_ sender: UIButton) {
    }
    
    @IBAction func pointButton(_ sender: UIButton) {
        pushInput(".")
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
        pushInput("0")
    }
    
    @IBAction func doubleZeroButton(_ sender: UIButton) {
        pushInput("00")
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
        pushInput("1")
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
        pushInput("2")
    }
    
    @IBAction func threeCButton(_ sender: UIButton) {
        pushInput("3")
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        pushInput("4")
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
        pushInput("5")
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
        pushInput("6")
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
        pushInput("7")
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        pushInput("8")
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
        pushInput("9")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCalculator()
        // Do any additional setup after loading the view.
    }
    
    private func initCalculator() {
        operandLabel.text = ""
        operatorLabel.text = ""
        stackCalculation = ""
        finalCalculation = ""
        calculatorStackView.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
    
    private func pushInput(_ userInput: String) {
        stackCalculation = stackCalculation + userInput
        finalCalculation = finalCalculation + userInput
        operandLabel.text = stackCalculation
    }
}

