//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    enum NumberButton: CustomStringConvertible {
        case one, two, three, four, five, six, seven,
             eight, nine, zero, doubleZero
        
        var description: String {
            switch self {
            case .one: return "1"
            case .two: return "2"
            case .three: return "3"
            case .four: return "4"
            case .five: return "5"
            case .six: return "6"
            case .seven: return "7"
            case .eight: return "8"
            case .nine: return "9"
            case .zero: return "0"
            case .doubleZero: return "00"
            }
        }
    }
    var calculator = Calculator()
    
    @IBOutlet var numberInputLabel: UILabel!
    @IBOutlet var operatorInputLabel: UILabel!
    @IBOutlet weak var CalculationStackView: UIStackView!
    @IBOutlet weak var CalculationStackScrollView: UIScrollView!
    
    @IBAction func clickNumberOneButton(_ sender: UIButton) {
    }
    @IBAction func clickNumberTwoButton(_ sender: UIButton) {
    }
    @IBAction func clickNumberThreeButton(_ sender: UIButton) {
    }
    @IBAction func clickNumberFourButton(_ sender: UIButton) {
    }
    @IBAction func clickNumberFiveButton(_ sender: UIButton) {
    }
    @IBAction func clickNumberSixButton(_ sender: UIButton) {
    }
    @IBAction func clickNumberSevenButton(_ sender: UIButton) {
    }
    @IBAction func clickNumberEightButton(_ sender: UIButton) {
    }
    @IBAction func clickNumberNineButton(_ sender: UIButton) {
    }
    @IBAction func clickNumberZeroButton(_ sender: UIButton) {
    }
    @IBAction func clickNumberDoubleZeroButton(_ sender: UIButton) {
    }
    @IBAction func clickDotButton(_ sender: UIButton) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickPlusOperatorButton(_ sender: UIButton) {
    }
    @IBAction func clickMinusOperatorButton(_ sender: UIButton) {
    }
    @IBAction func clickMultiplyOperatorButton(_ sender: UIButton) {
    }
    @IBAction func clickDivideOperatorButton(_ sender: UIButton) {
    }
    @IBAction func clickEqualOperatorButton(_ sender: UIButton) {
    }
    
    @IBAction func clickAllClearButton(_ sender: UIButton) {
    }
    
    @IBAction func clickClearEntryButton(_ sender: UIButton) {
    }
    
    @IBAction func clickToggleSignButton(_ sender: UIButton) {
    }
}
