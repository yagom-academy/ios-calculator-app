//
//  String+Extensions.swift
//  Calculator
//
//  Created by 김진태 on 2021/11/14.
//

import Foundation

extension String {
    func split(with target: Character) -> [String] {
        let targetString = String(target)
        let splittedStrings = self.components(separatedBy: targetString)
                                  .flatMap { [$0, targetString] }
                                  .dropLast()
                                  .filter { !$0.isEmpty }
                                  .map { String($0) }
        return splittedStrings
    }
}
