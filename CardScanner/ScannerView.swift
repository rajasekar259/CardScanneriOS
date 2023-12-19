//
//  ScannerView.swift
//  CardScanner
//
//  Created by rajasekar.r on 19/12/23.
//

import Foundation
import UIKit
import SwiftUI
import CreditCardScanner


struct ScannerView: UIViewControllerRepresentable {
    var delegate: ScannerViewDelegate!
    var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel) {
        self.delegate = ScannerViewDelegate(viewModel: viewModel)
        self.viewModel = viewModel
    }
    
    func makeUIViewController(context: Context) -> CreditCardScanner.CreditCardScannerViewController {
        CreditCardScannerViewController(delegate: delegate)
    }
    
    func updateUIViewController(_ uiViewController: CreditCardScanner.CreditCardScannerViewController, context: Context) { }
    
    typealias UIViewControllerType = CreditCardScannerViewController
}


class ScannerViewDelegate: CreditCardScannerViewControllerDelegate {
    var viewModel: ContentViewModel
    
    init(viewModel: ContentViewModel) {
        self.viewModel = viewModel
    }
    
    func creditCardScannerViewControllerDidCancel(_ viewController: CreditCardScanner.CreditCardScannerViewController) {
        viewController.dismiss(animated: true)
        viewModel.message = nil
    }
    
    func creditCardScannerViewController(_ viewController: CreditCardScanner.CreditCardScannerViewController, didErrorWith error: CreditCardScanner.CreditCardScannerError) {
        let error = "Error: \(error)"
        viewModel.message = error
    }
    
    func creditCardScannerViewController(_ viewController: CreditCardScanner.CreditCardScannerViewController, didFinishWith card: CreditCardScanner.CreditCard) {
        viewController.dismiss(animated: true)
        print(card)
        viewModel.message = "\(card)"
    }
}

