//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var screenText: UILabel!
    
    @IBOutlet var dot: UIButton!
    @IBOutlet var num0: UIButton!
    @IBOutlet var num1: UIButton!
    @IBOutlet var num2: UIButton!
    @IBOutlet var num3: UIButton!
    @IBOutlet var num4: UIButton!
    @IBOutlet var num5: UIButton!
    @IBOutlet var num6: UIButton!
    @IBOutlet var num7: UIButton!
    @IBOutlet var num8: UIButton!
    @IBOutlet var num9: UIButton!
    @IBOutlet var plusBtn: UIButton!
    @IBOutlet var minusBtn: UIButton!
    @IBOutlet var multiplyBtn: UIButton!
    @IBOutlet var divideBtn: UIButton!
    @IBOutlet var clearBtn: UIButton!
    @IBOutlet var equalBtn: UIButton!
        
    var calculator = Calculator()

    @IBAction func numBtn(_ sender: UIButton) {
        switch sender {
        case num0:
            screenText.text = "\(num0.tag)"
            calculator.receiveInput(buttonType: String(num0.tag))
        case num1:
            screenText.text = "\(num1.tag)"
            calculator.receiveInput(buttonType: String(num1.tag))
        case num2:
            screenText.text = "\(num2.tag)"
            calculator.receiveInput(buttonType: String(num2.tag))
        case num3:
            screenText.text = "\(num3.tag)"
            calculator.receiveInput(buttonType: String(num3.tag))
        case num4:
            screenText.text = "\(num4.tag)"
            calculator.receiveInput(buttonType: String(num4.tag))
        case num5:
            screenText.text = "\(num5.tag)"
            calculator.receiveInput(buttonType: String(num5.tag))
        case num6:
            screenText.text = "\(num6.tag)"
            calculator.receiveInput(buttonType: String(num6.tag))
        case num7:
            screenText.text = "\(num7.tag)"
            calculator.receiveInput(buttonType: String(num7.tag))
        case num8:
            screenText.text = "\(num8.tag)"
            calculator.receiveInput(buttonType: String(num8.tag))
        case num9:
            screenText.text = "\(num9.tag)"
            calculator.receiveInput(buttonType: String(num9.tag))
        case dot:
            calculator.receiveInput(buttonType: ".")
        case plusBtn:
            calculator.receiveInput(buttonType: "+")
        case minusBtn:
            calculator.receiveInput(buttonType: "-")
        case multiplyBtn:
            calculator.receiveInput(buttonType: "*")
        case divideBtn:
            calculator.receiveInput(buttonType: "/")
        case equalBtn:
            calculator.receiveInput(buttonType: "=")
        case clearBtn:
            print("clear button")
            calculator.receiveInput(buttonType: "c")
        default:
            break
        }
        screenText.text = calculator.screenNumber
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        let test = BinaryCalculator()
        test.receiveInput(buttonType: "1")
        test.receiveInput(buttonType: "0")
        test.receiveInput(buttonType: "1")
        test.receiveInput(buttonType: "1")
        test.receiveInput(buttonType: "+")
        test.receiveInput(buttonType: "1")
        test.receiveInput(buttonType: "1")
        test.receiveInput(buttonType: "1")
        test.receiveInput(buttonType: "1")
        test.receiveInput(buttonType: "=")
    }

    func setup() {
        screenText.text = "0"
        
        num1.calcBtn()
        num2.calcBtn()
        num3.calcBtn()
        num4.calcBtn()
        num5.calcBtn()
        num6.calcBtn()
        num7.calcBtn()
        num8.calcBtn()
        num9.calcBtn()
        dot.calcBtn()
        
        plusBtn.operatorBtn()
        minusBtn.operatorBtn()
        multiplyBtn.operatorBtn()
        divideBtn.operatorBtn()
        clearBtn.operatorBtn()
        equalBtn.operatorBtn()
        
        dot.setTitle(".", for: .normal)
        
        num0.setTitle("0", for: .normal)
        num0.frame.size.width = 170
        num0.frame.size.height = 60
        num0.layer.cornerRadius = 30
        num0.backgroundColor = .systemGray
        num0.setTitleColor(.white, for: .normal)
        num0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }

}

extension UIButton {
    func calcBtn() {
        self.setTitle("\(self.tag)", for: .normal)
        self.frame.size.width = 60
        self.frame.size.height = 60
        self.layer.cornerRadius = self.frame.width / 2
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.backgroundColor = .systemGray
    }
    
    func operatorBtn() {
        self.frame.size.width = 60
        self.frame.size.height = 60
        self.layer.cornerRadius = self.frame.width / 2
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.backgroundColor = .systemOrange
    }
}
