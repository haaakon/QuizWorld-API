//
//  ErrorEnvelope.swift
//  QuizWorldAPI
//
//  Created by Håkon Bogen on 28/01/17.
//  Copyright © 2017 beiningbogen.no. All rights reserved.
//

import Foundation
import Argo

public struct ErrorEnvelope {
    
    public let QWCode: String
    
    internal static func couldNotDecodeJSON(_ decodeError: DecodeError) -> ErrorEnvelope {
        
        return ErrorEnvelope(QWCode:"could not decode JSON")
        
    }
    
    internal static let couldNotParseJSON = ErrorEnvelope(QWCode:"")
    
    init(QWCode: String) {
        
        self.QWCode = QWCode
        
    }
    
    
}

extension ErrorEnvelope: Error {}
