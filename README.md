# 📱ios-calculator-app
> 프로젝트 기간 2022.03.14 ~
> 
> ✏️ 팀원 : [Doogie](https://github.com/doogie97) / 🎤 리뷰어 : [라자냐](https://github.com/wonhee009)

- [프로젝트 규칙](#프로젝트-규칙)
- [UML](#프로젝트-규칙)
- [STEP 1 기능 구현](#step-1-기능-구현)
    + [고민했던 것들](#고민했던-것들)
    + [배운 개념](#배운-개념)
    + [PR 후 개선사항](#pr-후-개선사항)
## 프로젝트 규칙
- 🕐 시간
    - 월,화,목 AM09:00 ~ PM08:00 + α
    - 수,금 AM09:00 ~ PM06:00
    - 주말은 필요에 따라

## UML 
![](https://i.imgur.com/S7NAWZo.png)
(해당 UML은 제가 작성한 것이 아닌 프로젝트 요구사항임)

## STEP 1 기능 구현
- DoubleStack을 이용해 Queue구현

## 고민했던 것들
#### *`DoubleStack`* VS *`LinkedList`*
- *`DoubleStack`* 와 비교해 *`LinkedList`* 의 장점은 요소 중간의 값에 접근하기가 더 쉽고 빠르다는 것이다. 그런데 이번 계산기 프로젝트에서는 중간 값에 접근할 필요도 없으니 해당 이점을 사용하지 않는다면 공간복잡도가 더 낮은 Double스택을 사용하는것이 좋다고 생각했다.
(+ EC버튼은 가장 나중에 들어온 요소를 제거해야 하기에 이 부분에서도 DoubleStack이 더 유리하다고 판단)

## 배운 개념
- *`Queue`*
- *`DoubleStack`*
- *`LinkedList`*

## PR 후 개선사항
- Double Stack으로 큐를 구현함에 있으 낮은 이해도로 인해 발생된 문제 들 개선

1. count

변경전
```swift
var count: Int { dequeueList.isEmpty ? enqueueList.count : dequeueList.count }
```
변경 후
```swift
var count: Int { enqueueList.count + dequeueList.count }
```
2. first, last
변경전
```swift
var first: item? { enqueueList.first }
var last: item? { enqueueList.last }
```
변경 후
```swift
var first: item? { dequeueList.isEmpty ? enqueueList.first : dequeueList.last }
var last: item? { enqueueList.isEmpty ? dequeueList.first : enqueueList.last }
```
## STEP 2 기능 구현
- 연산자에 따른 연산 방법 구현
- 입력된 계산식을 연산자와 피연산자로 구분
- 구분된 연산자와 피연산자를 각각의 큐에 넣기

## 고민했던 것들
### 1. 계산식 인큐 방식 고민

최초에는 연산자를 누를 때 마다 큐에 추가되는 방식으로 구현하고 싶었음
그래서 뷰컨트롤러에서의 구현까지 염두해 두고 뷰컨트롤러에 Formula 인스턴스를 생성해 연산자를 한번 눌러줄 때 마다 큐에 추가하려는 방식으로 구현했음

그런데 프로젝트에서 요청한 UML에 끼워 맞추다 보니 불필요한 과정이 너무 많이 생기기 시작
예를 들면
```swift
func parse(from input: String) -> Formula
```
위 함수의 반환값은 Formula타입인데 해당 타입을 활용하면서 연산자를 누를 때마다 enqueue를 해주려면 아래와 같은 방식으로밖에는 구현이 힘들었음
```swift
    func test_parse호출후result호출시_125빼기5곱하기음수4나누기음수5이_96을반환하는지() {
        var result = ExpressionParser.parse(from: "125")
        sut.operands.enqueue(result.operands.dequeue()!)
        result = ExpressionParser.parse(from: "-5")
        sut.operands.enqueue(result.operands.dequeue()!)
        sut.operations.enqueue(result.operations.dequeue()!)
        result = ExpressionParser.parse(from: "×-4")
        sut.operands.enqueue(result.operands.dequeue()!)
        sut.operations.enqueue(result.operations.dequeue()!)
        result = ExpressionParser.parse(from: "÷-5")
        sut.operands.enqueue(result.operands.dequeue()!)
        sut.operations.enqueue(result.operations.dequeue()!)
        
        XCTAssertEqual(sut.result(), 96)
    }
```
위는 테스트 코드 인데 UML이 연산자와 피연산자를 분리한 값을 Formula타입으로 반환하기를 원하다 보니 반환된 값에서 다시 dequeue를 해서 뷰컨에서 생성된 Formula인스턴스로 넣어주는 불필요한 과정이 생겨버림

(애초에 Formula로 반환하는 것이 parse() 함수에서 직접 넣어 줄 수 있으면 위 방법도 좋았겠으나 이번 프로젝트는 기존 UML에 필요한 타입등은 추가가 가능하나 이미 설정된 내용은 수정이 불가하기에 전체적으로 뒤엎고 현재와 같이 연산자, 피연산자를 하나의 스트링으로 받아 = 을 눌렀을 때 한번만 반환 하도록 구현)

#### 2. Character(요소) 를 통해 변환시 요소가 한자리가 아닐 때

```swift=
        for element in formulaArray {
            if let number = Double(element) {
                operandQueue.enqueue(number)
            }
            if let operation = Operator(rawValue: Character(element)) {
                operationQueue.enqueue(operation)
            }
        }
```
이렇게 실행했을 때 Character(element)에 한자리 숫자가 아닌 수가 들어올 경우 발생되는 문제
해당 배열에는 double로 변환되는 요소 아니면 character로 변환되는 연산자 둘중 하나라고 생각해
아래와 같이 수정

```swift=
        for element in formulaArray {
            if let number = Double(element) {
                operandQueue.enqueue(number)
                continue
            }
            if let operation = Operator(rawValue: Character(element)) {
                operationQueue.enqueue(operation)
            }
        }
```

## 배운 개념
- *`기존 타입의 확장 및 메서드 생성`*
- *`map & compactMap`*
- *`nan`*

## PR 후 개선사항
