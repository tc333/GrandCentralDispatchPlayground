//: [Previous](@previous)
/*:
 # Dispatch Group
*/
import Foundation
import UIKit

let group1 = DispatchGroup()

group1.enter()
asyncWork(withDelay: 5) {
    print("Finished block 1")
    group1.leave()
}

group1.enter()
asyncWork(withDelay: 2) {
    print("Finished block 2")
    group1.leave()
}

print("waiting for blocks to complete...")
group1.notify(queue: DispatchQueue.main) {
    print("Completed")
}
/*:
 #### Result
 The dispatch group runs the completion specified in the `notify` block once all pending tasks are completed.
*/
//: [Next](@next)
