//
//  MockService.swift
//  QuizWorldAPI
//
//  Created by Håkon Bogen on 28/01/17.
//  Copyright © 2017 beiningbogen.no. All rights reserved.
//

import Foundation
import XCTest
@testable import QuizWorldAPI
import Argo

final internal class QuestionTests: XCTestCase {
    
    func testJSONDecoding_GoodData() {
        
        let questions = Question.decodeJSONDictionary(
            ["text" : "What is einsteins nickname",
             "alternatives": [
                [
                    "text" : "Smarty pants",
                    "isCorrect" : false
                ]
                ]
            ]
            
        )
        
        XCTAssertNil(questions.error)
        XCTAssertEqual(questions.value?.alternatives.count, 1)
        
    }
    
    
}
