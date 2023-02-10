//
//  CurrentInputHandler.swift
//  Calculator
//
//  Created by Rowan on 2023/02/02.
//

final class InputManager {
    private var input: String = Sign.empty
    
    var currentInput: String {
        return input
    }
    
    func addInput(about currentItem: CurrentItem) {
        guard let input = makeInput(from: currentItem)
        else { return }
        
        self.input += input
    }
    
    func setEmptyInput() {
        input = Sign.empty
    }
    
    private func makeInput(from currentItem: CurrentItem) -> String? {
        guard let convertedOperandText = convertToNone(from: currentItem.operandText)
        else { return nil }
        
        let result = currentItem.operatorText + Sign.space + convertedOperandText + Sign.space
        
        return result
    }
    
    private func convertToNone(from decimal: String) -> String? {
        let comma = Character(Sign.comma)
        let noneStyle = decimal.split(with: comma).joined()
        
        return noneStyle
    }
}
