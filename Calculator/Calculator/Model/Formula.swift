//  Calculator - Formula.swift
//  created by vetto on 2023/01/27

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    func result() -> Double {
        return 0
    }
}
