//
//  QuestionGenerator.swift
//  MixMath
//
//  Created by Muhammad Rezky on 12/04/25.
//

import Foundation

struct QuestionGenerator {
    /// Generates a random mathematical question
    /// - Parameters:
    ///   - opsArr: Array of operation symbols
    ///   - isParenthesis: Whether to include parentheses
    /// - Returns: Generated numbers and optional parenthesis positions
    static func generateQuestion(opsArr: [String], isParenthesis: Bool = false) -> (number: [Int], parenthesis: [Int]?) {
        var numArr = Array(repeating: 0, count: opsArr.count + 1)
        var parenthesis: [Int] = []
        let rangeAddSub = 2..<10
        var index = 0
        var isDivision = false
        var tempDivisionOperand = 0
        
        // Generate parenthesis positions if needed
        if isParenthesis {
            while(true) {
                var parenthesisWrap = Int.random(in: 1..<3)
                var parenthesisOps = Int.random(in: 0..<3-parenthesisWrap)
                
                while (parenthesisWrap > 0) {
                    parenthesis.append(parenthesisOps)
                    parenthesisOps += 1
                    parenthesisWrap -= 1
                }
                
                // Handle constraints for division operations
                if !opsArr.contains(":") { break }
                
                if let index = opsArr.firstIndex(of: ":") {
                    if parenthesis.contains(index) { break }
                    
                    let gapFromDiv1 = parenthesis[0] - index
                    let gapFromDiv2 = parenthesis[parenthesis.count-1] - index
                    
                    if (gapFromDiv1 != 1) && (gapFromDiv2 != 1) && 
                       (gapFromDiv1 != -1) && (gapFromDiv2 != -1) {
                        break
                    }
                }
                parenthesis = []
            }
        }
        
        // Generate numbers for all operations except division
        if !opsArr.contains(":") {
            while(opsArr.count + 1 > index) {
                numArr[index] = Int.random(in: rangeAddSub)
                index += 1
            }
            return (numArr, parenthesis)
        }

        // Handle number generation with division operators
        for ops in opsArr {
            if !isParenthesis && ops == ":" && index != 0 && opsArr[index-1] == "x" {
                numArr[index] = Int.random(in: rangeAddSub)
                var operandDivision = 10
                
                while operandDivision > 1 {
                    if numArr[index] * numArr[index-1] % operandDivision == 0 && 
                       operandDivision != numArr[index] && 
                       operandDivision != numArr[index-1] {
                        tempDivisionOperand = operandDivision
                        break
                    }
                    operandDivision -= 1
                }
                
                if operandDivision == 1 {
                    tempDivisionOperand = numArr[index-1]
                }
                isDivision = true
            } else if ops == ":" {
                tempDivisionOperand = Int.random(in: rangeAddSub)
                numArr[index] = Int.random(in: rangeAddSub) * tempDivisionOperand
                isDivision = true
            } else if isDivision {
                numArr[index] = tempDivisionOperand
                isDivision = false
            } else {
                numArr[index] = Int.random(in: rangeAddSub)
            }
            index += 1
        }
        
        // Set the last number
        if isDivision {
            numArr[index] = tempDivisionOperand
        } else {
            numArr[index] = Int.random(in: rangeAddSub)
        }
        
        return (numArr, isParenthesis ? parenthesis : nil)
    }
}
