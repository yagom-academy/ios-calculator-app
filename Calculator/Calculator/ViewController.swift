//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    let zero = "0"
    let empty = ""
    var stringNumbers: String = ""
    var stringOperators: String = ""
    @IBOutlet weak var recentNumbersStackView: UIStackView!
    
    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stringNumbers = zero
        operandsLabel.text = stringNumbers
        operatorLabel.text = stringOperators
        recentNumbersStackView.arrangedSubviews.forEach {
            $0.isHidden = true
        }
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
    }
    
    @IBAction func touchUpNumberButton(_ sender: UIButton) {
        if operandsLabel.text == zero {
            stringNumbers = sender.titleLabel?.text ?? ""
            operandsLabel.text = stringNumbers
        } else {
            stringNumbers += sender.titleLabel?.text ?? ""
            operandsLabel.text = stringNumbers
        }
    }
    
    @IBAction func touchUpDoubleZeroButton(_ sender: UIButton) {
        if operandsLabel.text != zero {
            stringNumbers += "00"
            operandsLabel.text = stringNumbers
        }
    }
    @IBAction func touchUpDotButton(_ sender: UIButton) {
        if stringNumbers.last != "." && !stringNumbers.contains(".") && stringNumbers == zero {
            stringNumbers += "."
            operandsLabel.text = stringNumbers
        }
    }
}

