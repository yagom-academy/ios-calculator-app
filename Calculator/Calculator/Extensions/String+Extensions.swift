//
//  String+Extensions.swift
//  Calculator
//
//  Created by Gordon Choi on 2022/05/19.
//

extension String {
    func split(with target: Character) -> [String] {
        let data = self.map { String($0) }
        let target = String(target)
        var result = [String]()
        var storage = ""
        
        data.forEach {
            if $0 == target {
                result.append(storage)
                result.append(String($0))
                storage = ""
            } else {
                storage += $0
            }
        }
        
        if storage.isNotEmpty {
            result.append(storage)
        }
        
        return result
    }
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
