//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var inputNumbers = "" // 숫자값을 담을 스트링
    
    //현재 상태창
    @IBOutlet weak var currentNumberOnField: UILabel!
    
    @IBOutlet weak var currentOperatorOnField: UILabel!
    
    @IBOutlet weak var operatorStackView: UILabel!
    
    @IBOutlet weak var numberStackView: UILabel!
    
    //    ⁺⁄₋ 버튼은 현재 입력한 숫자의 부호를 변환합니다.
    //
    //    입력된 숫자가 0인경우 부호를 표시하지 않고 변경하지도 않습니다.
    //    숫자입력 중에 연산자(÷, ×, -, +)를 누르게 되면 숫자입력을 중지하고 다음 숫자를 입력받습니다.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpComponentsOnField()
    }
    
    //
    func setUpComponentsOnField() {
        currentNumberOnField.text = ""
        currentOperatorOnField.text = ""
    }
    //AC는 모든 연산내역을 초기화합니다.
    //    2+3-4+5 를 입력하고 AC를 누르면 모든 수식이 초기화되고 0의 상태가 됩니다.
    //    2+3-4+5= 을 입력하고 AC를 누르면 모든 수식이 초기화되고 0의 상태가 됩니다.
    
    @IBAction func allClearButtonTapped(_ sender: Any) {
        self.currentNumberOnField.text = "0"
        var queueStack = CalculatorItemQueue<String>()
        queueStack.removeAll()
    }
    
    //    CE는 현재 입력하던 숫자 혹은 연산결과만 삭제합니다.
    //    2+3-4+5를 입력하고 CE를 누르면 2+3-4+의 상태가 됩니다.
    //    2+3-4+ 를 입력하고 CE를 누르면 2+3-4+의 상태가 됩니다.
    //    2+3-4+5= 을 입력하고 CE를 누르면 0의 상태가 됩니다.
    @IBAction func clearEntryButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func changeOperatorButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func calculateResult(_ sender: Any) {
        //        ExpressionParser.parse(from: inputtedComponents)
    }
    
    //버트탭하면 가져온 입력값을 바탕으로 배열에 넣어주기
    @IBAction func operButtonTapped(_ sender: UIButton) {
        
        let currentOper = getInputtedOperator(sender)
        let currentNum = getInputtedNumber(sender)
        

        if currentOper.isEmpty == false {
            currentNumberOnField.text = ""
            inputNumbers = ""
        }
    }
    
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
//        currentNumberOnField.text! += getInputtedNumber(sender)
        // Q1.텍스트레이블에 강제 옵셔널언래핑을 써야하는가 / 아니면 전역변수를 사용해서 담아서 다시담아줘야함
    
//        inputNumbers += getInputtedNumber(sender)
    
        currentNumberOnField.text = getInputtedNumber(sender)
       
    }
    
    //숫자 입력값 가져오기
    func getInputtedNumber(_ sender: UIButton) -> String {
            
        var currentInputNumber: String = ""
        
        switch sender.tag {
        case 1: currentInputNumber += "1"
        case 2: currentInputNumber += "2"
        case 3: currentInputNumber += "3"
        case 4: currentInputNumber += "4"
        case 5: currentInputNumber += "5"
        case 6: currentInputNumber += "6"
        case 7: currentInputNumber += "7"
        case 8: currentInputNumber += "8"
        case 9: currentInputNumber += "9"
        case 0: currentInputNumber += "0"
        case 100: currentInputNumber += "00"
        case 101: currentInputNumber += "."
        default: return ""
        }
        
        inputNumbers += currentInputNumber
        return inputNumbers
    }
    
    
    //연산자 입력값가져오기
    func getInputtedOperator(_ sender: UIButton) -> String {
        
        var currentOperator: String = ""
        
        switch sender.titleLabel?.text {
        case "+": currentOperator = "+"
        case "−": currentOperator = "−"
        case "÷": currentOperator = "÷"
        case "×": currentOperator = "×"
        default:
            break
        }
        
        currentOperatorOnField.text = currentOperator
        
        return currentOperator
    }
  
    func convertOperator(_ sender: UIButton) -> String {
            
        guard let titleLabel = sender.titleLabel?.text else {
            return ""
           }
        switch titleLabel {
        case "+":
            return "+"
        case "−":
            return "-" // -값 다름 case부분에 적용된건 가짜 minus
        case "÷":
            return "/"
        case "×":
            return "*"
        default:
            return ""
        }
    }
    
    func makeScrollViewData() -> String {
            
        return ""
    }
        
}
    

