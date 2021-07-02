//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var notationUILabel: UILabel!
    @IBOutlet weak var notaionStackView: UIStackView!
    
    var notations: [String] = []
    var inputNotation: String = ""
    var minusFlag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetCalculator()
    }
    
    func resetNotation() {
        self.inputNotation = ""
        self.minusFlag = false
    }
    
    func resetCalculator() {
        self.notations = []
        resetNotation()
    }

    func updateLabel() {
        print(inputNotation)
        print(notations)
        guard let notationText = CalculatorManager.getTextToBeDrawnToUILabel(notation: inputNotation, isMinus: minusFlag) else {
            return
        }
        notationUILabel.text = notationText
    }
    
    func addNotaionStackViewItem(operatorText: String, operandText: String) {
        let operatorLabel = UILabel()
        let operandLabel = UILabel()
        
        operatorLabel.text = operatorText
        operandLabel.text = operandText
        operatorLabel.textColor = .white
        operandLabel.textColor = .white
        
        let arrangedStackViewLabels: [UIView] = [operatorLabel, operandLabel]
        let stackViewItem: UIStackView = UIStackView(arrangedSubviews: arrangedStackViewLabels)
        notaionStackView.addArrangedSubview(stackViewItem)
    }
    
    @IBAction func touchUpPlusMinusButton(_ sender: UIButton) {
        minusFlag.toggle()
        updateLabel()
    }
    
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let operandButtonNumber = sender.titleLabel?.text, !CalculatorManager.checkZeroButtonIsPressedInInitalValue(notation: inputNotation, buttonText: operandButtonNumber) else {
            return
        }
        
        inputNotation = "\(inputNotation)\(operandButtonNumber)"
        updateLabel()
    }
    
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        
        // TODO -  현재 숫자입력이 없는 상태인 0에서는 연산자를 반복해서 누르더라도 연산이 이뤄지지 않습니다. (ok)
        guard let operatorText = sender.titleLabel?.text else {
            return
        }
        
        let operatorCase = CalculatorManager.changeMultipleAndDivideText(operatorText: operatorText)
        
        if notations.isEmpty && CalculatorManager.isInitialValue(notation: inputNotation) {
            inputNotation = "0"
        }
        
        // 현재 숫자입력이 없는 상태인 0에서는 연산자의 종류만 변경 처리하기. (ok)
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
        
        // TODO - 숫자입력 중에 연산자(÷, ×, -, +)를 누르게 되면 숫자입력을 중지하고 다음 숫자를 입력 (ok)
        resetNotation()
        updateLabel()
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        guard let dotButtonText = sender.titleLabel?.text,
              !CalculatorManager.hasAlreadyDot(notation: inputNotation) else {
            return
        }
        
        inputNotation = "\(CalculatorManager.pasteZeroInFrontOfDot(notation: inputNotation))\(dotButtonText)"
        
        updateLabel()
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        // TODO = 버튼을 눌러 연산을 마친 후 다시 =을 눌러도 이전 연산을 다시 연산하지 않습니다
        // TODO 0으로 나누기에 대해서는 결과값을 NaN으로 표기합니다
        // TODO Change Valid inputNotation
        let infix = CalculatorManager.getFinalInfixResult(validNotation: inputNotation, notations: notations)
        let calculator = Calculator()
        let result = calculator.runCalculator(on: infix)
        
        if case .success(let resultValue) = result {
            addNotaionStackViewItem(operatorText: notations.last ?? "", operandText: inputNotation)
            inputNotation = String(resultValue)
        } else if case .failure(let errorCase) = result {
            switch errorCase {
            case .dividedByZero:
                print(errorCase)
            case .stackError:
                print(errorCase)
            case .unknownError:
                print(errorCase)
            }
        }
        
        updateLabel()
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        resetCalculator()
        updateLabel()
    }
}

