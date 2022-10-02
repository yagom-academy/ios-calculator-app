//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainOperandLabel: UILabel!
    @IBOutlet weak var mainOperatorLabel: UILabel!
    @IBOutlet weak var formulaHistoryView: UIStackView!
    var operandLabelText: String = ""
    var partialFormula: String = ""
    var formula: Formula = ExpressionParser.parse(from: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainOperandLabel.text = (mainOperandLabel.text ?? "").applyNumberFormatterInMainLabel()
    }
    
    @IBAction func touchUpFormulaButton(_ sender: UIButton) {
        guard isOnlyZeroAtMainFormulaView(sender) else {
            updateFormulaType()
            addStackViewInScrollView()
            updateMainFormulaView(sender)
            return
        }
    }
    
    func isOnlyZeroAtMainFormulaView(_ sender: UIButton) -> Bool {
        guard let operandText = mainOperandLabel.text,
              operandText != "0" else {
            mainOperatorLabel.text = sender.currentTitle ?? ""
            return true
        }
        return false
    }
    
    func updateFormulaType() {
        let operatorValue: String = mainOperatorLabel.text.operatorRawValue
        let operandValue: String = mainOperandLabel.text.removeComma()
        
        partialFormula += operatorValue + operandValue
        formula = ExpressionParser.parse(from: partialFormula)
    }
    
    func updateMainFormulaView(_ sender: UIButton) {
        mainOperandLabel.text = "0"
        mainOperatorLabel.text = sender.currentTitle ?? ""
    }
    
    func addStackViewInScrollView() {
        let stackView: UIStackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        let operandLabel: UILabel = UILabel()
        operandLabel.text = mainOperandLabel.text?.applyNumberFormatterInFormulaHistoryView()
        operandLabel.textColor = .white
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        let operatorLabel: UILabel = UILabel()
        operatorLabel.text = mainOperatorLabel.text
        operatorLabel.textColor = .white
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        [operatorLabel, operandLabel].map { stackView.addArrangedSubview($0) }
        
        formulaHistoryView.addArrangedSubview(stackView)
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        mainOperandLabel.text = "0"
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        operandLabelText = mainOperandLabel.text.removeComma()
        
        guard operandLabelText != "0" else {
            mainOperandLabel.text = sender.tag.description
            return
        }
        
        mainOperandLabel.text = (operandLabelText + sender.tag.description).applyNumberFormatterInMainLabel()
        // 20자리가 넘어가는 경우, alert 띄우기
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        operandLabelText = mainOperandLabel.text.removeComma()
        
        guard operandLabelText.count == 1,
              operandLabelText.last == "0" else {
            mainOperandLabel.text = (operandLabelText + "0").applyNumberFormatterInMainLabel()
            return
        }
    }
    
    @IBAction func touchUpZeroZeroButton(_ sender: UIButton) {
        operandLabelText = mainOperandLabel.text.removeComma()
        
        guard operandLabelText.count == 1,
              operandLabelText.last == "0" else {
            mainOperandLabel.text = (operandLabelText + "00").applyNumberFormatterInMainLabel()
            return
        }
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        operandLabelText = mainOperandLabel.text.removeComma()
        
        guard operandLabelText != ".",
              operandLabelText.contains(".") == false else {
            return
        }
        mainOperandLabel.text = operandLabelText.applyNumberFormatterInMainLabel() + "."
    }
}

