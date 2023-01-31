# 계산기 프로젝트
## 프로젝트 개요
* 피연산자와 연산자를 입력해 계산을 진행하는 프로젝트
* 프로젝트 인원: [Brody]()
* 프로젝트 기간: 2023.01.24 ~ 2023.02.03

## 목차
- [타임라인](#타임라인)
- [UML](#UML)
- [기능 설명](#기능-설명)
- [트러블 슈팅](#트러블-슈팅)
- [키워드](#프로젝트를-통해-학습한-키워드)
- [참고 자료](#참고-자료)


## 폴더 구조

```
├── Controller
|   ├── ViewController
├── Model
|   ├── CalculatorItem
|   ├── Operator
|   └── Formula
|   └── ExpressionParser
|   └── CalculatorItemQueue
└── View
    ├── Main
    └── Assets

```

----
    
## 타임라인
> 시간 순으로 프로젝트의 주요 진행 척도를 표시
> - 23.01.24(화): Queue자료구조 학습 
> - 23.01.25(수): UML작성 및 STEP1 TDD 진행, PR요청
> - 23.01.26(목): STEP1 머지 후 STEP2 진행
> - 23.01.27(금): STEP2 PR 요청목표

## UML
<img src="https://i.imgur.com/0iCVmIX.png"/>

<br/>


## 기능 설명

## 트러블 슈팅
### STEP1
### 테스트 케이스끼리의 의존성

실제 코드에서 프로퍼티를 private으로 접근제어를 설정함으로써 테스트케이스에서 직접 접근해 요소를 추가하거나 제거할 수 없었습니다. 이 떄문에 이미 작성한 테스트케이스메서드를 통해서 작성을 했는데요, 완전히 검증되었다고 할 수 없는 테스트케이스함수를 사용한다는 것이 조금 불완전한 코드를 작성하고 있는 것이 아닌가 생각이 들었습니다.

```swift 
func test_isEmpty호출시_dequeueStack과enqueueStack모두비어있다면_true를반환한다() {
    // given
    let input = ["1", "2", "3"]
    let inputAfterEnqueue = ["4", "5", "6"]
    let expectation = true

    // when
    input.forEach { sut.enqueueCurrentItem($0) }
    sut.dequeueCurrentItem()
    inputAfterEnqueue.forEach { sut.enqueueCurrentItem($0) }

    sut.removeAllElement()
    let result = sut.isEmpty

    // then
    XCTAssertEqual(result, expectation)
}
```
위 코드는 isEmpty를 검증하는 테스트케이스인데 내부에서 enqueueCurrentItem과 dequeueCurrentItem, resetAllElement라는 함수들을 실행하고 있습니다. 테스트케이스에서 여러 함수들의 의존을 피하기 위한 방법으로는 테스트할 때는 프로퍼티를 public으로 선언한 후 직접 접근해서 값을 조작하고, 테스트가 완료가 되면 private으로 변환하는 방법이 있겠다고 생각했습니다. 하지만 이 방법또한 추후 다시 테스트를 진행할 때는 접근제어를 풀고 해야하기 때문에 불편할 것 같다고 생각이 들었습니다. 그래서 의존성 주입을 생각했습니다.
```swift
func test_isEmpty호출시_dequeueStack과enqueueStack모두비어있다면_true를반환한다() {
    // given
    let input = ["1", "2", "3"]
    let expectation = true

    // when
    sut = CalculatrItemQueue<String>(inputs: input)
    sut.dequeueCurrentItem() 

    sut.removeAllElement()
    let result = sut.isEmpty

    // then
    XCTAssertEqual(result, expectation)
}
```
- 이처럼 enqueue테스트메서드를 사용하지 않아도 input값들을 외부에서 주입함으로써 사용할 수 있었습니다. 이 경우에도 `removeAllElement`함수나, `isEmpty`에 대한 의존은 피할 수 없지만 의존도를 최대한으로 줄이면서 테스트코드를 작성하는 것이 테스트코드 작성의 지향점이라고 느꼈습니다.

### 자료구조의 사용
큐 타입 구현을 위한 자료구조 몇가지를 살펴봤습니다.
기본적으로는 내장되어있는 Array가 있고 연결리스트, Array두 개를 이용한 더블스택이 존재한다는 것을 알게되었습니다.

전 이번 프로젝트에서 다음의 이유로 더블스택을 사용했습니다.

- **요소를 추가하거나 제거할 때 O(1)의 시간복잡도를 가진다.**
array로 큐를 구현할 경우 앞에서부터 지워진다면 nil이 존재하게 되고 이를 제거하는 O(n)의 시간복잡도를 필요로 하게 됩니다. 연결리스트의 경우에는 뒤 요소를 지울때 tail이 앞 요소의 주소값을 갖고있는 것이 아니라면 다시 tail을 할당하기위해 O(n)작업을 해야 하기 때문에 이중연결리스트로 구현하는 것이 아니라면 비효율적일 수 있겠다고 생각했습니다.
- **공간복잡도가 O(N)이다.**
배열로 큐를 구현했을 경우 하나의 Array에 모든 요소를 담게 됩니다. 더블 스택은 배열을 두개를 사용하지만 하나의 큐에 있는 요소들을 나누어서 담고 있기 때문에 동일하게 O(N)의 시간복잡도를 가지게 됩니다.

###### 다만 이 자료구조는 dequeue가 비어있을 때 enqueue의 요소들을 전부 옮긴뒤 삭제하는 작업이 있는데 이는 O(N)의 시간복잡도를 가지게 됩니다. 즉 항상 O(1)은 아니고 O(N)이 섞여있습니다. 그래도 이 작업은 기본 Array를 이용한 방법(dequeue시 항상 O(N)연산)보다는 개선되어있다고 생각해서 채택했습니다.

### STEP2
### 고차함수의 사용
외부에서 계산표현식들을 받아 연산자들을 분리해서 숫자배열들만 반환해주는 `componentsByOperators`함수를 작성했습니다. 
```swift
// let input = "1+2*32-42"
func componentsByOperators(input: String) -> [String] {
    for oper in Operator.allCases {
        switch oper {
        case .add:
            numbers = input.split(with: "+")
        case .subtract:
            separateNumbers(sep: "-", numbers: &numbers)
        case .divide:
            separateNumbers(sep: "/", numbers: &numbers)
        case .multiply:
            separateNumbers(sep: "*", numbers: &numbers)
        }
    }    
}

func separateNumbers(sep: Character, numbers: inout [String]) {
    var idx = 0
    // [1,2,3]
    while idx < numbers.count {
        if let _ = Int(numbers[idx]) {
            idx += 1
            continue
        }

        var move = 0
        let target = numbers.remove(at: idx)
        for x in target.split(with: sep).reversed() {
            numbers.insert(x, at: idx)
            move += 1
        }
        idx += move
    }
}
```
- 하지만 위 코드는 componentsByOperator가 다른 함수인 separateNumbers를 사용하고 있다는 점과 조금 복잡해보이는 while문을 사용하고 있는 단점이 있었습니다. 이를 개선하기 위해 고차함수를 사용했습니다.
```swift
func componentsByOperators(from input: String) -> [String] {
    var numbers: [String] = [input]

    Operator.allCases.forEach { oper in
        numbers = numbers.map{ $0.split(with: oper.rawValue) }.flatMap { $0 }
    }
    return numbers
}
```
- map을 사용해서 각 요소들이 연산에 맞는 split할 수 있게 만들고 생성된 2차원배열을 flatMap을 통해 1차원배열로 만들었습니다. 
### 프로젝트를 통해 학습한 키워드
- `TDD`, `Unit test`
- `접근제어`
- `UML`
- `고차함수`, `map`, `flatMap`



## 참고 자료
- [kodecocodes git - queue](https://github.com/kodecocodes/swift-algorithm-club/tree/master/Queue)
- [kodeco - queue](https://www.kodeco.com/848-swift-algorithm-club-swift-queue-data-structure)
- [Apple git - RangeRelaceableCollection](https://github.com/apple/swift/blob/main/stdlib/public/core/RangeReplaceableCollection.swift)
- [개발자 아라찌 - Swift로 구현한 Queue와 더블스택](https://apple-apeach.tistory.com/8)
