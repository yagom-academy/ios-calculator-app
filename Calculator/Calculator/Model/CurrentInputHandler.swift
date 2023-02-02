//
//  CurrentInputHandler.swift
//  Calculator
//
//  Created by Rowan on 2023/02/02.
//
import UIKit

final class CurrentInputHandler {
    static let shared = CurrentInputHandler()
    
    private enum Sign {
        static let empty = ""
        static let comma = ","
        static let space = " "
    }
    
    var currentInput: String = ""
    
    func addInput(about `operator`: UILabel, and operand: UILabel) {
        guard let input = makeInput(from: `operator`, and: operand) else { return }
        currentInput += input
    }
    
    private func makeInput(from `operator`: UILabel, and operand: UILabel) -> String? {
        guard let operatorText = `operator`.text,
              let operandText = operand.text,
              let convertedOperandText = convertToNone(from: operandText) else { return nil }
        
        let result = operatorText + Sign.space + convertedOperandText + Sign.space
        
        return result
    }
    
    private func convertToNone(from decimal: String) -> String? {
        let comma = Character(Sign.comma)
        let noneStyle = decimal.split(with: comma).joined()
        
        return noneStyle
    }
}
