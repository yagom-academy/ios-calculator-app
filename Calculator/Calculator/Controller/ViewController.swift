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
        
        configureInit()
    }
    
    func configureInit() {
        operandsLabel.text = ""
        operatorLabel.text = ""
    }
    
    //MARK: - Actions
    
    @IBAction func numberPadTapped(_ sender: UIButton) {
        guard let number = sender.currentTitle else {
            return
        }
        guard let currentText = operandsLabel.text else {
            return
        }
        operandsLabel.text = currentText + number
    }
    
    @IBAction func operatorTapped(_ sender: UIButton) {
        guard let currentOperator = sender.currentTitle else {
            return
        }
        operatorLabel.text = currentOperator
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: Any) {
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

