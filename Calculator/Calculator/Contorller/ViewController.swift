//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit


class ViewController: UIViewController {
    
    private var inputNumbers: String = ""
    private var calcuateComponents: String = ""
    
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
    }
    
    //버튼탭
    @IBAction func buttonTapped(sender: UIButton) {
        guard let Inputtedtitle = sender.titleLabel?.text else { return }
        
        switch Inputtedtitle {
        case "=":
            calculateResult()
        case "AC":
            allClear()
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
    
    private func setUpView() {
        view.addSubview(scrollView)
        scrollView.addSubview(verticalStackViewInScroll)
        allClear()
        
    }
    
    private func setUpScrollViewToBottom(){
        let bottomOffset = CGPoint(x: 0, y: self.scrollView.contentSize.height - self.scrollView.bounds.size.height)
        if(bottomOffset.y > 0) {
            self.scrollView.setContentOffset(bottomOffset, animated: true)
        }
    }
    
    private func allClear() {
        self.numberOnField.text = "0"
        self.inputNumbers = ""
        self.calcuateComponents = ""
        resetAllStackView()
    }
    
    private func clearEntryButtonTapped(){}
        
    private func changeOperatorButtonTapped(){}
        
    private func calculateResult(){}
        
   
    private func numberButtonTapped(sender: UIButton) {
      
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
    
    
    private func operatorButtonTapped(sender: UIButton) {
        
        guard let inputtedOperator = sender.titleLabel?.text else { return }
        guard let currentOper = operatorOnField.text else { return }
        
        operatorOnField.text = inputtedOperator
        
        if calcuateComponents == "" {
                    calcuateComponents += inputNumbers
                    addNewStackView(number: inputNumbers, oper: currentOper)
                } else {
                    calcuateComponents += currentOper + inputNumbers
                    addNewStackView(number: inputNumbers, oper: currentOper)
            self.numberOnField.text = ""
            self.inputNumbers = ""
        }
    }
    
    private func addNewStackView(number: String, oper: String) {
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
    
    private func resetAllStackView() {
        verticalStackViewInScroll.subviews.forEach { $0.removeFromSuperview() }
    }
    
    

}
    

