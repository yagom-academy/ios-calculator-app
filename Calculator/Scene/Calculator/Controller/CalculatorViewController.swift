//
//  Calculator - CalculatorViewController.swift
//  Created by bonf. 
//  Copyright © yagom. All rights reserved.
// 
import UIKit
import Foundation

class CalculatorViewController: UIViewController {
    
    @IBOutlet private var currentValue: [UILabel]!
    
    private var inputedStack: [UIStackView]!
    
    @IBOutlet private weak var expressionView: UIStackView!
    
    private var NumberOfFormula = 1
    
    private var totalFormula: String = ""
    
    @IBOutlet private var defaultStackView: [UIStackView]!

    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue[0].text = ""
        currentValue[1].text = "0"
        inputedStack = []
        defaultStackView.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    @IBAction private func tappedNumbers(_ sender: UIButton) {
        guard let number = sender.currentTitle,
              var value = currentValue[1].text else {
            return
        }
        
        guard value == "0" || value == "NAN" else {
            value += number
            currentValue[1].text = value
            return
        }
        
        guard number == "0" || number == "00" else {
            currentValue[1].text = number
            return
        }
    }
    
    @IBAction private func tappedDot(_ sender: UIButton) {
        guard var value = currentValue[1].text else { return }
        
        let isDot = isDouble(value)
        
        if isDot {
            value += "."
            currentValue[1].text = value
        }
    }
    
    @IBAction private func tappedOperators(_ sender: UIButton) {
        guard currentValue[1].text != "NAN" else { return }
        guard let formattableValue = currentValue[1].text else { return }
        let value = formattableValue.filter { $0 != ","}
    
        guard value != "0" else {
            if NumberOfFormula == 1 {
                return
            }
            currentValue[0].text = sender.currentTitle
            return
        }
        
        let isDot = isDouble(value)
        
        if isDot {
            currentValue[1].text = removeZeroOfDouble(value)
        }
        
       addStackView()
        
        if NumberOfFormula > 1 {
            totalFormula += " \(currentValue[0].text!) \(value)"
        } else {
            totalFormula += "\(value)"
        }
        
        currentValue[0].text = sender.currentTitle
        currentValue[1].text = "0"
        NumberOfFormula += 1
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height + 27)
        scrollView.setContentOffset(bottomOffset, animated: true)
    }
    
    @IBAction private func tappedResult(_ sender: UIButton) {
        guard currentValue[1].text != "NAN" else { return }
        guard currentValue[0].text != "" else { return }
        guard NumberOfFormula > 1 else {
            totalFormula += "\(currentValue[1].text!)"
            return
        }
        totalFormula += " \(currentValue[0].text!) \(currentValue[1].text!)"
        
        do {
            addStackView()
            let result = try ExpressionParser.parse(from: totalFormula).result()
            changeFormat("\(result)")
            totalFormula = ""
            let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height)
            scrollView.setContentOffset(bottomOffset, animated: true)
        } catch DevideError.nilOfValue {
            currentValue[0].text = ""
            currentValue[1].text = "0"
            AlertErrorEvent()
            totalFormula = ""
        } catch DevideError.insufficientOperator {
            currentValue[0].text = ""
            currentValue[1].text = "0"
            AlertErrorEvent()
            totalFormula = ""
        } catch DevideError.devideZero {
            currentValue[0].text = ""
            currentValue[1].text = "NAN"
            AlertErrorEvent()
            totalFormula = ""
        } catch {
            print(Error.self)
        }
    }
    
    @IBAction private func tappedChangeValue(_ sender: UIButton) {
        let changeValue = sender.tag
        if changeValue == 0 {
            inputedStack.forEach { stackView in
                stackView.removeFromSuperview()
            }
            inputedStack = []
            currentValue[0].text = ""
            currentValue[1].text = "0"
            totalFormula = ""
            NumberOfFormula = 1
        } else if changeValue == 1 {
            currentValue[1].text = "0"
        } else {
            guard let value = currentValue[1].text else { return }
            guard value != "0" else { return }
            guard value != "NAN" else { return }
            guard value.first == "-" else {
                currentValue[1].text = "-\(value)"
                return
            }
            currentValue[1].text = value.filter { $0 != "-" }
        }
    }
    
    private func removeZeroOfDouble(_ input: String) -> String {
        var value = input
        while value.last == "0" {
            value.removeLast()
        }
        if value.last == "."{
            value.removeLast()
        }
        return value
    }
    
    private func AlertErrorEvent() {
        expressionView.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.expressionView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    private func isDouble(_ value: String) -> Bool {
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
        currentValue[0].text = ""
        currentValue[1].text = "\(result)"
    }
    
    private func addStackView() {
        let operatorLabel = createLabel()
        operatorLabel.text = currentValue[0].text
        let operandLabel = createLabel()
        operandLabel.text = currentValue[1].text
        let stack = createStackView([operatorLabel, operandLabel])
        expressionView.addArrangedSubview(stack)
        inputedStack.append(stack)
    }
    
    private func createLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        return label
    }
    
    private func createStackView(_ UILabel: [UILabel]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.addArrangedSubview(UILabel[0])
        stackView.addArrangedSubview(UILabel[1])
        return stackView
    }
}
