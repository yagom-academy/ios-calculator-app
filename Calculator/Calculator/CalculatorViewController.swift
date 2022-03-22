//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit


class CalculatorViewController: UIViewController {
    static let zero: String = "0"
    static let empty: String = ""
    static let negativeSign: Character = "-"
    
    private var formulaNotYetCalculated: String = empty
    private var calculator: Formula = Formula()
    private var statusZeroFlag: Bool = true
    
    private var inputtingOperand: String = zero {
        didSet {
            NumberLabel.text = inputtingOperand
        }
    }
    private var inputtingOperator: String = empty {
        didSet {
            OperatorLabel.text = inputtingOperator
        }
    }
    
    private let numberFormatter = NumberFormatter()
    
    @IBOutlet var OperandButtons: [OperandButton]!
    
    @IBOutlet weak var OperandZeroButton: OperandButton!
    @IBOutlet weak var OperandCoupleZeroButton: OperandButton!
    @IBOutlet weak var OperandOneButton: OperandButton!
    @IBOutlet weak var OperandTwoButton: OperandButton!
    @IBOutlet weak var OperandThreeButton: OperandButton!
    @IBOutlet weak var OperandFourButton: OperandButton!
    @IBOutlet weak var OperandFiveButton: OperandButton!
    @IBOutlet weak var OperandSixButton: OperandButton!
    @IBOutlet weak var OperandSevenButton: OperandButton!
    @IBOutlet weak var OperandEightButton: OperandButton!
    @IBOutlet weak var OperandNineButton: OperandButton!
    @IBOutlet weak var OperandDotButton: OperandButton!
    
    
    @IBOutlet var OperatorButtons: [OperatorButton]!
    
    @IBOutlet weak var OperatorAddButton: OperatorButton!
    @IBOutlet weak var OperatorSubtractButton: OperatorButton!
    @IBOutlet weak var OperatorMultiplyButton: OperatorButton!
    @IBOutlet weak var OperatorDivideButton: OperatorButton!
    
    
    @IBOutlet weak var FuncAllClearButton: FunctionalButton!
    @IBOutlet weak var FuncClearEntryButton: FunctionalButton!
    @IBOutlet weak var FuncChangeSignButton: FunctionalButton!
    @IBOutlet weak var FuncExecuteButton: FunctionalButton!
    
  
    @IBOutlet weak var OperatorLabel: UILabel!
    @IBOutlet weak var NumberLabel: UILabel!
    
    
    public func setUpDefaultStatus() {
        clearFormula()
        setStatusZero()
        clearInputtingOperand()
        clearInputtingOperator()
    }
    
    public func clearFormula() {
        formulaNotYetCalculated = CalculatorViewController.empty
    }
    
    public func setStatusZero() {
        clearInputtingOperand()
        statusZeroFlag = true
    }
    public func clearInputtingOperand() {
        inputtingOperand = CalculatorViewController.zero
    }
    public func clearInputtingOperator() {
        inputtingOperator = CalculatorViewController.empty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpOperandButtonValue()
        setUpOpertorButtonValue()
        setUpNumberFormat()
        setUpDefaultStatus()
    }
    
    public func setUpNumberFormat() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.roundingMode = .halfUp
    }
    
    public func setUpOperandButtonValue() {
        OperandZeroButton.value = "0"
        OperandCoupleZeroButton.value = "00"
        OperandOneButton.value = "1"
        OperandTwoButton.value = "2"
        OperandThreeButton.value = "3"
        OperandFourButton.value = "4"
        OperandFiveButton.value = "5"
        OperandSixButton.value = "6"
        OperandSevenButton.value = "7"
        OperandEightButton.value = "8"
        OperandNineButton.value = "9"
        OperandDotButton.value = "."
    }

    public func setUpOpertorButtonValue() {
        OperatorAddButton.value = " + "
        OperatorSubtractButton.value = " - "
        OperatorMultiplyButton.value = " × "
        OperatorDivideButton.value = " ÷ "
    }
    
    @IBAction func OperandButtonAction(_ sender: OperandButton) {
        generateOperandNumber(sender)
        addOperatorToFormulaIfExists()
    }
    
    public func generateOperandNumber(_ sender: OperandButton) {
        guard let input = sender.value else { return }
        if statusZeroFlag == true {
            if sender == OperandZeroButton || sender == OperandCoupleZeroButton {
                inputtingOperand = CalculatorViewController.zero
            } else if sender == OperandDotButton {
                inputtingOperand += input
            } else {
                inputtingOperand = input
            }
            statusZeroFlag = false
        } else {
            inputtingOperand += input
        }
    }
    
    public func addOperatorToFormulaIfExists() {
        if !inputtingOperator.isEmpty {
            let lastInputtedOperator = OperatorLabel.text
            formulaNotYetCalculated += inputtingOperator
            clearInputtingOperator()
            OperatorLabel.text = lastInputtedOperator
        }
    }
    
    @IBAction func OperatorButtonAction(_ sender: OperatorButton) {
        guard let input = sender.value else { return }
        inputtingOperator = input
        addOperandToFormula()
    }
    
    public func addOperandToFormula() {
        if statusZeroFlag {
            return
        }
        
        formulaNotYetCalculated += inputtingOperand
        setStatusZero()
    }
    
    @IBAction func allClearAction(_ sender: FunctionalButton) {
        setUpDefaultStatus()
    }
    
    
    @IBAction func clearEntryAction(_ sender: FunctionalButton) {
        setStatusZero()
    }
    
    @IBAction func changeSignAction(_ sender: FunctionalButton) {
        if inputtingOperand == CalculatorViewController.zero {
            return
        } else if inputtingOperand.first == CalculatorViewController.negativeSign {
            inputtingOperand.remove(at: inputtingOperand.startIndex)
        } else {
            inputtingOperand.insert(CalculatorViewController.negativeSign, at: inputtingOperand.startIndex)
        }
    }
    
    @IBAction func executeCalculatingAction(_ sender: FunctionalButton) {
        if formulaNotYetCalculated.isEmpty {
            return
        }
        
        formulaNotYetCalculated += inputtingOperand
        clearInputtingOperand()
        var parser = ExpressionParser.parse(from: formulaNotYetCalculated)
        setUpDefaultStatus()
        
        guard let result = try? parser.result() as Double else { return }
        configureCalculateResultLabel(result)
    }
    
    public func configureCalculateResultLabel(_ result: Double) {
        if result.isNaN {
            NumberLabel.text = "NaN"
        } else {
            guard let numberFormattedResult = numberFormatter.string(for: result) else { return }
            NumberLabel.text = numberFormattedResult
        }
    }
}

