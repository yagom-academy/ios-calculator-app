//
//  InputDataValidation.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/30.
//

import Foundation

class InputDataValidation {
    private func filterAdditionalIncomingData(currentData: String, previousData: String) {
        switch Operators.list.contains(previousData) {
        case true :
            if currentData == "~" || !Operators.list.contains(currentData) {
                Data.medianNotation.append(currentData)
            }
            else {
                Data.medianNotation.removeLast()
                Data.medianNotation.append(currentData)
            }
        case false :
            if Operators.list.contains(currentData) {
                Data.medianNotation.append(currentData)
            }
            else {
                Data.medianNotation.removeLast()
                Data.medianNotation.append(previousData + currentData)
            }
        }
    }
    
    private func filterInitialIncomingData(_ inputData: String) {
        if inputData == "~" || !Operators.list.contains(inputData) {
            Data.medianNotation.append(inputData)
        }
        else {
            Data.medianNotation = []
        }
    }
    
    func manageData(input: String) {
        if Data.medianNotation.isEmpty {
            filterInitialIncomingData(input)
        }
        else {
            guard let finalElement = Data.medianNotation.last else { return }
            
            filterAdditionalIncomingData(currentData: input, previousData: finalElement)
        }
    }
}
