//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class CalculateViewController: UIViewController {
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var currentFormulaStackView: UIStackView!
    @IBOutlet weak var currentFormulaScrollView: UIScrollView!
    
    private var formulasUntilNow = ""
    private var isZeroButtonUsed = true
    private var isCalculated = false
    private let formManager = FormManager()
    
    private var currentFormula: String {
        guard let numberText = currentOperandLabel.text,
              let operatorText = currentOperatorLabel.text else {
            return "NaN"
        }
        let operandText = formManager.transformResult(from: (numberText)).replacingOccurrences(of: ",", with: "")
        
        return "\(operatorText) \(operandText) "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeOperandLabel()
        initializeOperatorLabel()
    }
    
    //MARK: - IBAction
    
    @IBAction func tappedOperandsButton(_ sender: UIButton) {
        guard let number = sender.currentTitle,
              let operandLabelText = currentOperandLabel.text,
              isCalculated == false,
              (operandLabelText + number).count <= 20 else {
            return
        }
        
        if operandLabelText == "0" {
            currentOperandLabel.text = number
        } else {
            currentOperandLabel.text = formManager.transformResult(from: operandLabelText + number)
        }
    }
    
    @IBAction func tappedDotButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText.contains(".") == false,
              isCalculated == false else {
            return
        }
        
        currentOperandLabel.text = operandLabelText + "."
    }
    
    @IBAction func tappedZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" else {
            currentOperandLabel.text = "0"
            isZeroButtonUsed = true
            return
        }
        
        guard (operandLabelText + "0").count <= 20,
              isCalculated == false else {
            return
        }
        
        currentOperandLabel.text = formManager.transformResult(from: (operandLabelText + "0"))
    }
    
    @IBAction func tappedDoubleZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" else {
            currentOperandLabel.text = "0"
            isZeroButtonUsed = true
            return
        }
        
        guard (operandLabelText + "00").count <= 20,
              isCalculated == false else {
            return
        }
        
        currentOperandLabel.text = formManager.transformResult(from: (operandLabelText + "00"))
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" ||  isZeroButtonUsed else {
            currentOperatorLabel.text = sender.currentTitle
            return
        }
        
        addCurrentFormula()
        currentOperatorLabel.text = sender.currentTitle
        
        isCalculated = false
        isZeroButtonUsed = false
        initializeOperandLabel()
    }
    
    @IBAction func tappedResultButton(_ sender: UIButton) {
        guard isCalculated == false,
              formulasUntilNow.isEmpty == false else {
            return
        }
        
        addCurrentFormula()
        
        var formula = ExpressionParser.parse(from: formulasUntilNow)
        
        currentOperandLabel.text = formManager.transformResult(from: String(formula.result()))
        formulasUntilNow.removeAll()
        
        isCalculated = true
        isZeroButtonUsed = true
        initializeOperatorLabel()
    }
    
    @IBAction func tappedChangeSignButton(_ sender: UIButton) {
        guard var operandLabelText = currentOperandLabel.text,
              operandLabelText != "0",
              isCalculated == false else {
            return
        }
        
        if operandLabelText.contains("-") {
            operandLabelText = operandLabelText.replacingOccurrences(of: "-", with: "")
        } else {
            operandLabelText = "-" + operandLabelText
        }

        currentOperandLabel.text = operandLabelText
    }
    
    @IBAction func tappedClearButton(_ sender: UIButton) {
        if formulasUntilNow.isEmpty {
            isZeroButtonUsed = true
        } else {
            isZeroButtonUsed = false
        }
        
        isCalculated = false
        initializeOperandLabel()
    }
    
    @IBAction func tappedAllClearButton(_ sender: UIButton) {
        currentFormulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        isCalculated = false
        isZeroButtonUsed = true
        initializeOperandLabel()
        initializeOperatorLabel()
    }
    
    // MARK: - Methods
    
    private func initializeOperandLabel() {
        currentOperandLabel.text = "0"
    }
    
    private func initializeOperatorLabel() {
        currentOperatorLabel.text = ""
    }
    
    private func addCurrentFormula() {
        guard let operatorString = currentOperatorLabel.text,
              let operandString = currentOperandLabel.text else {
            return
        }
        
        formulasUntilNow.append(currentFormula)
        setCurrentFormulaViewOnScroll(operatorString, formManager.transformResult(from: operandString))
    }
}

extension CalculateViewController {
    private func makeCurrentFormulaLabelStackView(_ `operator`: String, _ operand: String) -> UIStackView {
        let operatorLabel: UILabel = {
            let label = UILabel()
            
            label.text = `operator`
            label.font = .preferredFont(forTextStyle: .title2)
            label.textColor = .white
            
            return label
        }()
        
        let operandLabel: UILabel = {
            let label = UILabel()
            
            label.text = operand
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
    
    private func setCurrentFormulaViewOnScroll(_ `operator`: String, _ operand: String) {
        currentFormulaStackView.addArrangedSubview(makeCurrentFormulaLabelStackView(`operator`, operand))
        
        currentFormulaScrollView.layoutIfNeeded()
        currentFormulaScrollView.setContentOffset(CGPoint(x: 0, y: currentFormulaScrollView.contentSize.height - currentFormulaScrollView.bounds.height), animated: true)
    }
}
