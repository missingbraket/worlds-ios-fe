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
    @Environment(\.presentationMode) var presentationMode
//    @State private var goToQuestionView = false
    var onSubmit: () -> Void

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
//                NavigationLink(destination: QuestionView(), isActive: $goToQuestionView) {
//                                   EmptyView()
//                               }
//                               .hidden()
                
                Text("멘토에게 질문하기")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)

                TextField("제목", text: $title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Menu("사진 추가하기") {
                      Button("Camera") {
                        print("Normal")
                      }
                      Button("Photo") {
                        print("Formatted")
                      }
                    }

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

                Button {
                    onSubmit()
                } label: {
                    Text("등록")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 150)
                        .background(.blue)
                        .cornerRadius(15)
                }.frame(maxWidth: .infinity, alignment: .center)

                Spacer()
            }
            .padding()
            .navigationTitle("월스")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss() //지금화면 닫고 이전 화면가기
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.gray)
                            .padding(.leading, 15)
                            .frame(width: 20, height: 30)
                    }
                }
            }
        }
    }
}

