extension String {
    func split(with target: Character) -> [String] {
        var standardIndex = firstIndex(of: target) ?? startIndex
        let front = String(self[startIndex..<standardIndex])
        
        standardIndex = index(after: standardIndex)
        let back = String(self[standardIndex..<endIndex])
        return [front] + [back]
    }
}

extension Double: CalculateItem {
    
}
