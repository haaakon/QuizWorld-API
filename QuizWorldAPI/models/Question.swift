//
//  Question.swift
//  QuizWorldAPI
//
//  Created by Håkon Bogen on 28/01/17.
//  Copyright © 2017 beiningbogen.no. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

public struct Question {
    
    public let text: String
    let alternatives: [Alternative]
    
}

extension Question: Decodable {
    
    public static func decode(_ json: JSON) -> Decoded<Question> {
        
        return curry(Question.init)
            <^> json <| "text"
            <*> json <|| "alternatives"
        
    }
    
}
