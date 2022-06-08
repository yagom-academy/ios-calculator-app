//
//  String.swift
//  Calculator
//
//  Created by 유한석 on 2022/05/19.
//

import UIKit
extension String {
    func split(with target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}

extension String {
    func canInput(_ sender: String?) -> Bool {
        guard let sender = sender else {
            return false
        }
        
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
}
