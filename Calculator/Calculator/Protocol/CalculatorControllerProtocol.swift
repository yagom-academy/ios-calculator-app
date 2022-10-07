//  Calculator - CalculatorControllerProtocol.swift
//  Created by zhilly and Gundy on 2022/10/06.

protocol CalculatorControllerProtocol {
    var view: CalculatorViewDelegate { get }
    var viewDisplayNumber: String { get set }
    
    init(view: CalculatorViewDelegate)
    
    func tappedNumberButton(input: String?) -> String
    func tappedOperatorButton(input: String?) -> String
    func tappedCEButton()
    func tappedCalculateButton() -> String?
    func tappedDotButton() -> String
    func tappedACButton()
    func tappedReverseSignButton() -> String
}
