//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let inputDataValidator = InputDataValidator()
        //let decimalCalculator = DecimalCalculation()
        let binaryCalculator = BinaryCalculation()
        
        //UserInput(버튼 눌렀다고 가정, 버튼을 눌렀을때 파라미터를 입력받아 mangeData메서드 실행)
        inputDataValidator.validate(input: "0")
        inputDataValidator.validate(input: "1")
        inputDataValidator.validate(input: "0")
        inputDataValidator.validate(input: "1")
        inputDataValidator.validate(input: "+")
        inputDataValidator.validate(input: "1")
        inputDataValidator.validate(input: "1")
        inputDataValidator.validate(input: "1")
        inputDataValidator.validate(input: "1")


        
        //중위표현식(InputDataValidation의 manageData메서드를 통해 입력받은 String을 중위표현식 순서의 배열로 변환)
        print(inputDataValidator.data.medianNotation)
        
        //일반계산기 인스턴스let generalCalculator: GeneralCalculator = GeneralCalculator()
        let generalCalculator = Calculator()
        
        generalCalculator.convertToPostfixNotation(&inputDataValidator.data)
    
        //2진계산기 결과
        binaryCalculator.calculatePostfixNotation(inputDataValidator.data)
        
        //10진계산기 결과
        //decimalCalculator.calculatePostfixNotation(inputdatavalidation)
        

        print(inputDataValidator.data.postfixNotation)
    }
}

