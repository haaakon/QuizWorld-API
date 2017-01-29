//
//  QuestionEnvelope.swift
//  QuizWorldAPI
//
//  Created by Håkon Bogen on 28/01/17.
//  Copyright © 2017 beiningbogen.no. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

public struct QuestionEnvelope {
    
    public let questions: [Question]
    
}

extension QuestionEnvelope: Decodable {
    public static func decode(_ json: JSON) -> Decoded<QuestionEnvelope> {
        return curry(QuestionEnvelope.init)
            <^> json <|| "questions"
        
    }
}

