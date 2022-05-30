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
    
    @IBAction private func dotButtonDidTapped(_ sender: UIButton) {
        guard var inputedNumberLabel = valueLabels[1].text else { return }
        
        if hasDot(inputedNumberLabel) {
            inputedNumberLabel += "."
            valueLabels[1].text = inputedNumberLabel
        }
    }
    
    @IBAction private func operatorButtonDidTapped(_ sender: UIButton) {
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
        
        removeZeroHasDot(numericalValue)
        
        addStackView()
        inputToCalculation(numericalValue)
        valueLabels[0].text = sender.currentTitle
        valueLabels[1].text = "0"
        numberOfCalculation += 1
        holdScrollDown()
    }
    
    @IBAction private func resultButtonDidTapped(_ sender: UIButton) {
        guard valueLabels[1].text != "NAN" else { return }
        guard valueLabels[0].text != "" else { return }
        
        inputToCalculation(valueLabels[1].text!)
        
        do {
            addStackView()
            let result = try ExpressionParser.parse(from: totalCalculation).result()
            changeFormat("\(result)")
            totalCalculation = ""
            holdScrollDown()
        } catch DevideError.nilOfValue {
            clearStackView()
            setLabelText("0")
        } catch DevideError.insufficientOperator {
            clearStackView()
            setLabelText("0")
        } catch DevideError.devideZero {
            clearStackView()
            setLabelText("NAN")
        } catch {
            print(Error.self)
        }
    }
    
    @IBAction private func changeValueButtonDidTapped(_ sender: UIButton) {
        let changeValue = sender.currentTitle
        if changeValue == "AC" {
            clearStackView()
            setLabelText("0")
        } else if changeValue == "CE" {
            valueLabels[1].text = "0"
        } else {
            guard let value = valueLabels[1].text else { return }
            checkNegativeNumber(value)
        }
    }
    
    private func setLabelText(_ text: String) {
        valueLabels[0].text = ""
        valueLabels[1].text = text
        totalCalculation = ""
        numberOfCalculation = 1
        createdStackViews = []
    }
    
    private func checkInvalidValue(_ text: String) -> Bool {
        if text == "0" || text == "NAN" || text == "-0" {
            return true
        }
        return false
    }
    
    private func hasDot(_ value: String) -> Bool {
        if value.contains(".") {
            return false
        } else {
            return true
        }
    }
    
    private func removeZeroHasDot(_ text: String) {
        var numericalValue = text
        if !hasDot(numericalValue) {
            while numericalValue.last == "0" {
                numericalValue.removeLast()
            }
            if numericalValue.last == "."{
                numericalValue.removeLast()
            }
            valueLabels[1].text = numericalValue
        }
    }
    
    private func inputToCalculation(_ text: String) {
        if numberOfCalculation > 1 {
            totalCalculation += " \(valueLabels[0].text!) \(text)"
        } else {
            totalCalculation += "\(text)"
        }
    }
    
    private func checkNegativeNumber(_ text: String) {
        guard text != "0" else { return }
        guard text != "NAN" else { return }
        guard text.first == "-" else {
            valueLabels[1].text = "-\(text)"
            return
        }
        valueLabels[1].text = text.filter { $0 != "-" }
        return
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
                                   historyScrollView.bounds.size.height)
        historyScrollView.setContentOffset(bottomOffset, animated: true)
        historyScrollView.layoutSubviews()
    }
    
    private func changeFormat(_ format: String) {
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(for: Double(format))!
        valueLabels[0].text = ""
        valueLabels[1].text = "\(result)"
    }
    
    private func clearStackView() {
        createdStackViews.forEach { stackView in
            stackView.removeFromSuperview()
        }
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
