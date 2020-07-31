import Foundation

/// Dummy function to represent computationally intensive work
public func printMultiples(of n: Int, upTo upperBound: Int, withEmoji emoji: String) {
    for i in 0...upperBound {
        if i % n == 0 {
            print("\(emoji) \(i)")
        }
    }
}
