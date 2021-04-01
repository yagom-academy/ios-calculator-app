//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let inputDataValidation = InputDataValidator()
        let data = inputDataValidation.data
        //let decimalCalculator = DecimalCalculation()
        let binaryCalculator = BinaryCalculation()
        
        //UserInput(버튼 눌렀다고 가정, 버튼을 눌렀을때 파라미터를 입력받아 mangeData메서드 실행)
        inputDataValidation.validateData(input: "0")
        inputDataValidation.validateData(input: "1")
        inputDataValidation.validateData(input: "0")
        inputDataValidation.validateData(input: "1")
        inputDataValidation.validateData(input: "+")
        inputDataValidation.validateData(input: "1")
        inputDataValidation.validateData(input: "1")
        inputDataValidation.validateData(input: "1")
        inputDataValidation.validateData(input: "1")


        
        //중위표현식(InputDataValidation의 manageData메서드를 통해 입력받은 String을 중위표현식 순서의 배열로 변환)
        print(data.medianNotation)
        
        //일반계산기 인스턴스let generalCalculator: GeneralCalculator = GeneralCalculator()
        let generalCalculator = GeneralCalculator()
        
        generalCalculator.convertToPostfixNotation(inputDataValidation)
    
        //2진계산기 결과
        binaryCalculator.calculatePostfixNotation(inputDataValidation)
        
        //10진계산기 결과
        //decimalCalculator.calculatePostfixNotation(inputdatavalidation)
        

        print(data.postfixNotation)
    }
}

