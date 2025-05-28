//
//  QBoardViewModel.swift
//  WorldStudy-v10
//
//  Created by 이서하 on 5/26/25.
//

import Foundation
import Combine
import UIKit

class QBoardViewModel: ObservableObject {
    @Published var questions: [Question] = [] //질문리스트
    @Published var selectedQuestion: Question? //중 질문 하나 선택(디테일)
    
    func fetchQuestions() async {
        
//        Task{
            do{
                let questions = try await APIService.shared.fetchQuestions()
                await MainActor.run {
                    self.questions = questions
                }
            }catch {
                print("질문 목록 불러오기 실패: \(error)")
            }
//        }
    }
    
    func fetchQuestionDetail(questionId: Int) async {
        
        Task {
            do {
                let questions = try await APIService.shared.fethQuestionDetail(questionId: questionId)
                await MainActor.run {
                    self.selectedQuestion = questions
                }
            }catch{
                
            }
        }
    }
    
    func createQuestion(title: String, content: String, image: UIImage?, onSuccess: @escaping () -> Void) {
        Task {
            do {
                let success = try await APIService.shared.createQuestion(title: title, content: content, image: image)
                if success {
                    await fetchQuestions() // 질문 등록 후 목록 새로고침
                    onSuccess()
                }
            } catch {
                print("질문 등록 실패: \(error)")
            }
        }
    }
}
