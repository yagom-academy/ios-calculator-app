//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let inputdatavalidation = InputDataValidation()
        
        //UserInput(버튼 눌렀다고 가정, 버튼을 눌렀을때 파라미터를 입력받아 mangeData메서드 실행)
        inputdatavalidation.manageData(input: "5")
        inputdatavalidation.manageData(input: "-")
        inputdatavalidation.manageData(input: "15")
        
        //중위표현식(InputDataValidation의 manageData메서드를 통해 입력받은 String을 중위표현식 순서의 배열로 변환)
        print(Data.medianNotation)
        
        //일반계산기 인스턴스
        let generalCalculator: GeneralCalculator = GeneralCalculator()
        
        //2진계산기 결과
        generalCalculator.executeBinaryCalculation()
        //10진계산기 결과
        generalCalculator.executeDecimalCalculation()
    }
}

