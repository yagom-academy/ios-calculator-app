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
    
    private var formulaString: String = CalculatorNamespace.empty
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
        inputNumberLabel.text = CalculatorNamespace.zero
        inputOperatorLabel.text = CalculatorNamespace.empty
        formulaListStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    @IBAction func tapNumbersButton(_ sender: UIButton) {
        guard let inputNumberText = sender.titleLabel?.text,
              let numberLabelText = inputNumberLabel.text else { return }
        
        let numberLabelTextWithoutComma = numberLabelText.replacingOccurrences(of: CalculatorNamespace.comma,
                                                                               with: CalculatorNamespace.empty)
        
        if isComputable, numberLabelText.count < 19 {
            if numberLabelText == CalculatorNamespace.zero {
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
        
        let numberLabelTextWithoutComma = numberLabelText.replacingOccurrences(of: CalculatorNamespace.comma,
                                                                               with: CalculatorNamespace.empty)
        
        if numberLabelText.count < 19 {
            let formattedNumberText = Double(numberLabelTextWithoutComma + inputNumberText)
            if numberLabelText == CalculatorNamespace.zero {
                inputNumberLabel.text = CalculatorNamespace.zero
            } else {
                inputNumberLabel.text = calculatorNumberFormatter.string(for: formattedNumberText)
            }
        }
    }
    
    @IBAction func tapPeriodButton(_ sender: UIButton) {
        let period = CalculatorNamespace.period
        guard let numberLabelText = inputNumberLabel.text else { return }
        
        inputNumberLabel.text = numberLabelText.contains(period) ? numberLabelText : numberLabelText + period
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard let inputOperatorText = sender.titleLabel?.text else { return }
        
        if inputNumberLabel.text == CalculatorNamespace.zero {
            inputOperatorLabel.text = inputOperatorText
        } else {
            addFormulaStackView(inputOperatorText)
        }
        
        if inputOperatorText == CalculatorNamespace.equal {
            inputOperatorLabel.text = CalculatorNamespace.empty
        }
        
        isComputable = true
    }
    
    @IBAction func tapChangeSignButton(_ sender: UIButton) {
        let minusSign = CalculatorNamespace.minus
        guard let numberLabelText = inputNumberLabel.text,
              numberLabelText != CalculatorNamespace.zero else { return }
        
        if numberLabelText.hasPrefix(minusSign) {
            inputNumberLabel.text = String(numberLabelText.dropFirst(1))
        } else {
            inputNumberLabel.text = minusSign + numberLabelText
        }
    }
    
    @IBAction func tapEqualMarkButton(_ sender: UIButton) {
        guard isComputable else { return }
        
        tapOperatorButton(sender)
        var calculateResult = ExpressionParser.parse(from: formulaString)
        
        do {
            let formula = try calculateResult.result()
            let formulaResult = calculatorNumberFormatter.string(for: formula)
            inputNumberLabel.text = formulaResult
            
            isComputable = false
            formulaString = CalculatorNamespace.empty
        } catch CalculatorError.dividedByZero {
            inputNumberLabel.text = CalculatorNamespace.naN
            isComputable = false
        } catch {
            let alert = UIAlertController(title: AlertText.errorTitle,
                                          message: AlertText.errorMessage,
                                          preferredStyle: .alert)
            let cancel = UIAlertAction(title: AlertText.errorConfirm,
                                       style: .default)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
    }
    
    @IBAction func tapAllClearButton(_ sender: UIButton) {
        inputOperatorLabel.text = CalculatorNamespace.empty
        inputNumberLabel.text = CalculatorNamespace.zero
        formulaListStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
        isComputable = true
        formulaString = CalculatorNamespace.empty
    }
    
    @IBAction func tapClearEntryButton(_ sender: UIButton) {
        isComputable = true
        inputNumberLabel.text = CalculatorNamespace.zero
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
    
    func addFormulaStackView(_ inputOperatorText: String) {
        guard let numberLabelText = inputNumberLabel.text,
              let operatorLabelText = inputOperatorLabel.text else { return }
        
        let formulaStackView = makeStackView()
        let operatorLabel = makeLabelInStackView(operatorLabelText)
        let formattedNumberText = numberLabelText.hasSuffix(CalculatorNamespace.period) ? String(numberLabelText.dropLast(1)) : numberLabelText
        let numberLabel = makeLabelInStackView(formattedNumberText)
        
        formulaStackView.addArrangedSubview(operatorLabel)
        formulaStackView.addArrangedSubview(numberLabel)
        formulaListStackView.addArrangedSubview(formulaStackView)
        
        formulaString += operatorLabelText + numberLabelText
        
        inputOperatorLabel.text = inputOperatorText
        inputNumberLabel.text = CalculatorNamespace.zero
        
        setAutoScrollToBottom()
    }
}

extension CalculatorViewController {
    private enum CalculatorNamespace {
        static let empty: String = ""
        static let zero: String = "0"
        static let naN: String = "NaN"
        static let minus: String = "-"
        static let doubleZero: String = "00"
        static let period: String = "."
        static let equal: String = "="
        static let comma: String = ","
    }
    
    private enum AlertText {
        static let errorTitle: String =  "계산 오류입니다."
        static let errorMessage: String = "확인 버튼을 눌러주시기 바랍니다."
        static let errorConfirm: String = "확인"
    }
}
