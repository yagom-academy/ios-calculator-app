extension String {
    func split(with target: Character) -> [String] {
        let endindex = self.firstIndex(of: target) ?? self.startIndex
        let numbers = String(self[self.startIndex..<endindex])
        
        return [numbers] + [String(target)]
    }
}

extension Double: CalculateItem {
    
}
