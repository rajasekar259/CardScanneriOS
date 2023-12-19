//
//  CardIOScannerView.swift
//  CardScanner
//
//  Created by rajasekar.r on 19/12/23.
//

import Foundation
import UIKit
import SwiftUI



struct CardIOScannerView: UIViewControllerRepresentable {
    var delegate: CardIOPaymentViewControllerDelegate! = CardIOScannerDelegate()
    func makeUIViewController(context: Context) -> some UIViewController {
        CardIOPaymentViewController(paymentDelegate: delegate)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

class CardIOScannerDelegate: NSObject, CardIOPaymentViewControllerDelegate {
    func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        print("Cancelled....")
    }
    
    func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
        print(cardInfo)
    }
    
    
}
