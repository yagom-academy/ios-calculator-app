//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var mathSignLabel: UILabel!
    @IBOutlet private weak var mathFomulaLabel: UILabel!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var stackView: UIStackView!
    
    private var inputFormula: String = ""
    private var inputMathFormula: [String] = []
    private var judgeInputNumber = true

    override func viewDidLoad() {
        super.viewDidLoad()
        clearFormulaAndSign()
    }
    
    func clearFormulaAndSign() {
        mathFomulaLabel.text = "0"
        mathSignLabel.text = ""
        stackView.subviews.forEach{ $0.removeFromSuperview() }
        inputFormula = "0"
        inputMathFormula.removeAll()
    }
    
    @IBAction private func inputNumber(sender: UIButton) {
        guard let formulaNumber = sender.currentTitle else { return }
        
        if checkInputNumber(inputNumber: formulaNumber) { return }
        
        inputFormula += formulaNumber
        mathFomulaLabel.text = numberFormatter(number: inputFormula)
    }
    
    private func checkInputNumber(inputNumber: String) -> Bool {
        if inputFormula == "0" && inputNumber == "0" {
            return judgeInputNumber
        }
        
        if inputFormula == "0" && inputNumber == "00" {
            return judgeInputNumber
        }
        
        if inputFormula == "0" {
            inputFormula = inputNumber
            mathFomulaLabel.text = inputFormula
            return judgeInputNumber
        }
        
        if inputFormula.last == "0" || inputFormula.last == "." {
            inputFormula += inputNumber
            mathFomulaLabel.text = inputFormula
            return judgeInputNumber
        }
        
        return !judgeInputNumber
    }
    
    @IBAction private func inputDeciamlPoint(sender: UIButton) {
        guard let buttonDecimalPoint = sender.currentTitle,
                   let currentFormula = mathFomulaLabel.text else {
                       return
        }
        
        if inputFormula.last == "." || inputFormula.contains(".") {
            return
        }
        
        inputFormula += buttonDecimalPoint
        mathFomulaLabel.text = currentFormula + buttonDecimalPoint
    }
    
    @IBAction private func calculateFormula() {
        guard let signLabel = mathSignLabel?.text else { return }
        guard let formulaLabel = mathFomulaLabel?.text else { return }
        
        if signLabel.isEmpty { return }
        
        let freshStackView = createStackView(sign: signLabel, formula: formulaLabel)
        stackView.addArrangedSubview(freshStackView)
        scrollView.scrollSetting()
        
        if formulaLabel == "0" && signLabel == "÷" {
            mathSignLabel.text = ""
            mathFomulaLabel.text = "NaN"
            return
        }
        
        if formulaLabel == "0" { return }
        
        let setCalculteFormula = inputMathFormula.joined(separator: " ") + " " + inputFormula
        var completionOfCalculation = ExpressParser.parse(from: setCalculteFormula)
        do {
            let resultOfCalculation = try String(completionOfCalculation.result())
            mathFomulaLabel.text = numberFormatter(number: resultOfCalculation)
            mathSignLabel.text = ""
        } catch {
            mathFomulaLabel.text = "NaN"
        }
    }

    
    @IBAction private func inputSign(sender: UIButton) {
        guard let buttonSign = sender.currentTitle else { return }
        guard let signLabel = mathSignLabel.text else { return }
        guard let formulaLabel = mathFomulaLabel.text else { return }
        
        if inputFormula == "0" {
            mathSignLabel.text = buttonSign
            return
        }
        
        let inputStackView = createStackView(sign: signLabel, formula: formulaLabel)
        stackView.addArrangedSubview(inputStackView)
        scrollView.scrollSetting()
        inputMathFormula.append(inputFormula)
        inputMathFormula.append(buttonSign)
        inputFormula = "0"
        
        mathFomulaLabel.text = inputFormula
        mathSignLabel.text = buttonSign
    }
    
    @IBAction private func removeAll() {
        clearFormulaAndSign()
    }
    
    @IBAction private func clearEntity() {
        inputFormula = "0"
        mathFomulaLabel.text = inputFormula
    }
    
    @IBAction private func changeSign() {
        let InputMathFomula = Double(inputFormula) ?? 0
        
        if InputMathFomula == 0 { return }
        
        inputFormula = String(InputMathFomula * -1)
        mathFomulaLabel.text = numberFormatter(number: inputFormula)
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

