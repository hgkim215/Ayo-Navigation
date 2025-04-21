//
//  EagerViewInitView.swift
//  AyoNavigation
//
//  Created by 김현기 on 4/21/25.
//

import SwiftUI

struct EagerViewInitView: View {
  var body: some View {
    NavigationStack {
      NavigationLink {
//        print("ExampleView 관련 ~")
        ExampleView()
          .onAppear {
            print("ExampleView 관련 ~")
          }
      } label: {
        Text("탭 해서 이동하기! 😀")
      }
    }
  }
}

// DestinationView에 @StateObject와 같은 무거운 것들을 이것저것 사용하게 되면 더 퍼포먼스적으로 좋지 않겠죠?
struct ExampleView: View {
  init() {
    print("INIT 호출됨")
  }

  var body: some View {
    Text("안녕하세요! 👋")
  }
}

#Preview {
  EagerViewInitView()
}
