//
//  NavigationPathView.swift
//  AyoNavigation
//
//  Created by 김현기 on 4/21/25.
//

import SwiftUI

enum PathType: Hashable {
  case view1
  case view2
  case view3
  case view4
  case subView1
}

struct NavigationPathView: View {
  @State var path: [PathType] = []

  var body: some View {
    NavigationStack(path: $path) {
      ExampleHomeView(path: $path)
        .navigationDestination(for: PathType.self) { pathType in
          switch pathType {
          case .view1:
            View1(path: $path)
          case .view2:
            View2(path: $path)
          case .view3:
            View3(path: $path)
          case .view4:
            View4(path: $path)
          case .subView1:
            Text("서브뷰1 입니다")
          }
        }
    }
  }
}

struct ExampleHomeView: View {
  @Binding var path: [PathType]

  var body: some View {
    VStack {
      Text("안녕하세요! 👋")

      Button {
        path.append(.view1)
      } label: {
        Text("View 1")
      }

      Button {
        path.append(.view2)
      } label: {
        Text("View 2")
      }

      Button {
        path.append(.view3)
      } label: {
        Text("View 3")
      }

      Button {
        path.append(.view4)
      } label: {
        Text("View 4")
      }
    }
  }
}

struct View1: View {
  @Binding var path: [PathType]

  init(path: Binding<[PathType]>) {
    _path = path
    print("View1 init")
  }

  var body: some View {
    VStack {
      Text("View 1 입니다 👋")
        .navigationTitle("View 1")
        .padding(.bottom, 50)

      Button {
        path.append(.view4)
      } label: {
        Text("View 4로 이동하기")
      }
    }
  }
}

struct View2: View {
  @Binding var path: [PathType]

  init(path: Binding<[PathType]>) {
    _path = path
    print("View2 init")
  }

  var body: some View {
    Text("View 2 입니다 👋")
      .navigationTitle("View 2")
  }
}

struct View3: View {
  @Binding var path: [PathType]

  init(path: Binding<[PathType]>) {
    _path = path
    print("View3 init")
  }

  var body: some View {
    Text("View 3 입니다 👋")
      .navigationTitle("View 3")
  }
}

struct View4: View {
  @Binding var path: [PathType]

  init(path: Binding<[PathType]>) {
    _path = path
    print("View4 init")
  }

  var body: some View {
    Text("View 4 입니다 👋")
      .navigationTitle("View 4")
  }
}

#Preview {
  NavigationPathView()
}
