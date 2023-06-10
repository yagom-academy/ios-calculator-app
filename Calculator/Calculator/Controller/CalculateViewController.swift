//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculateViewController: UIViewController {
    //현재 표시되는 연산자 라벨
    @IBOutlet weak var currentOperatorLabel: UILabel!
    //현재 표시되는 피연산자 라벨
    @IBOutlet weak var currentOperandLabel: UILabel!
    //스크롤뷰에 쌓이는 스텍뷰, 연산 과정을 저장하는 스텍뷰
    @IBOutlet weak var saveFormulaStackView: UIStackView!
    //연산과정을 저장하는 스크롤뷰
    @IBOutlet weak var saveFormulaScrollView: UIScrollView!
    //현재까지의 수식들이 담기는 문자열 배열
    private var formulasUntilNow = [String]()
    //숫자0이 눌려졌었는지
    private var isZeroButtonTappedBefore = true
    //결과값이 나왔는지
    private var isResultValue = false
    //.(dot)이 사용되었었는지
    private var isDotUsed = false
    //연산자버튼이 눌려졌었는지
    private var isOperatorButtonPushed = false
    //현재 표시되는 피연산자 라벨 초기화하는지
    private var isInitializeCurrentOperandLabel = false {
        didSet {
            if isInitializeCurrentOperandLabel {
                currentOperandLabel.text = "0"
            }
        }
    }
    //현재 표시되는 연산자 라벨 초기화하는지
    private var isInitializeCurrentOperatorLabel = false {
        didSet {
            if isInitializeCurrentOperatorLabel {
                currentOperatorLabel.text = ""
            }
        }
    }
    // 이번에 추가할 수식에 대해 연산자와 피연산자를 합쳐서 형식을 만들어 반환해주는 클로져
    private var currentFormula: String {
        guard let numberText = currentOperandLabel.text,
              let operatorText = currentOperatorLabel.text else {
            return "NaN"
        }
        
        return "\(operatorText) \(checkFutureOperand(numberText).filter { $0 != "," }) "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isInitializeCurrentOperandLabel = true
        isInitializeCurrentOperatorLabel = true
    }
    
    //MARK: - 버튼 눌릴 때
    //1부터 9까지 숫자 눌릴때
    @IBAction func tappedOperandsButton(_ sender: UIButton) {
        guard let number = sender.currentTitle,
              let operandLabelText = currentOperandLabel.text,
              isResultValue == false,
              checkFutureOperand(operandLabelText + number) != "error" else {
            return
        }
        
        if operandLabelText == "0" {
            currentOperandLabel.text = number
        } else {
            currentOperandLabel.text = operandLabelText + number
        }
    }
    
    //.(dot) 버튼 눌릴 때
    @IBAction func tappedDotButton(_ sender: UIButton) {
        guard isDotUsed == false,
              let operandLabelText = currentOperandLabel.text,
              isResultValue == false,
              checkFutureOperand(operandLabelText) != "error" else {
            return
        }
        
        isDotUsed = true
        currentOperandLabel.text = operandLabelText + "."
    }
    
    //0 버튼 눌릴 때
    @IBAction func tappedZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" else {
            currentOperandLabel.text = "0"
            isZeroButtonTappedBefore = true
            return
        }
        
        guard checkFutureOperand(operandLabelText + "0") != "error",
              isResultValue == false else {
            return
        }
        
        currentOperandLabel.text = operandLabelText + "0"
    }
    
    //00버튼 눌릴 때
    @IBAction func tappedDoubleZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" else {
            currentOperandLabel.text = "0"
            isZeroButtonTappedBefore = true
            return
        }
        
        guard checkFutureOperand(operandLabelText + "00") != "error",
              isResultValue == false else {
            return
        }
        
        currentOperandLabel.text = operandLabelText + "00"
    }
    
    //연산자(+-%*) 버튼 눌릴때
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let operand = currentOperandLabel.text,
              operand != "0" || isZeroButtonTappedBefore,
              let operandLabelText = currentOperandLabel.text,
              checkFutureOperand(operandLabelText) != "error" else {
            return
        }
        
        settingFormula()

        currentOperatorLabel.text = sender.currentTitle

        isOperatorButtonPushed = true
        isResultValue = false
        isZeroButtonTappedBefore = false
        isDotUsed = false
        isInitializeCurrentOperandLabel = true
    }
    
    //=(결과) 버튼 눌릴 때
    @IBAction func tappedResultButton(_ sender: Any) {
        guard isResultValue == false,
              isOperatorButtonPushed == true else {
            return
        }
        settingFormula()
        
        var formula = ExpressionParser.parse(from: formulasUntilNow.joined())
        
        let result = formula.result()
        isResultValue = true
        isZeroButtonTappedBefore = true
        
        currentOperandLabel.text = result.formatNumber()
        formulasUntilNow.removeAll()
        isInitializeCurrentOperatorLabel = true
        isDotUsed = false
    }
    
    //-+ 변환 부호 버튼 눌릴 때
    @IBAction func tappedChangeSignButton(_ sender: Any) {
        guard var operandLabelText = currentOperandLabel.text,
                operandLabelText != "0",
                checkFutureOperand(operandLabelText) != "error" else {
            return
        }
        
        if operandLabelText.contains("-") {
            operandLabelText = operandLabelText.filter{ $0 != "-" }
        } else {
            operandLabelText = "-" + operandLabelText
        }

        currentOperandLabel.text = operandLabelText
    }
    
    //CE 버튼 눌릴 때
    @IBAction func tappedClearButton(_ sender: Any) {
        isInitializeCurrentOperandLabel = true
        isResultValue = false
        isZeroButtonTappedBefore = false
        isDotUsed = false
    }
    
    //AC 버튼 눌릴 때
    @IBAction func tappedAllClearButton(_ sender: Any) {
        saveFormulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        isInitializeCurrentOperandLabel = true
        isInitializeCurrentOperatorLabel = true
        isResultValue = false
        isZeroButtonTappedBefore = true
        isDotUsed = false
        isOperatorButtonPushed = false
    }

    //라벨의 수식을 문자열 배열에 저장하고, 스택뷰에 넘김
    //다음연산을 위해 이번 수식을 저장하며 지우는 함수
    private func settingFormula() {
        guard let operatorString = currentOperatorLabel.text,
              let operandString = currentOperandLabel.text else {
            return
        }
        print(currentFormula)
        formulasUntilNow.append(currentFormula)
        addView(operatorString, checkFutureOperand(operandString))
    }
    
    //들어갈 피연산자가 조건에 맞는지 확인하여 맞으면 형식에 알맞는 문자열을 반환하는 함수 (20자리, 컴마 등)
    private func checkFutureOperand(_ input: String) -> String {
        guard let number = Double(input.filter { $0 != "," })?.formatNumber(),
              input.count <= 20 else {
            return "error"
        }
        
        return number
    }
}

