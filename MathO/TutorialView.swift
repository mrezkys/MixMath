//
//  TutorialView.swift
//  MathO
//
//  Created by Muhammad Rezky on 04/04/23.
//

import SwiftUI


struct TutorialView: View {
    var displayText = "Jawablah pertanyaan yang muncul di sini dengan jawaban yang tersedia di bawah"
    @State  var showDisplayText : Bool = true
    
    var questionX: String = "1 + 3 x 2"
    var choices: [Int] = [7, 8, 12, 18]
    var answer: Int = 7
    
    @State public var isCircle: [Bool] =  [false, false, false, false]
    @State public var isSelected: [Bool] = [false, false, false, false]
    @State var showSummaryView: Bool = false
    @State var answerCorrectly: [Bool] = []
    
    
    
    var body: some View {
        VStack {
            if (showDisplayText)
            {
                Text(displayText)
                    .padding(.horizontal, 32)
                    .font(.system(size: 24))
                    .multilineTextAlignment(.center)
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 240)
                    .background(Color("celestialBlue"))
                    .cornerRadius(24)
                    .padding([.top, .leading, .trailing], 24)
                    .foregroundColor(Color.white)
            }
            else {
                Text(questionX)
                    .padding(.horizontal, 32)
                    .font(.system(size: 500))
                    .lineLimit(1)
                    .minimumScaleFactor(0.01)
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: 240)
                    .background(Color("celestialBlue"))
                    .cornerRadius(24)
                    .padding([.top, .leading, .trailing], 24)
                    .foregroundColor(Color.white)
                
            }
            
            VStack(spacing: 16) {
                HStack(spacing: 16) {
                    AnswerButton(
                        generatedNumber: choices[0], isCircle: $isCircle, isSelected: $isSelected, index: 0, correctAnswer: answer, answerCorrectly: $answerCorrectly)
                    
                    AnswerButton(generatedNumber: choices[1], isCircle: $isCircle, isSelected: $isSelected, index: 1, correctAnswer: answer, answerCorrectly: $answerCorrectly)
                }
                .padding(.horizontal, 32)
                
                HStack(spacing: 16) {
                    AnswerButton(generatedNumber: choices[2], isCircle: $isCircle, isSelected: $isSelected, index: 2, correctAnswer: answer, answerCorrectly: $answerCorrectly)
                    
                    AnswerButton(generatedNumber: choices[3], isCircle: $isCircle, isSelected: $isSelected, index: 3, correctAnswer: answer, answerCorrectly: $answerCorrectly)
                }
                .padding(.horizontal, 32)
            }
            .padding(.top, 32)
            Spacer()
            
            Image("book-illustration")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 42)
                .offset(y: 35)
        }
        .padding(.top, 35)
        .navigationBarTitle("Mari Berhitung 🤓")
        .navigationBarItems(
            trailing:
                Button(
                    action: {
                        // go to homepage
                    },
                    label: {
                        Text("Finish")
                    }
                )
        ).onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                self.showDisplayText = false
                
            }
        }
        
        
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
