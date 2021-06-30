//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnZero: UIButton!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    @IBOutlet weak var btnFive: UIButton!
    @IBOutlet weak var btnSix: UIButton!
    @IBOutlet weak var btnSeven: UIButton!
    @IBOutlet weak var btnEigth: UIButton!
    @IBOutlet weak var btnNine: UIButton!
    @IBOutlet weak var btnDoubleZero: UIButton!
    @IBOutlet weak var mainStackView: UILabel!
    
    @IBOutlet weak var btnDot: UIButton!
    var calculate = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushNumberButton(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            return
        }
        guard let text = titleLabel.text else {
            return
        }
        guard let currentText = mainStackView.text else {
            return
        }
        switch sender {
        case btnDot:
            if currentText.contains(text){
                
            } else {
                
            }
        
        default:
            mainStackView.text = currentText + text
            calculate.pushNumberOrOperator(Operand(value: Double(text)!))
        }
    }
}
