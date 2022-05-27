//
//  String+Extensions.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/19.
//

import Foundation

extension String {
    func formatAsNumber() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 20
        formatter.roundingMode = .halfUp
        
        let number = Double(self) ?? 0
        let result = formatter.string(for: number) ?? ""
        return result
    }
    
    func split(with target: Character) -> [String] {
        let data = self.map { $0 }
        var result = [String]()
        var storage = ""
        
        data.forEach {
            if $0 == target {
                result.append(storage)
                
                let operatorValue = String($0)
                result.append(operatorValue)
                
                storage = ""
            } else {
                let letter = String($0)
                storage += letter
            }
        }
        
        if storage.isNotEmpty {
            result.append(storage)
        }
        
        return result
    }
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
