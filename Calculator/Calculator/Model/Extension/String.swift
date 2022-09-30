//
//  String.swift
//  Created by Wonbi
//

extension String {
    func split(wiht target: Character) -> [String] {
        let splitComponents = self.split(separator: target, omittingEmptySubsequences: true)
        
        return splitComponents.map { String($0) }
    }
}
