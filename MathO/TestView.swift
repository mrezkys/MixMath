//
//  TestView.swift
//  MathO
//
//  Created by Vincent Gunawan on 31/03/23.
//

import SwiftUI

struct TestView: View {
    var question: [Math]
    var isCircle: [[Bool]]
    var isSelected: [[Bool]]
    
    var body: some View {
        var _ = print("Pindah Page bro")
        var _ = print(question)
        NavigationView {
            NavigationLink(destination: SumQuestionPage(question: question, currentPageIndex: 0, isCircle: isCircle[0], isSelected: isSelected[0])) {
                Text("Next")
            }
        }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(question: [Math()], isCircle: [[false, false, false, true]], isSelected: [[false, false, false, true]])
    }
}
