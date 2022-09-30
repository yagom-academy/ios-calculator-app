//  Calculator - MainViewController.swift
//  Created by zhilly on 2022/09/20.

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var numberButton: [UIButton]!
    @IBOutlet var operatorButton: [UIButton]!
    
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var calculateButton: UIButton!

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
        calculatorController = CalculatorController(view: self)
        configureDisplayLabels()
    }
    
    func configureDisplayLabels() {
        displaySignLabel.text = ""
        displayNumberLabel.text = "0"
        formulaVerticalStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func makeStakView() {
        let operandLabel = UILabel()
        operandLabel.text = displayNumberLabel.text
        operandLabel.textColor = .white
    
        let operatorLabel = UILabel()
        operatorLabel.text = displaySignLabel.text
        operatorLabel.textColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
        formulaVerticalStackView.addArrangedSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        autoScroll()
    }
    
    func autoScroll() {
        let contentOffsetPoint: CGPoint = CGPoint(x: .zero, y: formulaScrollView.contentSize.height)
        formulaScrollView.setContentOffset(contentOffsetPoint, animated: false)
    }
    
    func resetDisplayNumberLabel() {
        displayNumberLabel.text = "0"
        calculatorController.viewDisplayNumber = "0"
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        displaySignLabel.text = calculatorController.tappedOperatorButton(input: sender.titleLabel?.text)
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        displayNumberLabel.text = calculatorController.tappedNumberButton(input: sender.titleLabel?.text)
    }
    
    @IBAction func tapCEButton(_ sender: UIButton) {
        calculatorController.tappedCEButton()
    }
    
    @IBAction func tapCalculateButton(_ sender: UIButton) {
        displayNumberLabel.text = calculatorController.tappedCalculateButton()
        if displaySignLabel.text != "" {
            displaySignLabel.text = ""
            makeStakView()
        }
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        displayNumberLabel.text = calculatorController.tappedDotButton()
    }
    
    @IBAction func tapACButton(_ sender: UIButton) {
        configureDisplayLabels()
        calculatorController.tappedACButton()
    }
    
    @IBAction func tapReverseSignButton(_ sender: UIButton) {
        displayNumberLabel.text = calculatorController.tappedReverseSignButton()
    }
}

