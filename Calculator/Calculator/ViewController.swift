//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 빼기 : −
        // 음수 : -
        
        var formula = ExpressionParser<CalculatorItemQueue, CalculatorItemQueue>.parse(from: "-16*7+99+4")
    }
}

// MARK: - Button Action
extension ViewController {
    @IBAction func didTappedOperators(_ sender: UIButton) {
        
    }
    
    @IBAction func didTappedCalculate(_ sender: UIButton) {
        
    }
    
    @IBAction func didTappedNumbers(_ sender: UIButton) {
        
    }
    
    @IBAction func didTappedMenus(_ sender: UIButton) {
        
    }
}
