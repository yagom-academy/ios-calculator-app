## iOS 커리어 스타터 캠프

### 계산기 I 프로젝트 저장소
> 프로젝트 기간 2022.03.14 ~ 2022.03.25 <br/>
팀원 : [@grumpy-sw](https://github.com/grumpy-sw) | 리뷰어: [@jungseungyeo](https://github.com/https://github.com/jungseungyeo)

- [계산기 I](#계산기-I)
- [STEP 1](#[STEP-1]-Queue-타입-구현)
    + [UML](#STEP-1-UML)
    + [기능 구현](#STEP-1-기능-구현)
    + [고민했던 것](#STEP-1-고민했던-것들)
    + [배운 개념](#STEP-1-배운-개념)
    + [PR 후 개선사항](#STEP-1-PR-후-개선사항)
- [STEP 2](#[STEP-2]-계산-타입-및-주변-타입-구현)
    + [UML](#STEP-2-UML)
    + [기능 구현](#STEP-2-기능-구현)
    + [고민했던 것](#STEP-2-고민했던-것들)
    + [배운 개념](#STEP-2-배운-개념)
    + [PR 후 개선사항](#STEP-2-PR-후-개선사항)

## 계산기 I

## [STEP 1] Queue 타입 구현
- TDD를 기반으로 수행합니다.
- 프로젝트에 단위 테스트를 위한 타깃을 추가합니다.
- 계산기가 입력받은 숫자와 연산자는 연산큐에 쌓입니다.

## STEP 1 UML
![스크린샷 2022-03-16 오후 3 10 13](https://user-images.githubusercontent.com/63997044/158528313-cf17a7a6-1ec5-4d8e-886e-d12b40bb066f.png)

## STEP 1 기능 구현
- ```CalculateItem```
    - 큐 내부의 요소들이 준수할 빈 프로토콜

- ```Node``` 
    - ```data```: 노드가 저장하고 있는 값
    - ```prev```: 자신의 앞 순서의 노드를 가리키는 변수
    - ```next```: 자신의 뒷 순서의 노드를 가리키는 변수

- ```LinkedList```
    - ```head```: 리스트의 맨 첫 번째 노드를 가리키는 변수
    - ```tail```: 리스트의 맨 마지막 노드를 가리키는 변수
    - ```count```: 리스트의 전체 길이를 나타내는 변수
    - ```isEmpty```: 리스트가 현재 비어있는지를 나타내는 변수
    - ```node(at index: Int)```: 인덱스의 노드 정보를 반환하는 함수
    - ```append(_ data: T)```: 리스트의 맨 뒤에 새로운 노드를 추가하는 함수
    - ```insert(_ data: T, at index: Int)```: 리스트의 해당 위치에 새로운 노드를 추가하는 함수
    - ```remove(at index: Int)```: 리스트의 해당 위치의 노드를 제거하는 함수
    - ```peekData()```: 리스트의 head의 데이터를 반환하는 함수
    - ```removeHead()```: 리스트의 head를 제거하고 그 데이터를 반환하는 함수
    - ```removeAll()```: 리스트를 초기화하는 함수 
- ```CalculatorItemQueue```
    - ```data```: 큐의 데이터를 나타내는 연결 리스트
    - ```count```: 큐의 전체 길이를 나타내는 변수
    - ```isEmpty```: 큐가 현재 비어있는지를 나타내는 변수
    - ```enqueue(element: T)```: 큐의 마지막에 데이터를 삽입하는 함수
    - ```dequeue()```: 큐의 첫 번째 요소를 제거하는 함수
    - ```peek()```: 큐의 첫 번째 요소를 반환하나 제거하지는 않는 함수
    - ```clear()```: 큐를 초기화하는 함수
    - ```insert(_ element: T, at: Int)```: 큐의 특정 위치에 값을 삽입하는 함수
    - ```removeAtIndex(_ at: Int)```: 큐의 특정 위치에 값을 제거하는 함수
    -
- ```CalculatorItemQueueTests```
    - ```test_dequeue_value_is_equal_to_inserted_value```: dequeue값이 enqueue했던 값과 동일한지
    - ```test_count_is_correct```: count가 올바르게 값을 반환하는지
    - ```test_clear_method_is_working_well```: clear함수가 제대로 동작하는지
    - ```test_peek_is_working_well```: peek함수가 제대로 동작하는지
    - ```test_insert_is_working_well```: insert함수가 제대로 동작하는지
    - ```test_remove_is_working_well```: remove함수가 제대로 동작하는지
## STEP 1 고민했던 것들
1. Queue 자료구조의 특징과 제공하는 기능들이 무엇인지 고민했습니다.
2. Node와 Linked List의 구현 방법에 대해 고민했습니다.
3. Linked List의 초기화 시 head와 tail을 제외한 나머지 노드들의 참조는 유지가 되는 것인지 고민했습니다.
4. 구현한 Queue의 기능 범위에 대해 고민했습니다.
5. 연산자와 숫자들을 하나의 타입으로 묶을 수 없을지 고민했습니다.
6. 테스트 케이스의 설계에 대해 고민했습니다.

## STEP 1 배운 개념
- TDD
- Queue 자료구조
- Node와 Linked List
- Queue의 구현

## STEP 1 PR 후 개선사항
___

## [STEP 2] 계산 타입 및 주변 타입 구현
- TDD를 기반으로 수행합니다.
- 프로젝트에 단위 테스트를 위한 타깃을 추가합니다.
- 계산기가 입력받은 숫자와 연산자는 연산큐에 쌓입니다.

## STEP 2 UML
![](https://s3.ap-northeast-2.amazonaws.com/media.yagom-academy.kr/resources/6131c8fa2e11413823f8dd7f/6189d7537c82755a83c68a7d.jpg)

## STEP 2 기능 구현
- ```CalculatorError```
    - ```cannotDivideByZero```: 0으로 나눴을 경우 throw할 에러 지정
- ```CalculateItem```
    - ```extension String```: ```split``` 함수 재정의를 위한 확장
- ```Operator```
    - ```calculate```: 연산자 타입에 맞는 연산 결과를 반환하는 함수
- ```ExpressionParser```
    - ```parse```: 입력으로부터 연산자와 피연산자를 분리해 ```Formula``` 타입을 반환하는 함수
    - ```componentsByOperators```: 입력으로부터 연산자와 피연산자의 배열 형태로 만들어주는 함수
- ```Formula```
    - ```operands```: 피연산자가 담긴 ```CalculatorItemQueue```
    - ```operators```: 연산자가 담긴 ```CalculatorItemQueue```
    - ```result```: 연산의 결과를 반환하는 함수
- ```OperatorTests```
- ```FormulaTests```


## STEP 2 고민했던 것들
1. 설계된 타입과 메서드의 역할과 기능에 대해 고민했습니다.
2. 테스트 케이스의 설계에 대해 고민했습니다.
3. 0으로 나누는 상황의 에러 처리에 대해 고민했습니다.
4. 고차함수가 올바르게 사용되었는지 고민했습니다.

## STEP 2 배운 개념
- TDD
- UML을 기반으로 한 코드 구현
- 숫자와 연산자 입력에 큐 활용

## STEP 2 PR 후 개선사항

