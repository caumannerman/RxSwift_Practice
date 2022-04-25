import RxSwift

let disposeBag = DisposeBag()

print("------ignoreElements------")
let 취침모드 = PublishSubject<String>()

취침모드
    .ignoreElements() // onNext를 무시한다.
    .subscribe{ _ in
        print("☀️")
    }
    .disposed(by: disposeBag)

취침모드.onNext("🔊")
취침모드.onNext("🔊")
취침모드.onNext("🔊")

취침모드.onCompleted()

print("------elementAt-------")
let 두번울면깨는사람 = PublishSubject<String>()

두번울면깨는사람
    .element(at:2) // 해당 인덱스 값만 방출하겠다!!
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)

두번울면깨는사람.onNext("🔊") // index 0
두번울면깨는사람.onNext("🔊") // index 1
두번울면깨는사람.onNext("🧑‍🎄") // index 2
두번울면깨는사람.onNext("🔊") // index 3


print("------filter-------")
Observable.of(1,2,3,4,5,6,7,8) // [1,2,3,4,5,6,7,8]  순서대로 방출할 것
    .filter{ $0 % 2 == 0 }
    .subscribe(onNext:{
        print($0)
    })
    .disposed(by: disposeBag)


print("------skip-------")
Observable.of("😉","😁","😄","😆","😅","😂","🚘")
    .skip(5) // 5개만큼 skip한 뒤 그 다음 요소들만 방출
    .subscribe(onNext:{
        print($0)
    })
    .disposed(by: disposeBag)

print("------skipWhile-------")
Observable.of("😉","😁","😄","😆","😅","😂","🚘","🧑‍🎄")
    .skip(while:{ // 조건에 부합하는 동안 계속 skip
        $0 != "😆"
    })
    .subscribe(onNext:{
        print($0)
    })
    .disposed(by: disposeBag)


print("------skipUntil-------")
let 손님 = PublishSubject<String>()
let 문여는시간 = PublishSubject<String>()

손님
    .skip(until: 문여는시간) //다른 Observable에 의존하여...
    .subscribe(onNext:{
        print($0)
    })
    .disposed(by: disposeBag)

손님.onNext("😁")
손님.onNext("🚘")
문여는시간.onNext("땡!")
손님.onNext("😉")
손님.onNext("🧑‍🎄")


print("------take-------")
Observable.of("😉","😁","😄","😆","😅","😂","🚘","🧑‍🎄")
    .take(3) // 해당 갯수만큼만 방출!
    .subscribe(onNext:{
        print($0)
    })
    .disposed(by: disposeBag)


print("------takeWhile-------")
Observable.of("😉","😁","😄","😆","😅","😂","🚘","🧑‍🎄")
    .take(while: { // skip while과 동일한 논리. 조건이 부합하는 동안만 방출
        $0 != "🚘"
    }) // 해당 갯수만큼만 방출!
    .subscribe(onNext:{
        print($0)
    })
    .disposed(by: disposeBag)



print("------enumerated------")
Observable.of("😉","😁","😄","😆","😅","😂","🚘","🧑‍🎄")
    .enumerated() // index와 함께 표현 튜플로 생성
    .takeWhile{
        $0.index < 3
    }
    .subscribe(onNext: {
        print($0)
    })
    .disposed(by: disposeBag)


print("------takeUntil------")

let 수강신청 = PublishSubject<String>()
let 신청마감 = PublishSubject<String>()

수강신청
    .take(until: 신청마감)
    .subscribe(onNext:{
        print($0)
    })
    .disposed(by: disposeBag)

수강신청.onNext("🚘")
수강신청.onNext("😂")
신청마감.onNext("끝")
수강신청.onNext("😂")

print("------distinctUntilChanged------")
Observable.of("저는", "저는", "앵무새","앵무새","앵무새","앵무새","입니다","입니다","입니다","입니다","저는","앵무새","일까요?","일까요?")
    .distinctUntilChanged() // 연속적으로 반복되는거 버림 
    .subscribe(onNext:{
        print($0)
    })
    .disposed(by: disposeBag)
