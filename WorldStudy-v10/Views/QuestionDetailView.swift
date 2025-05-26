//
//  QuestionDetailView.swift
//  WorldStudy-v10
//
//  Created by 이서하 on 5/23/25.
//

import SwiftUI

struct QuestionDetailView: View {
    let question: Question

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(question.title)
                .font(.title)
                .bold()
                .padding(.top, 50)

            Text("작성일: \(question.createdAt.formatted())")
                .font(.subheadline)
                .foregroundColor(.gray)

            Divider()

            Text(question.content)
                .font(.body)
                .padding(.top,40)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    let sampleQuestion = Question(
        id: 1,
        title: "미리보기용 질문 제목",
        content: "미리보기용 질문 내용. 나 이거 궁금하다~ 알랴줘봐",
        createdAt: Date(),
        deletedAt: nil,
        userId: 1
    )
    
    return QuestionDetailView(question: sampleQuestion)
}
