//
//  ExpressionFormatter.swift
//  MixMath
//
//  Created by Muhammad Rezky on 12/04/25.
//

import Foundation

/// Formats mathematical expressions into readable strings
struct ExpressionFormatter {
    /// Formats a mathematical expression into readable string
    /// - Parameters:
    ///   - numArr: Number array
    ///   - opsArr: Operations array
    ///   - opsIndex: Operation index to highlight, or -1 for none
    ///   - parenthesis: Optional parenthesis positions
    /// - Returns: Formatted expression as string array
    static func formatExpression(numArr: [Int], opsArr: [String], opsIndex: Int, parenthesis: [Int]? = nil) -> [String] {
        var formattedExpression = ""
        var index = 0
        var pIndex = 0
        var closeParenthesis = false
        var highlightOperation = false
        var splitOperation: [String] = []
        
        for number in numArr {
            // Add opening parenthesis if needed
            if let parenthesis = parenthesis {
                if parenthesis.count > pIndex && (parenthesis[pIndex]) == index + pIndex {
                    formattedExpression += "( "
                    pIndex = parenthesis.count - 1
                    closeParenthesis = true
                }
            }
            
            // Handle operation highlighting for step-by-step displays
            if index == opsIndex {
                splitOperation.append(formattedExpression)
                formattedExpression = ""
                highlightOperation = true
            }
            
            formattedExpression += String(number) + " "
            
            if highlightOperation && index != opsIndex {
                splitOperation.append(formattedExpression)
                formattedExpression = ""
                highlightOperation = false
            }
            
            formattedExpression += " "
            
            // Add closing parenthesis if needed
            if let parenthesis = parenthesis {
                if closeParenthesis && (parenthesis[pIndex]) == index - 1 {
                    formattedExpression += ") "
                    closeParenthesis = false
                }
            }
            
            // Add operation symbol
            if opsArr.count > index {
                formattedExpression += opsArr[index] + " "
            }
            
            index += 1
        }
        
        // Add final closing parenthesis if needed
        if closeParenthesis {
            formattedExpression += ")"
        }
        
        splitOperation.append(formattedExpression)
        return splitOperation
    }
}
