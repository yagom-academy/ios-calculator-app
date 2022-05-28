//
//  Calculator - ViewController.swift
//  Created by bard.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        exampleStackView1.isHidden = true
        exampleStackView2.isHidden = true
        
    }
    let addedStackView = UIStackView()
    let addedOperatorsLabel = UILabel()
    let addedOperandsLabel = UILabel()
    private var expressionParserInput: String = "0"
    private var isCalculated = false
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var exampleStackView1: UIStackView!
    @IBOutlet private weak var exampleStackView2: UIStackView!
    @IBOutlet private weak var arrangedStackView: UIStackView!
    @IBOutlet private weak var operatorStackLabel: UILabel!
    @IBOutlet private weak var operandStackLabel: UILabel!
    @IBOutlet private weak var operandsTextLabel: UILabel!
    @IBOutlet private weak var operatorTextLabel: UILabel!
    
    //MARK: - addStackView()
    private func addStackView() {
        scrollView.setContentOffset(CGPoint(x: 0,
                                            y: scrollView.contentSize.height - scrollView.bounds.height + 22),
                                    animated: false)
        setAddedStackViewConstraints()
        setAddedOperatorsLabelConstraints()
        setAddedOperandsLabelConstraints()
        addSubviews()
    }
    
    private func setAddedStackViewConstraints() {
        addedStackView.axis = .horizontal
        addedStackView.alignment = .fill
        addedStackView.spacing = 8
        addedStackView.distribution = .fill
        addedStackView.translatesAutoresizingMaskIntoConstraints = false
        addedStackView.isHidden = false
    }
    
    private func setAddedOperatorsLabelConstraints() {
        addedOperatorsLabel.text = operatorTextLabel.text
        addedOperatorsLabel.textAlignment = .right
        addedOperatorsLabel.textColor = UIColor.white
        addedOperatorsLabel.translatesAutoresizingMaskIntoConstraints = false
        addedOperatorsLabel.isHidden = false
    }
    
    private func setAddedOperandsLabelConstraints() {
        addedOperandsLabel.text = formatNumber(operandsTextLabel.text!)
        addedOperandsLabel.textAlignment = .right
        addedOperandsLabel.textColor = UIColor.white
        addedOperandsLabel.translatesAutoresizingMaskIntoConstraints = false
        addedOperandsLabel.isHidden = false
    }
    
    private func addSubviews() {
        addedStackView.addArrangedSubview(addedOperatorsLabel)
        addedStackView.addArrangedSubview(addedOperandsLabel)
        arrangedStackView.addArrangedSubview(addedStackView)
    }
    
    //MARK: - deleteStackViewAll()
    private func deleteStackViewAll() {
        arrangedStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    //MARK: - operandButtonsTapped()
    @IBAction private func operandButtonsTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        let formattedText = formatNumber(senderLabelText)
        
        if operandsTextLabel.text == "NaN" {
            operandsTextLabel.text = ""
            return
        }
        
        if operandsTextLabel.text == "0" {
            operandsTextLabel.text = ""
            operandsTextLabel.text?.append(formattedText)
            expressionParserInput.append(formattedText)
            return
        }
        
        if isCalculated == true {
            operandsTextLabel.text?.append(formattedText)
            operatorTextLabel.text = ""
            operandsTextLabel.text = senderLabelText
            isCalculated = false
            return
        }
        operandsTextLabel.text?.append(formattedText)
        expressionParserInput.append(formattedText)
    }
    
    //MARK: - operatorButtonsTapped()
    @IBAction private func operatorButtonsTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        guard let operandLabelText = operandsTextLabel.text else { return }
        let formattedNumber = formatNumber(operandLabelText)

        if operandsTextLabel.text == "NaN" {
            return
        } else if operandLabelText == "0" {
            operatorTextLabel.text = senderLabelText
            return
        }
        
        expressionParserInput.append(" \(senderLabelText) ")
        addStackView()
        operatorTextLabel.text = senderLabelText
        operandsTextLabel.text = formattedNumber
        operandsTextLabel.text = "0"
    }
    
    //MARK: - calculateButtonTapped
    @IBAction private func calculateButtonTapped(_ sender: UIButton) {
        isCalculated = true
        var result: Double?
        var calculator = ExpressionParser.parse(from: expressionParserInput)
        guard operatorTextLabel.text != "" else { return }
        
        do {
            result = try calculator.result()
        } catch {
            print(OperatorError.devideFail.errorDescription)
            addStackView()
            expressionParserInput = ""
            operatorTextLabel.text = ""
            operandsTextLabel.text? = OperatorError.devideFail.errorDescription
            return
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        guard let formattedResult = numberFormatter.string(for: result) else { return }
        
        addStackView()
        operatorTextLabel.text = ""
        operandsTextLabel.text = formattedResult
        expressionParserInput = formattedResult
    }
    
    //MARK: - changeOperandSignButtonTapped
    @IBAction func changeOperandSignButtonTapped(_ sender: UIButton) {
        guard let operandsLabelText = operandsTextLabel.text else { return }
        
        if operandsLabelText == "0" {
            return
        } else if operandsTextLabel.text?.first == "-" {
            operandsTextLabel.text?.removeFirst()
            return
        } else if operandsTextLabel.text?.first?.isNumber == true {
            operandsTextLabel.text = "-" + operandsLabelText
        } else {
            print(OperatorError.unknown)
        }
    }
    
    //MARK: - allClearButtonTapped
    @IBAction func allClearButtonTapped(_ sender: UIButton) {
        isCalculated = false
        deleteStackViewAll()
        deleteTextLabelText()
        expressionParserInput = ""
    }
    
    //MARK: - clearEntryButtonTapped
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        if isCalculated == true {
            operandsTextLabel.text = "0"
            isCalculated = false
        }
        
        if operandsTextLabel.text == "0" {
            return
        }
            
        if operandsTextLabel.text?.isEmpty == false {
            operandsTextLabel.text? = "0"
            expressionParserInput.removeLast()
        } else {
            return
        }
    }
    
    //MARK: - zeroButtonTapped
    @IBAction func zeroButtonTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        
        if isCalculated == true {
            operatorTextLabel.text = ""
            operandsTextLabel.text = senderLabelText
            isCalculated = false
            return
        }
        
        if operandsTextLabel.text == "0" {
            operandsTextLabel.text = senderLabelText
            expressionParserInput += "0"
        } else if operandsTextLabel.text?.count == 1,
                  operandsTextLabel.text == "0" {
            operandsTextLabel.text = "0"
        } else {
            operandsTextLabel.text! += senderLabelText
            expressionParserInput.append(senderLabelText)
        }
    }
    
    //MARK: - doubleZeroButtonTapped
    @IBAction private func doubleZeroButtonTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        
        if operandsTextLabel.text?.count == 1,
           operandsTextLabel.text == "0" {
            operandsTextLabel.text = "0"
        } else {
            operandsTextLabel.text! += senderLabelText
            expressionParserInput.append(senderLabelText)
        }
    }
    
    //MARK: - decimalPointButtonTapped
    @IBAction private func decimalPointButtonTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        
        if operandsTextLabel.text?.contains(senderLabelText) == true {
            operandsTextLabel.text = operandsTextLabel.text
        } else if operandsTextLabel.text?.count != 0 {
            operandsTextLabel.text! += senderLabelText
            expressionParserInput += senderLabelText
        }
    }
    
    private func deleteTextLabelText() {
        operatorTextLabel.text = ""
        operandsTextLabel.text = "0"
    }
    
    private func formatNumber(_ input: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        guard let numberFormattedResult = numberFormatter.number(from: input) else {
            return OperatorError.unknown.errorDescription
        }
        guard let formattedResult = numberFormatter.string(from: numberFormattedResult) else {
            return OperatorError.unknown.errorDescription
        }
        return formattedResult
    }
}
