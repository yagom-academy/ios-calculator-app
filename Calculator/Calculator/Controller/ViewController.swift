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
    }
    
    @IBAction func zeroButton(_ sender: UIButton) {
    }
    
    @IBAction func doubleZeroButton(_ sender: UIButton) {
    }
    
    @IBAction func oneButton(_ sender: UIButton) {
    }
    
    @IBAction func twoButton(_ sender: UIButton) {
    }
    
    @IBAction func threeCButton(_ sender: UIButton) {
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
    }
    
    @IBAction func fiveButton(_ sender: UIButton) {
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
    }
    
    @IBAction func sevenButton(_ sender: UIButton) {
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
    }
    
    @IBAction func nineButton(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

