//
//  Operator.swift
//  Calculator
//
//  Created by jin on 9/21/22.
//

enum Operator: Character, CaseIterable {
    
    public case add = "+"
    public case subtract = "-"
    public case divide = "÷"
    public case multiply = "×"
    
    private add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
    
    private multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
}
