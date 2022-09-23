//
//  String.swift
//  Created by Wonbi
//

extension String {
    func split(wiht target: Character) -> [String] {
        return self.components(separatedBy: String(target))
    }
}
