//
//  String+Extensions.swift
//  Calculator
//
//  Created by 이원빈 on 2022/05/19.
//

import Foundation

extension String {
    
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
    
    mutating func removeEntire(character: Character) {
        
        while self.contains(character) {
            guard let indexOfCharacter = firstIndex(of: character) else { return }
            self.remove(at: indexOfCharacter)
        }
    }
}
