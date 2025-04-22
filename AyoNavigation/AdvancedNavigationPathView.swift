//
//  AdvancedNavigationPathView.swift
//  AyoNavigation
//
//  Created by 김현기 on 4/22/25.
//

import SwiftUI

class PathModel: ObservableObject {
  @Published var paths: [PathType]

  init(paths: [PathType] = []) {
    self.paths = paths
  }
}

struct AdvancedNavigationPathView: View {
  @StateObject private var pathModel = PathModel()

  var body: some View {
    NavigationStack(path: $pathModel.paths) {
      AdvancedExampleHomeView()
        .navigationDestination(for: PathType.self) { pathType in
          switch pathType {
          case .view1:
            AdvancedView1()
          case .view2:
            AdvancedView2()
          case .view3:
            AdvancedView3()
          case .view4:
            AdvancedView4()
          case .subView1:
            SubView1()
          }
        }
    }
    .environmentObject(pathModel)
  }
}

struct AdvancedExampleHomeView: View {
  @EnvironmentObject var pathModel: PathModel

  var body: some View {
    VStack {
      Text("안녕하세요! 👋")

      Button {
        pathModel.paths.append(.view1)
      } label: {
        Text("View 1")
      }

      Button {
        pathModel.paths.append(.view2)
      } label: {
        Text("View 2")
      }

      Button {
        pathModel.paths.append(.view3)
      } label: {
        Text("View 3")
      }

      Button {
        pathModel.paths.append(.view4)
      } label: {
        Text("View 4")
      }
    }
  }
}

struct AdvancedView1: View {
  @EnvironmentObject var pathModel: PathModel

  var body: some View {
    VStack {
      Text("View 1")
        .padding(.bottom, 30)

      Button {
        pathModel.paths.removeLast()
      } label: {
        Text("뒤로가기")
      }

      Button {
        pathModel.paths.append(.view3)
      } label: {
        Text("View 3로 이동하기")
      }

      Button {
        pathModel.paths.append(.subView1)
      } label: {
        Text("서브뷰1로 이동하기")
      }

      Button {
        pathModel.paths.removeAll()
      } label: {
        Text("루트뷰로 돌아가기")
      }
    }
  }
}

struct AdvancedView2: View {
  @EnvironmentObject var pathModel: PathModel

  var body: some View {
    VStack {
      Text("View 2")
        .padding(.bottom, 30)

      Button {
        pathModel.paths.removeLast()
      } label: {
        Text("뒤로가기")
      }

      Button {
        pathModel.paths.removeAll()
      } label: {
        Text("루트뷰로 돌아가기")
      }
    }
  }
}

struct AdvancedView3: View {
  @EnvironmentObject var pathModel: PathModel

  var body: some View {
    VStack {
      Text("View 3")
        .padding(.bottom, 30)

      Button {
        pathModel.paths.removeLast()
      } label: {
        Text("뒤로가기")
      }

      Button {
        pathModel.paths.append(.view4)
      } label: {
        Text("View 4로 이동하기")
      }

      Button {
        pathModel.paths.removeAll()
      } label: {
        Text("루트뷰로 돌아가기")
      }
    }
  }
}

struct AdvancedView4: View {
  @EnvironmentObject var pathModel: PathModel

  var body: some View {
    VStack {
      Text("View 4")
        .padding(.bottom, 30)

      Button {
        pathModel.paths.removeLast()
      } label: {
        Text("뒤로가기")
      }

      Button {
        pathModel.paths.append(.view1)
      } label: {
        Text("View 1로 이동하기")
      }

      Button {
        pathModel.paths.removeAll()
      } label: {
        Text("루트뷰로 돌아가기")
      }
    }
  }
}

struct SubView1: View {
  @EnvironmentObject var pathModel: PathModel

  var body: some View {
    VStack {
      Text("서브뷰1 입니다")
        .padding(.bottom, 30)

      Button {
        pathModel.paths.removeLast()
      } label: {
        Text("뒤로가기")
      }

      Button {
        pathModel.paths.removeAll()
      } label: {
        Text("루트뷰로 돌아가기")
      }
    }
  }
}

#Preview {
  AdvancedNavigationPathView()
}
