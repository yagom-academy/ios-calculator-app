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
    private var calculateSetting: Bool = true
    
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

        if numberLabel != "0" {
            inputNumberLabel.text? = (numberLabel.first.map(String.init) != minusSign) ? (minusSign + numberLabel) : (String(numberLabel.dropFirst(1)))
        }
    }

    @IBAction func periodButton(_ sender: UIButton) {
        guard let numberLabel = inputNumberLabel.text else { return }
        
        inputNumberLabel.text? = (numberLabel.contains(".")) ? (numberLabel) : (numberLabel + ".")
    }
    
    @IBAction func operatorsButton(_ sender: UIButton) {
        guard let inputButtonOperator = sender.titleLabel?.text,
              let inputNumber = inputNumberLabel.text,
              let inputOperatorLabelText = inputOperatorLabel.text else { return }
        
        if inputNumberLabel.text == "0" {
            inputOperatorLabel.text = inputButtonOperator
        } else {
            let makeStackView = makeStackView()
            let operatorLabel = makeLabelInStackView(inputOperatorLabelText)
            let numberLabel = makeLabelInStackView(inputNumber)
            
            makeStackView.addArrangedSubview(operatorLabel)
            makeStackView.addArrangedSubview(numberLabel)
            allStackView.addArrangedSubview(makeStackView)
            
            resultString = resultString + inputOperatorLabelText + inputNumber
            
            inputOperatorLabel.text = inputButtonOperator
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
    @IBAction func allClearButton(_ sender: UIButton) {
        inputOperatorLabel.text = ""
        inputNumberLabel.text = "0"
        allStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
    }
    
    @IBAction func clearEntryButton(_ sender: UIButton) {
        inputNumberLabel.text = "0"
    }
    
    func numberFormatter(_ inputNumber: String) -> String {
        let numberFormatter = NumberFormatter()
        let doubleNumber = Double(inputNumber)
        
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
//        numberFormatter.roundingMode = .roundUp
//        numberFormatter.maximumSignificantDigits = 2
        let result = numberFormatter.string(for: doubleNumber) ?? "0.0"
        
        return result
    }
    
extension ViewController {
    func makeStackView() -> UIStackView {
        let view: UIStackView = UIStackView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
        
        return view
    }
    
    func makeLabelInStackView(_ input: String) -> UILabel {
        let label = UILabel()
        
        label.text = input
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(displayP3Red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        return label
    }
    
    func setScrollView() {
        let bottomOffset = CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height + scrollView.contentInset.bottom)
        if bottomOffset.y > 0 {
            scrollView.setContentOffset(bottomOffset, animated: true)
        }
    }


}

