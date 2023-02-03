//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UIButton Outlet
    @IBOutlet var operandsButton: [UIButton]!
    @IBOutlet var operatorsButton: [UIButton]!
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearEntryButton: UIButton!
    @IBOutlet weak var changSignButton: UIButton!
    @IBOutlet weak var calculationButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    
    //MARK: - UILabel Outlet
    @IBOutlet weak var inputOperandsLabel: UILabel!
    @IBOutlet weak var inputOperatorsLabel: UILabel!
    @IBOutlet var stackView: UIStackView!
    
    enum Sign {
        static let dot = "."
        static let blank = " "
        static let nothing = ""
        static let minus = "-"
        static let zero = "0"
    }
    
    let operrands = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "00"]
    let operators = ["+", "−", "÷", "×"]
    var currentInputFormula: [String] = []
    var oldInputFormula: [String] = []
    var currentTappedNumber: String = Sign.nothing
    var IsOperatortapped: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        allocateOperrandsTag()
        allocateOperatorsTag()

    }
    
    func makeStackView(_ operatorSign: String, _ operand: String) -> UIStackView {
        let view = UIStackView()
        let operandLabel = UILabel()
        let operatorLabel = UILabel()
        
        operatorLabel.text = operatorSign
        operatorLabel.textColor = .white
        operandLabel.text = operand
        operandLabel.textColor = .white
        
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 8

        view.addArrangedSubview(operatorLabel)
        view.addArrangedSubview(operandLabel)
        //[operatorLabel, operandLabel].forEach(view.addArrangedSubview(_:))

        return view
    }
    
    func printex(){
        print("current: \(currentInputFormula)")
        print("old: \(oldInputFormula)")
    }
    
    func allocateOperrandsTag() {
        for index in 0..<operandsButton.count {
            operandsButton[index].tag = index
        }
    }
    
    func allocateOperatorsTag() {
        for index in 0..<operatorsButton.count {
            operatorsButton[index].tag = index
        }
    }
    
    @IBAction func operandsButtonDidTapped(_ sender: UIButton) {
        let number = operrands[sender.tag]
        
        if currentInputFormula.isEmpty {
            currentInputFormula.append(number)
        } else {
            currentInputFormula.append(number)
        }
        
        let currentOperand = currentInputFormula.last
        IsOperatortapped = false
        inputOperandsLabel.text = currentOperand
        printex()
    }
    
    // 1. 숫자누르고 +- 눌렀을때 -숫자 나오게
    // 2. 처음 숫자 누르고 스택뷰에 연산자없이 숫자만 입력 o
    // 3. 아무것도 입력하지 않은 0일때 연산자누르면 연산자 한번만 입력
    // 4. ac시 스택뷰 리셋
    @IBAction func operatorsButtonDidTapped(_ sender: UIButton) {
        var newStackView: UIStackView = UIStackView()
        
        inputOperatorsLabel.text = operators[sender.tag]
        
        
        guard let currentSign = inputOperatorsLabel.text,
                let lastElement = currentInputFormula.last else { return }
        
        // 연산자 입력 시 동작?
        // 1. inputOperandsLabel에 입력된 숫자가 currentFormula로 들어감
        // 2. (처음 입력한 값이라면) stackView에 operator 비우고 operand자리에만 숫자 들어감 ㅇ
        // 3. 0을 입력하지 않았을때 inputOperator가 0이라면 연산자는 마지막에 누른 한개만 들어감

        if IsOperatortapped == false {
            if currentInputFormula.count == 1 {
                newStackView = makeStackView(Sign.nothing, lastElement)
            }
            else if currentInputFormula.count != 0 && currentInputFormula.count > 1 {
                let oldOperator = currentInputFormula[currentInputFormula.count-3]
                newStackView = makeStackView(oldOperator, lastElement)
            }
            currentInputFormula.append(Sign.blank)
            currentInputFormula.append(currentSign)
            currentInputFormula.append(Sign.blank)
        
            IsOperatortapped = true
        }
        /*
        else if oldInputFormula != Sign.nothing {
            print("if")
            newStackView = makeStackView(currentSign, splitedOperand)
            currentInputFormula = oldInputFormula + Sign.blank + currentSign + Sign.blank
            printex()
            
        } else if oldInputFormula == Sign.nothing {
            newStackView = makeStackView(currentSign, splitedOperand)
            inputOperandsLabel.text = currentOperand
            currentInputFormula = currentInputFormula + Sign.blank + currentSign + Sign.blank
            
        } else {
            newStackView = makeStackView(currentSign, splitedOperand)
            inputOperandsLabel.text = currentOperand
            currentInputFormula = currentInputFormula + Sign.blank + currentSign + Sign.blank
        }
        
        else if inputOperandsLabel.text == Sign.zero && currentTappedNumber != Sign.zero {
            //currentsign만! 바뀜
            currentInputFormula = oldInputFormula + Sign.blank + currentSign + Sign.blank
            printex()
        } else {
            currentInputFormula = currentInputFormula + Sign.blank + currentSign + Sign.blank
            printex()
            let newStackView = makeStackView(currentSign, currentTappedNumber)
        }
        */
        
        
        inputOperandsLabel.text = Sign.zero
        
        print("스택뷰 연산자: \(currentSign)")
        print("스택뷰 피연산자: \(currentInputFormula)")
       
        stackView.addArrangedSubview(newStackView)
    }
    
    
    
    @IBAction func dotButtonDidTapped(_ sender: UIButton) {
        if let lastElement = currentInputFormula.last {
            if lastElement.hasSuffix(".") {
                print("lastElement: \(lastElement)")
            } else {
                currentInputFormula[currentInputFormula.count-1] += Sign.dot
            }
        } else if currentInputFormula.isEmpty {
            currentInputFormula.append(Sign.zero + Sign.dot)
            print(currentInputFormula)
        }
            
            
//        if currentInputFormula.last == "." {
//            printex()
//        } else {
//            currentInputFormula[currentInputFormula.count-1] += Sign.dot
//            printex()
//        }
    }
    
    @IBAction func calculationButtonDidTapped(_ sender: UIButton) {
        let stringFormula = currentInputFormula.joined(separator: "")
        print("stringformula :\(stringFormula)")
        var parsedFormula = ExpressionParser.parse(from: stringFormula)
        let result = parsedFormula.result()
        IsOperatortapped = false
        inputOperandsLabel.text = String(result)
        oldInputFormula.append(String(result))
        
        printex()
    }
    
    @IBAction func allClearButtonDidTapped(_ sender: UIButton) {
        currentInputFormula = []
        oldInputFormula = []
        //stackView.removeArrangedSubview(newStackView)
        printex()
    }
    
    @IBAction func changeSignButtonDidTapped(_ sender: UIButton) {

    }
    
    @IBAction func clearEntryButtonDidTapped(_ sender: UIButton) {
        inputOperandsLabel.text = Sign.zero
        printex()
    }
}
