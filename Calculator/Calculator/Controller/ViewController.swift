//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentOperator: UILabel!
    @IBOutlet var currentResult: UILabel!

    @IBOutlet var operandsButton: UIButton!
    @IBOutlet var operatorsButton: UIButton!
    @IBOutlet var acButton: UIButton!
    @IBOutlet var ceButton:
    UIButton!
    @IBOutlet var positiveOrNegativeButton: UIButton!
    
    @IBAction func hitButton(_ sender: UIButton) {

        switch sender {
        case operandsButton:
            //ispositive가 true면 양수 저장
            inputOperands()
        case operatorsButton:
            inputOperators()
        case acButton:
            clearAllcalculation()
        case ceButton:
            clearCurrentcalculation()
//        case positiveOrNegativeButton:
//            isPositive()
        default:
            print("error")
        }
    }
    
    func inputOperands() {
        //피연산자 큐에 입력
    }
    func inputOperators() {
        //연산자 큐에 입력
    }
    func isPositive() {
        //양수인지 반환
    }
    func clearAllcalculation() {
        //피연산자큐, 연산자큐 모두 비우기
    }
    func clearCurrentcalculation() {
        //마지막 피연산자 삭제
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

