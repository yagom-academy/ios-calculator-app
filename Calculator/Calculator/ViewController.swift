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
        guard currentOperand.text?.count ?? 0 < 20 else {
            return
        } //20 자 제한
        
        guard currentOperand.text != "NaN" else {
            currentOperand.text = sender.currentTitle
            return
        } // Nan일때 입력한 operand로 교체
        guard ((currentOperand.text?.contains(CalcAccessory.Dot)) != nil),
              sender.currentTitle == CalcAccessory.Dot else {
            return
        } // dot 중복 제한
        guard currentOperand.text != CalcAccessory.Zero,
              sender.currentTitle != CalcAccessory.DoubleZero else {
            currentOperand.text = CalcAccessory.Zero
            return
        } // 0일 때 00이면 0
        
        // 0 9 > 9
        // 0 . > 0.
        // 0 . 9 > 0.9
        // 0 . 0 9 > 0.09
        // 00 . > 0.
        // 00 00 > 0
        // 00 0 > 0
        // 00 9 > 9
        // 00
        // 9 0 > 90
        // 9 . > 9.
        // 9 9 > 99
        // 9 00 > 900
        
        if (currentOperand.text?.first == Character(CalcAccessory.Zero)),
           (sender.currentTitle == CalcAccessory.DoubleZero)
        {
            return //  앞이 0일때 00이면 0냅두고 리턴
        } else if (currentOperand.text?.first == Character(CalcAccessory.Zero)),
                  (sender.currentTitle == CalcAccessory.Zero)
        {
            return // 앞이 0인데 0들어오면 0냅두고 리턴
        }
        
        if sender.currentTitle == CalcAccessory.Dot {
            currentOperand.text = "0"
        } // 현재 입력이 . 이면 0. 으로 변경
        
        currentOperand?.text = (currentOperand?.text ?? CalcAccessory.Empty) + (sender.currentTitle ?? CalcAccessory.Empty)
    }
    @IBAction func pressOperatorButton(_ sender: UIButton) {
        guard currentOperand.text != CalcAccessory.Zero else {
            currentOperator.text = (sender.currentTitle ?? CalcAccessory.Empty)
            return
        }
        addCurrentOperationToScrollViewContent()
        currentOperator.text = sender.currentTitle
        operationStack += "\(currentOperand?.text ?? CalcAccessory.Zero) \(sender.currentTitle ?? CalcAccessory.Empty) "
        //create Scrollview Content
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
