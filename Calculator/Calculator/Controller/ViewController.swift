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
    let calculate = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushNumberButton(_ sender: UIButton) {
        switch sender {
        case btnDoubleZero:
            mainStackView.text! += "00"
            calculate.pushNumberOrOperator(Operand(value: Double("00")))
        case btnZero:
            
        case btnOne:
            
        case btnTwo:
            
        case btnThree:
            
        case btnFour:
            
        case btnFive:
            
        case btnSix:
            
        case btnSeven:
            
        case btnNine:
            
        default:
            <#code#>
        }
    }
}
