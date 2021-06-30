//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainStackView: UILabel!
    @IBOutlet weak var btnDot: UIButton!
    @IBOutlet weak var btnEquality: UIButton!
    @IBOutlet weak var btnAddition: UIButton!
    @IBOutlet weak var btnSubtraction: UIButton!
    @IBOutlet weak var btnMultiplication: UIButton!
    @IBOutlet weak var btnDivision: UIButton!
    @IBOutlet weak var operatorLabel: UILabel!
    
    var calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushButton(_ sender: UIButton) {
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
            // addDot() - 소수점을 레이블에 추가
//            if !currentText.contains(text){
//                mainStackView.text = currentText + text
//            }
        default:
            // addNumber() - 숫자를 레이블에 추가
//            mainStackView.text = currentText + text
//            calculator.pushNumberOrOperator(Operand(value: Double(text)!))
        }
    }
    
    @IBAction func pushOperatorButton(_ sender: UIButton) {
        guard let titleLabel = sender.titleLabel else {
            return
        }
        guard let text = titleLabel.text else {
            return
        }
        switch sender {
        case btnEquality:
            addDot()
            //  등호버튼 눌렸을때 동작
//            do {
//                let result = try calculator.makeCalculation()
//                mainStackView.text = String(result)
//            } catch {
//
//            }
        default:
            // 연산자가 추가될때 동작 - text
//            operatorLabel.text = text
//            switch sender {
//            case btnAddition:
//                calculator.pushNumberOrOperator(Operator(type: .addition))
//            case btnSubtraction:
//                calculator.pushNumberOrOperator(Operator(type: .subtraction))
//            case btnMultiplication:
//                calculator.pushNumberOrOperator(Operator(type: .mulitplication))
//            case btnDivision:
//                calculator.pushNumberOrOperator(Operator(type: .division))
//            default:
//                <#code#>
//            }
        }
    }
    
    @IBAction func pushChangingUIButton(_ sender: UIButton) {
//        switch <#value#> {
//        case <#pattern#>:
//            <#code#>
//        default:
//            <#code#>
//        }
    }
}

extension ViewController {
    func addDot() {
        
    }
}