extension CalculateViewController {
    //이번연산 과정을 담는 스택뷰를 만드는 함수
    func addSubView(_ `operator`: String, _ operand: String) -> UIStackView {
        let operatorLabel: UILabel = {
            let label = UILabel()
            
            label.text = `operator`
            label.textColor = .white
            
            return label
        }()
        
        let operandLabel: UILabel = {
            let label = UILabel()
            
            label.text = operand.filter { $0 != "," }
            label.font = .preferredFont(forTextStyle: .title2)
            label.textColor = .white
            
            return label
        }()
        
        let subStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [operatorLabel,operandLabel])
            
            stackView.spacing = 8
            stackView.alignment = .bottom
            
            return stackView
        }()
        
        return subStackView
    }
    
    //스크롤뷰에 있는 스택뷰에 만든 서브뷰를 추가하고, 자동스크롤 되도록
    // 현재 수식이 보이도록 스택뷰에 추가하는 함수
    func addView(_ `operator`: String, _ operand: String) {
        saveFormulaStackView.addArrangedSubview(addSubView(`operator`, operand))
        
        saveFormulaScrollView.layoutIfNeeded()
        saveFormulaScrollView.setContentOffset(CGPoint(x: 0, y: saveFormulaScrollView.contentSize.height - saveFormulaScrollView.bounds.height), animated: true)
    }
}
