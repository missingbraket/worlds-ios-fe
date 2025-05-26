//
//  ContentView.swift
//  WorldStudy-v1
//
//  Created by 이서하 on 5/23/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("메인페이지")
                .tabItem {
                    Image(systemName: "globe.asia.australia.fill")
                    Text("홈")
                }
            Text("커뮤니티")
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                    Text("커뮤니티")
                }
            MyPageMentor()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("마이페이지")
                }
        }
    }
}

#Preview {
    ContentView()
}
