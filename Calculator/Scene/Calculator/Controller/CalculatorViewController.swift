//
//  Calculator - CalculatorViewController.swift
//  Created by bonf. 
//  Copyright © yagom. All rights reserved.
// 
import UIKit
import Foundation

class CalculatorViewController: UIViewController {
    
    @IBOutlet private weak var historyScrollView: UIScrollView!
    
    @IBOutlet private weak var expressionStackView: UIStackView!
    
    @IBOutlet private var defaultStackViews: [UIStackView]!
    
    @IBOutlet private var valueLabels: [UILabel]!
    
    private var createdStackViews: [UIStackView]!
    
    private var numberOfCalculation = 1
    
    private var totalCalculation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText("0")
        defaultStackViews.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    @IBAction private func numberButtonDidTapped(_ sender: UIButton) {
        guard let number = sender.currentTitle,
              var inputedNumberLabel = valueLabels[1].text else {
            return
        }
        
        guard checkInvalidValue(inputedNumberLabel) else {
            inputedNumberLabel += number
            valueLabels[1].text = inputedNumberLabel
            return
        }
        
        guard number == "0" || number == "00" else {
            valueLabels[1].text = number
            return
        }
    }
    
    @IBAction private func DotButtonDidTapped(_ sender: UIButton) {
        guard var inputedNumberLabel = valueLabels[1].text else { return }
        
        if hasDot(inputedNumberLabel) {
            inputedNumberLabel += "."
            valueLabels[1].text = inputedNumberLabel
        }
    }
    
    @IBAction private func tappedOperators(_ sender: UIButton) {
        guard valueLabels[1].text != "NAN" else { return }
        guard let formattableValue = valueLabels[1].text else { return }
        let numericalValue = formattableValue.filter { $0 != ","}
        
        guard numericalValue != "0" else {
            if numberOfCalculation == 1 {
                return
            }
            valueLabels[0].text = sender.currentTitle
            return
        }
        
        if hasDot(numericalValue) {
            valueLabels[1].text = removeZeroOfDouble(numericalValue)
        }
        
        addStackView()
        inputToCalculation(numericalValue)
        valueLabels[0].text = sender.currentTitle
        valueLabels[1].text = "0"
        numberOfCalculation += 1
        holdScrollDown()
    }
    
    @IBAction private func tappedResult(_ sender: UIButton) {
        guard valueLabels[1].text != "NAN" else { return }
        guard valueLabels[0].text != "" else { return }
        
        guard numberOfCalculation > 1 else {
            totalCalculation += "\(valueLabels[1].text!)"
            return
        }
        
        totalCalculation += " \(valueLabels[0].text!) \(valueLabels[1].text!)"
        
        do {
            addStackView()
            let result = try ExpressionParser.parse(from: totalCalculation).result()
            changeFormat("\(result)")
            totalCalculation = ""
            holdScrollDown()
        } catch DevideError.nilOfValue {
            setLabelText("0")
        } catch DevideError.insufficientOperator {
            setLabelText("0")
        } catch DevideError.devideZero {
            setLabelText("NAN")
        } catch {
            print(Error.self)
        }
    }
    
    @IBAction private func tappedChangeValue(_ sender: UIButton) {
        let changeValue = sender.tag
        if changeValue == 0 {
            createdStackViews.forEach { stackView in
                stackView.removeFromSuperview()
            }
            createdStackViews = []
            valueLabels[0].text = ""
            valueLabels[1].text = "0"
            totalCalculation = ""
            numberOfCalculation = 1
        } else if changeValue == 1 {
            valueLabels[1].text = "0"
        } else {
            guard let value = valueLabels[1].text else { return }
            guard value != "0" else { return }
            guard value != "NAN" else { return }
            guard value.first == "-" else {
                valueLabels[1].text = "-\(value)"
                return
            }
            valueLabels[1].text = value.filter { $0 != "-" }
        }
    }
    
    private func checkInvalidValue(_ text: String) -> Bool {
        if text == "0" || text == "NAN" || text == "-0" {
            return true
        }
        return false
    }
    
    private func setLabelText(_ text: String) {
        valueLabels[0].text = ""
        valueLabels[1].text = text
        totalCalculation = ""
        numberOfCalculation = 1
        createdStackViews = []
    }
    
    private func inputToCalculation(_ text: String) {
        if numberOfCalculation > 1 {
            totalCalculation += " \(valueLabels[0].text!) \(text)"
        } else {
            totalCalculation += "\(text)"
        }
    }
    
    private func removeZeroOfDouble(_ text: String) -> String {
        var value = text
        while value.last == "0" {
            value.removeLast()
        }
        if value.last == "."{
            value.removeLast()
        }
        return value
    }
    
    private func holdScrollDown() {
        let bottomOffset = CGPoint(x: 0, y: historyScrollView.contentSize.height -
                                   historyScrollView.bounds.size.height + 27)
        historyScrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    private func hasDot(_ value: String) -> Bool {
        if value.contains(".") {
            return false
        } else {
            return true
        }
    }
    
    private func changeFormat(_ format: String) {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: Double(format))!
        valueLabels[0].text = ""
        valueLabels[1].text = "\(result)"
    }
    
    private func addStackView() {
        let operatorLabel = createLabel()
        operatorLabel.text = valueLabels[0].text
        let operandLabel = createLabel()
        operandLabel.text = valueLabels[1].text
        let stack = createStackView([operatorLabel, operandLabel])
        expressionStackView.addArrangedSubview(stack)
        createdStackViews.append(stack)
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        return label
    }
    
    private func createStackView(_ labels: [UILabel]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.addArrangedSubview(labels[0])
        stackView.addArrangedSubview(labels[1])
        return stackView
    }
}
