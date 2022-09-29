//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculatorDisplayLabel: UILabel!
    @IBOutlet weak var operatorDisplayLabel: UILabel!
    @IBOutlet weak var calculatorArchive: UIStackView!

    @IBOutlet weak var scrollView: UIScrollView!
    private var displayLabelText: String = nameSpace.zero {
        didSet {
            if displayLabelText.count >= 20 {
                let index = displayLabelText.index(displayLabelText.startIndex, offsetBy: 19)
                displayLabelText = String(displayLabelText[...index])
                if displayLabelText.last == "." {
                    displayLabelText.removeLast()
                }
            }
            
            calculatorDisplayLabel.text = displayLabelText
            
            guard let textToDouble = Double(displayLabelText) else {
                return
            }
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            calculatorDisplayLabel.text = numberFormatter.string(from: textToDouble as NSNumber)
        }
    }
    
    private(set) var formula: String = nameSpace.empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAccessibilityIndentifier()
    }
    
    func setAccessibilityIndentifier() {
        calculatorDisplayLabel.isAccessibilityElement = true
        calculatorDisplayLabel.accessibilityIdentifier = accessibilityIdentifier.calculatorDisplayLabel
        
        operatorDisplayLabel.isAccessibilityElement = true
        operatorDisplayLabel.accessibilityIdentifier = accessibilityIdentifier.operatorDisplayLabel
        
        calculatorArchive.isAccessibilityElement = true
        calculatorArchive.accessibilityIdentifier = accessibilityIdentifier.calculatorArchive
    }

    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle,
              displayLabelText != nameSpace.nan else {
            return
        }
        
        if displayLabelText == nameSpace.zero {
            displayLabelText = title
        } else {
            displayLabelText = displayLabelText + title
        }
    }
    
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle,
              displayLabelText != nameSpace.nan else {
            return
        }
        
        if displayLabelText != nameSpace.zero {
            displayLabelText = displayLabelText + title
        }
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle,
              displayLabelText != nameSpace.nan else {
            return
        }
        
        displayLabelText = displayLabelText + title
    }
    
    @IBAction func operatorButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle,
              let displayText = calculatorDisplayLabel.text,
              let operatorText = operatorDisplayLabel.text else {
            return
        }
        
        if displayLabelText != nameSpace.zero {
            pushInFormula(operand: displayLabelText, operator: operatorText)
            pushInArchive(operand: displayText, operator: operatorText)
        }
        
        if formula.isEmpty == false {
            operatorDisplayLabel.text = title
        }
        
        displayLabelText = nameSpace.zero
    }
    
    func pushInFormula(operand: String, `operator`: String) {
        if self.formula.isEmpty {
            formula += operand
        } else {
            formula += `operator` + operand
        }
    }
    
    func pushInArchive(operand: String, `operator`: String) {
        let stackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 8
            
            return stackView
        }()
        
        let operatorLabel = {
            let label = UILabel()
            label.text = `operator`
            label.textColor = .white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            
            return label
        }()
        
        let operandLabel = {
            let label = UILabel()
            label.text = operand
            label.textColor = .white
            label.font = UIFont.preferredFont(forTextStyle: .title3)
            
            return label
        }()
        
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(operandLabel)
        calculatorArchive.addArrangedSubview(stackView)
        
        self.scrollView.layoutIfNeeded()
        let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height + self.scrollView.contentInset.bottom)
        self.scrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    @IBAction func changeSignButtonTapped(_ sender: UIButton) {
        if displayLabelText != nameSpace.zero {
            displayLabelText = changeSign(displayLabelText)
        }
    }
    
    func changeSign(_ text: String) -> String {
        if text.first == Character(nameSpace.negative) {
            let secondIndex = text.index(after: text.startIndex)
            return String(text[secondIndex...])
        } else {
            return nameSpace.negative + text
        }
    }
    
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        displayLabelText = nameSpace.zero
    }
    
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        displayLabelText = nameSpace.zero
        operatorDisplayLabel.text = nameSpace.empty
        formula = nameSpace.empty
        
        allClearArchive()
    }
    
    func allClearArchive() {
        calculatorArchive.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        guard let operatorText = operatorDisplayLabel.text,
              formula != nameSpace.empty else {
            return
        }
        
        pushInFormula(operand: displayLabelText, operator: operatorText)
        pushInArchive(operand: displayLabelText, operator: operatorText)
        
        var parsedFormula = ExpressionParser.parse(from: formula)
        
        do {
            let result = try parsedFormula.result()
            displayLabelText = String(result)
            
            if result.isNaN == false {
                trimmingDoubleToInt(string: displayLabelText)
            }
            
            formula = nameSpace.empty
            operatorDisplayLabel.text = nameSpace.empty
        } catch CalculatorError.divideZero {
            displayLabelText = nameSpace.nan
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func trimmingDoubleToInt(string: String) {
        guard let textToDouble = Double(displayLabelText) else {
            return
        }
        
        if Double(Int(textToDouble)) == textToDouble {
            displayLabelText = String(Int(textToDouble))
        }
    }
}

