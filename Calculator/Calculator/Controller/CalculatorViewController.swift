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
    
    private var formulaString: String = CalculatorNamespace.Empty
    private var isComputable: Bool = true
    
    private var calculatorNumberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 5
        numberFormatter.maximumSignificantDigits = 15
        
        return numberFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputNumberLabel.text = CalculatorNamespace.Zero
        inputOperatorLabel.text = CalculatorNamespace.Empty
        formulaListStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    @IBAction func tapNumbersButton(_ sender: UIButton) {
        guard let inputNumberText = sender.titleLabel?.text,
              let numberLabelText = inputNumberLabel.text else { return }
        
        let numberLabelTextWithoutComma = numberLabelText.replacingOccurrences(of: CalculatorNamespace.Comma,
                                                                               with: CalculatorNamespace.Empty)
        
        if isComputable, numberLabelText.count < 19 {
            if numberLabelText == CalculatorNamespace.Zero {
                inputNumberLabel.text = inputNumberText
            } else {
                let resultNumberText = numberLabelTextWithoutComma + inputNumberText
                let doubleNumberText = Double(resultNumberText)
                inputNumberLabel.text = calculatorNumberFormatter.string(for: doubleNumberText)
            }
        }
    }
    
    @IBAction func tapSerialZeroButton(_ sender: UIButton) {
        guard let inputNumberText = sender.titleLabel?.text,
              let numberLabelText = inputNumberLabel.text else { return }
        
        let numberLabelTextWithoutComma = numberLabelText.replacingOccurrences(of: CalculatorNamespace.Comma,
                                                                               with: CalculatorNamespace.Empty)
        
        if numberLabelText.count < 19 {
            let formattedNumberText = Double(numberLabelTextWithoutComma + inputNumberText)
            if numberLabelText == CalculatorNamespace.Zero {
                inputNumberLabel.text = CalculatorNamespace.Zero
            } else {
                inputNumberLabel.text = calculatorNumberFormatter.string(for: formattedNumberText)
            }
        }
    }
    
    @IBAction func tapPeriodButton(_ sender: UIButton) {
        let period = CalculatorNamespace.Period
        guard let numberLabelText = inputNumberLabel.text else { return }
        
        inputNumberLabel.text =
        (numberLabelText.contains(period)) ?
        (numberLabelText) :
        (numberLabelText + period)
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard let inputOperatorText = sender.titleLabel?.text,
              let numberLabelText = inputNumberLabel.text,
              let operatorLabelText = inputOperatorLabel.text else { return }
        
        if inputOperatorText == CalculatorNamespace.Equal && inputNumberLabel.text == CalculatorNamespace.Zero {
            formulaString += operatorLabelText + numberLabelText
        } else if inputNumberLabel.text == CalculatorNamespace.Zero {
            inputOperatorLabel.text = inputOperatorText
        } else {
            let formulaStackView = makeStackView()
            let operatorLabel = makeLabelInStackView(operatorLabelText)
            let formattedNumberText =
            numberLabelText.hasSuffix(CalculatorNamespace.Period) ?
            String(numberLabelText.dropLast(1)) :
            numberLabelText
            let numberLabel = makeLabelInStackView(formattedNumberText)
            
            formulaStackView.addArrangedSubview(operatorLabel)
            formulaStackView.addArrangedSubview(numberLabel)
            formulaListStackView.addArrangedSubview(formulaStackView)
            
            formulaString += operatorLabelText + numberLabelText
            
            inputOperatorLabel.text = inputOperatorText
            inputNumberLabel.text = CalculatorNamespace.Zero
            
            setAutoScrollToBottom()
        }
        
        if inputOperatorText == CalculatorNamespace.Equal {
            inputOperatorLabel.text = CalculatorNamespace.Empty
        }
        
        isComputable = true
    }
    
    @IBAction func tapChangeSignButton(_ sender: UIButton) {
        let minusSign = CalculatorNamespace.Minus
        guard let numberLabelText = inputNumberLabel.text,
              numberLabelText != CalculatorNamespace.Zero else { return }
        
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
                let formulaResult = calculatorNumberFormatter.string(from: Decimal(formula) as NSNumber)
                inputNumberLabel.text = formulaResult
                
                isComputable = false
                formulaString = CalculatorNamespace.Empty
            } catch CalculatorError.dividedByZero {
                inputNumberLabel.text = CalculatorNamespace.NaN
                isComputable = false
            } catch {
                let alert = UIAlertController(title: "계산 오류입니다.",
                                              message: "확인 버튼을 눌러주시기 바랍니다.",
                                              preferredStyle: .alert)
                let cancel = UIAlertAction(title: "확인",
                                           style: .default)
                alert.addAction(cancel)
                present(alert, animated: true)
            }
        }
    }
    
    @IBAction func tapAllClearButton(_ sender: UIButton) {
        inputOperatorLabel.text = CalculatorNamespace.Empty
        inputNumberLabel.text = CalculatorNamespace.Zero
        formulaListStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
        isComputable = true
        formulaString = CalculatorNamespace.Empty
    }
    
    @IBAction func tapClearEntryButton(_ sender: UIButton) {
        isComputable = true
        inputNumberLabel.text = CalculatorNamespace.Zero
    }
}

extension CalculatorViewController {
    func makeStackView() -> UIStackView {
        let formulaStackView: UIStackView = UIStackView()
        
        formulaStackView.axis = .horizontal
        formulaStackView.spacing = 8
        
        return formulaStackView
    }
    
    func makeLabelInStackView(_ input: String) -> UILabel {
        let inputLabel: UILabel = UILabel()
        
        inputLabel.text = input
        inputLabel.textColor = UIColor.white
        
        return inputLabel
    }
    
    func setAutoScrollToBottom() {
        formulaListScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0,
                                   y: formulaListScrollView.contentSize.height - formulaListScrollView.bounds.height)
        if bottomOffset.y > 0 {
            formulaListScrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
}
