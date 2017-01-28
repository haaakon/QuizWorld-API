//
//  ServiceConfig.swift
//  QuizWorldAPI
//
//  Created by Håkon Bogen on 28/01/17.
//  Copyright © 2017 beiningbogen.no. All rights reserved.
//

import Foundation

public protocol ServerConfigType {
    
    var apiBaseURL: URL { get }
    
}


public struct ServerConfig: ServerConfigType {
    
    public let apiBaseURL: URL
    
    public static let local: ServerConfigType = ServerConfig(apiBaseURL: URL(string:"https://api")!)
    
    public init(apiBaseURL: URL) {
        
        self.apiBaseURL = apiBaseURL
        
    }
    
}
