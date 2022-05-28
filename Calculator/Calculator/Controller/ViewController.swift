//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet var inputNumberButtons: [UIButton]!
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    @IBOutlet weak var numberStackLabel: UILabel!
    @IBOutlet weak var numberStackLabel2: UILabel!
    @IBOutlet weak var opperLabel: UILabel!
    @IBOutlet weak var opperLabel2: UILabel!
    
    @IBOutlet weak var previousValues: UIScrollView!
    @IBOutlet weak var valuesStackView: UIStackView!

    var inputString: String = "0"
    
    var presentNumberString: String = ""
    var opperArray: [String] = []
    var opperString: String = ""
    var flag: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numberStackLabel.isHidden = true
        numberStackLabel2.isHidden = true
        opperLabel.isHidden = true
        opperLabel2.isHidden = true
    }
    
    override func viewWillLayoutSubviews() {
        let bottomOffset = CGPoint(x: 0, y: previousValues.contentSize.height - previousValues.bounds.height + numberStackLabel.font.lineHeight)
        previousValues.setContentOffset(bottomOffset, animated: true)
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        let digit = sender.currentTitle!

        if opperArray.isEmpty != true {
            opperString += opperArray.removeLast()
            inputString += presentNumberString
            inputString += " \(opperString) "
            
            print("presentNumberArray: ", presentNumberString)
            print("inputStirng: ", inputString)
            print( "\(opperString) ")
            
            presentNumberString = ""

            opperString = ""
            opperArray = []
            
            presentNumberString += "\(digit)"
            numberLabel.text = "\(digit)"

        } else {
            presentNumberString += "\(digit)"
            numberLabel.text = "\(presentNumberString)"

            print(presentNumberString)
        }
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .white
        
        let label2 = UILabel()
        label2.font = UIFont.preferredFont(forTextStyle: .title3)
        label2.textColor = .white
        
        
        if ["+", "−", "÷", "×"].contains(digit) {
            opperArray.append(" \(digit) ")
            operatorLabel.text = "\(digit)"
            
            print(opperArray)
            
            let stackView = UIStackView()
            valuesStackView.addArrangedSubview(stackView)
            
            label.text = "\(presentNumberString)"
            label.adjustsFontForContentSizeCategory = true

            label2.text = "\(digit) "
            label2.adjustsFontForContentSizeCategory = true
            stackView.axis = .horizontal
            stackView.addArrangedSubview(label2)
            stackView.addArrangedSubview(label)
            
        } else if ["="].contains(digit) {
            inputString += presentNumberString
            
            print(inputString)
            
            var parse = ExpressionParser.parse(from: (inputString))
            let result = try! parse.result()
            numberLabel.text = "\(result)"

            print(result)
            print("----")
            
            inputString = "\(result)"
            presentNumberString = ""
            flag = 1
        }
    }
    
    @IBAction func touchOptionButton(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if ["AC"].contains(digit) {
            inputString = "0"
            presentNumberString = ""
    
        } else if ["CE"].contains(digit) {
            presentNumberString = ""

            print(presentNumberString)

        } else if ["⁺⁄₋"].contains(digit) {
            presentNumberString = String((Int(presentNumberString) ?? 0) * -1)
            numberLabel.text = presentNumberString
            print(presentNumberString)
            
        }
    }
    
}

