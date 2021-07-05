//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var notationUILabel: UILabel!
    @IBOutlet weak var notaionStackView: UIStackView!
    @IBOutlet weak var signUILabel: UILabel!
    
    var notations: [String] = []
    var inputNotation: String = ""
    var resultNotation: String = ""
    var minusFlag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
    
    func resetNotation() {
        self.inputNotation = ""
        self.minusFlag = false
    }
    
    func resetExceptStackView() {
        self.notations = []
        resetNotation()
        updateSignUILabel(labelText: "")
    }
    
    func resetCalculator() {
        resetExceptStackView()
        resetNotationStackView()
        self.resultNotation = ""
    }
    
    func resetNotationStackView() {
        for view in notaionStackView.subviews {
            view.removeFromSuperview()
        }
    }

    func updateNotationLabel() {
        guard let notationText = CalculatorManager.getTextToBeDrawnToUILabel(notation: inputNotation, isMinus: minusFlag) else {
            return
        }
        notationUILabel.text = notationText
    }
    
    func updateSignUILabel(labelText: String) {
        signUILabel.text = labelText
    }
    
    func addNotaionStackViewItem(operatorText: String, operandText: String) {
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        
        operatorLabel.text = ("\(operatorText)  ")
        operandLabel.text = operandText
        operatorLabel.textColor = .white
        operandLabel.textColor = .white
        
        let arrangedStackViewLabels: [UIView] = [operatorLabel, operandLabel]
        let stackViewItem: UIStackView = UIStackView(arrangedSubviews: arrangedStackViewLabels)
        notaionStackView.addArrangedSubview(stackViewItem)
    }
    
    @IBAction func touchUpPlusMinusButton(_ sender: UIButton) {
        minusFlag.toggle()
        updateNotationLabel()
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let operandButtonNumber = sender.titleLabel?.text, !CalculatorManager.checkZeroButtonIsPressedInInitalValue(notation: inputNotation, buttonText: operandButtonNumber) else {
            return
        }
        
        if notations.isEmpty && CalculatorManager.isInitialValue(notation: inputNotation) {
            resetNotationStackView()
        }
        
        inputNotation = "\(inputNotation)\(operandButtonNumber)"
        updateNotationLabel()
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        
        guard let operatorText = sender.titleLabel?.text else {
            return
        }
        
        let operatorCase = CalculatorManager.changeMultipleAndDivideText(operatorText: operatorText)
        
        if notations.isEmpty && CalculatorManager.isInitialValue(notation: inputNotation) {
            guard resultNotation == "" else {
                return
            }
            resetNotationStackView()
            inputNotation = "0"
        }
        
        if CalculatorManager.isInitialValue(notation: inputNotation) {
            notations.removeLast()
            notations.append(operatorCase)
        } else {
            let signedNotion = CalculatorManager.applyNotationSign(notation: inputNotation, isMinus: minusFlag)
            let removedZeroNotion = CalculatorManager.removeZerosAfterDecimal(notation: signedNotion)
            
            addNotaionStackViewItem(operatorText: notations.last ?? "", operandText: removedZeroNotion)
            
            notations.append(removedZeroNotion)
            notations.append(operatorCase)
        }
        
        let labelText = CalculatorManager.restoreMultipleAndDivide(operatorText: operatorText)
        updateSignUILabel(labelText: labelText)
        
        resetNotation()
        updateNotationLabel()
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        guard let dotButtonText = sender.titleLabel?.text,
              !CalculatorManager.hasAlreadyDot(notation: inputNotation) else {
            return
        }
        
        inputNotation = "\(CalculatorManager.pasteZeroInFrontOfDot(notation: inputNotation))\(dotButtonText)"
        
        updateNotationLabel()
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        let infix = CalculatorManager.getFinalInfixResult(validNotation: inputNotation, notations: notations)
        let calculator = Calculator()
        let result = calculator.runCalculator(on: infix)
        
        if case .success(let resultValue) = result {
            addNotaionStackViewItem(operatorText: notations.last ?? "", operandText: inputNotation)
            inputNotation = String(resultValue)
            resultNotation = inputNotation
        } else if case .failure(let errorCase) = result {
            switch errorCase {
            case .dividedByZero:
                inputNotation = "NaN"
            case .stackError:
                inputNotation = "Error"
            case .unknownError:
                inputNotation = "System Error"
            }
        }
        
        updateNotationLabel()
        resetExceptStackView()
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        resetCalculator()
        updateNotationLabel()
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        resetNotation()
        updateNotationLabel()
    }
}

