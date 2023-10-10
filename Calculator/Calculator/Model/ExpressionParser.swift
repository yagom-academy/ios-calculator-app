//
//  ExpressionParser.swift
//  Calculator
//
//  Created by jyubong on 10/10/23.
//

enum ExpressionParser {
    
}

extension String {
    func split(with target: Character) -> [String] {
        var splitedString = self.split(separator: target).map{ String($0) }
        let limitCount = splitedString.count - 1
        
        splitedString.enumerated().forEach{(index, _) in
            guard index < limitCount else { return }
            
            splitedString.insert(String(target), at: index+1)
        }
        
        return splitedString
    }
}
