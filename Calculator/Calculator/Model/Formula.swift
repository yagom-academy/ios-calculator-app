//
//  Calculator.swift
//  Calculator
//
//  Created by 김동욱 on 2022/03/14.
//

import Foundation

struct Formula {
    var operands = LinkedQueue<Double>()
    var operators = LinkedQueue<Operator>()
    
    mutating func result() -> Double {
        var asd = 0.0
        guard var lhs = operands.removeFirst()?.value else { return 0 }
        while operators.isEmpty != true {
            guard let rhs = operands.removeFirst()?.value else { return 0 }
            let oper = operators.removeFirst()
            asd = oper?.value?.calculate(lhs: lhs, rhs: rhs) ?? 0
            lhs = asd
            asd = lhs
        }
        return asd
        //        guard let lhs = operands.removeFirst()?.value else { return 0 }
        //        guard let rhs = operands.removeFirst()?.value else { return 0 }
        //
        //        let `operator` = operators.removeFirst()
        //        guard let result = `operator`?.value?.calculate(lhs: lhs, rhs: rhs) else { return 0}
        //
        //        return result
    }
}
