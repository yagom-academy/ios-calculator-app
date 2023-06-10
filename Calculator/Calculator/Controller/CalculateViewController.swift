//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet weak var currentOperatorLabel: UILabel!
    @IBOutlet weak var currentOperandLabel: UILabel!
    @IBOutlet weak var currentFormulaStackView: UIStackView!
    @IBOutlet weak var currentFormulaScrollView: UIScrollView!
    private var formulasUntilNow = [String]()
    //라벨에 있는 0이 버튼을 누른 값인지
    private var isZeroButtonTapped = true
    //라벨에 있는 값이 결과값인지
    private var isCurrentOperandLabelMadeFromResult = false
    private var canTapDotButton = true
    private var isInitializeCurrentOperandLabel = false {
        didSet {
            if isInitializeCurrentOperandLabel {
                currentOperandLabel.text = "0"
            }
        }
    }
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
        
        return "\(operatorText) \(checkOperandForm(numberText).filter { $0 != "," }) "
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
              isCurrentOperandLabelMadeFromResult == false,
              checkOperandForm(operandLabelText + number) != "error" else {
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
        guard let operandLabelText = currentOperandLabel.text,
              canTapDotButton == true,
              isCurrentOperandLabelMadeFromResult == false else {
            return
        }
        
        canTapDotButton = false
        currentOperandLabel.text = operandLabelText + "."
    }
    
    //0 버튼 눌릴 때
    @IBAction func tappedZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" else {
            currentOperandLabel.text = "0"
            isZeroButtonTapped = true
            return
        }
        
        guard checkOperandForm(operandLabelText + "0") != "error",
              isCurrentOperandLabelMadeFromResult == false else {
            return
        }
        
        currentOperandLabel.text = operandLabelText + "0"
    }
    
    //00버튼 눌릴 때
    @IBAction func tappedDoubleZeroButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" else {
            currentOperandLabel.text = "0"
            isZeroButtonTapped = true
            return
        }
        
        guard checkOperandForm(operandLabelText + "00") != "error",
              isCurrentOperandLabelMadeFromResult == false else {
            return
        }
        
        currentOperandLabel.text = operandLabelText + "00"
    }
    
    //연산자(+-%*) 버튼 눌릴때
    @IBAction func tappedOperatorButton(_ sender: UIButton) {
        guard let operandLabelText = currentOperandLabel.text,
              operandLabelText != "0" ||  isZeroButtonTapped,
              checkOperandForm(operandLabelText) != "error" else {
            currentOperatorLabel.text = sender.currentTitle
            return
        }
        
        addCurrentFormula()

        currentOperatorLabel.text = sender.currentTitle


        isCurrentOperandLabelMadeFromResult = false
        isZeroButtonTapped = false
        canTapDotButton = true
        isInitializeCurrentOperandLabel = true
    }
    
    //=(결과) 버튼 눌릴 때
    @IBAction func tappedResultButton(_ sender: Any) {
        guard isCurrentOperandLabelMadeFromResult == false,
              (currentOperandLabel.text?.isEmpty) == nil else {
            return
        }
        addCurrentFormula()
        
        var formula = ExpressionParser.parse(from: formulasUntilNow.joined())
        
        let result = formula.result()
        isCurrentOperandLabelMadeFromResult = true
        isZeroButtonTapped = true
        
        currentOperandLabel.text = result.formatNumber()
        formulasUntilNow.removeAll()
        isInitializeCurrentOperatorLabel = true
        canTapDotButton = true
    }
    
    //-+ 변환 부호 버튼 눌릴 때
    @IBAction func tappedChangeSignButton(_ sender: Any) {
        guard var operandLabelText = currentOperandLabel.text,
                operandLabelText != "0",
                checkOperandForm(operandLabelText) != "error" else {
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
        isCurrentOperandLabelMadeFromResult = false
        isZeroButtonTapped = false
        canTapDotButton = true
    }
    
    //AC 버튼 눌릴 때
    @IBAction func tappedAllClearButton(_ sender: Any) {
        currentFormulaStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        isInitializeCurrentOperandLabel = true
        isInitializeCurrentOperatorLabel = true
        isCurrentOperandLabelMadeFromResult = false
        isZeroButtonTapped = true
        canTapDotButton = true
    }

    private func addCurrentFormula() {
        guard let operatorString = currentOperatorLabel.text,
              let operandString = currentOperandLabel.text else {
            return
        }
        print(currentFormula)
        formulasUntilNow.append(currentFormula)
        addView(operatorString, checkOperandForm(operandString))
    }
    
    private func checkOperandForm(_ input: String) -> String {
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
        currentFormulaStackView.addArrangedSubview(addSubView(`operator`, operand))
        
        currentFormulaScrollView.layoutIfNeeded()
        currentFormulaScrollView.setContentOffset(CGPoint(x: 0, y: currentFormulaScrollView.contentSize.height - currentFormulaScrollView.bounds.height), animated: true)
    }
}
