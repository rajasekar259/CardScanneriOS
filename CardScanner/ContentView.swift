//
//  ContentView.swift
//  CardScanner
//
//  Created by rajasekar.r on 15/12/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            if let message = viewModel.message {
                Text(message)
                    .font(.subheadline)
            }
            
            Button("Scan Card", action: {
                viewModel.isScannerVCPresented.toggle()
            })
        }
        .padding()
        .sheet(isPresented: $viewModel.isScannerVCPresented, content: {
//            ScannerView(viewModel: viewModel)
            CardIOScannerView()
        })
    }
}

#Preview {
    ContentView()
}


class ContentViewModel: ObservableObject {
    @Published var isScannerVCPresented = false
    @Published var message: String?
}
