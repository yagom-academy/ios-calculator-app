final class Observable<T> {
    var labelUpdateClosure: ((T) -> Void)?
    
    var value: T {
        didSet {
            self.labelUpdateClosure?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func subscribe(labelUpdateClosure: @escaping (T) -> Void) {
        self.labelUpdateClosure = labelUpdateClosure
    }
}
