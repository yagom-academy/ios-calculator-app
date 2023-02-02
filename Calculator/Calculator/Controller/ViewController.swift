//
//  Calculator - ViewController.swift
//  Created by kokkilE on 2023/01/25.
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var expression: String = ""
    var constraintsOfLabelView: [NSLayoutConstraint]?
    @IBOutlet weak var scrollView: UIStackView!
    @IBOutlet weak var operatorUILabel: UILabel!
    @IBOutlet weak var operandUILabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchUpCalculatorButton(sender: UIButton) {
        guard let inputFromButton = sender.titleLabel?.text else {
            return
        }
        
        processInput(from: inputFromButton)
    }
    
    func processInput(from inputFromButton: String) {
        switch inputFromButton {
        case "AC":
            return
        case "CE":
            return
        case "⁺⁄₋":
            return
        case "+", "−", "÷", "×":
            return
        case "=":
            return
        case "0", "00":
            return
        case ".":
            return
        default:
            return
        }
    }
}

