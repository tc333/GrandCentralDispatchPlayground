//: [Previous](@previous)

import Foundation

let queue = DispatchQueue(label: "deadlock.queue")
//let queue = DispatchQueue(label: "concurrent.queue", attributes: .concurrent)
let workItem = DispatchWorkItem {
    print("test1")
    queue.sync {
        print("test2")
    }
}

queue.async(execute: workItem)

/// Result: An async work item is dispatched to the queue. Since that work item contains work that is scheduled to execute synchronously, the queue.sync call will wait for the current work on the queue to finish but that ongoing work includes the synchonous work, which is itself waiting for the work on the queue to finish.

/// Now change the queue to have execute work concurrently by commenting out the first queue initialization...


//: [Next](@next)
