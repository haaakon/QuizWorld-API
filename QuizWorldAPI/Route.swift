//
//  Route.swift
//  QuizWorldAPI
//
//  Created by Håkon Bogen on 28/01/17.
//  Copyright © 2017 beiningbogen.no. All rights reserved.
//

import Foundation

enum Method {
    
    case GET
    
}

internal enum Route {
    
    case questions
    
    
    internal var requestProperties: (method: Method, path: String, query: [String:Any]) {
        
        switch self {
            
        case .questions:
            
            return (.GET, "/questions" , [:])
            
        }
        
    }
    
}
