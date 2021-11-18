//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func reset() {
        operandsLabel.text = "0"
        operatorLabel.text = ""
    }
    
    //MARK: - Actions
    
    @IBAction func numberPadTapped(_ sender: UIButton) {
        guard let currentNumber = operandsLabel.text,
              let newNumber = sender.currentTitle else {
                  return
              }
        if currentNumber == "0" {
            operandsLabel.text = newNumber
        } else {
            operandsLabel.text = currentNumber + newNumber
        }
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let currentOperator = sender.currentTitle else {
            return
        }
        operatorLabel.text = currentOperator
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
        guard let currentOperand = operandsLabel.text,
              let intValue = Int(currentOperand) else {
                  return
              }
        if intValue > 0 {
            operandsLabel.text = "-" + currentOperand
        } else {
            operandsLabel.text = operandsLabel.text?.replacingOccurrences(of: "-", with: "")
        }
    }
}

