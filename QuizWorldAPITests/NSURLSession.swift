//
//  NSURLSession.swift
//  QuizWorldAPI
//
//  Created by Håkon Bogen on 28/01/17.
//  Copyright © 2017 beiningbogen.no. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveExtensions

private func parseJSONData(_ data: Data) -> Any? {
    return (try? JSONSerialization.jsonObject(with: data, options: []))
}

private let scheduler = QueueScheduler(qos: .background, name: "no.beiningbogen.api", targeting: nil)

extension URLSession {
    
    // Wrap an URLSession producer with error envelope logic.
    internal func rac_dataResponse(_ request: URLRequest)
        -> SignalProducer<Data, ErrorEnvelope> {
            
            return SignalProducer<Data, ErrorEnvelope> { data, error in
                
                
            }
            
    }
    
    internal func rac_JSONResponse(_ request: URLRequest)
        -> SignalProducer<Any, ErrorEnvelope> {
            
            return self.rac_dataResponse(request)
                .map(parseJSONData)
                .flatMap { json -> SignalProducer<Any, ErrorEnvelope> in
                    guard let json = json else {
                        
                        return .init(error: .couldNotParseJSON)
                    }
                    return .init(value: json)
            }
    }
    
}
