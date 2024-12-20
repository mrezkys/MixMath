//
//  TestView.swift
//  MathO
//
//  Created by Vincent Gunawan on 31/03/23.
//

import SwiftUI

struct QuestionSummaryView: View {
    var questions: [QuestionPageModel]
    
    private var correctCount: Int {
        questions.filter { $0.isCorrect == true }.count
    }
    
    var body: some View {
        VStack {
            questionGrid
                .padding()
            Spacer()
            VStack(spacing: 8) {
                Text(summaryHeadline())
                    .font(.system(size: 36, weight: .heavy, design: .rounded))
                Text(summarySubheadline())
                    .font(.system(size: 18, weight: .bold, design: .rounded))
            }
            Spacer()
            ZStack (alignment: .bottom){
                Rectangle()
                    .foregroundColor(Color("water"))
                    .frame(maxWidth: .infinity, maxHeight: 100)
                Image(pickSummaryAvatar())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: .infinity, height: 250)
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationBarTitle("Ringkasan", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: HomeView()) {
                    Text("Selesai")
                }
            }
        }
    }
    
    private var questionGrid: some View {
        LazyVGrid(
            columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 4),
            spacing: 4
        ) {
            ForEach(questions.indices, id: \.self) { index in
                NavigationLink(
                    destination: QuestionEvaluationView(question: questions[index])
                ) {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: 81, height: 81)
                        .foregroundColor(
                            questions[index].isCorrect ?? false
                            ? Color("americanGreen")
                            : Color("fireOpal")
                        )
                }
            }
        }
        .frame(width: .infinity)
        .padding(.top, 38)
    }
    
    
    private func summaryHeadline() -> String {
        correctCount == 12
            ? NSLocalizedString("Sangat Baik", comment: "Label for a very good performance summary")
            : correctCount >= 10
            ? NSLocalizedString("Cukup Baik", comment: "Label for an adequate performance summary")
            : NSLocalizedString("Kurang Baik", comment: "Label for a poor performance summary")
    }
    
    private func summarySubheadline() -> String {
        correctCount == 12
            ? NSLocalizedString("Selamat! Pertahankan cara berlatihmu.", comment: "Encouragement for perfect score")
            : correctCount >= 10
            ? NSLocalizedString("Akan lebih baik jika kamu terus berlatih.", comment: "Encouragement for near-perfect score")
            : NSLocalizedString("Kamu perlu berlatih lagi, semangat!", comment: "Encouragement for needing improvement")
    }
    
    private func pickSummaryAvatar() -> String {
        correctCount == 12
        ? "girl-wow-illlustration"
        : correctCount >= 10
        ? "girl-smile-illlustration"
        : "girl-tongue-illlustration"
    }
}

struct QuestionSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionSummaryView(
            questions: Array(
                repeating: QuestionPageModel(
                    mathQuestion: Math()
                ),
                count: 12
            )
        )
    }
}

