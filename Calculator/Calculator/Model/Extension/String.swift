//
//  String.swift
//  Created by Wonbi
//

extension String {
    func split(wiht target: Character) -> [String] {
        let splitComponents = self.split(separator: target, omittingEmptySubsequences: true)
        var result = [String]()
        
        splitComponents.forEach { result.append(String($0)) }
        
        return result
    }
}
