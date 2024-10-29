//
//  MathPattern.swift
//  MathO
//
//  Created by Enzu Ao on 05/04/23.
//

import SwiftUI
import TabularData

struct MathPattern{
    private let MathPatterns: [String] = ["-,+,x",
                                          "+,:,-",
                                          "-,x,:",
                                          "+,-,:",
                                          "-,+,x",
                                          "+,+,:",
                                          "+,-,x",
                                          "x,-,+",
                                          ":,x,-",
                                          "x,+,:",
                                          "-,-,:",
                                          "-,-,x",
                                          "x,:,+",
                                          "+,+,x",
                                          "x,-,:",
                                          "x,-,+,x",
                                          "x,:,+,-",
                                          ":,+,-,x",
                                          "+,+,x,-",
                                          "-,+,:,-",
                                          "+,-,x,:",
                                          "+,x,+,:",
                                          "-,:,+,x",
                                          "-,x,+,x",
                                          "x,-,x,+",
                                          "+,:,+,-",
                                          "-,:,+,+",
                                          "x,+,-,:",
                                          ":,x,+,-",
                                          ":,+,x,-",
                                          "-,-,+,x"]
    
    
    private func randomMidPattern() -> String {
        return MathPatterns[Int.random(in: 0..<15)]
    }
    
    private func randomHardPattern() -> String {
        return MathPatterns[Int.random(in: 14..<30)]
    }
    
    private func GeneratePattern(amount: Int, recomendPattern: [String] = []) -> [String] {
        
        var patterns: [String] = []
        var pattern: String = ""
        let amountIndex = amount + 1
        
        for index in 0..<amountIndex {
            if index < (amount/3*2) {
                while(true) {
                    pattern = randomMidPattern()
                    if !patterns.contains(pattern) && !recomendPattern.contains(pattern){
                        patterns.append(pattern)
                        break
                    }
                }
                continue
            }
            if index > (amount/3*2) {
                while(true) {
                    pattern = randomHardPattern()
                    if !patterns.contains(pattern) && !recomendPattern.contains(pattern){
                        patterns.append(pattern)
                        break
                    }
                }
                continue
            }
        }
        return patterns.shuffled()
    }
    
    public func generateDefaultPatterns() -> [String] {
        return GeneratePattern(amount: 12)
    }

}
