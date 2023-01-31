//  Calculator - ViewController.swift
//  Created by 레옹아범.


import UIKit

class ViewController: UIViewController {
    
    private let numberFormatter = NumberFormatter()
    private var currentNumber: String = "" {
        willSet {
            guard let value = Double(newValue),
                  let labelText = self.numberFormatter.string(from: NSNumber(floatLiteral: value)) else { return }
            
            self.currentNumberLabel.text = labelText
        }
    }
    
    @IBOutlet private weak var currentNumberLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNumberFormatter()
    }
    
    func setNumberFormatter() {
        self.numberFormatter.numberStyle = .decimal
    }
    
    func resetCurrentNumberLabel() {
        self.currentNumber = ""
        self.currentNumberLabel.text = "0"
    }

    @IBAction private func didTapNumberButton(sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        
        self.currentNumber += buttonTitle
    }
    
    @IBAction private func didTapOperatorButton(sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        
        self.currentOperatorLabel.text = buttonTitle
        
        resetCurrentNumberLabel()
    }
    
    @IBAction private func didTapClearButton(sender: UIButton) {
        resetCurrentNumberLabel()
    }
    
    @IBAction private func didTapAllClearButton(sender: UIButton) {
        
    }
    
    @IBAction private func didTapCalculateButton(sender: UIButton) {
        
    }
}

