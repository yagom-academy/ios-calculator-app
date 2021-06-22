import Foundation

class Calculator {
	var currentInput = ""
	var infixNotation = [String]()
	
	
	func isPrior(operator first: String, to second: String) -> Bool {
		return "*/".contains(first) && "+-".contains(second)
	}
	
	func pushOperator(to stack: Stack, postfix: inout [String], element: String) {
		
		while let top = stack.top(), !isPrior(operator: element, to: top) {
			guard let top = stack.pop() else {
				continue
			}
			postfix.append(top)
		}
		stack.push(element: element)
	}
	
	func convertToPosfix() -> [String] {
		let tempStack = Stack()
		var postfix = [String]()
		
		for element in infixNotation {
			if let _ = Int(element) {
				postfix.append(element)
				continue
			}
			
			pushOperator(to: tempStack, postfix: &postfix, element: element)
		}
		while !tempStack.isEmpty() {
			postfix.append(tempStack.pop()!)
		}
		return postfix
	}
}
