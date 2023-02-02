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
    

    //버튼탭
    @IBAction func buttonTapped(sender: UIButton) {
        guard let Inputtedtitle = sender.titleLabel?.text else { return }
        
        switch Inputtedtitle {
        case "=":
            calculateResult()
        case "AC":
            allClearButtonTapped()
        case "CE":
            clearEntryButtonTapped()
        case "⁺⁄₋":
            changeOperatorButtonTapped()
        case "÷", "×", "−", "+":
            operatorButtonTapped(sender: sender)
        case "0","1","2","3","4","5","7","8","9","00",".":
            numberButtonTapped(sender: sender)
        default:
            return
        }
        
        
    }
        func setUpView() {
            
            view.addSubview(scrollView)
            scrollView.addSubview(verticalStackViewInScroll)
            self.numberOnField.text = "0"
            self.numberInStackView.text = ""
            self.operatorInStackView.text = ""
            
        }
    
        func setUpScrollViewToBottom(){
            let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
            if(bottomOffset.y > 0) {
                self.scrollView.setContentOffset(bottomOffset, animated: true)
            }
        }
        
        func allClearButtonTapped() {}
        
        func clearEntryButtonTapped(){}
        
        func changeOperatorButtonTapped(){}
        
        func calculateResult(){}
        
   
    func numberButtonTapped(sender: UIButton) {
      
        switch sender.tag {
        case 1: inputNumbers += "1"
        case 2: inputNumbers += "2"
        case 3: inputNumbers += "3"
        case 4: inputNumbers += "4"
        case 5: inputNumbers += "5"
        case 6: inputNumbers += "6"
        case 7: inputNumbers += "7"
        case 8: inputNumbers += "8"
        case 9: inputNumbers += "9"
        case 0: inputNumbers += "0"
        case 100: inputNumbers += "00"
        case 101: inputNumbers += "."
        default:
            return
        }
        numberOnField.text = inputNumbers
    }
    
    
    func operatorButtonTapped(sender: UIButton) {
        
        var currentOper = getInputtedOperator(sender)
        
        if self.horizonStackViewVertical.subviews.isEmpty {
            currentOper = ""
        } else{
            
            self.operatorOnField.text = currentOper
            
            addNewStackView(number: inputNumbers, oper: currentOper)
            setUpScrollViewToBottom()
            self.numberOnField.text = ""
            self.inputNumbers = ""
        }
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
    

    //연산자 입력값가져오기
    func getInputtedOperator(_ sender: UIButton) -> String {
        
        var currentOperator: String = ""
        
        guard numberOnField.text != "" else {    //숫자값이 없는 처음엔 오퍼레이터값이 들어가지않는다
            return currentOperator
        }
        
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
    

