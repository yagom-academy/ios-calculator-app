//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var formulaListStackView: UIStackView!
    @IBOutlet weak var formulaListScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private var formulaString: String = ""
    private var isComputable: Bool = true

    private var calculatorNumberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 5
        numberFormatter.maximumSignificantDigits = 20
        
        return numberFormatter
    }()
    
    @IBAction func tapNumbersButton(_ sender: UIButton) {
        if isComputable {
            guard let inputNumberText = sender.titleLabel?.text,
                  let numberLabelText = inputNumberLabel.text,
                  let operatorLabelText = inputOperatorLabel.text else { return }
            
            if numberLabelText.count < 20 {
                inputOperatorLabel.text = (formulaListStackView.subviews.isEmpty) ? ("") : operatorLabelText
                if numberLabelText == "0" {
                    inputNumberLabel.text = inputNumberText
                } else {
                    let formattedNumberText = numberLabelText.replacingOccurrences(of: ",", with: "") + inputNumberText
                    inputNumberLabel.text = calculatorNumberFormatter.string(for: Double(formattedNumberText))
                }
            }
        }
    }
    
    @IBAction func tapSerialZeroButton(_ sender: UIButton) {
        guard let inputNumberText = sender.titleLabel?.text,
              let numberLabelText = inputNumberLabel.text else { return }
        
        inputNumberLabel.text = (numberLabelText == "0") ? ("0") : (numberLabelText + inputNumberText)
    }
    
    @IBAction func tapPeriodButton(_ sender: UIButton) {
        let period = "."
        guard let numberLabelText = inputNumberLabel.text else { return }
        
        inputNumberLabel.text? = (numberLabelText.contains(period)) ? (numberLabelText) : (numberLabelText + period)
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard let inputOperatorText = sender.titleLabel?.text,
              let numberLabelText = inputNumberLabel.text,
              let operatorLabelText = inputOperatorLabel.text else { return }
        
        if inputOperatorText == "=" && inputNumberLabel.text == "0" {
            formulaString += operatorLabelText + numberLabelText
        } else if inputNumberLabel.text == inputOperatorText {
            inputOperatorLabel.text = inputOperatorText
        } else {
            formulaString += operatorLabelText + numberLabelText
            inputOperatorLabel.text = inputOperatorText
            inputNumberLabel.text = "0"
        }
    }
    
    @IBAction func tapChangeSignButton(_ sender: UIButton) {
        let minusSign = "-"
        guard let numberLabelText = inputNumberLabel.text,
              numberLabelText != "0" else { return }
        
        if numberLabelText.hasPrefix(minusSign) {
            inputNumberLabel.text = String(numberLabelText.dropFirst(1))
        } else {
            inputNumberLabel.text = minusSign + numberLabelText
        }
    }
    
    @IBAction func tapEqualMarkButton(_ sender: UIButton) {
        if isComputable {
            tapOperatorButton(sender)
            var calculateResult = ExpressionParser.parse(from: formulaString)
            
            do {
                let formula = try calculateResult.result()
                let formulaResult = calculatorNumberFormatter.string(for: formula)
                inputNumberLabel.text = formulaResult
                
                isComputable = false
                formulaString = ""
            } catch CalculatorError.dividedByZero {
                inputNumberLabel.text = "NaN"
                isComputable = false
            } catch {
                let alert = UIAlertController(title: "계산 오류입니다.", message: "확인 버튼을 눌러주시기 바랍니다.", preferredStyle: .alert)
                let cancle = UIAlertAction(title: "확인", style: .default)
                alert.addAction(cancle)
                present(alert, animated: true)
            }
        }
    }
    
    @IBAction func tapAllClearButton(_ sender: UIButton) {
    }
    
    @IBAction func tapClearEntryButton(_ sender: UIButton) {
    }
}

