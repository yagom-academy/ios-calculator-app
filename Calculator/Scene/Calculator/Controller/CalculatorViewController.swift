//
//  Calculator - CalculatorViewController.swift
//  Created by bonf. 
//  Copyright © yagom. All rights reserved.
// 
import UIKit
import Foundation

class CalculatorViewController: UIViewController {
    
    @IBOutlet var currentValue: [UILabel]!
    
    var inputedStack: [UIStackView]!
    
    @IBOutlet weak var expressionView: UIStackView!
    
    var NumberOfFormula = 1
    
    var totalFormula: String = ""
    
    @IBOutlet var defaultStackView: [UIStackView]!

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue[0].text = ""
        currentValue[1].text = "0"
        inputedStack = []
        defaultStackView.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    @IBAction func tappedNumbers(_ sender: UIButton) {
        guard let number = sender.currentTitle,
              var value = currentValue[1].text else {
            return
        }
        
        guard value == "0" else {
            value += number
            currentValue[1].text = value
            return
        }
        
        guard number == "0" || number == "00" else {
            currentValue[1].text = number
            return
        }
    }
    
    @IBAction func tappedDot(_ sender: UIButton) {
        guard var value = currentValue[1].text else { return }
        
        var isDot: Bool {
            if value.contains(".") {
                return false
            } else {
                return true
            }
        }
        
        if isDot {
            value += "."
            currentValue[1].text = value
        }
    }
    
    @IBAction func tappedOperators(_ sender: UIButton) {
        guard var value = currentValue[1].text else { return }
        
        guard value != "0" else {
            if NumberOfFormula == 1 {
                return
            }
            currentValue[0].text = sender.currentTitle
            return
        }
        
        var isDot: Bool {
            if value.contains(".") {
                return true
            } else {
                return false
            }
        }
        
        if isDot {
            while value.last == "0" {
                value.removeLast()
            }
            if value.last == "."{
                value.removeLast()
            }
            currentValue[1].text = value
        }
        
        let operatorLabel = createLabel()
        operatorLabel.text = currentValue[0].text
        let operandLabel = createLabel()
        operandLabel.text = value
        let stack = createStackView([operatorLabel, operandLabel])
        expressionView.addArrangedSubview(stack)
        inputedStack.append(stack)
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
    
    @IBAction func tappedResult(_ sender: UIButton) {
        guard NumberOfFormula > 1 else {
            totalFormula += "\(currentValue[1].text!)"
            return
        }
        totalFormula += " \(currentValue[0].text!) \(currentValue[1].text!)"
        
        do {
            let operatorLabel = createLabel()
            operatorLabel.text = currentValue[0].text
            let operandLabel = createLabel()
            operandLabel.text = currentValue[1].text
            let stack = createStackView([operatorLabel, operandLabel])
            expressionView.addArrangedSubview(stack)
            inputedStack.append(stack)
            
            let result = try ExpressionParser.parse(from: totalFormula).result()
            currentValue[0].text = ""
            currentValue[1].text = "\(result)"
            totalFormula = ""
            let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.size.height + 27)
            scrollView.setContentOffset(bottomOffset, animated: true)
        } catch DevideError.nilOfValue {
            currentValue[0].text = ""
            currentValue[1].text = "NAN"
        } catch DevideError.insufficientOperator {
            currentValue[0].text = ""
            currentValue[1].text = "NAN"
        } catch {
            print(Error.self)
        }
    }
    
    @IBAction func tappedChangeValue(_ sender: UIButton) {
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
            
            guard value.first == "-" else {
                currentValue[1].text = "-\(value)"
                return
            }
            
            currentValue[1].text = value.filter { $0 != "-" }
        }
    }
    
    func createLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        return label
    }
    
    func createStackView(_ UILabel: [UILabel]) -> UIStackView {
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
