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
    }
    
    private func applyNumberFormatter() {
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
    }
    
    @IBAction func touchUpACButton(_ sender: UIButton) {
        stringOperators = empty
        operatorLabel.text = stringOperators
        stringNumbers = empty
        operandsLabel.text = zero
        recentNumbersStackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
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
        let recentOperatorLabel = UILabel()
        recentOperatorLabel.text = stringOperators
        recentOperatorLabel.textColor = .white
        stringOperators = sender.titleLabel?.text ?? ""
        operatorLabel.text = stringOperators
        let recentOperandsLabel = UILabel()
        recentOperandsLabel.text = stringNumbers
        recentOperandsLabel.textColor = .white
        stringNumbers = zero
        operandsLabel.text = stringNumbers
        
        let stackView: UIStackView = .init(arrangedSubviews: [recentOperatorLabel, recentOperandsLabel])
        
        recentNumbersStackView.addArrangedSubview(stackView)
        recentNumbersScrollView.layoutIfNeeded()
        recentNumbersScrollView.setContentOffset(CGPoint(x: 0, y: recentNumbersScrollView.contentSize.height - recentNumbersScrollView.bounds.height), animated: false)
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        guard stringNumbers.count < 20 else { return }
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumSignificantDigits = 20
        
        if operandsLabel.text == zero {
            stringNumbers = sender.titleLabel?.text ?? ""
            operandsLabel.text = stringNumbers
        } else {
            stringNumbers += sender.titleLabel?.text ?? ""
            guard let stringNumber = Double(stringNumbers),
                  let number = numberFormatter.string(from: NSNumber(value: stringNumber)) else { return }
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
        
        // 숫자 개수가 3개씩 될때마다 . 찍어줘
        
    }
}

