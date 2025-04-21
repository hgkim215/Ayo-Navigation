//
//  ContentView.swift
//  AyoNavigation
//
//  Created by 김현기 on 4/21/25.
//

import SwiftUI

struct NavigationLinkView: View {
  // MARK: - NavigationLink

  var body: some View {
    // 가장 쉬운 방법
    // But, 권장하지 않음!!
    NavigationStack {
      NavigationLink(destination: {
        Text("안녕하세요! 👋")
      }) {
        Text("탭해서 이동하기! 😀")
      }
    }
  }
}

#Preview {
  NavigationLinkView()
}
