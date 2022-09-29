//  Calculator - MainViewController.swift
//  Created by zhilly on 2022/09/20.

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var numberButton: [UIButton]!
    @IBOutlet var operatorButton: [UIButton]!
    
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!

    @IBOutlet weak var ceButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var reverseSignButton: UIButton!
    
    @IBOutlet weak var displaySignLabel: UILabel!
    @IBOutlet weak var displayNumberLabel: UILabel!
    
    @IBOutlet weak var formulaScrollView: UIScrollView!
    @IBOutlet weak var formulaStackView: UIStackView!
    
    var calculatorController: CalculatorController!
    var displaySign: Operator.RawValue = Operator.add.rawValue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorController = CalculatorController()
        configureDisplayLabels()
    }
    
    func configureDisplayLabels() {
        displaySignLabel.text = ""
        displayNumberLabel.text = "0"
        formulaStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func determineOperator(stringOperator: String?) {
        switch stringOperator {
        case "+":
            displaySign = Operator.add.rawValue
        case "−":
            displaySign = Operator.subtract.rawValue
        case "×":
            displaySign = Operator.multiply.rawValue
        case "÷":
            displaySign = Operator.divide.rawValue
        default:
            displaySign = Operator.add.rawValue
        }
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        displaySignLabel.text = sender.titleLabel?.text
        determineOperator(stringOperator: sender.titleLabel?.text)
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        displayNumberLabel.text = calculatorController.tappedNumberButton(input: sender.titleLabel?.text)
    }
}

