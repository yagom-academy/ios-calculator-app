//
//  PrecedenceGruop.swift
//  Calculator
//
//  Created by 김민성 on 2021/03/27.
//

import Foundation

// MARK: NAND, NOR Operator
infix operator ~& : MultiplicationPrecedence
infix operator ~| : AdditionPrecedence

func ~& (lhs: UInt, rhs: UInt) -> UInt {
    return ~lhs | ~rhs
}

func ~| (lhs: UInt, rhs: UInt) -> UInt {
    return ~lhs & ~rhs
}

// & : AND, ~& : NAND, | : OR, ~| : NOR, ^ : XOR, ~ : NOT, >> : rightShift, << : leftShift
