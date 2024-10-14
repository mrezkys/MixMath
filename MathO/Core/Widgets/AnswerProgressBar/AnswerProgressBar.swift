//
//  AnswerProgressBar.swift
//  MixMath
//
//  Created by Muhammad Rezky on 14/10/24.
//

import SwiftUI

struct AnswerProgressBar: View {
    let answerCorrectly: [Bool?]
    let questionCount: Int
    
    let screenWidth = UIScreen.main.bounds.width
    var barLength : CGFloat = 0
    func getBarColor(index: Int) -> Color {
        if(answerCorrectly[index] == Optional(true)){
            return Color("americanGreen")
        } else if(answerCorrectly[index] == Optional(false)){
            return Color("fireOpal")
        } else {
            return Color("water")
        }
    }
    
    init(answerCorrectly: [Bool?], questionCount: Int) {
        self.answerCorrectly = answerCorrectly
        self.questionCount = questionCount
        
        self.barLength  = screenWidth/CGFloat(questionCount) - 8
    }
    var body: some View{
        HStack(spacing: 0){
            ForEach(0..<questionCount) {i in
                Rectangle()
                    .foregroundColor(getBarColor(index: i))
                    .frame(width: barLength, height: 8)
                    .padding(0)
                    .padding(.horizontal, 4)                
            }
        }
    }
}

//#Preview {
//    AnswerProgressBar()
//}
