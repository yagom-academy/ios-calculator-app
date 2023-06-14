//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

extension String {
    var isZero: Bool {
        return self == "0" ? true : false
    }
}

class ViewController: UIViewController {
    private var expression: String = String()
    private var inputedOperand: String = String()
    private var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 20
        
        return formatter
    }()
    private var isResult: Bool = false
    
    @IBOutlet weak var calculateHistoryScrollView: UIScrollView!
    @IBOutlet weak var calculateStackView: UIStackView!
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCalculator()
    }
    
    // 연산자 눌렀을 때 스택뷰 안들어가도록
    // 15자리부터 0 나오는 문제
    // numberFormatter를 쓰면 -> . 바로 안나옴
    @IBAction func touchUpOperandButton(_ sender: UIButton) {
        guard let partialOperand = sender.titleLabel?.text,
              inputedOperand.count < 20 else {
            return
        }
        
        if isResult {
            expression = ""
            inputedOperand = ""
            isResult = false
        }
        
        switch partialOperand {
        case ".":
            inputedOperand += checkDot()
        default:
            inputedOperand += partialOperand
        }
        
        //operandLabel.text = inputedOperand
        operandLabel.text = numberFormatter.string(for: Double(inputedOperand))
    }
    
    // 연산자 버튼 눌렀을 때
    @IBAction func touchUpOperatorButton(_ sender: UIButton) {
        guard let currentOperator = sender.titleLabel?.text,
              operandLabel.text?.isZero == false else {
            return
        }
        
        if isResult {
            isResult = false
        }
        
        addStackView()

        if inputedOperand.isEmpty == false {
            expression += inputedOperand
            initOperand()
            initOperandLabel()
        }
    
        operatorLabel.text = currentOperator
        updateOperator(currentOperator)
    }
        
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        guard expression.isEmpty == false && isResult == false else {
            return
        }
        
        if inputedOperand.isEmpty == false {
            expression += inputedOperand
        }
        
        addStackView()
        
        var value = ExpressionParser.parser(from: expression)
        
        do {
            let result = try value.result()
            
            let resultValue = numberFormatter.string(for: result)
            operandLabel.text = resultValue
            expression = resultValue ?? ""
            initOperand()
            initOperatorLabel()
            isResult = true
            //addStackView()
        } catch CalculatorError.notANumber {
            operandLabel.text = CalculatorError.notANumber.errorDescription
            initExpression()
            initOperand()
            initOperatorLabel()
        } catch {
            print("알 수 없는 오류")
        }
    }
    
    //AC: All Clear
    @IBAction func touchUpAllClearButton(_ sender: UIButton) {
        initializeCalculator()
    }
    
    //CE: Clear Entry
    @IBAction func touchUpClearEntryButton(_ sender: UIButton) {
        guard inputedOperand.isEmpty == false else {
            return
        }
        inputedOperand.removeLast()
        initOperandLabel()
    }
    
    @IBAction func touchUpChangeSignButton(_ sender: UIButton) {
        guard let currentOperand = operandLabel.text,
              currentOperand.isZero == false else {
            return
        }

        if let number = Double(currentOperand) {
            let changedSignNumber = number.sign == .plus ? -number : abs(number)
            operandLabel.text = numberFormatter.string(for: Double(changedSignNumber))
            inputedOperand = String(changedSignNumber)
        }
    }
    
}

extension ViewController {
    func initializeCalculator() {
        initExpression()
        initOperand()
        initOperandLabel()
        initOperatorLabel()
        removeStackView()
    }
    
    func initOperandLabel() {
        operandLabel.text = "0"
    }
    
    func initOperatorLabel() {
        operatorLabel.text = ""
    }
    
    func initOperand() {
        inputedOperand = ""
    }
    
    func initExpression() {
        expression = ""
    }
    
    func updateOperator(_ currentOperator: String) {
        // experssion 바로 전값이 연산자면, 넣지않음
        if let formerValue = expression.last,
           formerValue.isNumber || formerValue == "." {
            expression += currentOperator
        }
    }
    
    func checkDot() -> String {
        if inputedOperand.contains(".") == false && inputedOperand.isEmpty {
            return "0."
        } else
        if inputedOperand.contains(".") == false {
            return "."
        } else {
            return ""
        }
    }
}


extension ViewController {
    func addStackView() {
        var currentOperand: UILabel
        var currentOperator: UILabel
        
        if isResult {
            currentOperand = createUILabel(text: operandLabel.text)
            currentOperator = createUILabel(text: "")
        } else {
            currentOperand = createUILabel(text: operandLabel.text)
            currentOperator = createUILabel(text: operatorLabel.text)
        }
            
        let stackView = createUIStackView(currentOperator, currentOperand)
        calculateStackView.addArrangedSubview(stackView)
        
        scrollToBottom()
    }
    
    func removeStackView() {
        calculateStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func createUILabel(text: String?) -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.text = text
        
        return label
    }
    
    func createUIStackView(_ labels: UILabel...) -> UIStackView {
        let stackView = UIStackView()
        stackView.spacing = 10
        
        labels.forEach {
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }
    
    func scrollToBottom() {
        calculateHistoryScrollView.layoutIfNeeded()
        
        let bottomOffset = CGPoint(x: 0, y: (calculateHistoryScrollView.contentSize.height - calculateHistoryScrollView.bounds.size.height))

        calculateHistoryScrollView.setContentOffset(bottomOffset, animated: true)
    }
}
