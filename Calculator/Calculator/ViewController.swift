//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var operandLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    private let numberFormatter = NumberFormatter()
    private var digitIsSelecting: Bool = false
    private var dotIsClicked: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuareUI()
    }
    
    private func configuareUI() {
        operandLabel.text = NameSpace.zero
        
        numberFormatter.numberStyle = .decimal
    }

    @IBAction func digitButtonTapped(_ sender: UIButton) {
        guard let lhs = operandLabel.text, let rhs = sender.currentTitle else { return }
        
        if dotIsClicked {
            operandLabel.text = lhs + rhs
        } else if digitIsSelecting {
            formatInDigitSelecting(lhs: lhs, rhs: rhs)
        } else {
            operandLabel.text = rhs
        }
        
        digitIsSelecting = true
    }
    
    private func formatInDigitSelecting(lhs: String, rhs: String) {
        guard let lhsInt = numberFormatter.number(from: lhs) as? Int, let rhsInt = Int(rhs) else { return }
        
        var digit: Int = .zero
        
        switch rhs {
        case NameSpace.zero:
            digit = lhsInt * 10
        case NameSpace.doubleZero:
            digit = lhsInt * 100
        default:
            digit = lhsInt * 10 + rhsInt
        }
        
        operandLabel.text = numberFormatter.string(for: digit)
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        guard let lhs = operandLabel.text, let rhs = sender.currentTitle else { return }
        
        guard !dotIsClicked else { return }
        
        operandLabel.text = lhs + rhs
        dotIsClicked = true
    }
    
    @IBAction func signChangedButton(_ sender: UIButton) {
        guard var digit = operandLabel.text, digit != NameSpace.zero else { return }
        
        if digit.first == Character(NameSpace.minus) {
            digit.removeFirst()
            operandLabel.text = digit
        } else {
            operandLabel.text = NameSpace.minus + digit
        }
    }
    
    @IBAction func operatorsButtonTapped(_ sender: UIButton) {
        operatorLabel.text = sender.currentTitle
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        operandLabel.text = NameSpace.zero
        digitIsSelecting = false
        dotIsClicked = false
    }
}
