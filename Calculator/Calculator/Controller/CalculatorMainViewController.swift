//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorMainViewController: UIViewController {

    @IBOutlet var numberView: UILabel!
    @IBOutlet var operatorView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func touchUpPointButton(_ sender: UIButton) {
        let currentNumberText = numberView.text ?? "0"
        let newPointText = sender.titleLabel?.text ?? "."
        let isPoint = currentNumberText.contains(".")
        
        if isPoint == false {
            numberView.text = currentNumberText + newPointText
        }
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        let currentNumberText = numberView.text ?? "0"
        let newNumberText = sender.titleLabel?.text ?? "0"
        
        guard currentNumberText == "0" else {
            numberView.text = currentNumberText + newNumberText
            return
        }

        guard newNumberText == "00" else {
            numberView.text = newNumberText
            return
        }
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        
        guard let number = numberView.text, Double(number) == 0 else {
            return //스크롤뷰에 옮기기 numberView 초기화 작업
        }
        
        operatorView.text = sender.titleLabel?.text
    }
    
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        numberView.text = "0"
    }
    
    @IBAction func touchUpChangeSignButton(_ sender: UIButton) {
        var currentNumberText = numberView.text ?? "0"
        let isCurrentSign = currentNumberText.contains("-")
        
        if isCurrentSign == true {
            currentNumberText.removeFirst()
            numberView.text = currentNumberText
        } else {
            numberView.text = "-" + currentNumberText
        }
    }
}

