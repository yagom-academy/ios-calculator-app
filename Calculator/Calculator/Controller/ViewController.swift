//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var OperatorLabel: UILabel!
    @IBOutlet weak var OperandsLabel: UILabel!
    @IBOutlet var containerStackView: UIStackView!
    @IBOutlet var scrollView: UIScrollView!
    
    private var isDotClicked: Bool = false
    private var currentLabelText: String = ""
    private var inputList: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OperandsLabel.text = "0"
    }

    @IBAction func operandsButtonDidTap(_ sender: UIButton) {
        guard let inputNumber = sender.currentTitle else { return }
        
        switch inputNumber {
        case "0", "00":
            if currentLabelText.isEmpty {
                currentLabelText = "0"
                OperandsLabel.text = "0"
                return
            } else if currentLabelText == "0" { return }
            currentLabelText += inputNumber
            
        default: currentLabelText += inputNumber
        }
        
        //formatNumber(currentLabelText)
        OperandsLabel.text = formatNumber(currentLabelText)
    }
    

    @IBAction func operatorButtonDidTap(_ sender: UIButton) {
         guard let formattedOperands = OperandsLabel.text,
               let operatorSign = sender.currentTitle else { return }
         
         if currentLabelText.isEmpty && formattedOperands.isEmpty {
             OperatorLabel.text = sender.currentTitle
             return
         }
   
         if let element = inputList.last {
             guard Operator(rawValue: Character(element)) == nil else {
                 OperatorLabel.text = operatorSign
                 return
             }
         }
         
         let operands = restorationNumber(formattedOperands)
         updateScrollView()
         inputList.append(operands)
             
         guard let lastInput = inputList.last,
               let _ = Double(lastInput) else { return }
         
         inputList.append(operatorSign)
         OperatorLabel.text = operatorSign
         currentLabelText.removeAll()
         OperandsLabel.text = "0"
     }
    
    private func updateScrollView() {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .trailing
        stack.distribution = .fill
        stack.spacing = 8
        
        let `operator` = UILabel()
        `operator`.text = OperatorLabel.text
        `operator`.textColor = .white
        
        let operands = UILabel()
        operands.text = OperandsLabel.text
        operands.textColor = .white
        
        stack.addArrangedSubview(`operator`)
        stack.addArrangedSubview(operands)
        
        containerStackView.addArrangedSubview(stack)
        scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height), animated: true)
    }
 
    @IBAction func calculateButtonDidTap(_ sender: UIButton) {
           guard currentLabelText.isEmpty == false,
                 let operatorSign = OperatorLabel.text  else { return }
           inputList.removeLast()
           inputList.append(operatorSign)
           
           updateScrollView()
           inputList.append(currentLabelText)
           
           let calculate = inputList.reduce("") { current, next in current + " " + next}
           
           var formula = ExpressionParser.parse(from: calculate)
           guard let result = formula.result(),
                 result.isNaN == false  else {
               OperandsLabel.text = Double.nan.description
               isDotClicked = false
               
               inputList.removeAll()
               currentLabelText.removeAll()
               OperatorLabel.text = ""
               return
           }
         
           let intResult = Int(result)
                
           inputList.removeAll()
           currentLabelText.removeAll()
           OperatorLabel.text = ""
           
           if result == Double(intResult) {
               OperandsLabel.text = formatNumber(intResult.description)
               isDotClicked = false
           } else {
               OperandsLabel.text = formatNumber(result.description) 
               isDotClicked = true
           }
       }
    
    @IBAction func allClearButtonDidTap(_ sender: UIButton) {
        inputList.removeAll()
        currentLabelText.removeAll()
        OperatorLabel.text?.removeAll()
        OperandsLabel.text?.removeAll()
        containerStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }

    @IBAction func clearCurrentOperands(_ sender: UIButton) {
        currentLabelText.removeAll()
        OperandsLabel.text = "0"
    }
    
    @IBAction func changeNumberSign(_ sender: UIButton) {
        guard var operands = OperandsLabel.text,
              operands != "0"  else { return }
        
        if operands.first == "-" {
            operands.removeFirst()
        } else {
            operands = "-" + operands
        }
        currentLabelText = operands
        OperandsLabel.text = operands
    }
    
    @IBAction func dotButtonDidTap(_ sender: UIButton) {
        if currentLabelText.isEmpty {
            currentLabelText = "0."
            OperandsLabel.text = currentLabelText
        } else if isDotClicked == false {
            currentLabelText += "."
            OperandsLabel.text = currentLabelText
            isDotClicked = true
        } else if isDotClicked == true {
            return
        }
    }
    
    private func formatNumber(_ stringNumber: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 6
        guard let number = Double(stringNumber) else { return ""}
 
        let result = formatter.string(from: NSNumber(value: number)) ?? ""
        return result
    }
    
    private func restorationNumber(_ formattedNumber: String) -> String {
        let result = formattedNumber.split(with: ",").joined()
        return result
    }
    
}
