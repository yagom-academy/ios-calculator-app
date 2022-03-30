//
//  Calculator - ViewController.swift
//  Created by Red
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var currentNumberLabel: UILabel!
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var operationRecord: UIStackView!
    @IBOutlet weak var operationRecordScrollView: UIScrollView!
    private var allOperations: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAllHistory()
    }
    
    // MARK: IBAction
    @IBAction func clickNumberButton(_ sender: UIButton) {
        let currentNumber = currentNumberLabel.text.bind()
        let buttonTitle = sender.currentTitle.bind()
        
        guard currentNumber.removeComma().count < Constant.maximunNumberCount else { return }
        
        if currentNumber == Constant.defaultNumber {
            currentNumberLabel.text = buttonTitle
        } else {
            currentNumberLabel.text = (currentNumber + buttonTitle).changeDecimalFormat()
        }
    }
    
    @IBAction func clickOperatorButton(_ sender: UIButton) {
        let currentNumber = currentNumberLabel.text.bind()
        let currentOperator = currentOperatorLabel.text.bind()
        
        if currentNumber != Constant.defaultNumber {
            addNumberAndOperator(currentOperator, currentNumber)
        }
        currentOperatorLabel.text = sender.currentTitle
    }
    
    @IBAction func clickDotButton(_ sender: UIButton) {
        let currentNumber = currentNumberLabel.text.bind()
        
        guard currentNumber.contains(Constant.dot) == false else { return }
        currentNumberLabel.text = currentNumber + Constant.dot
    }
    
    @IBAction func clickZeroButton(_ sender: UIButton) {
        let currentNumber = currentNumberLabel.text.bind()
        let zeros = sender.currentTitle.bind()
        
        guard currentNumber.removeComma().count < Constant.maximunNumberCount else { return }
        
        if currentNumber.contains(Constant.dot) == true {
            currentNumberLabel.text = currentNumber + zeros
        } else {
            currentNumberLabel.text = (currentNumber + zeros).changeDecimalFormat()
        }
    }
    
    @IBAction func clickPlusMimusSign(_ sender: UIButton) {
        var currentNumber = currentNumberLabel.text.bind()
        
        guard currentNumber != Constant.defaultNumber else { return }
        
        if currentNumber.hasPrefix(Constant.minus) == true {
            currentNumber.removeFirst()
        } else {
            currentNumber.insert(Character(Constant.minus), at: currentNumber.startIndex)
        }
        currentNumberLabel.text = currentNumber.changeDecimalFormat()
    }
    
    @IBAction func clickAC(_ sender: UIButton) {
        clearAllHistory()
        allOperations = []
    }
    
    @IBAction func clickEC(_ sender: UIButton) {
        if allOperations.isEmpty {
            clearAllHistory()
        } else {
            currentNumberLabel.text = Constant.defaultNumber
        }
    }
    
    @IBAction func clickCalculateButton(_ sender: UIButton) {
        let currentNumber = currentNumberLabel.text.bind()
        let currentOperator = currentOperatorLabel.text.bind()
        
        if allOperations.isEmpty != true {
            addNumberAndOperator(currentOperator, currentNumber)
            let mergedAllOperation = allOperations.joined(separator: Constant.blank)
            var formula = ExpressionParser.parse(form: mergedAllOperation)
            let result = formula.result()
            
            currentOperatorLabel.text = Constant.empty
            currentNumberLabel.text = String(result).changeDecimalFormat()
            allOperations = []
        }
    }
    
    // MARK: private funtion
    private func clearAllHistory() {
        operationRecord.subviews.forEach { $0.removeFromSuperview() }
        currentNumberLabel.text = Constant.defaultNumber
        currentOperatorLabel.text = Constant.empty
    }
    
    private func addNumberAndOperator(_ currentOperator: String, _ currentNumber: String) {
        let operatorLabel = makeLabel()
        let numberLabel = makeLabel()
        numberLabel.text = currentNumber.changeDecimalFormat()
        operatorLabel.text = currentOperator
        
        let logStackView = makeStackView([operatorLabel, numberLabel])
        operationRecord.addArrangedSubview(logStackView)
        view.layoutIfNeeded()
        let contentBottom = operationRecordScrollView.contentSize.height - operationRecordScrollView.frame.height
        operationRecordScrollView.setContentOffset(CGPoint(x: 0, y: contentBottom), animated: true)
        
        if allOperations.isEmpty == false {
            allOperations.append(currentOperator)
        }
        let numberWithoutComma = currentNumber.removeComma()
        allOperations.append(numberWithoutComma)
        
        currentNumberLabel.text = Constant.defaultNumber
    }
    
    private func makeStackView(_ views: [UIView]) -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: views)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }
    
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title3)
        return label
    }
}
