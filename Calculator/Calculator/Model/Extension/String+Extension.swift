//
//  String+Extension.swift
//  Calculator
//
//  Created by 허건 on 2022/05/20.
//

extension String {
    func split(with target: Character) -> [String] {
        let splitStringResult = split(separator: target)
            .map{ (word: String.SubSequence) -> String in
                let resultWord = String(word)
                return resultWord
            }
        return splitStringResult
    }
}
