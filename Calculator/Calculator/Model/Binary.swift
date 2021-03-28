//
//  Binary.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/26.
//

import Foundation

struct Binary {
    private(set) var value: Int
    private(set) var text: String
    static let max = Int(pow(Double(2), Double(Constant.numberOfDigits - 1)) - 1)
    static let min = -Int(pow(Double(2), Double(Constant.numberOfDigits - 1)))
    
    init?(_ text: String) {
        guard let value = Int(text, radix: 2) else { return nil }
        
        if (text.count == Constant.numberOfDigits) && (text.first == "1") {
            self.value = value - 1 - Self.maxByDigits
        } else if text.count > Constant.numberOfDigits {
            return nil
        }
        
        self.value = value
        self.text = text
    }
    
    init(_ value: Int) {
        self.value = (value < 0) ? (value % (Self.min - 1)) : (value % (Self.max + 1))
        self.text = Self.twosComplement(for: self.value)
    }
    
    static func twosComplement(for number: Int) -> String {
        return number < 0 ? String(UInt(Self.maxByDigits + Int(number) + 1), radix:2) : String(number, radix:2)
    }
}

infix operator ~& : MultiplicationPrecedence
infix operator ~| : AdditionPrecedence

extension Binary: Operand {
    static var zero: Self = Self.init(0)
    static let maxByDigits: Int = Int(pow(2, Double(Constant.numberOfDigits))) - 1
    
    prefix static func ~ (x: Self) -> Self {
        return self.init(~x.value)
    }
    
    prefix static func - (x: Self) -> Self {
        return self.init(-x.value)
    }
    
    static func << (lhs: Self, rhs: Self) -> Self {
        return self.init(lhs.value << rhs.value)
    }
    
    static func >> (lhs: Self, rhs: Self) -> Self {
        return self.init(lhs.value >> rhs.value)
    }
    
    static func & (lhs: Self, rhs: Self) -> Self {
        return self.init(lhs.value & rhs.value)
    }
    
    static func ~& (lhs: Self, rhs: Self) -> Self {
        return self.init( ~(lhs.value & rhs.value))
    }
    
    static func + (lhs: Self, rhs: Self) -> Self {
        return self.init(lhs.value + rhs.value)
    }
    
    static func - (lhs: Self, rhs: Self) -> Self {
        return self.init(lhs.value - rhs.value)
    }
    
    static func | (lhs: Self, rhs: Self) -> Self {
        return self.init(lhs.value | rhs.value)
    }
    
    static func ~| (lhs: Self, rhs: Self) -> Self {
        return self.init(~(lhs.value | rhs.value))
    }
    
    static func ^ (lhs: Self, rhs: Self) -> Self {
        return self.init(lhs.value ^ rhs.value)
    }
    
    var description: String {
        return text
    }
}
