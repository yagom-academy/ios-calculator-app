//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var inputNumber = Number()
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var operatorLabel: UILabel!
    @IBOutlet var expressionStack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = inputNumber.value
    }
    
    @IBAction func touchNumberButton(_ sender: UIButton) {
        inputNumber.updateValue(with: sender.title(for: .normal)!)
        numberLabel.text = inputNumber.value
    }
    
    @IBAction func touchCEbutton(_ sender: UIButton) {
        inputNumber.reset()
        numberLabel.text = inputNumber.value
    }
    
    @IBAction func touchToggleSignButton(_ sender: UIButton) {
        inputNumber.toggleSign()
        numberLabel.text = inputNumber.value
    }
    
    @IBAction func touchOperatorButton(_ sender: UIButton) {
        guard numberLabel.text != "0" else {
            operatorLabel.text = sender.title(for: .normal)
            return
        }
        let `operator` = sender.title(for: .normal)
        let operand = inputNumber.value
        
        let expressionView = expressionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        let operatorlabels = expressionView.operatorLabel(operator: `operator`!)
        let operanadlabels = expressionView.operandLabel(operand: operand)
        expressionView.addSubview(operatorlabels)
        expressionView.addSubview(operanadlabels)
        expressionStack.addArrangedSubview(expressionView)
        numberLabel.text = "0"
        inputNumber.reset()
        operatorLabel.text = `operator`
    }
    
}

class expressionView: UIView {
    var operatorlabel: UILabel?
    var operandlabel: UILabel?
    
    func operatorLabel(`operator`: String) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 60, height: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = `operator`
        label.textColor = .white
        return label
    }
    
    func operandLabel(operand: String) -> UILabel {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 60, height: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = operand
        label.textColor = .white
        return label
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func layout() {
        
    }
}

