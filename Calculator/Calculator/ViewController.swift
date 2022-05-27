//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mathSign: UILabel!
    @IBOutlet weak var mathFomula: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    private var inputFormula: String = ""
    private var inputMathFormula: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        clearFormulaAndSign()
    }
    
    func clearFormulaAndSign() {
        mathFomula.text = "0"
        mathSign.text = ""
        stackView.subviews.forEach{ (view) in view.removeFromSuperview() }
        inputFormula = "0"
        inputMathFormula.removeAll()
    }
    
    @IBAction func InputNumber(buttonNumber: UIButton) {
        guard let formulaNumber = buttonNumber.currentTitle else { return }
        if inputFormula == "0" && formulaNumber == "0" {
            return
        }
        
        if inputFormula == "0" && formulaNumber == "00" {
            return
        }
        
        if inputFormula == "0" {
            inputFormula = formulaNumber
            mathFomula.text = inputFormula
            return
        }
        
        if inputFormula.last == "0" || inputFormula.last == "." {
            inputFormula += formulaNumber
            mathFomula.text = inputFormula
            return
        }
        
        inputFormula += formulaNumber
        mathFomula.text = numberFormatter(number: inputFormula)
    }
    
    @IBAction func InputDeciamlPoint(sender: UIButton) {
        guard let buttonDecimalPoint = sender.currentTitle else { return }
        guard let currentFormula = mathFomula.text else { return }
        
        if inputFormula.last == "." || inputFormula.contains(".") {
            return
        }
        
        inputFormula += buttonDecimalPoint
        mathFomula.text = currentFormula + buttonDecimalPoint
    }
    
    @IBAction func calculateFormula() {
        guard let signLabel = mathSign?.text else { return }
        guard let formulaLabel = mathFomula?.text else { return }
        
        if signLabel.isEmpty { return }
        
        let freshStackView = createStackView(sign: signLabel, formula: formulaLabel)
        stackView.addArrangedSubview(freshStackView)
        scrollView.scrollSetting()
        
        if formulaLabel == "0" && signLabel == "÷" {
            mathSign.text = ""
            mathFomula.text = "NaN"
            return
        }
        
        if formulaLabel == "0" { return }
        
        let setCalculteFormula = inputMathFormula.joined(separator: " ") + " " + inputFormula
        var completionOfCalculation = ExpressParser.parse(from: setCalculteFormula)
        do {
            let resultOfCalculation = try String(completionOfCalculation.result())
            mathFomula.text = numberFormatter(number: resultOfCalculation)
            mathSign.text = ""
        } catch {
            mathFomula.text = "NaN"
        }
    }

    
    @IBAction func InputSign(sender: UIButton) {
        guard let buttonSign = sender.currentTitle else { return }
        guard let signLabel = mathSign.text else { return }
        guard let formulaLabel = mathFomula.text else { return }
        
        if inputFormula == "0" {
            mathSign.text = buttonSign
            return
        }
        
        let inputStackView = createStackView(sign: signLabel, formula: formulaLabel)
        stackView.addArrangedSubview(inputStackView)
        scrollView.scrollSetting()
        inputMathFormula.append(inputFormula)
        inputMathFormula.append(buttonSign)
        inputFormula = "0"
        
        mathFomula.text = inputFormula
        mathSign.text = buttonSign
    }
    
    @IBAction func removeAll() {
        clearFormulaAndSign()
    }
    
    @IBAction func clearEntity() {
        inputFormula = "0"
        mathFomula.text = inputFormula
    }
    
    @IBAction func changeSign() {
        let InputMathFomula = Double(inputFormula) ?? 0
        
        if InputMathFomula == 0 { return }
        
        inputFormula = String(InputMathFomula * -1)
        mathFomula.text = numberFormatter(number: inputFormula)
    }
    
    private func numberFormatter(number: String) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 20
        
        let convertNumber = Double(number)
        let result = numberFormatter.string(for: convertNumber) ?? "NaN"
        
        return result
    }
    
    private func createStackView(sign: String?, formula: String?) -> UIStackView {
        let signLabel = UILabel()
        let formulaLabel = UILabel()
        
        signLabel.text = sign
        formulaLabel.text = formula
        signLabel.textColor = .white
        formulaLabel.textColor = .white
        
        let freshStackView = UIStackView()
        freshStackView.axis = .horizontal
        freshStackView.distribution = .fill
        freshStackView.spacing = 10
        freshStackView.addArrangedSubview(signLabel)
        freshStackView.addArrangedSubview(formulaLabel)
        
        return freshStackView
    }
}

extension UIScrollView {
    func scrollSetting() {
        self.layoutIfNeeded()
        let setBottom = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height)
        self.setContentOffset(setBottom, animated: true)
    }
}

