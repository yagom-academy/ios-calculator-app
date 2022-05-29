//
//  Calculator - CalculateViewController.swift
//  Created by bard.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    private var expressionParserInput: String = ""
    private var isCalculated = false
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var arrangedStackView: UIStackView!
    @IBOutlet private weak var operandsTextLabel: UILabel!
    @IBOutlet private weak var operatorTextLabel: UILabel!
    
    //MARK: - Action
    //MARK: - operandButtonsTapped()
    @IBAction private func operandButtonsTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        let formattedText = senderLabelText.formatNumber()
        
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
        let formattedNumber = operandLabelText.formatNumber()

        if operandsTextLabel.text == "NaN" {
            return
        } else if operandLabelText == "0" {
            operatorTextLabel.text = senderLabelText
            return
        } else if arrangedStackView.subviews.isEmpty {
            operandsTextLabel.text = formattedNumber
            addStackView()
            expressionParserInput.append(" \(senderLabelText) ")
            operatorTextLabel.text = senderLabelText
            operandsTextLabel.text = "0"
            return
        }
        
        expressionParserInput.append(" \(senderLabelText) ")
        operatorTextLabel.text = senderLabelText
        operandsTextLabel.text = formattedNumber
        addStackView()
        operandsTextLabel.text = "0"
        print(expressionParserInput)
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
            expressionParserInput.removeFirst()
            return
        } else if operandsTextLabel.text?.first?.isNumber == true {
            operandsTextLabel.text = "-" + operandsLabelText
        } else {
            operandsTextLabel.text = OperatorError.unknown.errorDescription
        }
    }
    
    //MARK: - allClearButtonTapped
    @IBAction private func allClearButtonTapped(_ sender: UIButton) {
        isCalculated = false
        deleteStackViewAll()
        deleteTextLabelText()
        expressionParserInput = ""
    }
    
    //MARK: - clearEntryButtonTapped
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
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
            return
        }
    }
    
    //MARK: - zeroButtonTapped
    @IBAction private func zeroButtonTapped(_ sender: UIButton) {
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
            return
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
    
    //MARK: - Method
    //MARK: - addStackView()
    private func addStackView() {
        let addedStackView = UIStackView()
        let addedOperatorsLabel = UILabel()
        let addedOperandsLabel = UILabel()
        
        addStackSubviews(addedStackView)
        addLabelSubviews(addedOperatorsLabel,
                         superView: addedStackView)
        addLabelSubviews(addedOperandsLabel,
                         superView: addedStackView)
        setStackViewConstraints(addedStackView)
        setOperatorsLabelConstraints(addedOperatorsLabel)
        setOperandsLabelConstraints(addedOperandsLabel)
        scrollView.layoutIfNeeded()
        scrollView.setContentOffset(CGPoint(x: 0,
                                            y: scrollView.contentSize.height - scrollView.bounds.height),
                                    animated: false)
    }
    
    //MARK: - addLabelSubviews(_ label: UILabel, superView: UIStackView)
    private func addLabelSubviews(_ label: UILabel, superView: UIStackView) {
        superView.addArrangedSubview(label)
    }
    
    //MARK: - addStackSubviews(_ stackView: UIStackView)
    private func addStackSubviews(_ stackView: UIStackView) {
        arrangedStackView.addArrangedSubview(stackView)
    }
    
    //MARK: - setStackViewConstraints(_ stackView: UIStackView)
    private func setStackViewConstraints(_ stackView: UIStackView) {
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isHidden = false
    }
    
    //MARK: - setOperatorsLabelConstraints(_ label: UILabel)
    private func setOperatorsLabelConstraints(_ label: UILabel) {
        label.text = operatorTextLabel.text
        label.textAlignment = .right
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = false
    }
    
    //MARK: - setAddedOperandsLabelConstraints(_ label: UILabel)
    private func setOperandsLabelConstraints(_ label: UILabel) {
        label.text = operandsTextLabel.text?.formatNumber()
        label.textAlignment = .right
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = false
    }
    
    //MARK: - deleteStackViewAll()
    private func deleteStackViewAll() {
        arrangedStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    //MARK: - deleteTextLabelText()
    private func deleteTextLabelText() {
        operatorTextLabel.text = ""
        operandsTextLabel.text = "0"
    }
}
