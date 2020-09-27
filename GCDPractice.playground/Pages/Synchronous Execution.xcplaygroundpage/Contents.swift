/*:
 # Synchronous Execution
 2 queues with the same QOS running their work items synchronously.
 */
import Foundation

let firstWorkItem = DispatchWorkItem {
    printMultiples(of: 3, upTo: 50, withEmoji: "🔴")
}

let secondWorkItem = DispatchWorkItem {
    printMultiples(of: 3, upTo: 50, withEmoji: "🔵")
}

DispatchQueue.global().sync(execute: firstWorkItem)
DispatchQueue.global().sync(execute: secondWorkItem)
/*:
 #### Result
 The second work item is blocked from running until the first work item has completed.
*/
//: [Next](@next)
