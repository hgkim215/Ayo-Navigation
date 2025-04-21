//
//  NavigationDestinationView.swift
//  AyoNavigation
//
//  Created by 김현기 on 4/21/25.
//

import SwiftUI

struct NavigationDestinationView: View {
  @State private var isPresented = false

  var body: some View {
    NavigationStack {
      Button {
        isPresented = true
        // 더 많은 액션 가능
      } label: {
        Text("탭해서 이동하기! 😀")
      }
      .navigationDestination(isPresented: $isPresented) {
        ExampleView()
      }
    }
  }
}

#Preview {
  NavigationDestinationView()
}
