//
//  Calculator - ViewController.swift
//  Created by unchain123
//
// 

import UIKit

class ViewController: UIViewController {
    
    var userIsInTheMiddleOfTyping = false
    var valueStack: String = ""
    
    @IBOutlet weak var operandsLable: UILabel!
    @IBOutlet weak var operatorLable: UILabel!
    @IBOutlet weak var expressionView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func makeNewStackView() {
        
        let newStackView = UIStackView()
        let newOperandsLabel = UILabel()
        let newOperatorLabel = UILabel()
        
        newStackView.axis = .horizontal
        newOperandsLabel.textColor = .white
        newOperatorLabel.textColor = .white
        
        if operatorLable == nil {
            newOperandsLabel.text = operandsLable.text
            operandsLable.text = "0"
        } else {
            newOperandsLabel.text = operandsLable.text
            newOperatorLabel.text = operatorLable.text
            operandsLable.text = "0"
        }
        
        newStackView.addArrangedSubview(newOperatorLabel)
        newStackView.addArrangedSubview(newOperandsLabel)
        expressionView.addArrangedSubview(newStackView)
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle, let currentLable = operandsLable.text else {
            return
        }
        
        if currentLable.contains(".") && buttonTitle == "." {
            return
        } else if userIsInTheMiddleOfTyping {
            operandsLable.text? += buttonTitle
            valueStack += buttonTitle
        } else {
            operandsLable.text = buttonTitle
            valueStack += buttonTitle
        }
        userIsInTheMiddleOfTyping = true
        }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        guard let operatorButtonTitle = sender.currentTitle else {
            return
        }
        if userIsInTheMiddleOfTyping {
            makeNewStackView()
            operatorLable.text = operatorButtonTitle
            valueStack += " \(operatorButtonTitle) "
        } else {
            operatorLable.text = operatorButtonTitle
            valueStack = String(valueStack.dropLast(3))
            valueStack += " \(operatorButtonTitle) "
            return
        }
        
        userIsInTheMiddleOfTyping = false
    }
    
    @IBAction func didTapEqualButton(_ sender: UIButton) {
        if let result = try? ExpressionPaser.parse(from: valueStack).result() {
            operandsLable.text = convertToDecimal(result)
            
        }
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction func didTapAllClearButton(_ sender: UIButton) {
        expressionView.subviews.forEach { $0.removeFromSuperview()
        }
        operandsLable.text = "0"
        operatorLable.text?.removeAll()
        valueStack = ""
        userIsInTheMiddleOfTyping = false
    }
    
    @IBAction func didTabclearEntryButton(_ sender: UIButton) {
        
        if let lastIndex = valueStack.last, Double(String(lastIndex)) != nil {
            operandsLable.text = String((operandsLable.text ?? "0").dropLast())
        } else {
            return
        }
        
        if operandsLable.text == "" {
            operandsLable.text = "0"
        }
        
        valueStack = String(valueStack.dropLast())
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction func didTapToggleButton(_ sender: UIButton) {
        guard let presentNumber = operandsLable.text else {
            return
        }
        guard presentNumber != "0" else {
            return
        }
        if presentNumber.contains("−") {
            operandsLable.text = presentNumber.filter { element -> Bool in
                if element == "-" {
                    return false
                }
                return true
            }
        } else {
            operandsLable.text = "-" + presentNumber
            }
        let valueStackArray = valueStack.split(with: " ").dropLast().reduce("", +)
        valueStack = valueStackArray + (operandsLable.text ?? "")
    }
}



