//
//  ErrorEnvelope.swift
//  QuizWorldAPI
//
//  Created by Håkon Bogen on 28/01/17.
//  Copyright © 2017 beiningbogen.no. All rights reserved.
//

import Foundation

public struct ErrorEnvelope : Error {
    
    public let QWCode: String
    
    init(QWCode: String) {
        
        self.QWCode = QWCode
        
    }
    
    
}
