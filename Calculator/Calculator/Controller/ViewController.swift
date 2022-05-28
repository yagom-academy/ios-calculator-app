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
    
    var inputValue: String = ""
    
    var presentNumberString: String = ""
    var opperArray: [String] = []
    var opperString: String = ""
    
    let numberFormatter = NumberFormatter()
    let stackNumberLabel = UILabel()
    let stackOperatorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberStackLabel.isHidden = true
        numberStackLabel2.isHidden = true
        opperLabel.isHidden = true
        opperLabel2.isHidden = true
        let bottomOffset = CGPoint(x: 0, y: previousValues.contentSize.height - previousValues.bounds.height + numberLabel.font.lineHeight)
        previousValues.setContentOffset(bottomOffset, animated: false)
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        let ButtonTitle = sender.currentTitle!
        
        if opperArray.isEmpty != true {
            opperString += opperArray.removeLast()
            inputValue += presentNumberString
            inputValue += " \(opperString) "
            
            print("presentNumberArray: ", presentNumberString)
            print("inputValue: ",  inputValue)
            print( "\(opperString) ")
            
            presentNumberString = ""
            
            opperString = ""
            opperArray = []
            
            presentNumberString += "\(ButtonTitle)"
            numberLabel.text = "\(ButtonTitle)"
            
        } else {
            presentNumberString += "\(ButtonTitle)"
            numberLabel.text = "\(presentNumberString)"
            
            print(presentNumberString)
            
        }
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        let ButtonTitle = sender.currentTitle!


        numberFormatter.maximumSignificantDigits = 3
        
        stackNumberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackNumberLabel.textColor = .white
        
        stackOperatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        stackOperatorLabel.textColor = .white
        let stackView = UIStackView()

        if ["+", "−", "÷", "×"].contains(ButtonTitle) {
            opperArray.append(" \(ButtonTitle) ")
            operatorLabel.text = "\(ButtonTitle)"
            
            print(opperArray)
                    
            stackNumberLabel.text = "\(presentNumberString)"
            stackOperatorLabel.text = "\(ButtonTitle) "
            
            stackNumberLabel.adjustsFontForContentSizeCategory = true
            stackOperatorLabel.adjustsFontForContentSizeCategory = true
            
            valuesStackView.addArrangedSubview(stackView)
            stackView.addArrangedSubview(stackOperatorLabel)
            stackView.addArrangedSubview(stackNumberLabel)

        } else if ["="].contains(ButtonTitle) {
            inputValue += presentNumberString
            
            print(inputValue)
            
            if !inputValue.isEmpty {
                var parse = ExpressionParser.parse(from: (inputValue))
                let result = try! parse.result()
                guard let NSNresult = numberFormatter.string(from: result as NSNumber) else {
                    return
                }
                numberLabel.text = "\(NSNresult)"
                
                print(result)
                print("----")
            }

            inputValue = ""
            presentNumberString = ""
        }
    }
    
    @IBAction func touchOptionButton(_ sender: UIButton) {
        let ButtonTitle = sender.currentTitle!
        
        if ["AC"].contains(ButtonTitle) {
            inputValue = ""
            presentNumberString = ""
            
        } else if ["CE"].contains(ButtonTitle) {
            presentNumberString = ""
            
            print(presentNumberString)
            
        } else if ["⁺⁄₋"].contains(ButtonTitle) {
            presentNumberString = String((Int(presentNumberString) ?? 0) * -1)
            numberLabel.text = "\(presentNumberString)"
            print(presentNumberString)
            
        }
    }
    
}

