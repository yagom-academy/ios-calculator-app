//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    //입력하고있는 상태의 필드숫자들
    var currentInputNumber: String = ""
    var currentInputOperator: String = ""
    
    var inputtedComponents: String = "" // 데이터를 저장할 스트링
    
    //현재 상태창
    @IBOutlet weak var currentInputtedNumberOnField: UILabel!
    
    @IBOutlet weak var currentOperatorOnField: UILabel!
        
    
    //    ⁺⁄₋ 버튼은 현재 입력한 숫자의 부호를 변환합니다.
//
//    입력된 숫자가 0인경우 부호를 표시하지 않고 변경하지도 않습니다.
//    숫자입력 중에 연산자(÷, ×, -, +)를 누르게 되면 숫자입력을 중지하고 다음 숫자를 입력받습니다.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpComponentsOnField()
    }
    
    
    func setUpComponentsOnField() {
        currentOperatorOnField.text = "+" //시작 오퍼레이터
        currentInputtedNumberOnField.text = currentInputNumber
    }
    //AC는 모든 연산내역을 초기화합니다.
    //    2+3-4+5 를 입력하고 AC를 누르면 모든 수식이 초기화되고 0의 상태가 됩니다.
    //    2+3-4+5= 을 입력하고 AC를 누르면 모든 수식이 초기화되고 0의 상태가 됩니다.
    
    @IBAction func allClearButtonTapped(_ sender: Any) {
        self.currentInputNumber = "0"
        self.currentInputtedNumberOnField.text = "0"
        var queueStack = CalculatorItemQueue<String>()
        queueStack.removeAll()
    }
    
    //    CE는 현재 입력하던 숫자 혹은 연산결과만 삭제합니다.
    //    2+3-4+5를 입력하고 CE를 누르면 2+3-4+의 상태가 됩니다.
    //    2+3-4+ 를 입력하고 CE를 누르면 2+3-4+의 상태가 됩니다.
    //    2+3-4+5= 을 입력하고 CE를 누르면 0의 상태가 됩니다.
    @IBAction func clearEntryButtonTapped(_ sender: Any) {
        self.currentInputNumber = ""
    }
   
    @IBAction func changeOperatorButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func calculateResult(_ sender: Any) {
        ExpressionParser.parse(from: inputtedComponents)
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        
        switch sender.tag {
        case 1: currentInputNumber = "1"
        case 2: currentInputNumber = "2"
        case 3: currentInputNumber = "3"
        case 4: currentInputNumber = "4"
        case 5: currentInputNumber  = "5"
        case 6: currentInputNumber  = "6"
        case 7: currentInputNumber  = "7"
        case 8: currentInputNumber  = "8"
        case 9: currentInputNumber  = "9"
        case 0: currentInputNumber  = "0"
        case 100: currentInputNumber  = "00"
        default:
            break
        }
        inputtedComponents += currentInputNumber //현재 데이터에 저장
        setUpComponentsOnField()
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        
        switch sender.titleLabel?.text {
        case "+": currentInputOperator = "+"
        case "−": currentInputOperator = "-" // -값 다름 case부분에 적용된건 가짜 minus
        case "÷": currentInputOperator = "/"
        case "×": currentInputOperator = "*"
        default:
            break
        }
        inputtedComponents += currentInputOperator  // 현재 데이터값에 저장
        currentOperatorOnField.text = currentInputOperator // 오퍼레이터 현재상태 표시
        setUpComponentsOnField()
    }
    

    
}

