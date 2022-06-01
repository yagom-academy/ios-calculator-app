//
//  Calculator - CalculateViewController.swift
//  Created by hugh, bard.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    private var expressionParserInput: String = ""
    private var isCalculated = false
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var arrangedStackView: UIStackView!
    @IBOutlet private weak var operandsTextLabel: UILabel!
    @IBOutlet private weak var operatorTextLabel: UILabel!
    
    private var subStackView: UIStackView {
       let stackView = UIStackView()
       stackView.axis = .horizontal
       stackView.alignment = .fill
       stackView.spacing = 8
       stackView.distribution = .fill
       stackView.translatesAutoresizingMaskIntoConstraints = false
       stackView.isHidden = false
       return stackView
    }
    
    private var operatorLabel: UILabel {
        let signLabel = UILabel()
        signLabel.text = operatorTextLabel.text
        signLabel.textAlignment = .right
        signLabel.textColor = UIColor.white
        signLabel.translatesAutoresizingMaskIntoConstraints = false
        signLabel.isHidden = false
        return signLabel
    }
    
    private var operandLabel: UILabel {
        let numberLabel = UILabel()
        numberLabel.text = operandsTextLabel.text?.formatNumber()
        numberLabel.textAlignment = .right
        numberLabel.textColor = UIColor.white
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.isHidden = false
        return numberLabel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Action
    //MARK: - operandButtonsTapped()
    @IBAction private func operandButtonsTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        let formattedText = senderLabelText.formatNumber()
        
        if operandsTextLabel.text == MagicLiteral.nan {
            operandsTextLabel.text = MagicLiteral.empty
            return
        } else if operandsTextLabel.text == MagicLiteral.zero {
            operandsTextLabel.text = MagicLiteral.empty
            operandsTextLabel.text?.append(formattedText)
            expressionParserInput.append(formattedText)
            return
        }
        
        if isCalculated == true {
            operandsTextLabel.text?.append(formattedText)
            operatorTextLabel.text = MagicLiteral.empty
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
        
        if expressionParserInput.isEmpty {
            return
        }
        
        if operandsTextLabel.text == MagicLiteral.nan {
            return
        } else if operandLabelText == MagicLiteral.zero {
            operatorTextLabel.text = senderLabelText
            return
        } else if arrangedStackView.subviews.isEmpty || isCalculated == true {
            operandsTextLabel.text = formattedNumber
            addStackView()
            expressionParserInput.append(senderLabelText)
            operatorTextLabel.text = senderLabelText
            operandsTextLabel.text = MagicLiteral.zero
            return
        }
        expressionParserInput.append(senderLabelText)
        operandsTextLabel.text = formattedNumber
        addStackView()
        operatorTextLabel.text = senderLabelText
        operandsTextLabel.text = MagicLiteral.zero
    }
    
    //MARK: - calculateButtonTapped
    @IBAction private func calculateButtonTapped(_ sender: UIButton) {
        isCalculated = true
        var result: Double?
        var calculator = ExpressionParser.parse(from: expressionParserInput)
        guard operatorTextLabel.text?.isEmpty != true else { return }
        
        do {
            result = try calculator.result()
        } catch OperatorError.devideFail {
            addStackView()
            expressionParserInput = MagicLiteral.empty
            operatorTextLabel.text = MagicLiteral.empty
            operandsTextLabel.text? = OperatorError.devideFail.errorDescription
            return
        } catch {
            expressionParserInput = MagicLiteral.empty
            operatorTextLabel.text = MagicLiteral.empty
            operandsTextLabel.text? = QueueError.unknown.errorDescription
            return
        }
        
        guard let formattedResult = result?.formatText() else { return }
        
        addStackView()
        operatorTextLabel.text = MagicLiteral.empty
        operandsTextLabel.text = formattedResult
        expressionParserInput = formattedResult
    }
    
    //MARK: - changeOperandSignButtonTapped
    @IBAction func changeOperandSignButtonTapped(_ sender: UIButton) {
        guard let operandsLabelText = operandsTextLabel.text else { return }
        guard let formattedNumber = operandsTextLabel.text?.formatNumber() else { return }
        
        if  formattedNumber == MagicLiteral.zero {
            return
        } else if operandsTextLabel.text?.first == "-" {
            operandsTextLabel.text?.removeFirst()
            expressionParserInput.removeFirst()
            return
        } else if operandsTextLabel.text?.first?.isNumber == true {
            operandsTextLabel.text = MagicLiteral.minus + operandsLabelText
            expressionParserInput.removeLast()
            expressionParserInput += operandsTextLabel.text!
        } else {
            operandsTextLabel.text = OperatorError.unknown.errorDescription
        }
    }
    
    //MARK: - allClearButtonTapped
    @IBAction private func allClearButtonTapped(_ sender: UIButton) {
        isCalculated = false
        deleteStackViewAll()
        deleteTextLabelText()
        expressionParserInput = MagicLiteral.empty
    }
    
    //MARK: - clearEntryButtonTapped
    @IBAction private func clearEntryButtonTapped(_ sender: UIButton) {
        if isCalculated == true {
            operandsTextLabel.text = MagicLiteral.zero
            deleteStackViewAll()
            isCalculated = false
        }
        
        if operandsTextLabel.text == MagicLiteral.zero {
            return
        }
            
        if operandsTextLabel.text?.isEmpty == false {
            operandsTextLabel.text? = MagicLiteral.zero
            
            while expressionParserInput.last?.isNumber == true {
                expressionParserInput.removeLast()
            }
            return
        }
    }
    
    //MARK: - zeroButtonTapped
    @IBAction private func zeroButtonTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        if isCalculated == true {
            operatorTextLabel.text = MagicLiteral.empty
            operandsTextLabel.text = senderLabelText
            isCalculated = false
            return
        }
        
        if operandsTextLabel.text == MagicLiteral.zero {
            operandsTextLabel.text = senderLabelText
            expressionParserInput += MagicLiteral.zero
        } else if operandsTextLabel.text?.count == 1,
                  operandsTextLabel.text == MagicLiteral.zero {
            return
        } else {
            operandsTextLabel.text? += senderLabelText
            expressionParserInput.append(senderLabelText)
        }
    }
    
    //MARK: - doubleZeroButtonTapped
    @IBAction private func doubleZeroButtonTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        
        if operandsTextLabel.text?.count == 1,
           operandsTextLabel.text == MagicLiteral.zero {
            operandsTextLabel.text = MagicLiteral.zero
        } else {
            operandsTextLabel.text? += senderLabelText
            expressionParserInput.append(senderLabelText)
        }
    }
    
    //MARK: - decimalPointButtonTapped
    @IBAction private func decimalPointButtonTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        
        if operandsTextLabel.text?.contains(senderLabelText) == true {
            operandsTextLabel.text = operandsTextLabel.text
        } else if operandsTextLabel.text?.count != 0 {
            operandsTextLabel.text? += senderLabelText
            expressionParserInput += senderLabelText
        }
    }
    
    //MARK: - Method
    //MARK: - addStackView()
    private func addStackView() {
        let addedStackView = subStackView
        let addedOperatorsLabel = operatorLabel
        let addedOperandsLabel = operandLabel
        
        addStackSubviews(addedStackView)
        addLabelSubviews(addedOperatorsLabel,
                         superView: addedStackView)
        addLabelSubviews(addedOperandsLabel,
                         superView: addedStackView)
        
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
    
    //MARK: - deleteStackViewAll()
    private func deleteStackViewAll() {
        arrangedStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    //MARK: - deleteTextLabelText()
    private func deleteTextLabelText() {
        operatorTextLabel.text = MagicLiteral.empty
        operandsTextLabel.text = MagicLiteral.zero
    }
}
