//  Calculator - MainViewController.swift
//  Created by zhilly on 2022/09/20.

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var displaySignLabel: UILabel!
    @IBOutlet weak var displayNumberLabel: UILabel!
    
    @IBOutlet weak private var formulaScrollView: UIScrollView!
    @IBOutlet weak private var formulaHorizontalStackView: UIStackView!
    @IBOutlet weak private var formulaVerticalStackView: UIStackView!
    
    var calculatorController: CalculatorController!
    private let numberFormatter: NumberFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorController = CalculatorController(view: self)
        configureDisplayLabels()
        configureNumberFormatter()
    }
    
    private func configureDisplayLabels() {
        displaySignLabel.text = ""
        displayNumberLabel.text = "0"
        formulaVerticalStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    private func configureNumberFormatter() {
        self.numberFormatter.maximumFractionDigits = 16
        self.numberFormatter.numberStyle = .decimal
    }
    
    private func changeCalculateResultFormat(result: String?) -> String? {
        guard let text = result,
              let number = Double(text),
              let changedFormatResult: String = numberFormatter.string(from: NSNumber(value: number)) else {
            return nil
        }
        
        return changedFormatResult
    }
    
    func makeStackView() {
        let operandLabel = UILabel()
        operandLabel.text = displayNumberLabel.text
        operandLabel.textColor = .white
        
        let operatorLabel = UILabel()
        operatorLabel.text = displaySignLabel.text
        operatorLabel.textColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [operatorLabel, operandLabel])
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        formulaVerticalStackView.addArrangedSubview(stackView)
        
        autoScroll()
    }
    
    private func autoScroll() {
        let contentOffsetPoint: CGPoint = CGPoint(x: .zero, y: formulaScrollView.contentSize.height)
        formulaScrollView.setContentOffset(contentOffsetPoint, animated: false)
    }
    
    func resetDisplayNumberLabel() {
        displayNumberLabel.text = "0"
        calculatorController.viewDisplayNumber = "0"
    }
    
    @IBAction private func tapOperatorButton(_ sender: UIButton) {
        displaySignLabel.text = calculatorController.tappedOperatorButton(
            input: sender.titleLabel?.text
        )
    }
    
    @IBAction private func tapNumberButton(_ sender: UIButton) {
        displayNumberLabel.text = changeCalculateResultFormat(
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
        
        if displaySignLabel.text != "" {
            displaySignLabel.text = ""
            makeStackView()
        }
    }
    
    @IBAction private func tapDotButton(_ sender: UIButton) {
        displayNumberLabel.text = changeCalculateResultFormat(
            result: calculatorController.tappedDotButton()
        )
    }
    
    @IBAction private func tapACButton(_ sender: UIButton) {
        configureDisplayLabels()
        calculatorController.tappedACButton()
    }
    
    @IBAction private func tapReverseSignButton(_ sender: UIButton) {
        displayNumberLabel.text = changeCalculateResultFormat(
            result: calculatorController.tappedReverseSignButton()
        )
    }
}

