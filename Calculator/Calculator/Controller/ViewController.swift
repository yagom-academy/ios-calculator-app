//  Calculator - ViewController.swift
//  Created by 레옹아범.


import UIKit

class ViewController: UIViewController {
    
    private var isPositive: Bool = true
    
    private var currentNumber: String = "" {
        didSet {
            currentNumberLabel.text = currentNumber
        }
        willSet {
            if currentNumber.count > 20 {
            }
        }
    }
    

    @IBOutlet private weak var currentNumberLabel: UILabel!
    @IBOutlet private weak var currentOperatorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func didTapNumberButton(sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else { return }
        
        switch buttonTitle {
        case "⁺⁄₋":
            if isPositive {
                self.currentNumber = "-" + self.currentNumber
                isPositive.toggle()
            } else {
                self.currentNumber = self.currentNumber.replacingOccurrences(of: "-", with: "")
                isPositive.toggle()
            }
        case ".":
            self.currentNumber += "."
        default:
            self.currentNumber += buttonTitle
        }
    }
}

