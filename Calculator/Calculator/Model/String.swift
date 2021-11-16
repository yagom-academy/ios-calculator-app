extension String {
    func split(with target: Character) -> [String] {
        return self.split(separator: target).map { String($0) }
    }
    
    func hasOnlyNumberOrOperator() -> Bool {
        for character in self {
            if character.isNotNumber
                && ["+","-","/","*"].contains(character) == false {
                return false
            }
        }
        
        return true
    }
    
    func firstAndLastCharacterAreNumbers() -> Bool {
        guard let firstCharacter = self.first,
              let lastCharacter = self.last else {
            return false
        }
        
        return firstCharacter.isNumber && lastCharacter.isNumber
    }
}
