//
//  Formula.swift
//  Calculator
//
//  Created by Ari on 2021/11/11.
//

import Foundation

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() -> Double {
        guard operands.count > 1, operands.front != nil else {
            operators.clear()
            operands.clear()
            return 0.0
        }
        var result: Double = 0
        do {
            result = try calculateFirst()
        } catch let error as CalculatorError {
            print(error.description)
        } catch {
            print(error.localizedDescription)
    init() {
        self.operands = CalculatorItemQueue<Double>()
        self.operators = CalculatorItemQueue<Operator>()
    }
    
    init(opreands: CalculatorItemQueue<Double>,
         operators: CalculatorItemQueue<Operator>) {
        self.operands = opreands
        self.operators = operators
    }
    
        }
        guard operands.isEmpty == false else {
            return result
        }
        repeat {
            do {
                result = try calculateFromTheSecond(lhs: result)
            } catch let error as CalculatorError {
                print(error.description)
            } catch {
                print(error.localizedDescription)
            }
        } while operands.isEmpty == false
        if operators.isEmpty == false {
            operators.clear()
        }
        return result
    }
    
    private mutating func calculateFirst() throws -> Double {
        let element = try operators.dequeue()
        let lhs = try operands.dequeue()
        let rhs = try operands.dequeue()
        return element.calculate(lhs: lhs, rhs: rhs)
    }
    
    private mutating func calculateFromTheSecond(lhs: Double) throws -> Double {
        let element = try operators.dequeue()
        let rhs = try operands.dequeue()
        return element.calculate(lhs: lhs, rhs: rhs)
    }
}
