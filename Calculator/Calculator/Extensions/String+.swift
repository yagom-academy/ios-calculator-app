//
//  String+.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

extension String {
    func split(with target: Character) -> [String] {
        let targetIndex: Index = self.lastIndex(of: target) ?? self.endIndex
        let targetBeforeWord = String(self.prefix(upTo: targetIndex))
        
        return [targetBeforeWord, String(target)]
    }
}
