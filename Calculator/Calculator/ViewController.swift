//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberOneButton: UIButton!
    @IBOutlet weak var numberTwoButton: UIButton!
    @IBOutlet weak var numberThreeButton: UIButton!
    @IBOutlet weak var numberFourButton: UIButton!
    @IBOutlet weak var numberFiveButton: UIButton!
    @IBOutlet weak var numberSixButton: UIButton!
    @IBOutlet weak var numberSevenButton: UIButton!
    @IBOutlet weak var numberEightButton: UIButton!
    @IBOutlet weak var numberNineButton: UIButton!
    @IBOutlet weak var numberZeroButton: UIButton!
    @IBOutlet weak var numberZeroZeroButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    
    @IBOutlet weak var allClearButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var togglePlusMinusButton: UIButton!
    
    @IBOutlet weak var resultButton: UIButton!
    
    @IBOutlet weak var adderButton: UIButton!
    @IBOutlet weak var subtractorButton: UIButton!
    @IBOutlet weak var dividerButton: UIButton!
    @IBOutlet weak var multiplierButton: UIButton!
    
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var inputHistoryScrollView: UIScrollView!
    @IBOutlet weak var inputHistoryStackView: UIStackView!
    
    var allHistory: String {
        return inputHistoryStackView.subviews.compactMap {
            ($0 as? UILabel)?.text
        }.reduce("") {
            "\($0) \($1)"
        }
    }

    @IBAction func numberButtonHandler(_ sender: UIButton) {
        runButtonAction(delegate: NumberButtonHandler.shared, button: sender)
    }
    
    @IBAction func operatorButtonHandler(_ sender: UIButton) {
        runButtonAction(delegate: OperatorButtonHandler.shared, button: sender)
    }
    
    @IBAction func allClearButtonHandler(_ sender: UIButton) {
        runButtonAction(delegate: AllClearButtonHandler.shared, button: sender)
    }
    
    @IBAction func clearButtonHandler(_ sender: UIButton) {
        runButtonAction(delegate: ClearButtonHandler.shared, button: sender)
    }
    
    @IBAction func togglePlusMinusButtonHandler(_ sender: UIButton) {
        runButtonAction(delegate: TogglePlusMinusButtonHandler.shared, button: sender)
    }
    
    @IBAction func resultButtonHandler(_ sender: UIButton) {
        runButtonAction(delegate: ResultButtonHandler.shared, button: sender)
    }
    
    var currentPhase: CalculatorPhase = .phase0
    
    func runButtonAction(delegate: ButtonActionDelegate, button: UIButton) {
        delegate.runAction(viewController: self, button: button)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func pushInputToHistoryStack() {
        let newInput = UILabel()
        newInput.textColor = .white
        
        let `operator` = operatorLabel.text ?? ""
        let value = valueLabel.text ?? ""

        if `operator` == "" {
            newInput.text = value
        } else {
            newInput.text = "\(`operator`) \(value)"
        }
        
        inputHistoryStackView.addArrangedSubview(newInput)
        
        scrollDownToBottom()
    }
    
    func scrollDownToBottom() {
        let destinationY = inputHistoryScrollView.contentSize.height
        let destinationPoint = CGPoint(x: 0, y: destinationY)
        
        inputHistoryScrollView.setContentOffset(destinationPoint, animated: false)
    }
    
    func clearInputHistory() {
        inputHistoryStackView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func clearValueLabel() {
        valueLabel.text = "0"
    }
}

