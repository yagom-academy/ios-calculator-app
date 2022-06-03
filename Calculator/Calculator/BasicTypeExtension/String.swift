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

extension String { //self , currentoperand
    func canInput(_ currentOperandLabel: String?) -> Bool {
        guard let currentOperandLabel = currentOperandLabel else {
            return false
        }
        
        if self == CalcAccessory.dot, currentOperandLabel.contains(CalcAccessory.dot) {
            return false
        }
        
        switch (self, currentOperandLabel) {
        case (CalcAccessory.zero, CalcAccessory.zero):
            return false
        case (CalcAccessory.doubleZero, CalcAccessory.zero) :
            return false
        default:
            return true
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
