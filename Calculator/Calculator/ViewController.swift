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
    private let ZERO = "0"
    private var isEndOperation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearOperationScrollviewContent()
        clearCurrentOperandUILabel()
        clearCurrentOperatorUILabel()
        // Do any additional setup after loading the view.
    }
    // MARK: - IBAction
    @IBAction func pressOperandButton(_ sender: UIButton) {
        isEndOperation = false
        guard currentOperand.text?.count ?? 0 < 20 else {
            return
        }
        if currentOperand.text?.first == "0" || currentOperand.text == "NaN"{
            currentOperand.text = ""
        }
        if currentOperand.text?.contains(".") == true,
           sender.currentTitle == "." {
            return
        }
        if currentOperand.text == "." {
            currentOperand.text = "0."
        }
        currentOperand?.text = (currentOperand?.text ?? "") + (sender.currentTitle ?? "")
    }
    @IBAction func pressOperatorButton(_ sender: UIButton) {
        guard currentOperand.text != ZERO else {
            currentOperator.text = (sender.currentTitle ?? "")
            return
        }
        addCurrentOperationToScrollViewContent()
        currentOperator.text = sender.currentTitle
        operationStack += "\(currentOperand?.text ?? ZERO) \(sender.currentTitle ?? "") "
        //create Scrollview Content
        clearCurrentOperandUILabel()
        scrollingUnder()
    }
    @IBAction func pressAllClearButton(_ sender: UIButton) {
        operationStack = ""
        clearOperationScrollviewContent()
        clearCurrentOperandUILabel()
        clearCurrentOperatorUILabel()
    }
    @IBAction func pressClearEntryButton(_ sender: UIButton) {
        clearCurrentOperandUILabel()
    }
    @IBAction func pressReverseSignButton(_ sender: UIButton) {
        guard currentOperand.text != ZERO else {
            return
        }
        if currentOperand.text?.first == "-" {
            currentOperand.text?.removeFirst()
        } else {
            currentOperand.text = "-" + (currentOperand.text ?? "")
        }
    }
    @IBAction func pressEqualButton(_ sender: UIButton) {
        guard !isEndOperation else {
            return
        }
        addCurrentOperationToScrollViewContent()
        operationStack += currentOperand.text ?? ZERO
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
        operationStack = ""
        scrollingUnder()
        isEndOperation = true
    }
    
    private func clearCurrentOperandUILabel() {
        currentOperand.text = ZERO
    }
    private func clearCurrentOperatorUILabel() {
        currentOperator.text = ""
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
            inputOperator: currentOperator.text ?? "",
            inputOperand: currentOperand.text ?? ""
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
        return numberFormmater.string(for: Double(filteredInput ?? "")) ?? ""
    }
}
