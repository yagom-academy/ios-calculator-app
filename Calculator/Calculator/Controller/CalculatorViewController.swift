//
//  Calculator - CalculatorViewController.swift
//  Created by DuDu
//

import UIKit

private enum Digit {
    static let limitDigit = 20
    static let limitNumber = 1.0e20
}

private enum NumberString {
    static let empty = ""
    static let zero = "0"
    static let nan = "NaN"
}

final class CalculatorViewController: UIViewController {
    private var currentStringNumber: String = NumberString.empty
    private var expression: [String?] = []
    private var isInputExist: Bool = false
    private var isCalculateValue: Bool = false
    
    @IBOutlet private var logScrollView: UIScrollView!
    @IBOutlet private var calculateLogStackView: UIStackView!
    
    @IBOutlet private var numberLabel: UILabel!
    @IBOutlet private var operatorLabel: UILabel!
    
    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAttribute()
    }
    
    func setUpAttribute() {
        updateNumberLabel(to: NumberString.zero)
        logScrollView.showsVerticalScrollIndicator = false
    }
    
    func updateNumberLabel(to number: String?) {
        numberLabel.text = number
    }
    
    func updateOperatorLabel(to operator: String?) {
        operatorLabel.text = `operator`
    }
    
    func updateCurrentStringNumber(to number: String) {
        currentStringNumber = number
    }
    
    func resetElements() {
        isCalculateValue = false
        isInputExist = false
        updateCurrentStringNumber(to: NumberString.empty)
        updateNumberLabel(to: NumberString.zero)
        updateOperatorLabel(to: NumberString.empty)
    }
}

//MARK: - Method

private extension CalculatorViewController {
    
    func writeCalculateLog() {
        guard isInputExist else { return }
        
        let doubleNumber = numberLabel.text?.removeComma()
        let stackView = logStackView()
        
        expression.append(contentsOf: [operatorLabel.text, doubleNumber])
        calculateLogStackView.addArrangedSubview(stackView)
        logScrollView.scrollToBottom()
        resetElements()
    }
    
    func logStackView() -> UIStackView {
        let doubleNumber = numberLabel.text?.removeComma()
        let numberLogLabel = logLabel(with: doubleNumber)
        let operatorLogLabel = logLabel(with: operatorLabel.text)
        
        let stackView = UIStackView(arrangedSubviews: [operatorLogLabel, numberLogLabel])
        stackView.axis = .horizontal
        stackView.alignment = .trailing
        stackView.spacing = 10
        
        return stackView
    }
    
    func logLabel(with text: String?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        return label
    }
    
    func resetCalculator() {
        expression.removeAll()
        resetElements()
        
        calculateLogStackView.arrangedSubviews.forEach { subView in
            subView.removeFromSuperview()
        }
    }
    
    func addComma(to number: Double) -> String? {
        let splitedNumber = String(number).split(with: ".")
        let integerDigits = splitedNumber[0]
        
        if integerDigits.count > Digit.limitDigit ||
            number >= Digit.limitNumber {
            return NumberString.nan
        } else {
            return numberFormatter.string(from: number as NSNumber)
        }
    }
}

//MARK: - IBAction Method

private extension CalculatorViewController {
    
    @IBAction func numberButtonDidTapped(_ sender: UIButton) {
        guard currentStringNumber.count < Digit.limitDigit,
            let inputNumber = sender.titleLabel?.text else {
            return
        }
        
        if isCalculateValue ||
            numberLabel.text == NumberString.nan {
            isCalculateValue = false
            resetCalculator()
        }
        
        if ["00","0"].contains(inputNumber),
           numberLabel.text == NumberString.zero {
            isInputExist = true
            return
        }
    
        isInputExist = true
        updateCurrentStringNumber(to: currentStringNumber + inputNumber)
        updateNumberLabel(to: currentStringNumber)
    }
    
    @IBAction func operatorButtonDidTapped(_ sender: UIButton) {
        guard numberLabel.text != NumberString.nan else { return }
        
        writeCalculateLog()
        updateOperatorLabel(to: sender.titleLabel?.text)
    }
    
    @IBAction func dotButtonDidTapped(_ sender: UIButton) {
        guard numberLabel.text != NumberString.nan,
            !currentStringNumber.contains("."),
            isCalculateValue == false,
            currentStringNumber.count < Digit.limitDigit else {
            return
        }
        
        if currentStringNumber.isEmpty {
            updateCurrentStringNumber(to: NumberString.zero)
        }
        
        updateCurrentStringNumber(to: currentStringNumber + ".")
        updateNumberLabel(to: currentStringNumber)
    }
    
    @IBAction func allClearButtonDidTapped(_ sender: UIButton) {
        resetCalculator()
    }
    
    @IBAction func clearEntryButtonDidTapped(_ sender: UIButton) {
        guard numberLabel.text != NumberString.nan else { return }
        
        updateCurrentStringNumber(to: NumberString.empty)
        updateNumberLabel(to: NumberString.zero)
        isInputExist = false
    }
    
    @IBAction func signButtonDidTapped(_ sender: UIButton) {
        guard let number = Double(currentStringNumber),
            numberLabel.text != NumberString.zero else {
            return
        }
        
        if number < .zero {
            currentStringNumber.removeFirst()
        } else {
            currentStringNumber.insert("-", at: currentStringNumber.startIndex)
        }
        
        updateNumberLabel(to: currentStringNumber)
    }
    
    @IBAction func calculateButtonDidTapped(_ sender: UIButton) {
        guard expression.isEmpty == false else { return }
        
        writeCalculateLog()
        
        let expressionString = expression.compactMap { $0 }.joined(separator: " ")
        expression.removeAll()
        updateCurrentStringNumber(to: NumberString.empty)
        
        do {
            let calculateResult = try ExpressionParser.parse(from: expressionString).result()
            
            updateNumberLabel(to: addComma(to: calculateResult))
            isCalculateValue = true
            isInputExist = true
        } catch {
            updateNumberLabel(to: NumberString.nan)
        }
    }
    
}
