//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var currentFormulaStackView: UIStackView!
    @IBOutlet weak var currentFormulaScrollView: UIScrollView!
    private var formulasUntilNow = [String]()
    private var didZeroButtonTapped = true
    private var isCurrentOperandLabelMadeFromResult = false
    private var canTapDotButton = true
    private var isInitializeCurrentOperandLabel = false {
        didSet {
            if isInitializeCurrentOperandLabel {
                currentOperandLabel.text = "0"
            }
        }
    }
    private var isInitializeCurrentOperatorLabel = false {
        didSet {
            if isInitializeCurrentOperatorLabel {
                currentOperatorLabel.text = ""
            }
        }
    }

    private var currentFormula: String {
        guard let numberText = currentOperandLabel.text,
              let operatorText = currentOperatorLabel.text else {
            return "NaN"
        }
        
        return "\(operatorText) \(checkOperandForm(numberText).filter { $0 != "," }) "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isInitializeCurrentOperandLabel = true
        isInitializeCurrentOperatorLabel = true
    }
    
    //MARK: - 버튼 눌릴 때
    @IBAction func tappedOperandsButton(_ sender: UIButton) {
        guard let number = sender.currentTitle,
              let operandLabelText = currentOperandLabel.text,
              isCurrentOperandLabelMadeFromResult == false,
              checkOperandForm(operandLabelText + number) != "error" else {
            return
        }
        
        if operandLabelText == "0" {
            currentOperandLabel.text = number
        } else {
            currentOperandLabel.text = operandLabelText + number
        }
    }
    
    @IBAction func tappedDotButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              canTapDotButton == true,
              isCurrentOperandLabelMadeFromResult == false else {
            return
        }
        
        currentOperandLabel.text = operandLabelText + "."
        canTapDotButton = false
    }
    
    @IBAction func tappedZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" else {
            currentOperandLabel.text = "0"
            didZeroButtonTapped = true
            return
        }
        
        guard checkOperandForm(operandLabelText + "0") != "error",
              isCurrentOperandLabelMadeFromResult == false else {
            return
        }
        
        currentOperandLabel.text = operandLabelText + "0"
    }
    
    @IBAction func tappedDoubleZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" else {
            currentOperandLabel.text = "0"
            didZeroButtonTapped = true
            return
        }
        
        guard checkOperandForm(operandLabelText + "00") != "error",
              isCurrentOperandLabelMadeFromResult == false else {
            return
        }
        
        currentOperandLabel.text = operandLabelText + "00"
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" ||  didZeroButtonTapped else {
            currentOperatorLabel.text = sender.currentTitle
            return
        }
        
        guard checkOperandForm(operandLabelText) != "error" else {
            return
        }
        
        addCurrentFormula()
        currentOperatorLabel.text = sender.currentTitle
        
        isCurrentOperandLabelMadeFromResult = false
        didZeroButtonTapped = false
        canTapDotButton = true
        isInitializeCurrentOperandLabel = true
    }
    
    @IBAction func tappedResultButton(_ sender: Any) {
        guard isCurrentOperandLabelMadeFromResult == false,
              formulasUntilNow.isEmpty == false else {
            return
        }
        
        addCurrentFormula()
        
        var formula = ExpressionParser.parse(from: formulasUntilNow.joined())
        let result = formula.result()
        
        currentOperandLabel.text = result.formatNumber()
        formulasUntilNow.removeAll()
        
        isCurrentOperandLabelMadeFromResult = true
        didZeroButtonTapped = true
        canTapDotButton = true
        isInitializeCurrentOperatorLabel = true
    }
    
    @IBAction func tappedChangeSignButton(_ sender: Any) {
        guard var operandLabelText = currentOperandLabel.text,
              operandLabelText != "0",
              checkOperandForm(operandLabelText) != "error" else {
            return
        }
        
        if operandLabelText.contains("-") {
            operandLabelText = operandLabelText.filter{ $0 != "-" }
        } else {
            operandLabelText = "-" + operandLabelText
        }

        currentOperandLabel.text = operandLabelText
    }
    
    @IBAction func tappedClearButton(_ sender: Any) {
        if formulasUntilNow.isEmpty {
            didZeroButtonTapped = true
        } else {
            didZeroButtonTapped = false
        }
        isCurrentOperandLabelMadeFromResult = false
        canTapDotButton = true
        isInitializeCurrentOperandLabel = true
    }
    
    @IBAction func tappedAllClearButton(_ sender: Any) {
        currentFormulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        isCurrentOperandLabelMadeFromResult = false
        didZeroButtonTapped = true
        canTapDotButton = true
        isInitializeCurrentOperandLabel = true
        isInitializeCurrentOperatorLabel = true
    }

    private func addCurrentFormula() {
        guard let operatorString = currentOperatorLabel.text,
              let operandString = currentOperandLabel.text else {
            return
        }

        formulasUntilNow.append(currentFormula)
        setCurrentFormulaViewOnScroll(operatorString, checkOperandForm(operandString))
    }
    
    private func checkOperandForm(_ input: String) -> String {
        guard let number = Double(input.filter { $0 != "," })?.formatNumber(),
              input.count <= 20 else {
            return "error"
        }
        
        return number
    }
}

extension CalculateViewController {
    func makeCurrentFormulaLabelStackView(_ `operator`: String, _ operand: String) -> UIStackView {
        let operatorLabel: UILabel = {
            let label = UILabel()
            
            label.text = `operator`
            label.textColor = .white
            
            return label
        }()
        
        let operandLabel: UILabel = {
            let label = UILabel()
            
            label.text = operand.filter { $0 != "," }
            label.font = .preferredFont(forTextStyle: .title2)
            label.textColor = .white
            
            return label
        }()
        
        let subStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [operatorLabel,operandLabel])
            
            stackView.spacing = 8
            stackView.alignment = .bottom
            
            return stackView
        }()
        
        return subStackView
    }
    
    func setCurrentFormulaViewOnScroll(_ `operator`: String, _ operand: String) {
        currentFormulaStackView.addArrangedSubview(makeCurrentFormulaLabelStackView(`operator`, operand))
        
        currentFormulaScrollView.layoutIfNeeded()
        currentFormulaScrollView.setContentOffset(CGPoint(x: 0, y: currentFormulaScrollView.contentSize.height - currentFormulaScrollView.bounds.height), animated: true)
    }
}
