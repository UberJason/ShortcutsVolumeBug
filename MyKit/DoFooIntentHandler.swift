//
//  DoFooIntentHandler.swift
//  MyKit
//
//  Created by Jason Ji on 6/25/19.
//  Copyright © 2019 Jason Ji. All rights reserved.
//

import Foundation

public class DoFooIntentHandler: NSObject, DoFooIntentHandling {
    public func handle(intent: DoFooIntent, completion: @escaping (DoFooIntentResponse) -> Void) {
        print("handle called")
        if let amount = intent.amount {
            print("Value: \(amount)")
        }
        else {
            print("Amount is unknown")
        }
        completion(DoFooIntentResponse(code: .success, userActivity: nil))
    }
    
    public func resolveAmount(for intent: DoFooIntent, with completion: @escaping (DoFooAmountResolutionResult) -> Void) {
        print("resolveAmount called")
        guard let amount = intent.amount else {
            completion(.needsValue())
            return
        }
        
        completion(.success(with: amount))
    }

}
