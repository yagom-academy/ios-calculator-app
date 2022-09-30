//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainOperandLabel: UILabel!
    var operandLabelText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainOperandLabel.text = mainOperandLabel.text ?? "".applyNumberFormatter()
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        mainOperandLabel.text = "0"
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        operandLabelText = removeComma(mainOperandLabel.text)
        
        guard operandLabelText != "0" else {
            mainOperandLabel.text = sender.tag.description
            return
        }
        
        mainOperandLabel.text = (operandLabelText + sender.tag.description).applyNumberFormatter()
        // 20자리가 넘어가는 경우, alert 띄우기
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        operandLabelText = removeComma(mainOperandLabel.text)
        
        guard operandLabelText.count == 1,
              operandLabelText.last == "0" else {
            mainOperandLabel.text = (operandLabelText + "0").applyNumberFormatter()
            return
        }
    }
    
    @IBAction func touchUpZeroZeroButton(_ sender: UIButton) {
        operandLabelText = removeComma(mainOperandLabel.text)
        
        guard operandLabelText.count == 1,
              operandLabelText.last == "0" else {
            mainOperandLabel.text = (operandLabelText + "00").applyNumberFormatter()
            return
        }
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        operandLabelText = removeComma(mainOperandLabel.text)
        
        guard operandLabelText != ".",
              operandLabelText.contains(".") == false else {
            return
        }
        
        mainOperandLabel.text = operandLabelText.applyNumberFormatter() + "."
    }
    
    func removeComma(_ string: String?) -> String {
        guard let returnValue = string?.components(separatedBy: ",").joined() else {
            return ""
        }
        return returnValue
    }
}

