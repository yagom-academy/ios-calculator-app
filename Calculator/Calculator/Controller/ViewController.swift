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
        OperandsLabel.text = currentLabelText
    }
    

    @IBAction func operatorButtonDidTap(_ sender: UIButton) {
         guard let operands = OperandsLabel.text,
               let operatorSign = sender.currentTitle else { return }
         
         if currentLabelText.isEmpty && operands.isEmpty {
             OperatorLabel.text = sender.currentTitle
             return
         }
   
         if let element = inputList.last {
             guard Operator(rawValue: Character(element)) == nil else {
                 OperatorLabel.text = operatorSign
                 return
             }
         }
         
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
 
}
