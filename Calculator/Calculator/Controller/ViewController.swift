//
//  Calculator - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteTextLabelText()
        exampleStackView1.isHidden = true
        exampleStackView2.isHidden = true
    }
    
    var expressionParserInput: String = "0"
    var isCalculated = false
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var exampleStackView1: UIStackView!
    @IBOutlet weak var exampleStackView2: UIStackView!
    @IBOutlet weak var largeStackView: UIStackView!
    @IBOutlet weak var operatorStackLabel: UILabel!
    @IBOutlet weak var operandStackLabel: UILabel!
    @IBOutlet weak var operandsTextLabel: UILabel!
    @IBOutlet weak var operatorTextLabel: UILabel!
    
    //MARK: - addStackView()
    func addStackView() {
        let addedStackView = UIStackView()
        let addedOperatorsLabel = UILabel()
        let addedOperandsLabel = UILabel()
        scrollView.setContentOffset(CGPoint(x: 0,
                                            y: scrollView.contentSize.height - scrollView.bounds.height + 22),
                                    animated: false)
        
        // addedStackView Constraints
        addedStackView.axis = .horizontal
        addedStackView.alignment = .fill
        addedStackView.spacing = 8
        addedStackView.distribution = .fill
        addedStackView.translatesAutoresizingMaskIntoConstraints = false
        addedStackView.isHidden = false
        
        // addedOperatorsLabel Constraints
        addedOperatorsLabel.text = operatorTextLabel.text
        addedOperatorsLabel.textAlignment = .right
        addedOperatorsLabel.textColor = UIColor.white
        addedOperatorsLabel.translatesAutoresizingMaskIntoConstraints = false
        addedOperatorsLabel.isHidden = false
        
        // addedOperandsLabel Constraints
        addedOperandsLabel.text = formatNumber(operandsTextLabel.text!)
        addedOperandsLabel.textAlignment = .right
        addedOperandsLabel.textColor = UIColor.white
        addedOperandsLabel.translatesAutoresizingMaskIntoConstraints = false
        addedOperandsLabel.isHidden = false

        addedStackView.addArrangedSubview(addedOperatorsLabel)
        addedStackView.addArrangedSubview(addedOperandsLabel)
        largeStackView.addArrangedSubview(addedStackView)
    }
    
    //MARK: - deleteStackViewAll()
    func deleteStackViewAll() {
        largeStackView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    //MARK: - operandButtonsTapped()
    @IBAction func operandButtonsTapped(_ sender: UIButton) {
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
    @IBAction func operatorButtonsTapped(_ sender: UIButton) {
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
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
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
    
    //MARK: - clearEntryButtonTapped :operandsTextLabel 에서 마지막으로 입력된 숫자만 지움, 연산이 된상태라면 모든 스택을 지움
    @IBAction func clearEntryButtonTapped(_ sender: UIButton) {
        if isCalculated == true {
            deleteStackViewAll()
            deleteTextLabelText()
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
    @IBAction func doubleZeroButtonTapped(_ sender: UIButton) {
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
    @IBAction func decimalPointButtonTapped(_ sender: UIButton) {
        guard let senderLabelText = sender.titleLabel?.text else { return }
        
        if operandsTextLabel.text?.contains(senderLabelText) == true {
            operandsTextLabel.text = operandsTextLabel.text
        } else if operandsTextLabel.text?.count != 0 {
            operandsTextLabel.text! += senderLabelText
            expressionParserInput += senderLabelText
        }
    }
    
    func deleteTextLabelText() {
        operatorTextLabel.text = ""
        operandsTextLabel.text = "0"
    }
    
    func formatNumber(_ input: String) -> String {
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
