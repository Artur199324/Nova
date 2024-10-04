//
//  RequestAppReview.swift
//  Nova Scotia Resort Places
//
//  Created by Artur on 05.10.2024.
//

import Foundation
import StoreKit
struct RequestAppReview{
    func requestAppReview() {
           if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
               SKStoreReviewController.requestReview(in: scene)
           }
       }
}
