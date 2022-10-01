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
    @IBOutlet weak var addButton: UIButton!
    var operandLabelText: String = ""
    var partialFormula: String = ""
    var formula: Formula = ExpressionParser.parse(from: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainOperandLabel.text = (mainOperandLabel.text ?? "").applyNumberFormatter()
    }
    
    @IBAction func touchUpAddButton(_ sender: UIButton) {
        guard let operandText = mainOperandLabel.text,
              operandText != "0" else {
            return
        }
        
        sender.accessibilityLabel = "+"
        let operatorText = sender.accessibilityLabel ?? ""
        partialFormula += removeComma(operandText) + operatorText
        formula = ExpressionParser.parse(from: partialFormula)
        addStackViewInScrollView()
        mainOperandLabel.text = "0"
        mainOperatorLabel.text = operatorText
    }
    
    func addStackViewInScrollView() {
        let stackView: UIStackView = UIStackView(frame: CGRect())
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        
        let operandLabel: UILabel = UILabel()
        let operatorLabel: UILabel = UILabel()
        operandLabel.text = mainOperandLabel.text
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

