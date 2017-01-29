//
//  File.swift
//  QuizWorldAPI
//
//  Created by Håkon Bogen on 28/01/17.
//  Copyright © 2017 beiningbogen.no. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveExtensions
import Result

public protocol ServiceType {
    
    var serverConfig: ServerConfigType { get }
    
    /// Fetch all questions.
    func fetchQuestions() -> SignalProducer<QuestionEnvelope, ErrorEnvelope>
    
}

