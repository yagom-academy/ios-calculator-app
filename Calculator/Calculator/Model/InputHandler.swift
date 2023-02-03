//
//  CurrentInputHandler.swift
//  Calculator
//
//  Created by Rowan on 2023/02/02.
//

import UIKit

final class InputHandler {
    static let shared = InputHandler()
    
    private init() {}
    private var input: String = Sign.empty
    
    var currentInput: String {
        return input
    }
    
    func addInput(about `operator`: UILabel, and operand: UILabel) {
        guard let input = makeInput(from: `operator`, and: operand) else { return }
        
        self.input += input
    }
    
    func setEmptyInput() {
        input = Sign.empty
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
