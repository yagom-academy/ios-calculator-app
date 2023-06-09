//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputNumberLabel: UILabel!
    @IBOutlet weak var inputOperatorLabel: UILabel!
    @IBOutlet weak var allStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    private var resultString: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputNumberLabel.text = "0"
        inputOperatorLabel.text = ""
        
    @IBAction func tapNumbersButton(_ sender: UIButton) {
        guard let inputNumber = sender.titleLabel?.text,
              let numberLabel = inputNumberLabel.text else { return }
        
        inputNumberLabel.text = (numberLabel == "0") ? (inputNumber) : (numberLabel + inputNumber)
    }
    
    @IBAction func tapSerialZeroButton(_ sender: UIButton) {
        guard let inputNumber = sender.titleLabel?.text,
              let numberLabel = inputNumberLabel.text else { return }
        
        inputNumberLabel.text = (numberLabel == "0") ? ("0") : (numberLabel + inputNumber)
    }
    @IBAction func positiveNegativeButton(_ sender: UIButton) {
        let minusSign = "-"
        guard let numberLabel = inputNumberLabel.text else { return }
        
        inputNumberLabel.text? = (numberLabel != "0" && numberLabel.first.map(String.init) != minusSign) ? (minusSign + numberLabel) : (numberLabel)
    }
    @IBAction func periodButton(_ sender: UIButton) {
        guard let numberLabel = inputNumberLabel.text else { return }
        
        inputNumberLabel.text? = (numberLabel.contains(".")) ? (numberLabel) : (numberLabel + ".")
    }
    
    @IBAction func operatorsButton(_ sender: UIButton) {
        guard let inputOperator = sender.titleLabel?.text,
              let inputNumber = inputNumberLabel.text,
              let inputOperatorText = inputOperatorLabel.text else { return }
        
        //현재 숫자입력이 없는 상태인 0에서는 연산자를 반복해서 누르더라도 연산이 이뤄지지 않습니다
        if inputNumberLabel.text == "0" {
            inputOperatorLabel.text = inputOperator
        } else {
            let makeStackView = makeStackView()
            let operatorLabel = makeLabelInStackView(inputOperatorText)
            let numberLabel = makeLabelInStackView(inputNumber)
            
            makeStackView.addArrangedSubview(operatorLabel)
            makeStackView.addArrangedSubview(numberLabel)
            allStackView.addArrangedSubview(makeStackView)
            
            inputOperatorLabel.text = inputOperator
            inputNumberLabel.text = "0"
            
            setScrollView()
        }
    }
    
    @IBAction func equalMarkButton(_ sender: UIButton) {
        var calculateResult = ExpressionParser.parse(from: resultString)
        do {
            let Formula = try calculateResult.result()
            let formulaResult = numberFormatter(String(Formula))
            inputNumberLabel.text = formulaResult
        } catch {
            let alert = UIAlertController(title:"계산 오류입니다.",
                                          message: "취소버튼을 눌러주시기 바랍니다",
                                          preferredStyle: UIAlertController.Style.alert)
            let cancle = UIAlertAction(title: "취소", style: .default, handler: nil)
            alert.addAction(cancle)
            present(alert,animated: true,completion: nil)
        }
    }
    }


}

