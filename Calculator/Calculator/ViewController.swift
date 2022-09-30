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
        operandsLabel.text = empty
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
        //        guard operandsLabel.text != zero else { return }
        // 마지막 숫자가 레이블에 있어도 =을 누르면 계산이 되어야 한다.
        // 레이블에 = 연산 결과값이 띄워져 있다면 = 계산이 되지 않아야 한다.
        
        // ===연속 처리
        // 0나누기 했을 때 nan
        // = 누르면 연산결과가 숫자 레이블에 보여지기
        // 스택뷰 만드는 함수 생성 후 호출!
        
        fullFormula += operandsLabel.text ?? ""
        operandsLabel.text = fullFormula
        
        //만약 stringOperators 가 0이라면 위에 쌓인 레이블 초기화 시키고 현재 숫자 레이블에는 오류 문구로 바뀌
        var parsedFullFormula = ExpressionParser.parse(from: fullFormula)
        let calcultedFormula = parsedFullFormula.result()
        operandsLabel.text = String(calcultedFormula)
    }
}

