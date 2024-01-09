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
            Image(systemName: "creditcard")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Card Scan Options!")
            
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
            
            Button("Open stripe view", action: {
                viewModel.isStripeScannerPresented.toggle()
            })
        }
        .padding()
        .sheet(isPresented: $viewModel.isCardIOScannerPresented, content: {
            CardIOScannerView()
        })
        .sheet(isPresented: $viewModel.isCCScannerPresented, content: {
            ScannerView(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isStripeScannerPresented, content: {
            StripeView(viewModel: viewModel)
        })
    }
}

#Preview {
    ContentView()
}


class ContentViewModel: ObservableObject {
    @Published var isCardIOScannerPresented = false
    @Published var isCCScannerPresented = false
    @Published var isStripeScannerPresented = false
    @Published var message: String?
}
