//
//  InputDataValidation.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/30.
//

import Foundation

class InputDataValidator {
    var data = Data()
    
    private func isPrefixOperator (_ input: String) -> Bool {
        if input == "~" || !Operators.list.contains(input) {
            return true
        }
        return false
    }
    
    private func filterAdditionalIncomingData(currentData: String, previousData: String) {
        switch Operators.list.contains(previousData) {
        case true :
            if isPrefixOperator(currentData) {
                data.medianNotation.append(currentData)
            }
            else {
                data.medianNotation.removeLast()
                data.medianNotation.append(currentData)
            }
        case false :
            if Operators.list.contains(currentData) {
                data.medianNotation.append(currentData)
            }
            else {
                data.medianNotation.removeLast()
                data.medianNotation.append(previousData + currentData)
            }
        }
    }
    
    private func filterInitialIncomingData(_ input: String) {
        if isPrefixOperator(input) {
            data.medianNotation.append(input)
        }
    }
    
    func validateData(input: String) {
        if data.medianNotation.isEmpty {
            filterInitialIncomingData(input)
        }
        else {
            guard let finalElement = data.medianNotation.last else { return }
            
            filterAdditionalIncomingData(currentData: input, previousData: finalElement)
        }
    }
}
