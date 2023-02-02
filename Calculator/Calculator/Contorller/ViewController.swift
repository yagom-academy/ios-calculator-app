//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {
    
    private var inputNumbers = "" // 숫자값을 담을 스트링
    private var isFirstComponents: Bool {
        return self.verticalStackViewInScroll.subviews.isEmpty
        }
    
    @IBOutlet weak var numberOnField: UILabel!
    
    @IBOutlet weak var operatorOnField: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var verticalStackViewInScroll: UIStackView!

    @IBOutlet weak var horizonStackViewVertical: UIStackView!
    
    @IBOutlet weak var operatorInStackView: UILabel!
    
    @IBOutlet weak var numberInStackView: UILabel!
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
        setUpView()
        setUpComponentsOnField()
        
    }

    @IBAction func allClearButtonTapped(_ sender: Any) {
        
        var queueStack = CalculatorItemQueue<String>()
        queueStack.removeAll()
    }

    
    @IBAction func clearEntryButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func changeOperatorButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func calculateResult(_ sender: Any) {
 
    }
    
    //버튼탭
    @IBAction func operButtonTapped(_ sender: UIButton) {
       
        let currentOper = getInputtedOperator(sender)

        
        if currentOper.isEmpty == false {
            self.operatorOnField.text = currentOper
            
            addNewStackView(number: inputNumbers, oper: currentOper)
        }
     
        self.numberOnField.text = ""
        self.inputNumbers = ""
        
    }
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        numberOnField.text = getInputtedNumber(sender)
       
    }
    
    func setUpView() {
        view.addSubview(scrollView)
        scrollView.addSubview(verticalStackViewInScroll)
        self.numberOnField.text = "0"
        self.numberInStackView.text = ""
        self.operatorInStackView.text = ""
    }
    
    func setFirstStackView (number: String, oper: String) {
        
        numberInStackView.text = number
        operatorInStackView.text = oper
        verticalStackViewInScroll.addSubview(horizonStackViewVertical) // ?
    }
    
    func addNewStackView(number: String, oper: String) {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        
        let createdOperLabel = UILabel()
            createdOperLabel.text = oper
            createdOperLabel.textColor = .white
            createdOperLabel.font = UIFont.systemFont(ofSize: 20)
    
        let createdNumberLabel = UILabel()
            createdNumberLabel.text = number
            createdNumberLabel.textColor = .white
            createdNumberLabel.font = UIFont.systemFont(ofSize: 20)
        
        [createdOperLabel, createdNumberLabel].map {
            stackView.addArrangedSubview($0)
        }

        self.verticalStackViewInScroll.addArrangedSubview(stackView)
        
    }
    
    func setUpComponentsOnField() {
        numberOnField.text = ""
        operatorOnField.text = ""
    }
    
    //숫자 입력값 가져오기
    func getInputtedNumber(_ sender: UIButton) -> String {
            
        var currentInputNumber: String = ""
        
        switch sender.tag {
        case 1: currentInputNumber += "1"
        case 2: currentInputNumber += "2"
        case 3: currentInputNumber += "3"
        case 4: currentInputNumber += "4"
        case 5: currentInputNumber += "5"
        case 6: currentInputNumber += "6"
        case 7: currentInputNumber += "7"
        case 8: currentInputNumber += "8"
        case 9: currentInputNumber += "9"
        case 0: currentInputNumber += "0"
        case 100: currentInputNumber += "00"
        case 101: currentInputNumber += "."
        default: return ""
        }
        
        inputNumbers += currentInputNumber
        return inputNumbers
    }

    //연산자 입력값가져오기
    func getInputtedOperator(_ sender: UIButton) -> String {
        
        var currentOperator: String = ""
        
        switch sender.titleLabel?.text {
        case "+": currentOperator += "+"
        case "−": currentOperator += "−"
        case "÷": currentOperator += "÷"
        case "×": currentOperator += "×"
        default:
            break
        }
        
        return currentOperator
    }
        
}
    

