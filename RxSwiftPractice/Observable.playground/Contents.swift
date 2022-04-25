import UIKit
import RxSwift

//하나의 element만 방출
print("----Just----")
Observable<Int>.just(1)
    .subscribe(onNext: {
        print($0)
    })

print("----Of1----")
Observable<Int>.of(1, 2, 3, 4, 5)
    .subscribe(onNext: {
        print($0)
    })

print("----Of2----")
Observable.of([1, 2, 3, 4, 5])
    .subscribe(onNext: {
        print($0)
    })

//받은 array 속 element들을 하나씩 방출
//from은 array만 받음 
print("----From----")
Observable.from([1,2,3,4,5])
    .subscribe(onNext: {
        print($0)
    })

print("-----subscribe1-----")
Observable.of(1,2,3)
    .subscribe{
        print($0)
    }

print("-----subscribe2-----")
Observable.of(1,2,3)
    .subscribe{
        if let element = $0.element{
            print(element)
        }
    }

print("-----subscribe3-----")
Observable.of(1,2,3)
    .subscribe(onNext: {
        print($0)
    })

print("-----empty-----")
Observable<Void>.empty()
    .subscribe{
        print($0)
    }

print("----never-----")
Observable.never()
    .subscribe(onNext:{
        print($0)
    },
               onCompleted: {
        print("Complete")
    })

print("----range-----")
Observable.range(start: 1, count:9)
    .subscribe(onNext: {
        print("2* \($0) = \(2*$0)")
    })

print("------dispose------")
Observable.of(1,2,3)
    .subscribe(onNext:{
        print($0)
    }).dispose()


print("------disposeBag------")
let disposeBag = DisposeBag()

Observable.of(1,2,3)
    .subscribe{
        print($0)
    }.disposed(by: disposeBag)

print("-----create1-----")
Observable.create{ observer -> Disposable in
    observer.onNext(1)
    observer.onCompleted()
    observer.onNext(2)
    return Disposables.create()
}
.subscribe{
    print($0)
}
.disposed(by: disposeBag)

print("-----create2-----")
enum MyError: Error{
    case anError
}
Observable.create{ observer -> Disposable in
    observer.onNext(1)
    observer.onError(MyError.anError)
    observer.onCompleted()
    observer.onNext(2)
    return Disposables.create()
}
.subscribe(
onNext:{
    print($0)
},
onError:{
    print($0.localizedDescription)
},
onCompleted: {
    print("completed")
},
onDisposed:{
    print("disposed")
}
)
.disposed(by: disposeBag)
