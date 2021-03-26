# 📱 iOS 2진/10진 계산기

## Jay, Henry, Tak

<br/>

## 💬 프로젝트 키워드
  - 프로토콜(Protocol)
  - 제네릭(Generic)
  - 클로저(Closure)

<br/>

## 🏢 설계하기
  - 프로젝트의 설계 과정에서 가장 중요한 부분은 '공통 연산 부분을 어떤식으로 구현할 것인가'였습니다. 10진 계산기와 2진 계산기가 공통적으로 가진 연산이 있고, 각자만 가진 연산이 있습니다. 이를 단순히 상속으로 처리할 수 있지만 프로토콜을 학습하며 이를 적용하는 것이 더 적합한지 고민했습니다. 우선 고려사항을 보면 아래와 같습니다.

    > - 10진 계산기와 2진 계산기가 있습니다. 이를 각각 구현할 것인지, 한 계산기에서 입력에 따라 다른 역할로 변경될 수 있도록 하나의 계산기로 구현할 것인지를 결정할 필요가 있습니다. 
    > - 두 계산기가 공통적으로 갖는 연산이 존재합니다. 
    > - 각 계산기가 개별적으로 가진 연산이 존재합니다.

  - 두 종류의 계산기가 존재: 회의를 통해 각각 개별적인 기능을 가진 계산기가 좋다는 결론이 나왔습니다. 한 계산기에 두 계산기의 기능을 구현하면 쓸데없이 복잡해지고, 굳이 하나에 모든 기능을 담을 필요가 없기 때문입니다. 모든 연산이 같고 단지 차이가 2진과 10진 numeric system이라면 의미 있는 설계일 수 있지만 실제로 다른 작동을 하는 기능이 많습니다.

  - 공통으로 갖는 연산이 존재: 공통으로 갖는 연산을 상속을 통해 처리할 것인지, 프로토콜로 구현할 것인지 정의가 필요합니다.

  - 개별적인 연산이 존재: 각 개별 연산을 어떤식으로 정의할 것인지 결정해야 합니다.

<br/>

## 🎯 고민 Point

1. 계산기 구현의 중간과정을 어떻게 처리할 것인가?

   크게 두가지의 방식이 있을 수 있습니다.

   1. 연산자를 입력할 때마다 중간 연산을 완료하여 완료된 값을 기준으로 새 연산을 실행하는 방법
   2. 연산자를 입력 받을 때마다 그때까지 받은 입력의 연산을 모두 받아 연산자 우선순위를 기준으로 연산하는 방법

   아이폰 계산기 어플을 기준으로 했을 때, 10진 계산기는 2번의 방식을 따릅니다. 예시로 삼을 2진 계산기가 없어 2진 계산기 역시 2번의 방식으로 구현하기로 했습니다.

2. 연산자 우선순위

   1-2의 방식을 따르려면 연산자 우선순위가 필요합니다. 연산자 우선순위는 아래와 같이 구현했습니다.

   ![](https://images.velog.io/images/jayb/post/6e32ee16-d410-409e-b0cf-8f11c9ea8ede/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202021-03-26%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%205.22.45.png)

   문제는 여기서 .notAnd, notOr 연산이었습니다. notAnd 연산과 notOr 연산의 우선 순위를 알 수가 없어서 우선 캠퍼들과 대화를 통해 not의 우선순위와 동치시켰습니다. 이는 이후 더 많은 대화와 자료를 통해 수정할 예정입니다. 아직 답을 모르는 상태입니다(and에 가까운지 not에 가까운지).

3. Operator 열거형이 String을 rawValue로 갖는 이유가 나중에 stack에서 입력받아 사용할때 필요