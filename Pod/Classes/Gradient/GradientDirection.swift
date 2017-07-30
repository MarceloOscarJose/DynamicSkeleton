//
//  GradientDirection.swift
//  Pods
//
//  Created by Marcelo Oscar José on 7/29/17.
//
//

import Foundation

/// Represents a `CAGradientLayer`'s `startPoint` or `endPoint`, respectively.
enum GradientProperty {
    case startPoint
    case endPoint
}

/// A `Transition` between two `GradientPoint`s.
typealias GradientTransition = Transition<GradientPoint>

/// A generic structure to represent a transition.
struct Transition<T> {
    /// The beginning of the Transition.
    let from: T
    /// The end of the Transition.
    let to: T
}

infix operator -->: AdditionPrecedence
/// A custom operator that builds a `Transition<T>`
func --><T>(from: T, to: T) -> Transition<T> {
    return Transition.init(from: from, to: to)
}

/// The direction to slide in.
public enum GradientDirection {
    case right
    case left

    /// Creates a `GradientTransition` for the corresponding `GradientProperty`.
    func transition(for point: GradientProperty) -> GradientTransition {
        switch (self, point) {
        case (.right, .startPoint):
            return GradientPoint(x: .negativeOne) --> GradientPoint(x: .one)
        case (.right, .endPoint):
            return GradientPoint(x: .zero) --> GradientPoint(x: .two)
        case (.left, .startPoint):
            return GradientPoint(x: .one) --> GradientPoint(x: .negativeOne)
        case (.left, .endPoint):
            return GradientPoint(x: .two) --> GradientPoint(x: .zero)
        }
    }
}
