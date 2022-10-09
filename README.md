#  계산기 프로젝트 Ⅱ
## 🧮 프로젝트 소개
- 각자 구현 했던 계산기 프로젝트를 한개의 프로젝트로 병합

## 📍 목차
#### 1. [팀원](#🧑🏻‍💻-1-팀원)
#### 2. [순서도](#🔖-2-순서도)
#### 3. [타임라인](#⏱-3-타임라인)
#### 4. [병합 내용](#💻-4-병합-내용)
#### 5. [TDD](#🎯-5-TDD(테스트-코드-작성-과정))
#### 6. [회고](#📝-6-회고)

## 🧑🏻‍💻 1. 팀원

|미니|SummerCat|
| :--------: | :--------: |
| <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://i.imgur.com/ikEGO8k.jpg">    | <img width="180px" img style="border: 2px solid lightgray; border-radius: 90px;-moz-border-radius: 90px;-khtml-border-radius: 90px;-webkit-border-radius: 90px;" src="https://avatars.githubusercontent.com/u/111038381?v=4">     |
| <a href="https://github.com/leegyoungmin"> <center>*@Minii*</center></a>|<a href="https://github.com/ttokin"> <center>*@SummerCat*</center></a> |

## 🔖 2. 순서도
### Class Diagram
![UML](https://i.imgur.com/UhNQmT8.png)


## ⏱ 3. 타임라인
- **2022.10.3**
    ![10.3](https://i.imgur.com/cyVAn3m.png)

    - 브랜치 생성
    - 모델 타입 병합
    - 타입별 확장함수 병합
- **2022.10.4**
    ![10.4](https://i.imgur.com/1BAEuKc.png)

    - 모델 타입 리팩터링
    - UI, 메인 로직 병합 및 리팩터링
    - PR 발송

- **2022.10.5**
    - 피드백 항목 리팩터링

- **2022.10.6**
    ![10.6](https://i.imgur.com/P505mnM.png)

    - Test 코드 병합 및 리팩터링
    - PR 발송
    
## 💻 4. 병합 내용
### 📌 STEP 1
요구사항 : 각자의 코드를 서로 리뷰하며 더 좋은 코드라고 생각하는 코드로 병합하기

1. `CalculatorVC`의 현재 입력값(연산 기호, 숫자)의 label과 데이터 분리
SummerCat 코드는 입력값이 들어오면 `label.text`에 들어온 입력값을 직접 업데이트 해 주는 방식, 미니의 코드는 입력값을 별도의 `String` 변수에 저장했다가 업데이트 해 주는 방식이었습니다. 서로의 코드의 장단점을 정리하면 다음과 같습니다.

    | 구분 | 구현방식 | 장점 | 단점 |
    | :--- | :--- | :--- | :--- |
    | SummerCat | 사용자 입력을 직접적으로 label의 데이터로 업데이트 하도록 구현 | 사용자 입력의 오류가 발생할 가능성이 적음 | label의 데이터를 지속적으로 파싱하여서 검사해야함. |
    | 미니 | 사용자의 입력과 사용자에게 보여줄 화면의 데이터를 따로 관리하도록 구현 | 사용자 입력이 잘못되었을 경우 뷰를 업데이트 하지 않을 수 있다. | 사용자의 입력을 잃어버리거나 코드상의 에러를 통해서 잘못된 연산을 할 가능성이 큼. |

    두 코드의 장점을 모두 활용할 수 있도록, SummerCat 코드 중 사용자의 입력을 직접적으로 label의 데이터를 업데이트 하는 방식과 미니의 코드 중 사용자의 입력 값을 기억하여 이전 값의 입력을 종료하는 상황에서 업데이트 하는 방식을 혼합하여 활용하였습니다.


2. log로 업데이트 하는 로직
각자 구현했던 한 줄의 수식을 업데이트 하는 로직을 서로에게 설명해주고 아래와 같이 정리해 보았습니다.

    | 구분 | 데이터 업데이트 방식 |
    | --- | --- |
    | SummerCat | 새로운 연산 기호 입력 발생시, 이전에 입력된 연산 기호와 숫자를 동시에 업데이트 |
    | 미니 | 새로운 입력이 연산자일 경우 피연산자를 업데이트, 피연산자일 경우 연산자를 업데이트 |

    이야기를 나눈 결과, 미니의 코드에서는 불필요하게 피연산자를 업데이트 하는 부분이 있다고 판단해서 SummerCat의 방식을 활용해 코드를 병합했습니다.


### 📌 STEP 2
1. 커스텀 view의 init 방식 고민
커스텀 StackView를 코드로 구현할 때, 이니셜라이저에서 데이터를 받아서 커스텀 StackView 내부에 존재하는 label에 값을 할당하는 방식으로 작성했었습니다.
하지만 MVC 아키텍쳐에 대해 함께 고민하다, 뷰를 init하는 과정에서 데이터를 알게 되는 것이 아니냐는 의문이 들었습니다. 그래서 Delegate 패턴을 통해서 커스텀 뷰가 가지는 데이터를 Controller가 직접 설정할 수 있도록 하였습니다.
한편으로는 init을 하는 과정에서 데이터를 설정하는 것이 아니라 뷰를 생성하고, 그 후에 Delegate를 설정해서 메서드를 호출하는 모습이 부자연스럽다는 것도 생각했습니다. 다른 코더의 입장에서 보았을 때에는 데이터가 없는 뷰를 생성한 후, 데이터를 뷰에 적용하는 모습이 어색할 수 있다고 생각했습니다.


## 🎯 5. TDD(테스트 코드 작성 과정)
### 📌 STEP 2
테스트 코드에서 구현해야 할 것은 아래의 2가지라고 생각했습니다.
1. 기본 기능이 제대로 작동하는가?
    - 타입의 명세서 역할을 할 수 있도록 타입의 기본 기능 테스트
2. edge case
    - 발생 가능한 edge case에 대해 기능이 제대로 작동하는지 테스트

![Test 명세서](https://i.imgur.com/denHZAa.png)

테스트 커버리지
![Test 커버리지](https://i.imgur.com/QylwVYI.png)

## 📝 6. 회고 
**※ 각자 브랜치에서 회고 작성 예정**
### 📌 SummerCat


### 📌 미니
