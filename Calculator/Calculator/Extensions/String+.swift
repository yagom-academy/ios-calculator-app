//
//  String+.swift
//  Calculator
//
//  Created by Minsup on 2023/05/31.
//

extension String {
    func split(with target: Character) -> [String] {
        var wordsBeforeTarget: String = ""
        var listToReturn: [String] = []
        
        self.forEach { element in
            if element != target {
                wordsBeforeTarget.append(element)
            } else {
                listToReturn.append(wordsBeforeTarget)
                listToReturn.append(String(element))
            }
        }
        
        return listToReturn
    }
}
