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
    @IBOutlet weak var operatorStackLabel: UILabel!
    @IBOutlet weak var operatorStackLabel2: UILabel!
    
    @IBOutlet weak var previousValues: UIScrollView!
    @IBOutlet weak var valuesStackView: UIStackView!
    
    var inputValue: String = ""
    var presentNumbers: String = ""
    var operatorStorage: [String] = []
    var operatorChoice: String = ""
    
    let numberFormatter = NumberFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = "0"
        operatorLabel.text = ""
        numberStackLabel.removeFromSuperview()   
        numberStackLabel2.removeFromSuperview()
        operatorStackLabel.removeFromSuperview()
        operatorStackLabel2.removeFromSuperview()
        
        numberFormatter.roundingMode = .floor
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 3
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        let ButtonTitle = sender.currentTitle!
        
        if operatorStorage.isEmpty != true {
            operatorChoice += operatorStorage.removeLast()
            inputValue += presentNumbers
            inputValue += " \(operatorChoice) "
            
            print("presentNumberArray: ", presentNumbers)
            print("inputValue: ",  inputValue)
            print( "\(operatorChoice) ")
            
            presentNumbers = ""
            operatorChoice = ""
            operatorStorage = []
            
            presentNumbers += "\(ButtonTitle)"
            numberLabel.text = "\(ButtonTitle)"
            
        } else if presentNumbers.contains(".") && ButtonTitle == "." {
            return
            
        } else {
            presentNumbers += "\(ButtonTitle)"
            numberLabel.text = "\(presentNumbers)"
            
            print(presentNumbers)
            
        }
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        let ButtonTitle = sender.currentTitle!

        operatorLabel.text = "\(ButtonTitle)"

        if ["+", "−", "÷", "×"].contains(ButtonTitle) && !presentNumbers.isEmpty {
            let stackView = UIStackView()
            let stackNumberLabel = UILabel()
            let stackOperatorLabel = UILabel()
            
            let bottomOffset = CGPoint(x: 0,
                                       y: previousValues.contentSize.height
                                       - previousValues.bounds.height
                                       + numberLabel.font.lineHeight)
            previousValues.setContentOffset(bottomOffset, animated: false)
            stackNumberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
            stackNumberLabel.textColor = .white
            stackOperatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
            stackOperatorLabel.textColor = .white
            
            operatorStorage.append(" \(ButtonTitle) ")
            
            print(operatorStorage)

            stackNumberLabel.text = "\(presentNumbers)"
            stackOperatorLabel.text = "\(ButtonTitle) "
            
            stackView.addArrangedSubview(stackOperatorLabel)
            stackView.addArrangedSubview(stackNumberLabel)
            valuesStackView.addArrangedSubview(stackView)
            numberLabel.text = "0"
            
        } else if ["="].contains(ButtonTitle) {
            inputValue += presentNumbers
            
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
            presentNumbers = ""
            
        }
    }
    
    @IBAction func touchOptionButton(_ sender: UIButton) {
        let ButtonTitle = sender.currentTitle!
        
        if ["AC"].contains(ButtonTitle) {
            presentNumbers = ""
            inputValue = ""
            numberLabel.text = "0"
            operatorLabel.text = ""
            valuesStackView.subviews.forEach { views in
                views.removeFromSuperview()
            }
        } else if ["CE"].contains(ButtonTitle) {
            presentNumbers = ""
            numberLabel.text = "0"
            print(presentNumbers)
            
        } else if ["⁺⁄₋"].contains(ButtonTitle) && presentNumbers != "0" {
            if presentNumbers.contains("-") {
               presentNumbers = presentNumbers.filter { word in
                    if word == "-"{
                        return false
                    }
                    return true
                }
            } else {
                presentNumbers = "-" + presentNumbers
            }
            numberLabel.text = "\(presentNumbers)"
            print(presentNumbers)
        }
    }
    
}

