//: [Previous](@previous)
/*:
 # Asynchronous Execution
 2 queues with the same QOS running their work items asynchronously.
*/
import Foundation

DispatchQueue.global(qos: .utility).async {
    printMultiples(of: 3, upTo: 50, withEmoji: "🔴")
}

DispatchQueue.global(qos: .utility).async {
    printMultiples(of: 3, upTo: 50, withEmoji: "🔵")
}

/*:
 #### Result
 The work items are executed asynchronously and can finish in any order.
*/
//: [Next](@next)
