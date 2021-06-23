//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    var inputStorage: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkReasonableOperation(with: Calculator.Component){
        switch with {
        case .number:
            inputStorage.last
        default:
            <#code#>
        }
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        inputStorage.append("0")
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpOneButton(_ sender: UIButton) {
        
    }
    
    @IBAction func touchUpTwoButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpThreeButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpFourButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpFiveButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpSixButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpSevenButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpEightButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpNineButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpDivideButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpMultiplyButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpMinusButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpPlusButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
    }
    
    @IBAction func touchUpConvertSignButton(_ sender: UIButton) {
    }
    
}

