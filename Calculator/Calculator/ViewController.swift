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
    
    private func addZero(inputText: String, zero: String) {
        if inputText == "0" {
            return
        } else {
            inputNumberLabel.text = inputText + "\(zero)"
        }
    }
    
    private func addPoint(inputText: String, point: Character) {
        if inputText.filter({ $0 == point }).count >= 1 {
            return
        } else {
            inputNumberLabel.text = inputText + String(point)
        }
    }
    
    private func addNumber(inputText: String, number: String) {
        if inputText == "0" {
            inputNumberLabel.text = "\(number)"
        } else {
            inputNumberLabel.text = inputText + "\(number)"
        }
    }
    
    @IBAction private func touchUpNumberButton(sender: UIButton) {
        guard let id = sender.restorationIdentifier,
        let inputText = inputNumberLabel.text else {
            return
        }
        
        switch id {
        case "number_00":
            addZero(inputText: inputText , zero: "00")
        case "number_0":
            addZero(inputText: inputText, zero: "0")
        case "number_point":
            addPoint(inputText: inputText, point: ".")
        case "number_1":
            addNumber(inputText: inputText, number: "1")
        case "number_2":
            addNumber(inputText: inputText, number: "2")
        case "number_3":
            addNumber(inputText: inputText, number: "3")
        case "number_4":
            addNumber(inputText: inputText, number: "4")
        case "number_5":
            addNumber(inputText: inputText, number: "5")
        case "number_6":
            addNumber(inputText: inputText, number: "6")
        case "number_7":
            addNumber(inputText: inputText, number: "7")
        case "number_8":
            addNumber(inputText: inputText, number: "8")
        case "number_9":
            addNumber(inputText: inputText, number: "9")
        default:
            return
        }
    }
}

