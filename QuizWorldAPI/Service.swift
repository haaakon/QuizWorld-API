//
//  Service.swift
//  QuizWorldAPI
//
//  Created by Håkon Bogen on 28/01/17.
//  Copyright © 2017 beiningbogen.no. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveExtensions
import Result


public struct Service: ServiceType {
    
    /// Fetch all questions
    //    public func fetchQuestions() -> SignalProducer<QuestionEnvelope, ErrorEnvelope> {
    //
    //    }

    
    public let serverConfig: ServerConfigType
    
    public init(serverConfig: ServerConfig) {
        
        self.serverConfig = serverConfig
        
    }
    
    //    private func request<M: Decodable>(_ route: Route)
    //        -> SignalProducer<M, ErrorEnvelope> where M == M.DecodedType {
    //
    //            let properties = route.requestProperties
    //
    //            guard let URL = URL(string: properties.path, relativeTo: self.serverConfig.apiBaseUrl as URL) else {
    //                fatalError(
    //                    "URL(string: \(properties.path), relativeToURL: \(self.serverConfig.apiBaseUrl)) == nil"
    //                )
    //            }
    //
    //            return Service.session.rac_JSONResponse(
    //                preparedRequest(forURL: URL, method: properties.method, query: properties.query),
    //                uploading: properties.file.map { ($1, $0.rawValue) }
    //                )
    //                .flatMap(decodeModel)
    //    }
    //    
    
//    private func request<M: Decodable>(_ route: Route)
//        -> SignalProducer<[M], ErrorEnvelope> where M == M.DecodedType {
//            
//            let properties = route.requestProperties
//            
//            let url = self.serverConfig.apiBaseUrl.appendingPathComponent(properties.path)
//            
//            return Service.session.rac_JSONResponse(
//                preparedRequest(forURL: url, method: properties.method, query: properties.query),
//                uploading: properties.file.map { ($1, $0.rawValue) }
//                )
//                .flatMap(decodeModels)
//    }
}

