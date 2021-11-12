# 계산기 프로젝트

## 목차 
- [Step 1](#step-1)
  - [UML](#1-uml) 
  - [고민된 점 및 해결 방법](#2-고민된-점-및-해결-방법)
- [Step 2](#step-2)
  - [UML 분석](#1-uml-분석) 
  - [고민된 점 및 해결 방법](#2-고민된-점-및-해결-방법)

## Step 1 

구현 기간: 2021.11.08 ~ 09



### 1. UML
![CalculatorUML](https://user-images.githubusercontent.com/45652743/141072217-badda911-4d21-476f-bab8-a91dcab94259.png)

### 2. 고민된 점 및 해결 방법 

> 1. 타입 명시에 관한 부분 

`LinkedList`나 `CalculatorItemQueue`를 구현할 때에 특정한 타입을 선택해서 적어줘야 할까에 대한 고민을 해봤습니다. 현재는 계산기 프로젝트이기 때문에 유효한 타입으로는 `Double`(or `Float`)이나 `String`정도가 들어올 수 있다고 생각했습니다. 이에 특정한 타입을 정해두고 `LinkedList`나 `CalculatorItemQueue`를 구현하는 것이 아니라 generics를 활용하여 확장성있는 타입을 구현하였습니다. 또한 generics 사용시 `T`가 아닌 더 명확한 의미를 주고자 `Element`라는 키워드를 활용하였습니다


> 2. `Array` vs `LinkedList`

Queue를 구현하기 위해 어떠한 자료구조를 써야할지 고민을 해봤습니다. Array를 기반으로 queue를 구현한다면 별도의 추가 코드 없이 구현할 수 있겠지만, LinkedList의 이점이 명확하게 드러나는 것 같아 LinkedList 자료구조를 선택했습니다. 

|자료 구조|Array|LinkedList|
|---|---|---|
|장점|1. 인덱싱(검색)이 빠르다(`O(1)`)|1. 데이터 추가 및 삭제가 빠르다 <br> 2. 데이터 추가/삭제시 메모리 재배치가 필요없기에 오버헤드가 낮다  |
|단점|1. 메모리의 위치가 연속적이고 고정적이기에 오버헤드가 높다 <br> 2. 데이터 추가/삭제가 느리다 |1. 인덱싱(검색)이 느리다(`O(n)`) |

계산기 프로젝트에서는 값의 검색보다는 추가/삭제가 더 빈번하게 발생할 것이라 생각하여 `LinkedList` 타입을 선택하였고 그 중에서 `계산은 우선순위 없이 순서대로 된다`라는 부분에 착안하여 `Singly Linked List`를 구현한 후 이를 활용하여 Queue를 구현했습니다. 

> 3. TDD에 대하여 

TDD 기반으로 프로젝트를 진행해보고자 테스트 코드를 우선적으로 작성하였습니다. 테스트 코드를 짤 때 미세하게 놓친 부분들이 실제 프로덕션 코드를 구현할 때 생각이 나기도 했고 이를 수정해가며 테스트를 통과할 수 있는 코드를 작성해봤습니다. 테스트 실행 이후 code coverage를 살펴보며 커버되지 않는 부분이 있는지 스스로 피드백하며 테스트를 진행해봤습니다. 


## Step 2

구현 기간: 2021.11.10 ~ 12

### 1. UML 분석 

- `ExpressionPaser`
	- 연산식에서 피연산자와 연산자를 분리하는 역할과 책임을 갖는 타입이라고 생각했습니다. 
	- `parse`: 연산식에서 피연산자/연산자를 분리하고 이를 활용하여 `Formula` 인스턴스를 만들어 반환
	- `componentsByOperators`: 연산자를 제외한 연산자 배열만 반환하는 기능
- `String`
	- `split`: 특정 구분자를 갖고 연산식을 피연산자/연산자와 분리허는 기능
- `Operator`
	- 연산을 담당하는 타입 
	- 연산자 케이스와 각 케이스에 맞는 연산 로직 매칭 담당
- `Formula`
	- 최종 연산자/피연산자로 구성된 queue를 각각 가지고 있다.
	- 이를 통해 result 메서드를 사용하여 최종 연산 결과를 얻어내는 역할을 한다.


`Double`이나 `Operator`가 빈 프로토콜인 `CalculateItem`를 채택하는 이유는 `CalculatoritemQueue`가 다루는 요소가 `CalculateItem`를 채택하기 때문에 이들 또한 채택해야 요소로서 사용할 수 있을 것이라 생각했습니다. 


### 2. 고민된 점 및 해결 방법

> 1. guard 문 

```swift
while  operands.items.count  >  0  &&  operators.items.count  >  0 {
    guard let nextOperand = operands.dequeue() else {
        throw QueueError.queueIsEmpty
    }
    ...
}
```
이렇게 사전에 조건을 달아줌에 따라 요소가 있는 것을 확인해주는 역할을 하지만, 최대한 안정성을 추구하고자 내부에서 dequeue할 때 강제 언래핑이 아닌 옵셔널 바인딩을 사용했습니다. 



### Set 과 array

`Operator`인지 여부를 파악하기 위해 filter하는 부분에서 `Operator`의 `allCases`를 `Array`가 아닌 `Set`으로 두었습니다. 
그 이유는 `Set`의 `.contains` 시간 복잡도는 `O(1)`이고, `Array`의 `.contains`가 `O(n)`이어서 더 빠른 `Set`으로 구현하였습니다. 


