//
//  String.swift
//  Calculator
//
//  Created by Borysarang, Yeton on 2022/05/19.
//

import UIKit
extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}

extension String {
    func canInput(_ sender: String) -> Bool {
        switch (sender, self) {
        case let (CalcAccessory.dot, operand) where operand.contains(CalcAccessory.dot):
            return false
        case (CalcAccessory.zero, CalcAccessory.zero):
            return false
        case (CalcAccessory.doubleZero, CalcAccessory.zero) :
            return false
        default:
            return true
        }
    }
    
    func removeComma() -> String {
        return self.replacingOccurrences(of: CalcAccessory.comma, with: CalcAccessory.empty) 
    }
    
    func applyNumberFormatter() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.roundingMode = .floor
        numberFormatter.minimumSignificantDigits = 0
        numberFormatter.maximumSignificantDigits = 20
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.maximumIntegerDigits = 20
        numberFormatter.maximumFractionDigits = 20
        
        return numberFormatter.string(for: Double(self)) ?? CalcAccessory.empty
    }
}
