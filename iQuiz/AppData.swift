//
//  AppData.swift
//  iQuiz
//
//  Created by Anirudh Subramanyam on 11/4/18.
//  Copyright © 2018 Anirudh Subramanyam. All rights reserved.
//

import UIKit

struct Quiz: Codable {
    var title: String
    var desc: String
    var image: String?
    var questions: [QuestionAnswers]
}

struct QuestionAnswers: Codable {
    var text: String
    var answers: [String]
    var answer: String
}

class AppData: NSObject {
    static let shared = AppData()
    
//    open var quizzes: [Quiz] = [nbaQuiz, dcQuiz, musicQuiz]
    open var quizzes: [Quiz] = []
    open var topicIndex = 0
    open var currQuestionIndex = 0
    open var choice = ""
    open var defaultImages = ["science", "marvel", "math"]
    open var defaultUrl = "http://api.jsonbin.io/b/5be8f0019e81da1cf03c0a07"
//    open var defaultUrl = "http://tednewardsandbox.site44.com/questions.json"
    open var quizScore = 0
}
