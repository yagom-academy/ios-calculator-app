//
//  String.swift
//  Created by Wonbi
//

extension String {
    func split(with target: Character) -> [String] {
        let splitComponents = self.split(separator: target, omittingEmptySubsequences: true)
        
        return splitComponents.map { String($0) }
    }
}
