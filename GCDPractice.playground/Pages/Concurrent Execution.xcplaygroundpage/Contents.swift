//: [Previous](@previous)
/*:
 # Concurrent Execution
 Perform work on a single custom queue with a concurrent execution order
*/
import Foundation

let concurrentBackgroundQueue = DispatchQueue(label: "com.example.concurrent", attributes: .concurrent)
let firstWorkItem = DispatchWorkItem {
    printMultiples(of: 5, upTo: 50, withEmoji: "🔴")
}
let secondWorkItem = DispatchWorkItem {
    printMultiples(of: 5, upTo: 50, withEmoji: "🔵")
}

concurrentBackgroundQueue.async(execute: firstWorkItem)
concurrentBackgroundQueue.async(execute: secondWorkItem)
/*:
 #### Result
 The work items are started in order but are executed in parallel on different threads and can finish in any order.
*/
//: [Next](@next)
