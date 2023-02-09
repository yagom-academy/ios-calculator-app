final class Observable<T> {
    var value: T {
        didSet {
            self.labelUpdateClosure?(value)
        }
    }
    
    var labelUpdateClosure: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func subscribe(labelUpdateClosure: @escaping (T) -> Void) {
//        labelUpdateClosure(value)
        self.labelUpdateClosure = labelUpdateClosure
    }
}
