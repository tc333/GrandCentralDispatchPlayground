//: [Previous](@previous)
/*:
 # Serial Execution
 Perform work on a single custom queue with a serial (FIFO) execution order
*/
import Foundation

let serialQueue = DispatchQueue(label: "com.example.serial")
let firstWorkItem = DispatchWorkItem {
    printMultiples(of: 5, upTo: 50, withEmoji: "🔴")
}
let secondWorkItem = DispatchWorkItem {
    printMultiples(of: 5, upTo: 50, withEmoji: "🔵")
}

serialQueue.async(execute: firstWorkItem)
serialQueue.async(execute: secondWorkItem)
/*:
 #### Result
 The work items are executed in the order they are called.
 */
//: [Next](@next)
