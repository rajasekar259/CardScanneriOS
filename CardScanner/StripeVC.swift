//
//  StripVC.swift
//  CardScanner
//
//  Created by rajasekar.r on 19/12/23.
//

import UIKit
import SwiftUI
import StripeCardScan

class StripeVC: UIViewController {
    var viewModel: ContentViewModel?
    convenience init(viewModel: ContentViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute:  {
            self.cardScanSheetButtonPressed()
        })
        
    }
    
    func cardScanSheetButtonPressed() {
        let cardScanSheet = CardScanSheet()
        
        cardScanSheet.present(from: self) { [weak self] result in
            switch result {
            case .completed(let scannedCard):
                /*
                 * The user scanned a card. The result of the scan are detailed
                 * in the `scannedCard` field of the result.
                 */
                print("scan success")
                self?.viewModel?.message = "\(scannedCard)"
            case .canceled:
                /*
                 * The scan was canceled by the user.
                 */
                print("scan canceled")
                self?.viewModel?.message = "Scan Canceled"
            case .failed(let error):
                /*
                 * The scan failed. The displayable error is
                 * included in the `localizedDescription`.
                 */
                let msg = "scan failed: \(error.localizedDescription)"
                print(msg)
                self?.viewModel?.message = msg
            }
            
            self?.dismiss(animated: true)
        }
    }
}


struct StripeView: UIViewControllerRepresentable {
    var viewModel: ContentViewModel
    
    func updateUIViewController(_ uiViewController: StripeVC, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> StripeVC {
        StripeVC(viewModel: viewModel)
    }
}
