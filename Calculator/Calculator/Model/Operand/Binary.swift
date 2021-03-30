//
//  Binary.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/26.
//

import Foundation

struct Binary: Operand {
    typealias ValueType = Int
    
    private(set) var value: ValueType
    private(set) var text: String
    static let zero = Self(0)
    static let max = Int(pow(Double(2), Double(Constant.maxDigitCount - 1)) - 1)
    static let min = -Int(pow(Double(2), Double(Constant.maxDigitCount - 1)))
    static let unsignedMax = Int(pow(2, Double(Constant.maxDigitCount))) - 1
    
    var description: String {
        return text
    }
    
    init?(_ text: String) {
        guard var value = Int(text, radix: 2) else { return nil }
        guard text.count <= Constant.maxDigitCount else { return nil }
        
        if (text.count == Constant.maxDigitCount) && (text.first == "1") {
            value = value - 1 - Self.unsignedMax
        }
        
        self.value = value
        self.text = text
    }
    
    init(_ value: Int) {
        self.value = (value < 0) ? (value % (Self.min - 1)) : (value % (Self.max + 1))
        self.text = (self.value < 0) ? String(UInt(Self.unsignedMax + Int(self.value) + 1), radix:2) : String(self.value, radix:2)
    }
}
