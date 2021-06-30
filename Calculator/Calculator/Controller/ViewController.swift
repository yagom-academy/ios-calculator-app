//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    var notations: [String] = []
    var inputNotation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notations = []
    }

    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let operandButtonNumber = sender.titleLabel?.text else {
            return
        }
        
        inputNotation = "\(inputNotation)\(operandButtonNumber)"
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let operatorCase = sender.titleLabel?.text else {
            return
        }
        notations.append(inputNotation)
        notations.append(operatorCase)
        inputNotation = ""
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        guard let dotButtonText = sender.titleLabel?.text else {
            return
        }
        
        if inputNotation.components(separatedBy: "").contains(".") {
            return
        }
        
        inputNotation = "\(inputNotation)\(dotButtonText)"
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        let calculator = Calculator()
        let result = calculator.runCalculator(on: notations)
        
        if case .success(let resultValue) = result {
            print(resultValue)
        } else if case .failure(let errorCase) = result {
            switch errorCase {
            case .dividedByZero:
                print(errorCase)
            case .stackError:
                print(errorCase)
            case .unknownError:
                print(errorCase)
            }
        }
    }
}

