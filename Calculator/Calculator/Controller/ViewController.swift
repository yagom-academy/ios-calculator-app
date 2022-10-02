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
        updateFormulaView(sender)
    }
    
    func updateFormulaView(_ sender: UIButton) {
        guard let operandText = mainOperandLabel.text,
              operandText != "0" else {
            mainOperatorLabel.text = sender.currentTitle ?? ""
            return
        }
        
        let operatorText = sender.operatorRawValue
        partialFormula += operandText.removeComma() + operatorText
        formula = ExpressionParser.parse(from: partialFormula)
        addStackViewInScrollView()
        mainOperandLabel.text = "0"
        mainOperatorLabel.text = sender.currentTitle ?? ""
    }
    
    func addStackViewInScrollView() {
        let stackView: UIStackView = UIStackView(frame: CGRect())
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        let operandLabel: UILabel = UILabel()
        let operatorLabel: UILabel = UILabel()
        operandLabel.text = mainOperandLabel.text?.applyNumberFormatterInFormulaHistoryView()
        operandLabel.textColor = .white
        operandLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.text = mainOperatorLabel.text
        operatorLabel.textColor = .white
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        [operatorLabel, operandLabel].map {
                stackView.addArrangedSubview($0)
            }
        
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

