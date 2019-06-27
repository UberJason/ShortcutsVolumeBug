//
//  IntentHandler.swift
//  ShortcutIntent
//
//  Created by Jason Ji on 6/25/19.
//  Copyright © 2019 Jason Ji. All rights reserved.
//

import Intents
import MyKit

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return DoFooIntentHandler()
    }
    
}

