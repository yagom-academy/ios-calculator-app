## iOS 커리어 스타터 캠프

### 계산기

# 목차
  
1. [제목](#제목)
2. [소개](#소개)
3. [팀원](#팀원)
4. [타임라인](#타임라인)
5. [프로젝트 구조](#프로젝트-구조)
6. [실행화면](#실행화면)
7. [트러블 슈팅](#트러블-슈팅)
8. [참고 링크](#참고-링크)

## 제목

- 계산기

## 소개

- 사용자가 숫자패드와 기호를 통해 입력한 값의 연산 결과를 출력하는 앱입니다.

## 팀원

| [Ayaan](https://github.com/oneStar92) |
|:---:|
|![](https://i.imgur.com/Unq1bdd.png)|

## 타임라인

- Step 1
    - `CalculatorItemQueue` Type 구현
    - Linked List 자료구조 구현
<details>
<summary>Details</summary>
    <div markdown="1">
        
- 2022.09.19
    - `CalculateItem`
    - `Node`
        - Linked List 구현.
    - `CalculateItemQueue`
        - `enqueue()`, `dequeue()` 자료 입출력 메소드 구현.
        - `peek()`, `clear()` 부가기능 구현.
    - Unit Test를 이용하여 TDD를 기반으로 코드 작성.
- 2022.09.20
    - `CalculateItemQueue`
        - 사용 요소가 `CalculateItem`프로토콜 준수하도록 구현.
- 2022.09.21
    - Unit Test 수정.
        - given, when, then가 명확하게 메소드에 표현되도록 수정.
        - `sut`, `setUpWithError`, `tearDownWithError`를 사용하여 좀더 깔끔한 코드 작성.
    </div>
</details>

- Step 2
    - `Operator` Type 구현.
    - `Formula` Type 구현.
    - `ExpressionPaser` Type 구현.
<details>
<summary>Details</summary>
    <div markdown="1">
        
- 2022.09.22
    - `Operator`
        - Case 구현.
        - `CaseIterable` 프로토콜 채택
        - 사칙연사을 수행하는 `calculate`메소드 구현
    - `Double`
        - `CalculateItem` 프로토콜 채택
- 2022.09.23
    - `String`
        - `split`메소드 오버로딩
    </div>
</details>

  
## 프로젝트 구조

- 자료 구조.

![](https://raw.githubusercontent.com/oneStar92/ios-calculator-app/Step_2/CalculateItemQueue_ClassDiagram.png)

  

## 실행화면

  

## 트러블 슈팅

### List 자료구조 선택.
- Queue: FIFO 방식으로 데이터를 입출력하는 자료구조.
- Queue를 어떤 List를 통하여 구현할지에 대한 많은 고민을 했습니다.
    - Array: 연속된 메모리 공간에 요소를 순차적으로 저장하는 자료 구조입니다.
        - index를 통해 요소에 접근가능합니다.
    - Linked List: 각각의 요소가 다음 요소의 주소를 가지고 있는 자료 구조입니다.
    - Doubly Linked List: 양방향으로 연결된 Linked List로 각각의 요소는 이전/다음 요소의 주소를 가지고 있는 자료 구조입니다.
    - 시간 복잡도
        - Array: FIFO 방식으로 추가는 O(1), 삭제는 O(n)
        - Linked List: FIFO 방식으로 추가는 O(1), 삭제는 O(1)
        - Doubly Linked List: FIFO 방식으로 추가는 O(1), 삭제는 O(1)

- **결론**
: Array의 경우 삭제가 O(n)의 시간 복잡도를 나타냄으로 후보에서 제외하였습니다. Linked List와 Doubly Linked List는 단방향과 양방향 연결의 차이를 나타내고 있고 이러한 차이점에 의해 검색 및 요소에 접근성은 Doubly Linked List가 더 유리합니다. 하지만 본 프로젝트에서는 요소에 접근하는 경우가 없다고 판단하여 더 가벼운 Linked List를 선택하였습니다.
    
### TDD.
- TDD: 테스트 주도 개발로 Unit Test를 진행하면서 개발을 하는 방식입니다. Red -> Green -> Blue 단계로 진행하여야 합니다.
    - Red: 테스트가 실패하는 단계
    - Green: 테스트를 통과하기 위해 최소한의 구현
    - Blue: Retactoring을 통해 코드를 정리.

- TDD를 사용해서 개발을 하는 것이 생각보다 까다로웠습니다. 어떠한 테스트 케이스를 테스트 해야되는지도 감을 잡지 못했고, Red 단계에선 어느정도 수준의 코드를 작성하고 해야 되는지도 햇갈렸습니다.
- 여러 캠퍼들과 토론한 끝에 아무것도 없는 상황에서 테스트 케이스를 먼저 작성한 후 테스트를 통과하기 위한 최소한의 코드를 작성하는 방법으로 TDD를 수행했습니다.


## 참고 링크
https://developer.apple.com/documentation/swift/caseiterable
https://ko.wikipedia.org/wiki/%ED%85%8C%EC%8A%A4%ED%8A%B8_%EC%A3%BC%EB%8F%84_%EA%B0%9C%EB%B0%9C
https://en.wikipedia.org/wiki/Queue
https://ko.wikipedia.org/wiki/%EC%97%B0%EA%B2%B0_%EB%A6%AC%EC%8A%A4%ED%8A%B8
https://en.wikipedia.org/wiki/Doubly_linked_list
