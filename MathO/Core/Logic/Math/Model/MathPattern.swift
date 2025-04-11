//
//  MathPattern.swift
//  MathO
//
//  Created by Enzu Ao on 05/04/23.
//

import SwiftUI
import TabularData

/// Manages the mathematical operation patterns used in generating questions
struct MathPattern {
    /// Collection of predefined mathematical operation patterns
    private let patterns: [String] = [
        "-,+,x", "+,:,-", "-,x,:", "+,-,:", "-,+,x",
        "+,+,:", "+,-,x", "x,-,+", ":,x,-", "x,+,:",
        "-,-,:", "-,-,x", "x,:,+", "+,+,x", "x,-,:",
        "x,-,+,x", "x,:,+,-", ":,+,-,x", "+,+,x,-", "-,+,:,-",
        "+,-,x,:", "+,x,+,:", "-,:,+,x", "-,x,+,x", "x,-,x,+",
        "+,:,+,-", "-,:,+,+", "x,+,-,:", ":,x,+,-", ":,+,x,-", "-,-,+,x"
    ]
    
    /// Difficulty levels for patterns
    enum Difficulty {
        case medium
        case hard
    }
    
    /// Returns a random pattern of medium difficulty
    private func getRandomMediumPattern() -> String {
        return patterns[Int.random(in: 0..<15)]
    }
    
    /// Returns a random pattern of hard difficulty
    private func getRandomHardPattern() -> String {
        return patterns[Int.random(in: 15..<patterns.count)]
    }
    
    /// Generates a collection of unique patterns
    /// - Parameters:
    ///   - amount: The number of patterns to generate
    ///   - excludedPatterns: Patterns to exclude from generation
    /// - Returns: Array of unique operation patterns
    private func generateUniquePatterns(amount: Int, excludedPatterns: [String] = []) -> [String] {
        var selectedPatterns: [String] = []
        var pattern: String = ""
        let totalPatterns = amount + 1
        let mediumPatternCount = (amount / 3 * 2)
        
        for index in 0..<totalPatterns {
            if index < mediumPatternCount {
                // Generate medium difficulty patterns
                while true {
                    pattern = getRandomMediumPattern()
                    if !selectedPatterns.contains(pattern) && !excludedPatterns.contains(pattern) {
                        selectedPatterns.append(pattern)
                        break
                    }
                }
            } else {
                // Generate hard difficulty patterns
                while true {
                    pattern = getRandomHardPattern()
                    if !selectedPatterns.contains(pattern) && !excludedPatterns.contains(pattern) {
                        selectedPatterns.append(pattern)
                        break
                    }
                }
            }
        }
        return selectedPatterns.shuffled()
    }
    
    /// Generates a default set of operation patterns
    /// - Returns: Array of operation patterns
    public func generateDefaultPatterns() -> [String] {
        return generateUniquePatterns(amount: 12)
    }
}
