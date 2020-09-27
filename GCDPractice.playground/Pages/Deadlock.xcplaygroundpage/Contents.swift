//: [Previous](@previous)

import Foundation

let queue = DispatchQueue(label: "deadlock.queue")
let workItem = DispatchWorkItem {
    print("started block 1")
    queue.sync {
        print("completed block 2")
    }
}

queue.async(execute: workItem)
/*:
 #### Result
 An async work item is dispatched to the queue. Since the queue has a serial execution attribute (the default), the `queue.sync` call will wait for the current work on the queue to finish but that ongoing work includes the synchonous work, which is itself waiting for the work on the queue to finish. If the queue has the `concurrent` attribute, the synchronous work item will be able to complete as intended since it will be executed on a parallel thread.
*/
//: [Next](@next)
