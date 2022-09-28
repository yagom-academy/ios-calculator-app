//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak private var inputNumberLabel: UILabel!
    @IBOutlet weak private var inputOperatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addNumber(number: String) {
        guard let num = inputNumberLabel.text else {
            return
        }
        
        if num == "0" {
            inputNumberLabel.text = "\(number)"
        } else {
            inputNumberLabel.text = num + "\(number)"
        }
    }
    
    @IBAction private func touchUpNumberButton(sender: UIButton) {
        
        guard let id = sender.restorationIdentifier else {
            return
        }
        
        switch id {
        case "number_00":
            guard let num = inputNumberLabel.text,
                  num != "" else {
                return
            }
            
            inputNumberLabel.text = num + "00"
        case "number_0":
            guard let num = inputNumberLabel.text,
                  num != "" else {
                return
            }
            
            inputNumberLabel.text = num + "0"
        case "number_point":
            guard let num = inputNumberLabel.text,
                  num != "" else {
                return
            }
            
            inputNumberLabel.text = num + "."
        case "number_1":
            addNumber(number: "1")
        case "number_2":
            addNumber(number: "2")
        case "number_3":
            addNumber(number: "3")
        case "number_4":
            addNumber(number: "4")
        case "number_5":
            addNumber(number: "5")
        case "number_6":
            addNumber(number: "6")
        case "number_7":
            addNumber(number: "7")
        case "number_8":
            addNumber(number: "8")
        case "number_9":
            addNumber(number: "9")
        default:
            return
        }
    }
}

