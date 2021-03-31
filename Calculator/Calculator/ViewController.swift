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
    
    @IBOutlet var decimalView: UIView!
    @IBOutlet var binaryView: UIView!
    
    @IBOutlet var binaryClear: UIButton!
    @IBOutlet var binaryNum0: UIButton!
    @IBOutlet var binaryNum1: UIButton!
    @IBOutlet var binaryOR: UIButton!
    @IBOutlet var binaryNOR: UIButton!
    @IBOutlet var binaryNOT: UIButton!
    @IBOutlet var binaryAND: UIButton!
    @IBOutlet var binaryNAND: UIButton!
    @IBOutlet var binaryXOR: UIButton!
    @IBOutlet var binaryLeftShift: UIButton!
    @IBOutlet var binaryRightShift: UIButton!
    @IBOutlet var binaryMinus: UIButton!
    @IBOutlet var binaryPlus: UIButton!
    @IBOutlet var binaryEqual: UIButton!
    
    let calculator = Calculator()
    let binaryCalculrator = BinaryCalculator()
    
    
    @IBAction func numBtn(_ sender: UIButton) {
        switch sender {
        case num0:
            calculator.receiveInput(buttonType: String(num0.tag))
        case num1:
            calculator.receiveInput(buttonType: String(num1.tag))
        case num2:
            calculator.receiveInput(buttonType: String(num2.tag))
        case num3:
            calculator.receiveInput(buttonType: String(num3.tag))
        case num4:
            calculator.receiveInput(buttonType: String(num4.tag))
        case num5:
            calculator.receiveInput(buttonType: String(num5.tag))
        case num6:
            calculator.receiveInput(buttonType: String(num6.tag))
        case num7:
            calculator.receiveInput(buttonType: String(num7.tag))
        case num8:
            calculator.receiveInput(buttonType: String(num8.tag))
        case num9:
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
    
    @IBAction func binaryBtn(_ sender: UIButton) {
        print((sender.titleLabel?.text!)!)
        switch sender {
        case binaryClear:
            binaryCalculrator.receiveInput(buttonType: "c")
        case binaryNum0:
            binaryCalculrator.receiveInput(buttonType: "0")
        case binaryNum1:
            binaryCalculrator.receiveInput(buttonType: "1")
        case binaryOR:
            binaryCalculrator.receiveInput(buttonType: "|")
        case binaryNOR:
            binaryCalculrator.receiveInput(buttonType: "~|")
        case binaryNOT:
            binaryCalculrator.receiveInput(buttonType: "~")
        case binaryAND:
            binaryCalculrator.receiveInput(buttonType: "&")
        case binaryNAND:
            binaryCalculrator.receiveInput(buttonType: "~&")
        case binaryXOR:
            binaryCalculrator.receiveInput(buttonType: "^")
        case binaryLeftShift:
            binaryCalculrator.receiveInput(buttonType: "<<")
        case binaryRightShift:
            binaryCalculrator.receiveInput(buttonType: ">>")
        case binaryMinus:
            binaryCalculrator.receiveInput(buttonType: "-")
        case binaryPlus:
            binaryCalculrator.receiveInput(buttonType: "+")
        case binaryEqual:
            binaryCalculrator.receiveInput(buttonType: "=")
        default:
            break
        }

    }
    
    @IBAction func changeBtn(_ sender: UIButton) {
        if decimalView.isHidden == false {
            decimalView.isHidden = true
            binaryView.isHidden = false
        } else {
            decimalView.isHidden = false
            binaryView.isHidden = true
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        binaryView.isHidden = true
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
    
    func binarySetup() {
        
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
