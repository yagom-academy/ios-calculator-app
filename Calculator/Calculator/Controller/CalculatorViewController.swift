//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak private var inputNumberLabel: UILabel!
    @IBOutlet weak private var inputOperatorLabel: UILabel!
    @IBOutlet weak private var formulaListStackView: UIStackView!
    @IBOutlet weak private var formulaListScrollView: UIScrollView!
    
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
        clearFormula()
    }
    
    @IBAction private func tapNumbersButton(_ sender: UIButton) {
        guard let inputNumberText = sender.titleLabel?.text,
              let currentNumberLabelText = inputNumberLabel.text,
              isComputable,
              currentNumberLabelText.count < 19 else { return }
        
        let numberLabelTextWithoutComma = currentNumberLabelText.replacingOccurrences(of: CalculatorNamespace.comma,
                                                                               with: CalculatorNamespace.empty)
        
        if currentNumberLabelText == CalculatorNamespace.zero {
            inputNumberLabel.text = inputNumberText
        } else {
            let resultNumberText = numberLabelTextWithoutComma + inputNumberText
            let doubleNumberText = Double(resultNumberText)
            inputNumberLabel.text = calculatorNumberFormatter.string(for: doubleNumberText)
        }
    }
    
    @IBAction private func tapSerialZeroButton(_ sender: UIButton) {
        guard let inputNumberText = sender.titleLabel?.text,
              let currentNumberLabelText = inputNumberLabel.text else { return }
        
        let numberLabelTextWithoutComma = currentNumberLabelText.replacingOccurrences(of: CalculatorNamespace.comma,
                                                                               with: CalculatorNamespace.empty)
        
        if currentNumberLabelText.count < 19 {
            let formattedNumberText = Double(numberLabelTextWithoutComma + inputNumberText)
            if currentNumberLabelText == CalculatorNamespace.zero {
                inputNumberLabel.text = CalculatorNamespace.zero
            } else {
                inputNumberLabel.text = calculatorNumberFormatter.string(for: formattedNumberText)
            }
        }
    }
    
    @IBAction private func tapDotButton(_ sender: UIButton) {
        guard let currentNumberLabelText = inputNumberLabel.text else { return }
        guard !currentNumberLabelText.contains(CalculatorNamespace.dot) else { return }
        
        inputNumberLabel.text = currentNumberLabelText + CalculatorNamespace.dot
    }
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        guard let inputOperatorText = sender.titleLabel?.text else { return }
        
        addFomulaStackViewWithoutZero(inputOperatorText)
    }
    
    @IBAction private func tapSignChangeButton(_ sender: UIButton) {
        guard let currentNumberLabelText = inputNumberLabel.text,
              currentNumberLabelText != CalculatorNamespace.zero else { return }
        
        if currentNumberLabelText.hasPrefix(CalculatorNamespace.minus) {
            inputNumberLabel.text = String(currentNumberLabelText.dropFirst(1))
        } else {
            inputNumberLabel.text = CalculatorNamespace.minus + currentNumberLabelText
        }
    }
    
    @IBAction private func tapEqualMarkButton(_ sender: UIButton) {
        guard isComputable else { return }
        guard let inputOperatorText = sender.titleLabel?.text else { return }
        
        addFomulaStackViewWithoutZero(inputOperatorText)
        
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
    
    @IBAction private func tapAllClearButton(_ sender: UIButton) {
        clearFormula()
        isComputable = true
        formulaString = CalculatorNamespace.empty
    }
    
    @IBAction private func tapClearEntryButton(_ sender: UIButton) {
        isComputable = true
        inputNumberLabel.text = CalculatorNamespace.zero
    }
}

extension CalculatorViewController {
    private func makeStackView() -> UIStackView {
        let formulaStackView: UIStackView = UIStackView()
        
        formulaStackView.axis = .horizontal
        formulaStackView.spacing = 8
        
        return formulaStackView
    }
    
    private func makeLabelInStackView(_ input: String) -> UILabel {
        let inputLabel: UILabel = UILabel()
        
        inputLabel.text = input
        inputLabel.textColor = UIColor.white
        
        return inputLabel
    }
    
    private func setAutoScrollToBottom() {
        formulaListScrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0,
                                   y: formulaListScrollView.contentSize.height - formulaListScrollView.bounds.height)
        if bottomOffset.y > 0 {
            formulaListScrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
    
    private func addFormulaStackView(_ inputOperatorText: String) {
        guard let currentNumberLabelText = inputNumberLabel.text,
              let operatorLabelText = inputOperatorLabel.text else { return }
        
        let formulaStackView = makeStackView()
        let operatorLabel = makeLabelInStackView(operatorLabelText)
        let formattedNumberText = currentNumberLabelText.hasSuffix(CalculatorNamespace.dot) ? String(currentNumberLabelText.dropLast(1)) : currentNumberLabelText
        let numberLabel = makeLabelInStackView(formattedNumberText)
        
        formulaStackView.addArrangedSubview(operatorLabel)
        formulaStackView.addArrangedSubview(numberLabel)
        formulaListStackView.addArrangedSubview(formulaStackView)
        
        formulaString += operatorLabelText + currentNumberLabelText
        
        inputOperatorLabel.text = inputOperatorText
        inputNumberLabel.text = CalculatorNamespace.zero
        
        setAutoScrollToBottom()
    }
    
    private func clearFormula() {
        inputNumberLabel.text = CalculatorNamespace.zero
        inputOperatorLabel.text = CalculatorNamespace.empty
        formulaListStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    private func addFomulaStackViewWithoutZero(_ inputOperatorText: String) {
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
}

extension CalculatorViewController {
    private enum CalculatorNamespace {
        static let empty: String = ""
        static let zero: String = "0"
        static let naN: String = "NaN"
        static let minus: String = "-"
        static let doubleZero: String = "00"
        static let dot: String = "."
        static let equal: String = "="
        static let comma: String = ","
    }
    
    private enum AlertText {
        static let errorTitle: String =  "계산 오류입니다."
        static let errorMessage: String = "확인 버튼을 눌러주시기 바랍니다."
        static let errorConfirm: String = "확인"
    }
}
