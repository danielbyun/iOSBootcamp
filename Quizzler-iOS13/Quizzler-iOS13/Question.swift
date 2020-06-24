//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Daniel Byun on 6/23/20.
//

// is this the same thing as classes..? = yes.
// creating a structure
//struct Quiz {
//    // properties
//    var firstQuestion: String
//    var possibleAnswers: [String]
//    var resources: [String: Int]
//
//    // methods
//    func buildQuiz() {
//        print("\(firstQuestion): out of \(possibleAnswers)")
//    }
//
//    // initializer probably aka constructors
//    init(question: String, answers: [String], otherResources: [String: Int]) {
//        firstQuestion = question
//        possibleAnswers = answers
//        resources = otherResources
//    }
//
//}


import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}


