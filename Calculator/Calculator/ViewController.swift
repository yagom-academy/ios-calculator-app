//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operationScrollView: UIScrollView!
    @IBOutlet weak var operationStackView: UIStackView!
    @IBOutlet weak var currentOperand: UILabel!
    @IBOutlet weak var currentOperator: UILabel!
    private var operationStack: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        clearOperationScrollviewContent()
        clearCurrentOperandUILabel()
        clearCurrentOperatorUILabel()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBAction
    @IBAction func pressOperandButton(_ sender: UIButton) {
        let operandLabel = currentOperand.text ?? CalcAccessory.Empty
        
        guard sender.currentTitle != "." || currentOperand.text?.contains(".") == false
        else {
            return
        }
        
        if operandLabel == CalcAccessory.Zero,
            (sender.currentTitle == CalcAccessory.Zero || sender.currentTitle == CalcAccessory.DoubleZero) {
            return
        } else if operandLabel == CalcAccessory.Zero, sender.currentTitle != CalcAccessory.Dot {
            currentOperand.text = CalcAccessory.Empty
        }
        
        if operandLabel == "NaN" {
            switch sender.currentTitle {
            case CalcAccessory.DoubleZero:
                currentOperand.text = CalcAccessory.Zero
                return
            case CalcAccessory.Dot:
                currentOperand.text = CalcAccessory.Zero + CalcAccessory.Dot
                return
            case CalcAccessory.Zero:
                currentOperand.text = CalcAccessory.Zero
                return
            default:
                currentOperand.text = CalcAccessory.Empty
            }
        }
        
        currentOperand?.text = (currentOperand?.text ?? CalcAccessory.Empty) + (sender.currentTitle ?? CalcAccessory.Empty)
    }

    @IBAction func pressOperatorButton(_ sender: UIButton) {
        guard currentOperand.text != CalcAccessory.Zero else {
            currentOperator.text = (sender.currentTitle ?? CalcAccessory.Empty)
            return
        }
        
        if currentOperand.text?.last == "." {
            currentOperand.text?.removeLast()
        }
        
        addCurrentOperationToScrollViewContent()
        operationStack += "\(currentOperand?.text ?? CalcAccessory.Zero) \(sender.currentTitle ?? CalcAccessory.Empty) "
        currentOperator.text = sender.currentTitle
        clearCurrentOperandUILabel()
        scrollingUnder()
    }
    
    @IBAction func pressAllClearButton(_ sender: UIButton) {
        operationStack = CalcAccessory.Empty
        clearOperationScrollviewContent()
        clearCurrentOperandUILabel()
        clearCurrentOperatorUILabel()
    }
    @IBAction func pressClearEntryButton(_ sender: UIButton) {
        clearCurrentOperandUILabel()
    }
    @IBAction func pressReverseSignButton(_ sender: UIButton) {
        guard currentOperand.text != CalcAccessory.Zero else {
            return
        }
        if currentOperand.text?.first == "-" {
            currentOperand.text?.removeFirst()
        } else {
            currentOperand.text = "-" + (currentOperand.text ?? CalcAccessory.Empty)
        }
    }
    @IBAction func pressEqualButton(_ sender: UIButton) {
        guard currentOperator.text != CalcAccessory.Empty else {
            return
        }
        
        addCurrentOperationToScrollViewContent()
        operationStack += currentOperand.text ?? CalcAccessory.Zero
        operationStack = operationStack.filter {
            $0 != ","
        }
        var formula = ExpressionParser.parse(from: operationStack)
        do {
            let operationResult = try formula.result()
            currentOperand.text = changeDecimalStyle(String(operationResult))
        } catch CalculatorError.divideByZero {
            currentOperand.text = "NaN"
        } catch {
            debugPrint("UNKNOWN ERROR")
        }
        clearCurrentOperatorUILabel()
        operationStack = CalcAccessory.Empty
        scrollingUnder()
    }
    
    private func clearCurrentOperandUILabel() {
        currentOperand.text = CalcAccessory.Zero
    }
    private func clearCurrentOperatorUILabel() {
        currentOperator.text = CalcAccessory.Empty
    }
    private func clearOperationScrollviewContent() {
        operationStackView.subviews.forEach { UIView in
            UIView.removeFromSuperview()
        }
    }
}
//MARK: - UI Components
extension ViewController {
    private func addCurrentOperationToScrollViewContent() {
        let currentContent = createOpearionStackViewContent(
            inputOperator: currentOperator.text ?? CalcAccessory.Empty,
            inputOperand: currentOperand.text ?? CalcAccessory.Empty
        )
        operationStackView.addArrangedSubview(currentContent)
    }
    private func createOpearionStackViewContent(inputOperator: String, inputOperand: String) -> UILabel {
        let currentOperation = "\(inputOperator) \(inputOperand)"
        let currentOperationUILabel = createUILabel(currentOperation)
        return currentOperationUILabel
    }
    private func createUILabel(_ text: String) -> UILabel {
        let uiLabel = UILabel()
        uiLabel.textColor = .white
        uiLabel.font = .preferredFont(forTextStyle: .title3, compatibleWith: nil)
        uiLabel.text = text
        return uiLabel
    }
    private func scrollingUnder() {
        operationScrollView.setContentOffset(CGPoint(x: 0,
                                                     y: operationScrollView.contentSize.height - operationScrollView.bounds.height), animated: true)
    }
    private func changeDecimalStyle(_ input: String?) -> String {
        let filteredInput = input?.filter {
            $0 != ","
        }
        let numberFormmater = NumberFormatter()
        numberFormmater.numberStyle = .decimal
        numberFormmater.maximumSignificantDigits = 20
        return numberFormmater.string(for: Double(filteredInput ?? CalcAccessory.Empty)) ?? CalcAccessory.Empty
    }
}
