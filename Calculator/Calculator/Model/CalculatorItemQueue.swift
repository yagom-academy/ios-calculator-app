struct CalculatorItemQueue<T>: CalculateItem {
    var calculateItems = [T]()
    
    mutating func enqueu(_ element: T) {
        calculateItems.append(element)
    }
}
