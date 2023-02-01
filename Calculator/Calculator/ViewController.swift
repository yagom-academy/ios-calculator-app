//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var operatorInput: UILabel!
    @IBOutlet weak private var numberInput: UILabel!
    
    @IBOutlet var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    private var isFinishedEnteringOperands: Bool = false
    private var isFinishedCalculate: Bool = false
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        
        if let senderSign = sender.currentTitle {
            operatorInput.text = senderSign
            addStackView()
        }
        numberInput.text = "0"
    }
    
    private func addStackView() {
        
        guard let operandStackLabel = numberInput.text,
              let operatorStackLabel = operatorInput.text  else {  return  }
        
        let stackLabel = UILabel()
        stackLabel.text = operatorStackLabel + " " + operandStackLabel
        stackLabel.numberOfLines = 0
        stackLabel.adjustsFontForContentSizeCategory = true
        stackLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackLabel.textColor = .white
        stackView.addArrangedSubview(stackLabel)
        
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        
        guard let number = sender.currentTitle else { return }
        checkFirstDigit()
        
        if isFinishedEnteringOperands {
            guard let currentNumber = numberInput.text else  { return }
            numberInput.text = currentNumber + number
        } else {
            numberInput.text = number
        }
        isFinishedEnteringOperands = true
    }
    
    private func checkFirstDigit() {
        if numberInput.text == "0" || numberInput.text == "00" {
            numberInput.text = ""
        }
    }
    
}
