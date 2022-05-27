//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var currentNumberLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
    private var currentNumber: String = "0"
    private var currentOperator: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshNumberLabel()
        refreshOperatorLabel()
    }
    
    func refreshNumberLabel() {
        DispatchQueue.main.async {
            self.currentNumberLabel.text = self.currentNumber
        }
    }
    
    func refreshOperatorLabel() {
        DispatchQueue.main.async {
            self.currentOperatorLabel.text = self.currentOperator
        }
    }
    
    @IBAction func pressNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        switch currentNumber {
        case "0":
            currentNumber = number
        default:
            currentNumber += number
        }
        
        refreshNumberLabel()
    }
    
    
    @IBAction func pressOperatorButton(_ sender: UIButton) {
        guard let `operator` = sender.titleLabel?.text else {
            return
        }
        // TODO: 오퍼레이터가 없는 초기 상태일 경우 숫자를 입력하고 오퍼레이터를 입력하면 숫자가 올라가게끔
        
        currentOperator = `operator`
        
        refreshOperatorLabel()
    }
}

