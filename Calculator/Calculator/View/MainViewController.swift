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
    @IBOutlet weak var formulaHorizontalStackView: UIStackView!
    @IBOutlet weak var formulaVerticalStackView: UIStackView!
    
    var calculatorController: CalculatorController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorController = CalculatorController()
        configureDisplayLabels()
    }
    
    func configureDisplayLabels() {
        displaySignLabel.text = ""
        displayNumberLabel.text = "0"
        formulaHorizontalStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        displaySignLabel.text = calculatorController.tappedOperatorButton(input: sender.titleLabel?.text)
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        displayNumberLabel.text = calculatorController.tappedNumberButton(input: sender.titleLabel?.text)
    }
    
    @IBAction func tapCEButton(_ sender: UIButton) {
        displayNumberLabel.text = "0"
        displaySignLabel.text = ""
    }
}

