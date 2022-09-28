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
    
    private func addZero(zero: String) {
        guard let num = inputNumberLabel.text else {
            return
        }
        
        if num == "0" {
            return
        } else {
            inputNumberLabel.text = num + "\(zero)"
        }
    }
    
    private func addPoint(point: Character) {
        guard let num = inputNumberLabel.text else {
            return
        }
        
        if num.filter({ $0 == point }).count >= 1 {
            return
        } else {
            inputNumberLabel.text = num + String(point)
        }
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
            addZero(zero: "00")
        case "number_0":
            addZero(zero: "0")
        case "number_point":
            addPoint(point: ".")
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

