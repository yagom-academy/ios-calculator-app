//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var expressionString: String = ""
    var totalString: String = ""
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var doubleZeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var ceButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var expressionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func signOfOperator(sender: UIButton) -> String {
        switch sender {
        case plusButton:
            return String(Operator.add.rawValue)
        case minusButton:
            return String(Operator.subtract.rawValue)
        case multiplyButton:
            return String(Operator.multiply.rawValue)
        case divideButton:
            return String(Operator.divide.rawValue)
        default:
            return ""
        }
    }
    
    func resetVauleToZero() {
        expressionLabel.text = "0"
    }
    
    func resetStackView() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func initializeExpression() {
        resetVauleToZero()
        resetStackView()
    }
    
    func addLabelAndSign(vaule: String, sender: UIButton) {
        addNewLableToStackView(message: vaule, stackView: stackView)
        signLabel.text = signOfOperator(sender: sender)
    }

    @IBAction func tappedOperandButton(_ sender: UIButton) {
        switch sender {
        case oneButton:
            expressionString += "1"
        case twoButton:
            expressionString += "2"
        case threeButton:
            expressionString += "3"
        case fourButton:
            expressionString += "4"
        case fiveButton:
            expressionString += "5"
        case sixButton:
            expressionString += "6"
        case sevenButton:
            expressionString += "7"
        case eightButton:
            expressionString += "8"
        case nineButton:
            expressionString += "9"
        case zeroButton:
            expressionString += "0"
        case doubleZeroButton:
            expressionString += "00"
        case dotButton:
            expressionString += "."
        default:
            return
        }
        expressionLabel.text = expressionString
    }
    
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard expressionString.count != 0 && expressionLabel.text != "" else {
            return
        }
        
        if totalString.isEmpty {
            guard let vaule = expressionLabel.text else { return }
            addLabelAndSign(vaule: vaule, sender: sender)
            initializeExpression()
        } else {
            if expressionLabel.text == "0" {
                signLabel.text = signOfOperator(sender: sender)
            } else {
                guard let sign = signLabel.text else { return }
                guard let value = expressionLabel.text else { return }
            }
        }
        
        
    }
    
    func addNewLableToStackView(message: String, stackView: UIStackView) {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        label.text = "\(message)"
        label.textAlignment = .right
        label.numberOfLines = 0
        stackView.addArrangedSubview(label)
    }
    
}

