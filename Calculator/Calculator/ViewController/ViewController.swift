//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var userTyping = false
    
    @IBOutlet weak var displayOperandLabel: UILabel!
    @IBOutlet weak var displayOperatorLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        guard let digit = sender.currentTitle else { return }
        
        if userTyping {
            let currentText = displayOperandLabel.text!
            displayOperandLabel.text = currentText + digit
        } else {
            displayOperandLabel.text = digit
        }
        
        userTyping = true
    }
    
    @IBAction func touchOperator(_ sender: UIButton) {

    }
    
    @IBAction func touchCalculate(_ sender: UIButton) {
        
    }
    
    @IBAction func touchMenu(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        switch title {
        case "AC":
            clearOperandLabel()
            clearOperatorLabel()
            clearStackView()
        case "CE":
            print("clearEntry")
        case "":
            print("chageSign")
        default:
            break
        }
    }
    
    private func clearOperandLabel() {

    }
    
    private func clearOperatorLabel() {

    }
    
    private func clearStackView() {

    }
    
    private func clearEntry() {
        
    }
    
    private func changeSign() {
        
    }
}
