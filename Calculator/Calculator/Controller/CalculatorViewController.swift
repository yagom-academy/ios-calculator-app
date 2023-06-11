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
    @IBOutlet weak var formulaListscrollView: UIScrollView!
    
    private var formulaString: String = ""
    private var isComputable: Bool = true
    
    private var calculatorNumberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.maximumFractionDigits = 15
        
        return numberFormatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputNumberLabel.text = "0"
        inputOperatorLabel.text = ""
        
        formulaListStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    @IBAction func tapNumbersButton(_ sender: UIButton) {
        if isComputable {
            guard let inputNumberText = sender.titleLabel?.text,
                  let numberLabelText = inputNumberLabel.text,
                  let operatorLabelText = inputOperatorLabel.text else { return }
            
            if numberLabelText.count < 20 {
                inputOperatorLabel.text = (formulaListStackView.subviews.isEmpty) ? ("") : operatorLabelText
                inputNumberLabel.text = (numberLabelText == "0") ? (inputNumberText) : calculatorNumberFormatter.string(for: Double(numberLabelText.replacingOccurrences(of: ",", with: "") + inputNumberText))
            }
        }
    }
    
    @IBAction func tapSerialZeroButton(_ sender: UIButton) {
        guard let inputNumberText = sender.titleLabel?.text,
              let numberLabelText = inputNumberLabel.text else { return }
        
        inputNumberLabel.text = (numberLabelText == "0") ? ("0") : (numberLabelText + inputNumberText)
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
    
    @IBAction func tapPeriodButton(_ sender: UIButton) {
        let period = "."
        guard let numberLabelText = inputNumberLabel.text else { return }
        
        inputNumberLabel.text? = (numberLabelText.contains(period)) ? (numberLabelText) : (numberLabelText + period)
    }
    
    @IBAction func tapOperatorsButton(_ sender: UIButton) {
        guard let inputOperatorText = sender.titleLabel?.text,
              let numberLabelText = inputNumberLabel.text,
              let operatorLabelText = inputOperatorLabel.text else { return }
        
        if inputOperatorText == "=" && inputNumberLabel.text == "0" {
            formulaString += operatorLabelText + numberLabelText
        } else if inputNumberLabel.text == "0" {
            inputOperatorLabel.text = inputOperatorText
        } else {
            let formulaStackView = makeStackView()
            let operatorLabel = makeLabelInStackView(operatorLabelText)
            let formattedNumberText = numberLabelText.hasSuffix(".") ? String(numberLabelText.dropLast(1)) : numberLabelText
            let numberLabel = makeLabelInStackView(formattedNumberText)
            
            formulaStackView.addArrangedSubview(operatorLabel)
            formulaStackView.addArrangedSubview(numberLabel)
            formulaListStackView.addArrangedSubview(formulaStackView)
            
            formulaString += operatorLabelText + numberLabelText
            
            inputOperatorLabel.text = inputOperatorText
            inputNumberLabel.text = "0"
            
            setAutoScrollToBottom()
        }
        
        if inputOperatorText == "=" {
            inputOperatorLabel.text = ""
        }
        
        isComputable = true
    }
    
    @IBAction func tapEqualMarkButton(_ sender: UIButton) {
        if isComputable == true {
            tapOperatorsButton(sender)
            var calculateResult = ExpressionParser.parse(from: formulaString)
            
            do {
                let formula = try calculateResult.result()
                let formulaResult = calculatorNumberFormatter.string(for: formula)
                inputNumberLabel.text = formulaResult
                
                isComputable = false
                formulaString = ""
            } catch CalculateError.dividedByZero {
                inputNumberLabel.text = "NaN"
                isComputable = false
            } catch {
                let alert = UIAlertController(title:"계산 오류입니다.",
                                              message: "확인버튼을 눌러주시기 바랍니다",
                                              preferredStyle: UIAlertController.Style.alert)
                let cancle = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(cancle)
                present(alert,animated: true,completion: nil)
            }
        }
    }
    
    @IBAction func tapAllClearButton(_ sender: UIButton) {
        inputOperatorLabel.text = ""
        inputNumberLabel.text = "0"
        formulaListStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
        isComputable = true
        formulaString = ""
    }
    
    @IBAction func tapClearEntryButton(_ sender: UIButton) {
        isComputable = true
        inputNumberLabel.text = "0"
    }
}

extension CalculatorViewController {
    func makeStackView() -> UIStackView {
        let formulaStackView: UIStackView = UIStackView()
        
        formulaStackView.translatesAutoresizingMaskIntoConstraints = false
        formulaStackView.axis = .horizontal
        formulaStackView.spacing = 8
        
        return formulaStackView
    }
    
    func makeLabelInStackView(_ input: String) -> UILabel {
        let inputLabel = UILabel()
        
        inputLabel.text = input
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
        inputLabel.textColor = UIColor.white
        
        return inputLabel
    }
    
    func setAutoScrollToBottom() {
        formulaListscrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: formulaListscrollView.contentSize.height - formulaListscrollView.bounds.height + formulaListscrollView.contentInset.bottom)
        if bottomOffset.y > 0 {
            formulaListscrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
}
