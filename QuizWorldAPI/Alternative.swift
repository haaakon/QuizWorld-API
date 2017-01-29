//
//  Alternative.swift
//  QuizWorldAPI
//
//  Created by Håkon Bogen on 28/01/17.
//  Copyright © 2017 beiningbogen.no. All rights reserved.
//

import Foundation
import Argo
import Curry
import Runes

public struct Alternative {
    
    let text: String
    let isCorrect: Bool
    
}

extension Alternative: Decodable {
    public static func decode(_ json: JSON) -> Decoded<Alternative> {
        return curry(Alternative.init)
            <^> json <| "text"
            <*> json <| "isCorrect"
    }
}
