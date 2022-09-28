//
//  Calculator - ViewController.swift
//  Created by 써니쿠키.
//  Copyright © 써니쿠키. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var operandItem: String = "" {
        willSet {
            guard newValue != "" && newValue != "-" else {
                operandLabel.text = "0"
                return
            }
            
            operandLabel.text = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else { return }
        
        switch number {
        case "0", "00":
            guard operandItem != "0" else { return }
        default:
            if operandItem == "0" {
                operandItem.removeFirst()
            }
            
            operandItem += number
        }
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        operatorLabel.text = sender.titleLabel?.text
    }
    
    @IBAction func touchUpPositiveNegativeNumberButton() {
        guard operandItem != "" else { return }
        
        if operandItem.prefix(1) == "-" {
            operandItem.removeFirst()
        } else {
            operandItem.insert("-", at: operandItem.startIndex)
        }
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        guard operandItem != "" else { return }
        operandItem.removeLast()
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        operandItem = ""
    }
}

