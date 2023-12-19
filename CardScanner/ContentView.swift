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
            
            Button("Scan with CardIO", action: {
                viewModel.isCardIOScannerPresented.toggle()
            })
            
            Button("Scan with CCScanner", action: {
                viewModel.isCCScannerPresented.toggle()
            })
            
            Button("Open strip view", action: {
                viewModel.isStripScannerPresented.toggle()
            })
        }
        .padding()
        .sheet(isPresented: $viewModel.isCardIOScannerPresented, content: {
            CardIOScannerView()
        })
        .sheet(isPresented: $viewModel.isCCScannerPresented, content: {
            ScannerView(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isStripScannerPresented, content: {
            StripView(viewModel: viewModel)
        })
    }
}

#Preview {
    ContentView()
}


class ContentViewModel: ObservableObject {
    @Published var isCardIOScannerPresented = false
    @Published var isCCScannerPresented = false
    @Published var isStripScannerPresented = false
    @Published var message: String?
}
