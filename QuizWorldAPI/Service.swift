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
import Argo
import Prelude

public struct Service: ServiceType {
    
    /// Fetch friends for a user.
    public func fetchQuestions() -> SignalProducer<QuestionEnvelope, ErrorEnvelope> {
        
        return request(Route.questions)
        
    }
    
    public let serverConfig: ServerConfigType
    
    private static let session = URLSession(configuration: .default)
    
    public init(serverConfig: ServerConfig) {
        
        self.serverConfig = serverConfig
        
    }
    
    private func decodeModel<M: Decodable>(_ json: Any) ->
        SignalProducer<M, ErrorEnvelope> where M == M.DecodedType {
            
            return SignalProducer(value: json)
                .map { json in decode(json) as Decoded<M> }
                .flatMap(.concat) { (decoded: Decoded<M>) -> SignalProducer<M, ErrorEnvelope> in
                    switch decoded {
                    case let .success(value):
                        return .init(value: value)
                    case let .failure(error):
                        print("Argo decoding model \(M.self) error: \(error)")
                        return .init(error: .couldNotDecodeJSON(error))
                    }
            }
    }
    
    private func decodeModels<M: Decodable>(_ json: Any) ->
        SignalProducer<[M], ErrorEnvelope> where M == M.DecodedType {
            
            return SignalProducer(value: json)
                .map { json in decode(json) as Decoded<[M]> }
                .flatMap(.concat) { (decoded: Decoded<[M]>) -> SignalProducer<[M], ErrorEnvelope> in
                    switch decoded {
                    case let .success(value):
                        return .init(value: value)
                    case let .failure(error):
                        print("Argo decoding model error: \(error)")
                        return .init(error: .couldNotDecodeJSON(error))
                    }
            }
    }
    
    private func request<M: Decodable>(_ route: Route)
        -> SignalProducer<M, ErrorEnvelope> where M == M.DecodedType {
            
            let properties = route.requestProperties
            
            guard let URL = URL(string: properties.path, relativeTo: self.serverConfig.apiBaseURL as URL) else {
                fatalError(
                    "URL(string: \(properties.path), relativeToURL: \(self.serverConfig.apiBaseURL)) == nil"
                )
            }
            
            let request = URLRequest(url: URL)
            
            return Service.session.rac_JSONResponse(
                request
                )
                .flatMap(decodeModel)
    }
    
    private func request<M: Decodable>(_ route: Route)
        -> SignalProducer<[M], ErrorEnvelope> where M == M.DecodedType {
            
            let properties = route.requestProperties
            
            let url = self.serverConfig.apiBaseURL.appendingPathComponent(properties.path)
            let request = URLRequest(url: url)
            
            return Service.session.rac_JSONResponse(
                request
                )
                .flatMap(decodeModels)
    }
}

