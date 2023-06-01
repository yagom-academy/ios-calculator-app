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

extension String {
    func count(of character: Character) -> Int {
        var count = 0
        for char in self where char == character {
            count += 1
        }
        return count
    }
}
