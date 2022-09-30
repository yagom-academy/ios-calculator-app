# Calculator

## 🗒︎목차
1. [소개](#-소개)
2. [개발환경 및 라이브러리](#-개발환경-및-라이브러리)
3. [팀원](#-팀원)
4. [타임라인](#-타임라인)
5. [UML](#-uml)
6. [실행화면](#-실행-화면)
7. [트러블 슈팅 및 고민](#-트러블-슈팅-및-고민)
8. [참고링크](#-참고-링크)


## 👋 소개
[하모](https://github.com/lxodud)가 구현한 Calculator Step-2 입니다.

## 💻 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.4.1-blue)]()


## 🧑 팀원
|<img src="https://i.imgur.com/ydRkDFq.jpg" width=200>|
|:--:|
|[하모](https://github.com/lxodud)|
  

## 🕖 타임라인

Step - 1:

Step - 2:

## 🗺 UML

- STEP - 1

![제목 없는 다이어그램 (1)](https://user-images.githubusercontent.com/85005933/191208106-a6c61fca-9184-4db0-8525-20ee4a382677.jpg)
- STEP - 2

![제목 없는 다이어그램 drawio](https://user-images.githubusercontent.com/85005933/193236539-96b802c0-3909-427a-abd1-952efd9f562f.png)



## 💻 실행 화면

## 🎯 트러블 슈팅 및 고민
### Step - 1 
<details>
<summary> 
펼쳐보기
</summary>


#### 1. struct vs class에 대한 고민.

먼저 Node가 값타입일 경우 인스턴스가 계속 복사되기때문에 LinkedList클래스에서 Node를 다룰 때 복사된 값에 작업을 하게되기 때문에 참조 타입으로 선언해 주어야 한다고 판단하였습니다.
추가적으로 Node를 Struct로 만들었을 내부에 자기 자신의 타입인 프로퍼티를 소유해야 하는데 값 타입이라 런타임에서 에러가 발생하였습니다. 따라서 Node는 Class로 선언하는 것이 맞다고 판단하였습니다.

LinkedList와 CalculatorItemQueue의 경우 값 타입을 사용해도 문제되는 부분이 없다고 생각하여 애플의 권장사항인 struct를 사용하게 되었습니다. 그리고 bringQueue()를 이용하여 LinkedList 인스턴스를 호출할 때 복사하여 전달해주기 때문에 원본값을 보존할 수 있다고 생각하였습니다.

#### 2. queue의 요소를 저장할 때 두 가지 자료구조에 대한 고민.
Array의 장단점
원하는 요소에 접근이 빠르다는 장점이 있습니다.
삭제나 삽입을 할 때 배열의 크기에 따라 복잡도가 올라갑니다.
Linked list의 장단점
삭제나 삽입을 할 때 해당 연결을 끊고 뒤의 요소에 주소값을 이어주면 되어 복잡도가 낮습니다.
원하는 요소에 접근할 때 처음부터 순차적으로 접근하여야해서 비효율적입니다.
값과, 다음 요소에 대한 정보를 가지고 있어야 하므로 메모리효율도 좋지않다고 생각됩니다.
두 방법의 장단점을 비교해보았을 때 큐를 구현할 때 원하는 위치의 값에 접근할 필요가 없는 없고 앞에 있는 요소만 꺼내와야 하기 때문에 값 빼낼 때 효율적인 Linked list를 사용하게 되었습니다.
</details>

### Step - 2

#### 1. Operator 열거형에 접근권한이 private인 메서드들을 테스트해야 되는가?

- calculate()를 선언하고 유닛테스트를 진행하면서 리팩토링하는 과정에서 private 접근권한을 가진 메서드들은 calculate()에서 기능이 분리되는 순서라고 생각해서 테스트를 진행하지않았습니다.ExpressionPaser 열거형에 componentsByOperators() 메서드 또한 위와 같은 순서라고 생각하여 테스트를 진행하지 않았습니다.

#### 2. 음수처리하기
- "-"를 연산자로 처리할 때 "-2"같은 음수도 분리되는 문제가 있었습니다.
- 문자열을 split 메서드를 통해서 분리할 때 연산자가 제일 앞에 있는 경우는 음수일 때 뿐이기 때문에 해당 부분을 Bool값을 이용한 조건문으로 해결하였습니다.

#### 4. Queue에서 사용하는 요소들에 CalculateItem 프로토콜 채택한 타입의 값만 할당되게 하기!
- Step-1에서는 Queue내부에 있는 LinkedList의 요소가 CalculateItem 타입으로 만들어 주어서 해당 부분을 해결하였는데 문제는 내부의 값을 사용할 때 마다 다운캐스팅을 해주어야 하는 문제가 발생했습니다.
 - Linked List와 Node를 제네릭 타입으로 만들어 주고 제네릭 타입에 CalculateItem 프로토콜을 채택해주어서 해결하였습니다!!
    
    
## TDD
### 1. 순서
- 우선 테스트할 메서드를 선언한다.
- 인터페이스의 테스트 케이스에 맞는 메서드를 구현한다.
    - 이때 테스트는 실패가 나야한다! -> 실패하는 코드를 작성하는 단계
- 테스트 코드가 통과하도록 메서드를 리팩토링 한다.

구현이 되어있지 않기 때문에 처음에는 무조건 실패가 나야함
그리고 테스트 케이스에 맞게 동작하게만 구현(하드코딩)
다른 테스트 케이스를 또 만들고 코드를 계속 수정
이 순서를 반복
### 2. 테스트 메서드 네이밍
- given_when_then 순으로 끊어서 네이밍 해준다!
- 실제 테스트 데이터는 기재하지 않는게 좋다!
    - 다른 데이터에 대해서 통과하는지 모호해짐
```swift!
func testQueue_비어있는CalculatorItemQueue에_isEmpty를_호출했을때_정확한Bool값이나와야한다()
```
위 네이밍에서 정확한 값이란게 굉장히 애매모호하다!
```swift!
func testQueue_비어있는CalculatorItemQueue에_isEmpty를호출했을때_true가나와야한다()
```
이렇게 네이밍 수정

```swift!
func testQueue_dequeue를했을때_해당Double타입의값이나와야한다() 
```
해당이라는 부분도 애매모호하다!
```swift!
func testQueue_Double타입의값을enqueue한후_dequeue를했을때_enqueue한값반환되어야한다() 
```
네이밍을 할때 명확하게 어떤것을 하는 테스트 메서드인지를 잘 작성해야한다!
다만 실제 테스트 데이터를 기입하는 것은 지양한다!

테스트 메서드 내부의 코드도 한가지만 검증해서 어떤 이유로 fail이 나는지를 명확하게 만들어야 한다!

## 📚 참고 링크

