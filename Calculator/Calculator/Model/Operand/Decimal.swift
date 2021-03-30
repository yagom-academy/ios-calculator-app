//
//  Decimal.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/30.
//

import Foundation

struct Decimal: Operand {
    typealias ValueType = Double
    
    private(set) var value: ValueType
    private(set) var text: String
    static let zero: Self = Self.init(0)
    static var max: ValueType = pow(10, Double(Constant.maxDigitCount)) - 1
    static var min: ValueType = -(pow(10, Double(Constant.maxDigitCount)) - 1)

    var description: String {
        return text
    }
    
    init?(_ text: String) {
        guard let value = Double(text) else { return nil }
        if value < 0 {
            guard String(value).count <= (Constant.maxDigitCount + 3) else { return nil }
        }
        guard String(value).count <= (Constant.maxDigitCount + 2) else { return nil }
        
        self.value = value
        self.text = value.truncatingRemainder(dividingBy: 1.0) == 0.0 ? String(Int(self.value)) : text
    }
    
    init(_ value: Double) {
        var formattedValue: Double = value.truncatingRemainder(dividingBy: Double(Self.max) + 1)
        let count: Int = Constant.maxDigitCount - String(Int(formattedValue)).count
        formattedValue = ceil(formattedValue * pow(10, Double(count))) / pow(10, Double(count))
        
        self.value = formattedValue
        self.text = formattedValue.truncatingRemainder(dividingBy: 1.0) == 0.0 ? String(Int(self.value)) : String(self.value)
    }
}
