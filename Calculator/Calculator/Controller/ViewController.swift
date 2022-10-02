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
        mainOperandLabel.text = (mainOperandLabel.text ?? "").applyNumberFormatterAtMainLabel()
    }
    
    //MARK: - NumberPad 메서드
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        operandLabelText = mainOperandLabel.text.removeComma()
        
        guard operandLabelText != "0" else {
            mainOperandLabel.text = sender.tag.description
            return
        }
        
        mainOperandLabel.text = (operandLabelText + sender.tag.description).applyNumberFormatterAtMainLabel()
        // 20자리가 넘어가는 경우, alert 띄우기
    }
    
    @IBAction func touchUpZeroButton(_ sender: UIButton) {
        operandLabelText = mainOperandLabel.text.removeComma()
        
        guard operandLabelText.count == 1,
              operandLabelText.last == "0" else {
            mainOperandLabel.text = (operandLabelText + "0").applyNumberFormatterAtMainLabel()
            return
        }
    }
    
    @IBAction func touchUpZeroZeroButton(_ sender: UIButton) {
        operandLabelText = mainOperandLabel.text.removeComma()
        
        guard operandLabelText.count == 1,
              operandLabelText.last == "0" else {
            mainOperandLabel.text = (operandLabelText + "00").applyNumberFormatterAtMainLabel()
            return
        }
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        operandLabelText = mainOperandLabel.text.removeComma()
        
        guard operandLabelText != ".",
              operandLabelText.contains(".") == false else {
            return
        }
        mainOperandLabel.text = operandLabelText.applyNumberFormatterAtMainLabel() + "."
    }
    
    //MARK: - 사칙연산 메서드
    @IBAction func touchUpFormulaButton(_ sender: UIButton) {
        guard isOnlyZeroAtMainFormulaView() else {
            updateFormulaType()
            addStackViewInformulaHistoryView()
            updateMainFormulaView(sender)
            return
        }
        mainOperatorLabel.text = sender.currentTitle ?? ""
    }
    
    func isOnlyZeroAtMainFormulaView() -> Bool {
        guard let operandText = mainOperandLabel.text,
              operandText != "0" else {
            return true
        }
        return false
    }
    
    func updateFormulaType() {
        let operatorValue: String = mainOperatorLabel.rawValueByOperatorLabelText
        let operandValue: String = mainOperandLabel.text.removeComma()
        
        partialFormula += operatorValue + " " + operandValue + " "
        formula = ExpressionParser.parse(from: partialFormula)
    }
    
    func addStackViewInformulaHistoryView() {
        let stackView: UIStackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        let operandLabel: UILabel = UILabel()
        operandLabel.text = mainOperandLabel.text?.applyNumberFormatterAtFormulaHistoryView()
        
        let operatorLabel: UILabel = UILabel()
        operatorLabel.text = mainOperatorLabel.text
        
        [operatorLabel, operandLabel].forEach {
            $0.textColor = .white
            $0.font = UIFont.preferredFont(forTextStyle: .title3)
            stackView.addArrangedSubview($0)
        }
        
        formulaHistoryView.addArrangedSubview(stackView)
    }
    
    func updateMainFormulaView(_ sender: UIButton) {
        mainOperandLabel.text = "0"
        mainOperatorLabel.text = sender.currentTitle ?? ""
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
    }
    
    // MARK: - 기능 메서드
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        mainOperandLabel.text = "0"
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        deleteStackViewInScrollView()
        resetMainLabelText()
        resetFormulaType()
    }
    
    func deleteStackViewInScrollView() {
        formulaHistoryView.subviews.forEach {
            $0.isHidden = true
        }
    }
    
    func resetMainLabelText() {
        mainOperatorLabel.text = ""
        mainOperandLabel.text = "0"
    }
    
    func resetFormulaType() {
        partialFormula = ""
        formula.operands.removeAll()
        formula.operators.removeAll()
    }
    
    @IBAction func touchUpSignButton(_ sender: UIButton) {
        guard let operandLabelText = mainOperandLabel.text,
        operandLabelText != "0" else {
            return
        }
        
        operandLabelText.contains("-") ?
        (mainOperandLabel.text = operandLabelText.split(with: "-").joined()) :
        (mainOperandLabel.text = "-" + operandLabelText)
    }
}
