//
//  Calculator - CalculatorViewController.swift
//  Created by 미니.
//

import UIKit

class CalculatorViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let input = "10*-20*8*2"
        let form = ExpressionParser.parse(from: input)
        
        do {
            let value = try form.result()
            print(value)
        } catch FormulaError.dividedByZero {
            print(Double.nan)
        } catch FormulaError.emptyQueue {
            print("Empty Queue")
        } catch {
            
        }
    }
}

