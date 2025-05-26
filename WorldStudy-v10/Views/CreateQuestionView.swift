//
//  CreateQuestionView.swift
//  WorldStudy-v10
//
//  Created by 이서하 on 5/27/25.
//

import SwiftUI

struct CreateQuestionView: View {
    @Binding var title: String
    @Binding var content: String
    @Binding var isPresented: Bool
    @Binding var isCreating: Bool
    @Binding var errorMessage: String?
    var onSubmit: () -> Void

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Text("질문 작성")
                    .font(.title)
                    .bold()

                TextField("제목", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextEditor(text: $content)
                    .frame(height: 150)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.5)))

                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }

                if isCreating {
                    ProgressView()
                }

                Button("등록") {
                    onSubmit()
                }
                .buttonStyle(.borderedProminent)
                .padding(.top)

                Button("취소", role: .cancel) {
                    isPresented = false
                }
                .foregroundColor(.red)
                .padding(.top, 4)

                Spacer()
            }
            .padding()
            .navigationTitle("질문 작성")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

