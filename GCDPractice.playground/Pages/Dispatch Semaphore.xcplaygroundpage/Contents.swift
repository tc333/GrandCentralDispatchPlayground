//: [Previous](@previous)

import Foundation

let semaphore = DispatchSemaphore(value: 0)
var sharedResource: [Int] = []

let queue1 = DispatchQueue.global(qos: .background)

queue1.async {
    asyncWork {
        sharedResource.append(1)
        print("Finished first block")
//        semaphore.signal()
        print(sharedResource)
    }
//    semaphore.wait()
    
    asyncWork {
        sharedResource.removeLast()
        print("Finished second block")
//        semaphore.signal()
        print(sharedResource)
    }
//    semaphore.wait()
    
    asyncWork {
        sharedResource += [1, 2, 3 ,4]
        print("Finished third block")
//        semaphore.signal()
        print(sharedResource)
    }
//    semaphore.wait()
}


//: [Next](@next)


class Controller {
    var saveWorkItem: DispatchWorkItem?
    
    func save() {
        saveWorkItem?.cancel()
        saveWorkItem = DispatchWorkItem {
            print("saved")
        }
        let time = DispatchTime(uptimeNanoseconds: 5 * 1000000000)
        if let workItem = saveWorkItem {
            DispatchQueue.global(qos: .background).asyncAfter(deadline: time, execute: workItem)
        }
    }
}
