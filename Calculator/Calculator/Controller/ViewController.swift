//
//  Calculator - CalculatorViewController.swift
//  Created by 미니.
//

import UIKit

class CalculatorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let input = "1*-2/-8*2"
        /*
         1+2+-8*2
         
         */
        print(ExpressionParser.parse(from: input))
    }
}

