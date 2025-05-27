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
//struct QuestionDetailView: View {
//    let question: Question
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text(question.title).font(.title2).bold()
//            Text(question.content)
//            Divider()
//            Text("댓글")
//                .font(.headline)
//            List(question.answers) { answer in
//                VStack(alignment: .leading) {
//                    Text(answer.user).font(.subheadline).bold() //Text(answer.userId.nickname).font(.subheadline).bold()
//                    Text(answer.content)
//                }
//            }
//        }
//        .padding()
//        .navigationTitle("게시글")
//    }
//}
//
