#  계산기 

## 목차
1. [소개](#-소개)
2. [팀원](#-팀원)
3. [타임라인](#-타임라인)
4. [트러블 슈팅](#-트러블-슈팅)
5. [핵심 경험](#-프로젝트-수행-중-핵심-경험)
6. [참고 링크](#-참고-링크)

## 1. 소개
사용자의 입력에 따른 계산이 가능한 계산기 앱입니다. 

<br>
![image]()



## 2. 팀원
| bella |
| --- |
| <img src=https://user-images.githubusercontent.com/99257965/190572701-5e51fd28-455f-4c3b-924d-0baade5011a3.png width=150> |
|  @hyhy0429 |

<br>

## 3. 타임라인
[STEP-1]
- 220919: 자료구조 큐(queue)에 대한 이해와 구현
    - 전반적인 자료구조 큐에 대한 구글링을 통해 주요 프로퍼와 메서드 확인 및 swift 내에서의 구현 시도
    - dequeue 메서드의 방법을 고려하여 시간복잡도가 O(n)으로 소요되는 방법 중 배열과 head 프로퍼티를 이용한 방법을 이용하여 큐 구현
- 220920: TDD-CalculatorItemQueueTests 작성
    - TDD를 통해 CalculatorItemQueue 메서드 리팩토링 및 구현하고자 하는 메서드 종류 결정 및 구현
- 220921: Double Stack을 이용하여 큐 구현방법 변경
    - 기존의 구현한 방법의 시간복잡도와 동일한 enqueue용과 dequeue용 배열 생성 후 배열 내부 프로퍼티인 reversed을 이용하여 큐 구현
    - 큐 내부 peek 메서드 추가 



[STEP-2]
- 220922: Enum Operator 파일 내부 케이스와 프로퍼티 구현, Formula 타입 구현
    - case 연산기호에 따른 각각의 연산 메서드는 private 지정 하였으며, caluculate 메서드를 활용하여 연산기호에 따른 메서드에 접근 가능하도록 구현 
    - 계산을 위한 계산식 구현에 있어서 조건을 이용하여 사용자 입력값에 다른 계산 가능
    - FormulaTests 파일 생성 후, 테스트 진행
- 220923: ExpressionParser 타입 내 메서드 구현에 대한 고민

<br>

## 4. 트러블 슈팅
### TDD 테스트 파일 내부 프로퍼티의 private 지정
- 처음에는 `CalculatorItemQueueTests` 내부에서 `CalculatorItemQueue` 의 프로퍼티에 접근하고자 private을 하지 않고 테스트 파일을 구현하였으나, 큐의 메서드만 자유롭게 사용하고 doubleStack의 프로퍼티들은 private 설정을 해주어 외부에서 접근이 불가하도록 해주어야 했으며, 이에 따라, 테스트 파일 내에서는 이전에 직접 프로퍼티에 접근했던 부분을  `CalculatorItemQueueTests`의 다른 메서드를 활용하여 테스트를 진행하여 문제를 해결하였습니다.

### FormulaTests
- Formula에서 구현한 코드가 제대로 작동하는지 테스트가 필요성을 느끼고 [STEP 2]에서 TDD를 통해 테스트의 중요성과 필요성을 느끼게 되었습니다.
- 테스트 구현에 있어서, 머릿속으로 예상한 결과와 resul()메서드의 결과값 숫자가 뭔가 계속 달라 문제를 찾지 못하다가 숫자가 반대서부터 계산이 되는 점을 발견하게 되었고, 캠퍼의 도움을 받아 enqueueStack에 담아야 할 값을 dequeueStack에 담고 있는 것을 알 수 있었습니다. 🥲
```swift
// 수정 전
 sut = Formula(operands: CalculatorItemQueue(dequeueStack: [5,3,1]),
                      operators: CalculatorItemQueue(dequeueStack: [Operator.multiply,Operator.add]))
// 수정 후
 sut = Formula(operands: CalculatorItemQueue(enqueueStack: [5,3,1]),
                      operators: CalculatorItemQueue(enqueueStack: [Operator.multiply,Operator.add]))
```

<br>

## 5. 프로젝트 수행 중 핵심 경험

- TDD 경험하기
- Queue 자료구조의 이해와 swift에서의 구현
- UML에 대한 이해를 기반으로 한 코드 구현
- 숫자와 연산자 입력에 큐 활용
- 고차함수의 활용
  

<br>

## 6. 참고 링크
- The Swift Programming Language (Swift 5.7)
    - [Generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
- Apple Developer - 고차함수
    - [filter](https://developer.apple.com/documentation/swift/sequence/filter(_:))
    - [map](https://developer.apple.com/documentation/swift/array/map(_:)-87c4d)
    - [compactMap](https://developer.apple.com/documentation/swift/sequence/compactmap(_:))

- 도구 사이트
    - [drawio - UML](https://app.diagrams.net/#G1GfUnm8pqcSgVwBMxitc_-zU6mqlr4KEm)



---
[🔝 맨 위로 이동하기](#계산기)
