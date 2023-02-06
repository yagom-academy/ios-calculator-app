//
//  CurrentInputHandler.swift
//  Calculator
//
//  Created by Rowan on 2023/02/02.
//

final class InputHandler {
    private var input: String = Sign.empty
    
    var currentInput: String {
        return input
    }
    
    func addInput(about operatorText: String, and operandText: String) {
        guard let input = makeInput(from: operatorText, and: operandText)
        else { return }
        
        self.input += input
    }
    
    func setEmptyInput() {
        input = Sign.empty
    }
    
    private func makeInput(from operatorText: String, and operandText: String) -> String? {
        guard let convertedOperandText = convertToNone(from: operandText)
        else { return nil }
        
        let result = operatorText + Sign.space + convertedOperandText + Sign.space
        
        return result
    }
    
    private func convertToNone(from decimal: String) -> String? {
        let comma = Character(Sign.comma)
        let noneStyle = decimal.split(with: comma).joined()
        
        return noneStyle
    }
}
