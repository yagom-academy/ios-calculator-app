//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var historyScrollView: UIScrollView!
    @IBOutlet weak var historyStackView: UIStackView!
    @IBOutlet weak var lastOperatorLabel: UILabel!
    @IBOutlet weak var currentNumberLabel: UILabel!
    var formula: [String] = []
    
    private var numberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAll()
    }
    
    func resetCurrentNumberLabel() {
        currentNumberLabel.text = "0"
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        updateCurrentNumberLabel(String(sender.tag))
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        
        updateCurrentNumberLabel("00")
    }
    
    func updateCurrentNumberLabel(_ int: String) {
        guard var curNumStr = currentNumberLabel.text else { return }
        
        if curNumStr == "0" {
            curNumStr = int
        } else {
            curNumStr += int
        }
        
        currentNumberLabel.text = curNumStr
    }
    
    
    @IBAction func touchUpPlusButton(_ sender: UIButton) {
        
        updateOperatorLabel("+")
    }
    
    @IBAction func touchUpMinusButton(_ sender: UIButton) {
        
        updateOperatorLabel("-")
    }
    
    @IBAction func touchUpMultiplyButton(_ sender: UIButton) {
        
        updateOperatorLabel("×")
    }
    
    @IBAction func touchUpDivideButton(_ sender: UIButton) {
        
        updateOperatorLabel("÷")
    }
    
    
    func updateOperatorLabel(_ operatorSign: String) {
        lastOperatorLabel.text = operatorSign
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        
    }
    
    // AC버튼을 눌렀을 때 동작할 녀석
    func clearAll() {
        // 입력하던 숫자창 비우기
        resetCurrentNumberLabel()
        
        // 입력되어있던 기호창 비우기

        // stackView 안의 전체 stack item 날리는 것
        // -> 익스텐션 메서드로 따로 구현해놓고 호출해서 쓰기?
        
        //
    }
    
    func reset() {
        
    }
    

    
    func pushFormula() {
        lastOperatorLabel.text = ""
        
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        
        // 스택 다 긁어와서 formula에 집어넣기
    }
    
}

