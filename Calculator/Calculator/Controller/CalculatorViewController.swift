//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet var numberInputLabel: UILabel!
    @IBOutlet var operatorInputLabel: UILabel!
    @IBOutlet weak var CalculationStackView: UIStackView!
    @IBOutlet weak var CalculationStackScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(CalculationStackView.arrangedSubviews.count)
        
        for stackView in CalculationStackView.arrangedSubviews {
            stackView.removeFromSuperview()
        }
    }
    
    //FIXME: scrollview scroll : 최하단으로 내려가질 않음.
    private func addEntry() {
        let nextEntryIndex = CalculationStackView.arrangedSubviews.count
        let newEntryView = createEntryView()
        
        CalculationStackView.insertArrangedSubview(newEntryView, at: nextEntryIndex )
        CalculationStackScrollView.setContentOffset(CGPoint(x: 0, y: CalculationStackScrollView.contentSize.height-CalculationStackScrollView.bounds.height), animated: true)
        
        resetInputLabelsToDefault()
    }
    
    private func createEntryView() -> UIView {
        let inputNumber = numberInputLabel.text
        let inputOperator = operatorInputLabel.text
        
        let newStackView = UIStackView()
        newStackView.axis = .horizontal
        newStackView.alignment = .trailing
        newStackView.distribution = .fill
        newStackView.spacing = 8
        
        let operatorLabel = UILabel()
        operatorLabel.text = inputNumber
        operatorLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        operatorLabel.textColor = UIColor.white
        
        let numberLabel = UILabel()
        numberLabel.text = inputOperator
        numberLabel.textColor = UIColor.white
        numberLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        
        newStackView.addArrangedSubview(numberLabel)
        newStackView.addArrangedSubview(operatorLabel)
        
        return newStackView
    }
    
    
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
    func resetInputLabelsToDefault(){
        numberInputLabel.text = "0"
    }
    // depth 고민
    func addNumberToNumberInputLabel(number: NumberButton) {
        // 숫자 20자리 넘어가면 더이상 추가하지 않음.
        if numberInputLabel.text == "0" {
            if number != .doubleZero {
                numberInputLabel.text? = "\(number)"
            }
        } else {
            numberInputLabel.text? += "\(number)"
        }
    }
    
    @IBAction func clickNumberOneButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .one)
    }
    @IBAction func clickNumberTwoButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .two)
    }
    @IBAction func clickNumberThreeButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .three)
    }
    @IBAction func clickNumberFourButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .four)
    }
    @IBAction func clickNumberFiveButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .five)
    }
    @IBAction func clickNumberSixButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .six)
    }
    @IBAction func clickNumberSevenButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .seven)
    }
    @IBAction func clickNumberEightButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .eight)
    }
    @IBAction func clickNumberNineButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .nine)
    }
    @IBAction func clickNumberZeroButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .zero)
    }
    @IBAction func clickNumberDoubleZeroButton(_ sender: UIButton) {
        addNumberToNumberInputLabel(number: .doubleZero)
    }
    @IBAction func clickDotButton(_ sender: UIButton) {
    }
    
    // Operator
    @IBAction func clickPlusOperatorButton(_ sender: UIButton) {
        operatorInputLabel.text = "+"
        if numberInputLabel.text != "0"{
            addEntry()
        }
    }
    @IBAction func clickMinusOperatorButton(_ sender: UIButton) {
        operatorInputLabel.text = "-"
        if numberInputLabel.text != "0"{
            addEntry()
        }
    }
    @IBAction func clickMultiplyOperatorButton(_ sender: UIButton) {
        operatorInputLabel.text = "x"
        if numberInputLabel.text != "0"{
            addEntry()
        }
    }
    @IBAction func clickDivideOperatorButton(_ sender: UIButton) {
        operatorInputLabel.text = "÷"
        if numberInputLabel.text != "0"{
            addEntry()
        }
    }
    @IBAction func clickEqualOperatorButton(_ sender: UIButton) {
        operatorInputLabel.text = ""
        // 후위 연산 작업
        
        // 0으로 나누는 것은 "NaN" 출력
        
        // 결과를 20자리 이상 넘어가지 않도록 함.
    }
    
    @IBAction func clickAllClearButton(_ sender: UIButton) {

        numberInputLabel.text = "0"
        for stackView in CalculationStackView.arrangedSubviews {
            stackView.removeFromSuperview()
        }
    }
    
    @IBAction func clickClearEntryButton(_ sender: UIButton) {
        numberInputLabel.text = "0"
    }
    
    @IBAction func clickToggleSignButton(_ sender: UIButton) {
        guard let inputNumber = numberInputLabel.text else { return }
        if inputNumber.first == "-" {
            numberInputLabel.text?.removeFirst()
        } else if inputNumber.first != "0" {
            numberInputLabel.text? = "-\(inputNumber)"
        }
    }
}

