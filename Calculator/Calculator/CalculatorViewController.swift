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
        } else if arrangedStackView.subviews.isEmpty || isCalculated == true {
            operandsTextLabel.text = formattedNumber
            addStackView()
            expressionParserInput.append(senderLabelText)
            operatorTextLabel.text = senderLabelText
            operandsTextLabel.text = "0"
            return
        }
        expressionParserInput.append(senderLabelText)
        operatorTextLabel.text = senderLabelText
        operandsTextLabel.text = formattedNumber
        addStackView()
        operandsTextLabel.text = "0"
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
            expressionParserInput = ""
            operatorTextLabel.text = ""
            operandsTextLabel.text? = OperatorError.devideFail.errorDescription
            return
        } catch {
            expressionParserInput = ""
            operatorTextLabel.text = ""
            operandsTextLabel.text? = QueueError.unknown.errorDescription
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
            expressionParserInput.removeLast()  // 숫자가 하나의 숫자일 때만 가능
            // 연산자가 나오기 전까지 제거 하던가 반복문 돌려서
            return
        }
    }
    
    //MARK: - zeroButtonTapped
    @IBAction private func zeroButtonTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        // IBOutlet을 꺼내서 써야 하나?
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
        operatorTextLabel.text = ""
        operandsTextLabel.text = "0"
    }
}

