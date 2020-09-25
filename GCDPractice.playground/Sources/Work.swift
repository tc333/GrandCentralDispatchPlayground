import Foundation

/// Dummy function to represent computationally intensive work
public func printMultiples(of n: Int, upTo upperBound: Int, withEmoji emoji: String) {
    for i in 0...upperBound {
        if i % n == 0 {
            print("\(emoji) \(i)")
        }
    }
}


public typealias Seconds = Int
public func asyncWork(withDelay: Seconds, completion: @escaping () -> Void) {
    let deadline = DispatchTime.now().advanced(by: .seconds(withDelay))
    DispatchQueue.global(qos: .utility).asyncAfter(deadline: deadline) {
        completion()
    }
}
