//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var currentPhase: CalculatorPhase = .EmptyScrollViewWithoutInput
    
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
    
    @IBOutlet weak var inputHistoryStackView: UIStackView!

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
    
    func runButtonAction(delegate: ButtonActionDelegate, button: UIButton) {
        switch currentPhase {
        case .EmptyScrollViewWithoutInput:
            delegate.runActionInPhase0(viewController: self, button: button)
        case .EmptyScrollViewWithInput:
            delegate.runActionInPhase1(viewController: self, button: button)
        case .NotEmptyScrollViewWithoutInput:
            delegate.runActionInPhase2(viewController: self, button: button)
        case .NotEmptyScrollViewWithInput:
            delegate.runActionInPhase3(viewController: self, button: button)
        case .needToAllClear:
            delegate.runActionInPhase4(viewController: self, button: button)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addInputHistory() {
        let operatorText = operatorLabel.text ?? ""
        let valueText = valueLabel.text ?? ""
        
        let inputHistory = UILabel()

        if operatorLabel.text == "" {
            inputHistory.text = valueLabel.text
        } else {
            inputHistory.text = "\(operatorText) \(valueText)"
        }
        
        inputHistoryStackView.addArrangedSubview(inputHistory)
    }
    
    func clearInputHistory() {
        inputHistoryStackView.subviews.forEach {
            inputHistoryStackView.removeArrangedSubview($0)
        }
    }
}

