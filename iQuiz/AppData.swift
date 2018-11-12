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

//var nbaQuiz = Quiz(title: "NBA",
//                   desc: "Test you knowledge of NBA",
//                   image: UIImage(named: "nba")!,
//                   questions: [
//                    QuestionAnswers(text: "Which one of these players was enrolled in medical school before joining the NBA?", answers: ["Jaylen Brown", "Dirk Nowitzki", "Tim Duncan","Pau Gasol"], answer: "4"),
//                    QuestionAnswers(text: "Which player flops a lot in the NBA even though he is a great player and hence has the most number of free throws attempted?", answers: ["Lebron James", "Demar Derozan", "James Harden", "Kevin Durant"], answer: "3"),
//                    QuestionAnswers(text: "Which team tied the NBA record and broke the playoff record for the most consecutive misses from the 3-point range?", answers: ["Houston Rockets", "Never Happened", "Team Melo", "Thunders"], answer: "1"),
//                    QuestionAnswers(text: "Who is the greatest shooting guard in the NBA right now?", answers: ["Andre Roberson", "James Harden", "Garret Temple", "J.R. Smith"], answer: "1")]
//                   )
//
//var dcQuiz = Quiz(title: "DC",
//                  desc: "Test you knowledge of DC",
//                  image: UIImage(named: "dc")!,
//                  questions: [
//                    QuestionAnswers(text: "Which of these Robins became The Red Hood?", answers: ["Dick Grayson", "Damian Wayne", "Jason Todd","Tim Drake"], answer: "3"),
//                    QuestionAnswers(text: "Which of these heroes are not in the Justice League?", answers: ["Raven", "Green Arrow", "Lex Luthor", "Cyborg"], answer: "1")]
//                  )
//
//var musicQuiz = Quiz(title: "Music",
//                     desc: "Test you knowledge of Music",
//                     image: UIImage(named: "music")!,
//                     questions: [
//                        QuestionAnswers(text: "Who won the most Grammys in one night?", answers: ["Quincy Jones", "Michael Jackson", "Beyonce","Bruno Mars"], answer: "2"),
//                        QuestionAnswers(text: "Which artist has the best-selling album of all time?", answers: ["Eagles", "Michael Jackson", "The Beatles", "Pink Floyd"], answer: "1")]
//                     )


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
