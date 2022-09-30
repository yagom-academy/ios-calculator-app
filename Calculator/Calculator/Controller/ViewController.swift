//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    let numberFormatter = NumberFormatter()
    @IBOutlet weak var mainOperandLabel: UILabel!
    var operandLabelText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainOperandLabel.text = applyNumberFormatter(to: mainOperandLabel.text ?? "")
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        operandLabelText = removeComma(mainOperandLabel.text)
        guard operandLabelText != "0" else {
            mainOperandLabel.text = sender.tag.description
            return
        }
        
        mainOperandLabel.text = applyNumberFormatter(to: operandLabelText + sender.tag.description)
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        operandLabelText = removeComma(mainOperandLabel.text)
        guard operandLabelText.count == 1,
              operandLabelText.last == "0" else {
            mainOperandLabel.text = applyNumberFormatter(to: operandLabelText + "0")
            return
        }
    }
    
    @IBAction func touchUpZeroZeroButton(_ sender: UIButton) {
        operandLabelText = removeComma(mainOperandLabel.text)
        guard operandLabelText.count == 1,
              operandLabelText.last == "0" else {
            mainOperandLabel.text = applyNumberFormatter(to: operandLabelText + "00")
            return
        }
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
    }
    
    func removeComma(_ string: String?) -> String {
        guard let returnValue = string?.components(separatedBy: ",").joined() else {
            return ""
        }
        return returnValue
    }
    
    func applyNumberFormatter(to string: String) -> String {
        numberFormatter.numberStyle = .decimal // 3자리마다 , 를 찍어주는 역할
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20 // 유효자리수를 설정해주는 역할
        
        guard string.contains(".") else {
            guard let number: NSNumber = numberFormatter.number(from: string),
                  let returnValue = numberFormatter.string(from: number) else {
                return ""
            }
            return returnValue
        }
        
        let stringsSplitedByDot: [String] = string.split(with: ".")
        guard let numberBeforeDot: NSNumber = numberFormatter.number(from: stringsSplitedByDot[0]),
              let returnValue = numberFormatter.string(from: numberBeforeDot) else {
            return ""
        }
        return returnValue + "." + stringsSplitedByDot[1]
    }
}

