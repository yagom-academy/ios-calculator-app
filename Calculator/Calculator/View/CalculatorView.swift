//  Calculator - MainViewController.swift
//  Created by zhilly and Gundy on 2022/10/04.

import UIKit

final class CalculatorView: UIViewController, MainViewControllerDelegate {
    
    @IBOutlet weak var displaySignLabel: UILabel!
    @IBOutlet weak var displayNumberLabel: UILabel!
    
    @IBOutlet weak private var formulaScrollView: UIScrollView!
    @IBOutlet weak private var formulaHorizontalStackView: UIStackView!
    @IBOutlet weak private var formulaVerticalStackView: UIStackView!
    
    private var calculatorController: CalculatorControllerProtocol!
    private let numberFormatter: NumberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorController = CalculatorController(view: self)
        resetDisplayLabels()
        configureNumberFormatter()
    }
    
    private func resetDisplayLabels() {
        displaySignLabel.text = String()
        displayNumberLabel.text = String(Int.zero)
        formulaVerticalStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func configureNumberFormatter() {
        numberFormatter.maximumFractionDigits = 16
        numberFormatter.numberStyle = .decimal
    }
    
    private func changeCalculateResultFormat(result: String?) -> String? {
        guard let text = result,
              let number = Double(text),
              let changedFormatResult: String = numberFormatter.string(from: NSNumber(value: number)) else { return nil }
        
        return changedFormatResult
    }
    
    private func displayChangeCalculateResultFormat(result: String?) -> String? {
        var changedFormatResult: String
        guard let nonOptionalResult = result else { return nil }
        
        if nonOptionalResult.split(with: Character(Constants.dot)).count >= 2 {
            let splitResult = nonOptionalResult.split(with: Character(Constants.dot))
            let integerNumber = Double(splitResult[0]) ?? .nan
            let changedFormatIntegerNumber: String = numberFormatter.string(from: NSNumber(value: integerNumber)) ?? String()
            let decimalNumber = splitResult[1]
            changedFormatResult = changedFormatIntegerNumber + Constants.dot + decimalNumber
        } else if nonOptionalResult.contains(Constants.dot) == true {
            let number = Double(nonOptionalResult) ?? .nan
            changedFormatResult = (numberFormatter.string(from: NSNumber(value: number)) ?? String()) + Constants.dot
        } else {
            let number = Double(nonOptionalResult) ?? .nan
            changedFormatResult = numberFormatter.string(from: NSNumber(value: number)) ?? String()
        }
        
        return changedFormatResult
    }
    
    func makeStackView() {
        let stackView = FormulaStackView()
        let operandText = changeCalculateResultFormat(result: displayNumberLabel.text?.split(with: Character(Constants.comma)).joined())
        stackView.configure(operatorText: displaySignLabel.text, operandText: operandText)
        formulaVerticalStackView.addArrangedSubview(stackView)
        autoScroll()
    }
    
    private func autoScroll() {
        let contentOffsetPoint: CGPoint = CGPoint(x: .zero, y: formulaScrollView.contentSize.height)
        formulaScrollView.setContentOffset(contentOffsetPoint, animated: false)
    }
    
    func resetDisplayNumberLabel() {
        displayNumberLabel.text = String(Int.zero)
        calculatorController.viewDisplayNumber = String(Int.zero)
    }
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        displaySignLabel.text = calculatorController.tappedOperatorButton(
            input: sender.titleLabel?.text
        )
    }
    
    @IBAction private func tapNumberButton(_ sender: UIButton) {
        displayNumberLabel.text = displayChangeCalculateResultFormat(
            result: calculatorController.tappedNumberButton(input: sender.titleLabel?.text)
        )
    }
    
    @IBAction private func tapCEButton(_ sender: UIButton) {
        calculatorController.tappedCEButton()
    }
    
    @IBAction private func tapCalculateButton(_ sender: UIButton) {
        displayNumberLabel.text = changeCalculateResultFormat(
            result: calculatorController.tappedCalculateButton()
        )
        
        if displaySignLabel.text != String() {
            displaySignLabel.text = String()
        }
    }
    
    @IBAction private func tapDotButton(_ sender: UIButton) {
        displayNumberLabel.text = displayChangeCalculateResultFormat(
            result: calculatorController.tappedDotButton()
        )
    }
    
    @IBAction private func tapACButton(_ sender: UIButton) {
        resetDisplayLabels()
        calculatorController.tappedACButton()
    }
    
    @IBAction private func tapReverseSignButton(_ sender: UIButton) {
        displayNumberLabel.text = changeCalculateResultFormat(
            result: calculatorController.tappedReverseSignButton()
        )
    }
}

