extension String {
    func split(with target: Character) -> [String] {
        let endIndex = self.lastIndex(of: target) ?? self.startIndex
        let numbers = String(self[self.startIndex..<endIndex])
        
        return [numbers]
    }
}

extension Double: CalculateItem {
    
}
