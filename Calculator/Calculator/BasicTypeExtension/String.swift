//
//  String.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/19.
//
extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}

extension String {
    func canInput(_ currentOperandLabel: String?) -> Bool {
        guard let currentOperandLabel = currentOperandLabel else {
            return false
        }
        
        switch self {
        case CalcAccessory.dot where currentOperandLabel.contains(CalcAccessory.dot):
            return true
        case CalcAccessory.zero where currentOperandLabel == CalcAccessory.zero:
            return false
        case CalcAccessory.doubleZero where currentOperandLabel == CalcAccessory.zero:
            return false
        default:
            return false
        }
    }
    
    func canReturn(_ currentOperandLabel: String?) -> String? {
        guard let currentOperandLabel = currentOperandLabel else {
            return nil
        }
        
        switch (self, currentOperandLabel) {
        case (CalcAccessory.dot, CalcAccessory.zero), (CalcAccessory.dot, CalcAccessory.nan):
            return CalcAccessory.zero + CalcAccessory.dot
        case (CalcAccessory.doubleZero, CalcAccessory.nan), (CalcAccessory.zero, CalcAccessory.nan):
            return CalcAccessory.zero
        default:
            return nil
        }
    }
}
