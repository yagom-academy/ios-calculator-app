//
//  CalculatorManager.swift
//  Calculator
//
//  Created by Minsup on 2023/06/08.
//

extension CalculatorViewController {
    final class CalculatorManager {
        private var expression: String = ""
        
        private var incomingRecentOperand: String {
            return self.getRecentOperand()
        }
        
        private var incomingRecentOperator: String {
            return self.getRecentOperator()
        }
        
        func inputOperand(_ element: String) -> String {
            let isMaxLengthReached = self.incomingRecentOperand.count >= Constraints.inputMaxLength
            let isDuplicateDecimal = element == Symbol.dot && incomingRecentOperand.contains(Symbol.dot)
            
            if isMaxLengthReached || isDuplicateDecimal {
                return InputFormatter.format(from: self.incomingRecentOperand)
            }
            
            self.expression.append(element)
            
            return InputFormatter.format(from: self.incomingRecentOperand)
        }
        
        
        func inputOperator(_ element: String, record: (String, String) -> Void) -> String {
            if let last = self.expression.last, last.isOperator {
                self.expression.removeLast()
            } else if self.expression.isNotEmpty {
                record(self.incomingRecentOperator, ResultFormatter.format(from: self.incomingRecentOperand))
            } else {
                return Symbol.empty
            }
            
            self.expression.append(element)
            return element
        }
        
        func toggleSign() -> String {
            let isNegative = self.incomingRecentOperand.first == Sign.minus
            let isZero = self.incomingRecentOperand.isEmpty
            
            let signToggledOperand =  isNegative || isZero
            ? String(self.incomingRecentOperand.dropFirst())
            : String(Sign.minus) + self.incomingRecentOperand
            
            self.clearRecentOperand()
            self.expression.append(signToggledOperand)
            return InputFormatter.format(from: self.incomingRecentOperand)
        }
        
        func allClear() {
            self.expression = Symbol.empty
        }
        
        func clearRecentOperand() {
            if let recentOperatorIndex = self.getRecentOperatorIndex()  {
                self.expression = String(self.expression[...recentOperatorIndex])
            } else {
                self.expression = Symbol.empty
            }
        }
        
        func deliverResult(record: (String, String) -> Void) -> String {
            if self.incomingRecentOperand.isEmpty {
                self.expression.append(Number.zero)
            }
            
            do {
                record(self.incomingRecentOperator, ResultFormatter.format(from: self.incomingRecentOperand))
                var formula = ExpressionParser.parse(from: self.expression)
                let result = try formula.result()
                self.expression = ExpressionFormatter.format(from: result)
                return ResultFormatter.format(from: self.incomingRecentOperand)
            } catch {
                return ResultFormatter.format(from: self.incomingRecentOperand)
            }
        }
        
        private func getRecentOperand() -> String {
            if let recentOperatorIndex = self.getRecentOperatorIndex() {
                let startIndex = self.expression.index(after: recentOperatorIndex)
                let substring = self.expression[startIndex...]
                let result = String(substring)
                return result
            }
            return self.expression
        }
        
        private func getRecentOperatorIndex() -> String.Index? {
            return self.expression.lastIndex { $0.isOperator }
        }
        
        private func getRecentOperator() -> String {
            if let recentOperator = self.expression.last(where: { $0.isOperator }) {
                return String(recentOperator)
            } else {
                return Symbol.empty
            }
        }
    }
}

extension CalculatorViewController {
    enum Constraints {
        static let inputMaxLength = 15
    }
    
    enum Sign {
        static let minus: Character = "-"
    }
    
    enum Symbol {
        static let dot = "."
        static let empty = ""
    }
    
    enum Number {
        static let zero = "0"
    }
}
