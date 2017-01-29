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

private let scheduler = QueueScheduler(qos: .background, name: "com.kickstarter.ksapi", targeting: nil)

extension URLSession {
    
    // Returns a producer that will execute the given upload once for each invocation of start().
    //    fileprivate func rac_dataWithRequest(_ request: URLRequest, uploading file: URL, named name: String)
    //        -> SignalProducer<(Data, URLResponse), AnyError> {
    //            
    //            var mutableRequest = request
    //            
    //            guard
    //                let data = try? Data(contentsOf: file),
    //                let mime = file.imageMime ?? data.imageMime,
    //                let multipartHead = ("--\(boundary)\r\n"
    //                    + "Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(file.lastPathComponent)\"\r\n"
    //                    + "Content-Type: \(mime)\r\n\r\n").data(using: .utf8),
    //                let multipartTail = "--\(boundary)--\r\n".data(using: .utf8)
    //                else { fatalError() }
    //            
    //            var body = Data()
    //            body.append(multipartHead)
    //            body.append(data)
    //            body.append(multipartTail)
    //            
    //            mutableRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
    //            mutableRequest.httpBody = body
    //            
    //            return SignalProducer { observer, disposable in
    //                let task = self.dataTask(with: mutableRequest) { data, response, error in
    //                    guard let data = data, let response = response else {
    //                        observer.send(error: AnyError(error ?? defaultSessionError))
    //                        return
    //                    }
    //                    observer.send(value: (data, response))
    //                    observer.sendCompleted()
    //                }
    //                disposable += task.cancel
    //                task.resume()
    //            }
    //    }
    
    // Wrap an URLSession producer with error envelope logic.
    internal func rac_dataResponse(_ request: URLRequest)
        -> SignalProducer<Data, ErrorEnvelope> {
            
            return SignalProducer<Data, ErrorEnvelope> { data, error in
                
                
            }
            
            //            SignalProducer<Data, ErrorEnvelope> { data, response in
            //                
            //                guard let response = response as? HTTPURLResponse else { fatalError() }
            //                
            //                guard
            //                    (200..<300).contains(response.statusCode),
            //                    let headers = response.allHeaderFields as? [String:String],
            //                    let contentType = headers["Content-Type"], contentType.hasPrefix("application/json")
            //                    else {
            //                        
            //                        print("[KsApi] Failure \(request)")
            //                        
            //                        if let json = parseJSONData(data) {
            //                            switch decode(json) as Decoded<ErrorEnvelope> {
            //                            case let .success(envelope):
            //                                // Got the error envelope
            //                                return SignalProducer(error: envelope)
            //                            case let .failure(error):
            //                                print("Argo decoding error envelope error: \(error)")
            //                                return SignalProducer(error: .couldNotDecodeJSON(error))
            //                            }
            //                        } else {
            //                            print("Couldn't parse error envelope JSON.")
            //                            return SignalProducer(error: .couldNotParseErrorEnvelopeJSON)
            //                        }
            //                }
            //                
            //                print("[KsApi] Success request")
            
            //            return SignalProducer(value: data)
    }
    
    // Converts an URLSessionTask into a signal producer of raw JSON data. If the JSON does not parse
    // successfully, an `ErrorEnvelope.errorJSONCouldNotParse()` error is emitted.
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
