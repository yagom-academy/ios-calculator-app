//
//  Double+.swift
//  Calculator
//
//  Created by Kiseok on 2023/10/12.
//

extension Double: CalculateItem {
    func haveDecimalPlace() -> Bool {
        let integer = Double(Int(self))
        let DecimalPlace = self - integer
        return DecimalPlace != 0
    }
}
