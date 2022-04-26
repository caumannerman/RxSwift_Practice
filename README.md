# RxSwift_Practice

## 1. Observable => rx의 근간, subscribe되기 전에는 아무런 이벤트도 내보내지 않고 그저 정의일 뿐이다.

- 1. Just => 오직 지정된 타입의 element "하나만" 방출하는 Observable Sequence를 생성 
<img width="241" alt="스크린샷 2022-04-26 오후 5 08 37" src="https://user-images.githubusercontent.com/75043852/165253044-a1c9b7f0-4d70-4f7a-a601-8d4b191e7355.png">
<img width="114" alt="스크린샷 2022-04-26 오후 5 13 24" src="https://user-images.githubusercontent.com/75043852/165253906-01b0b526-071d-464a-8cce-8fab9fd4c1f5.png">


- 2. Of => 여러개의 element를 차례로 발생시킬 수 있음 

<img width="271" alt="스크린샷 2022-04-26 오후 5 13 03" src="https://user-images.githubusercontent.com/75043852/165253843-ebf8a05a-5589-4784-aebd-33c894d602c4.png">

<img width="136" alt="스크린샷 2022-04-26 오후 5 12 54" src="https://user-images.githubusercontent.com/75043852/165253809-feae8726-2fe9-47fe-a5b2-7968ca400a87.png">

- 3. from => Array형태만 받아서, 하나씩 방출

<img width="266" alt="스크린샷 2022-04-26 오후 5 14 31" src="https://user-images.githubusercontent.com/75043852/165254150-275ba261-2b84-430f-a209-6d30fce591fb.png">

<img width="114" alt="스크린샷 2022-04-26 오후 5 14 41" src="https://user-images.githubusercontent.com/75043852/165254220-acc2792a-8186-4cd6-a8df-e5869a3e5bce.png">

- 4. subscribe 내 분기

<img width="362" alt="스크린샷 2022-04-26 오후 5 36 24" src="https://user-images.githubusercontent.com/75043852/165258541-48adced6-0da2-456b-93b0-a09965ea60a1.png">
<img width="161" alt="스크린샷 2022-04-26 오후 5 36 37" src="https://user-images.githubusercontent.com/75043852/165258586-edb7ba1a-faee-427b-a8a1-53a62862e69c.png">

- 5. empty & never 
empty는 completed만 방출, never는 아무 이벤트도 방출하지 않는다.
<img width="229" alt="스크린샷 2022-04-26 오후 5 38 11" src="https://user-images.githubusercontent.com/75043852/165258913-9f56a562-feac-4802-965a-a1e18f95facf.png">
<img width="127" alt="스크린샷 2022-04-26 오후 5 38 19" src="https://user-images.githubusercontent.com/75043852/165258950-6e9abf28-875b-447f-876c-79f04d1a00f6.png">

- 6. create ( observer -> Disposable ) 

<img width="344" alt="스크린샷 2022-04-26 오후 5 54 34" src="https://user-images.githubusercontent.com/75043852/165262316-cae8acba-e56c-4334-93b2-6443836deede.png">

<img width="531" alt="스크린샷 2022-04-26 오후 5 54 48" src="https://user-images.githubusercontent.com/75043852/165262368-b51971e3-c101-437d-84d8-d7bc5b30ff7a.png">

- 7. deferred
<img width="410" alt="스크린샷 2022-04-26 오후 6 10 18" src="https://user-images.githubusercontent.com/75043852/165265511-7e7bd33b-6bdf-4da8-a825-6a0d6c263677.png">
<img width="175" alt="스크린샷 2022-04-26 오후 6 10 29" src="https://user-images.githubusercontent.com/75043852/165265548-1104c5a0-2421-4d41-859e-66dd4178c6c7.png">

# 2. Traits ( Single, Maybe, Completable ) => 더 좁은 범위의 Observable. 간결한 코드로 가독성을 좋게 해줌 

# 3. Subject : Observable이자 Observer 
- 1. PublishSubject : 빈 상태로 시작하여 새 값만들 subscriber에 방출
- 1. BahaviorSubject : 하나의 초기값을 가지고 시작, 새로운 subscriber에 초기값 또는 최신값을 방출
- 1. ReplaySubject : 버퍼를 두고 초기화하며, 버퍼 사이즈만큼의 값들을 유지하면서 새로운 subscriber에게 방출 



