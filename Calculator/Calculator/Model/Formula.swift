//
//  Formula.swift
//  Calculator
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<String>
    
    func result() -> Double {
        fatalError()
    }
}
