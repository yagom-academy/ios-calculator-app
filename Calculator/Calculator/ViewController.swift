//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let doubleZero = "00"
    let zero = "0"
    let empty = ""
    var stringNumbers: String = ""
    var stringOperators: String = ""
    var fullFormula: String = ""
    let numberFormatter = NumberFormatter()
    
    @IBOutlet weak var recentNumbersStackView: UIStackView!
    @IBOutlet weak var recentNumbersScrollView: UIScrollView!
    
    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operandsLabel.text = zero
        operatorLabel.text = stringOperators
        recentNumbersStackView.arrangedSubviews.forEach {
            $0.isHidden = true
        }
        applyNumberFormatter()
    }
    
    private func makeLabel(labelText :String) -> UILabel {
        let label = UILabel()
        label.text = labelText
        label.textColor = .white
        return label
    }
    
    private func makeStackView(operatorLabel: UILabel, operandLabel: UILabel) -> UIStackView {
        let formulaStackView: UIStackView = .init(arrangedSubviews: [operatorLabel, operandLabel])
        formulaStackView.spacing = 8
        return formulaStackView
    }
    
    private func applyNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
    }
    
    private func placeScroll() {
        recentNumbersScrollView.layoutIfNeeded()
        recentNumbersScrollView.setContentOffset(CGPoint(x: 0, y: recentNumbersScrollView.contentSize.height - recentNumbersScrollView.bounds.height), animated: false)
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        stringOperators = empty
        operatorLabel.text = stringOperators
        stringNumbers = empty
        operandsLabel.text = zero
        recentNumbersStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        operandsLabel.text = zero
        fullFormula = empty
    }
    
    @IBAction func touchUpCEButton(_ sender: UIButton) {
        stringOperators = sender.titleLabel?.text ?? ""
        operatorLabel.text = stringNumbers
    }
    
    @IBAction func touchUpPositiveNegativeButton(_ sender: UIButton) {
        guard operandsLabel.text != zero else { return }
        if !stringNumbers.contains("-") {
            stringNumbers = "-\(stringNumbers)"
            operandsLabel.text = stringNumbers
        } else {
            stringNumbers.removeFirst()
            operandsLabel.text = stringNumbers
        }
    }
    
    @IBAction func touchUpOperatorsButton(_ sender: UIButton) {
        var formulaStackView = UIStackView()
        
        if fullFormula == empty {
            stringOperators = sender.titleLabel?.text ?? ""
            let operatorUILabel = makeLabel(labelText: empty)
            operatorLabel.text = stringOperators
            
            let operandsUILabel = makeLabel(labelText: stringNumbers)
            fullFormula += stringNumbers + stringOperators
            stringNumbers = zero
            operandsLabel.text = stringNumbers
            
            formulaStackView = makeStackView(operatorLabel: operatorUILabel, operandLabel: operandsUILabel)
            
        } else {
            let operatorUILabel = makeLabel(labelText: stringOperators)
            stringOperators = sender.titleLabel?.text ?? ""
            operatorLabel.text = stringOperators
            
            let operandsUILabel = makeLabel(labelText: stringNumbers)
            fullFormula += stringNumbers + stringOperators
            stringNumbers = zero
            operandsLabel.text = stringNumbers
            
            formulaStackView = makeStackView(operatorLabel: operatorUILabel, operandLabel: operandsUILabel)
        }
        
        recentNumbersStackView.addArrangedSubview(formulaStackView)
        placeScroll()
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        guard stringNumbers.count < 20 else { return }
        
        if operandsLabel.text == zero {
            stringNumbers = sender.titleLabel?.text ?? ""
            operandsLabel.text = stringNumbers
        } else {
            stringNumbers += sender.titleLabel?.text ?? ""
            let number = numberFormatter.string(for: Double(stringNumbers))
            operandsLabel.text = number
        }
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        if operandsLabel.text != zero {
            stringNumbers += doubleZero
            operandsLabel.text = stringNumbers
        }
    }
    
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        guard !stringNumbers.contains(".") else { return }
        if operandsLabel.text == zero {
            stringNumbers = zero + "."
            operandsLabel.text = stringNumbers
        } else {
            stringNumbers += "."
            operandsLabel.text = stringNumbers
        }
    }
    
    @IBAction func touchUpEqualButton(_ sender: UIButton) {
        guard operatorLabel.text != empty else { return }
        stringOperators = empty
        operatorLabel.text = stringOperators
        stringNumbers = empty
        recentNumbersStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        fullFormula += operandsLabel.text ?? ""
        operandsLabel.text = fullFormula
        
        var parsedFullFormula = ExpressionParser.parse(from: fullFormula)
        let calculatedFormula = parsedFullFormula.result()
        
        if calculatedFormula.isNaN || calculatedFormula.isInfinite {
            operandsLabel.text = "NaN"
        } else {
            operandsLabel.text = numberFormatter.string(for: calculatedFormula)
            stringNumbers = String(calculatedFormula)
        }
    }
}

