//
//  ContentView.swift
//  imitate
//
//  Created by garigari0118 on 2025/08/17.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text(viewModel.helloWorldText)
            Button("update") {
                Task {
                    await viewModel.loadHelloWorld()
                }
            }
        }
        .padding()
    }
}

class ContentViewModel: ObservableObject {
    @Published var helloWorldText = "initial Hello World"
    private let hellowWorldRepository = HellowWorldRepository()
    
    func loadHelloWorld() async {
        do {
            helloWorldText = try await hellowWorldRepository.fetch()
        } catch {
            helloWorldText = "failed loadHelloWorld()"
        }
    }
}

class HellowWorldRepository {
    
    func fetch() async throws -> String {
        // TODO: ここをFlutterモジュールから表示状態を取得するコードに変更
        return "Hello World"
    }
}

#Preview {
    ContentView()
}
