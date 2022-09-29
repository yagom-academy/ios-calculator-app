//
//  Charactor+.swift
//  Calculator
//
//  Created by 이경민 on 2022/09/29.
//

extension Character {
    var shouldConvertOperator: Bool {
        return Operator(rawValue: self) != nil
    }
}
