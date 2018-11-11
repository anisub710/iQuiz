//
//  AppData.swift
//  iQuiz
//
//  Created by Anirudh Subramanyam on 11/4/18.
//  Copyright © 2018 Anirudh Subramanyam. All rights reserved.
//

import UIKit

struct Quiz {
    var subject: String
    var subjectDesc: String
    var image: UIImage
    var questionsAnswers: [QuestionAnswers]
    var correctAnswers: [String]
}

struct QuestionAnswers {
    var question: String
    var answers: [String]
}

var nbaQuiz = Quiz(subject: "NBA",
                   subjectDesc: "Test you knowledge of NBA",
                   image: UIImage(named: "nba")!,
                   questionsAnswers: [
                    QuestionAnswers(question: "Which one of these players was enrolled in medical school before joining the NBA?", answers: ["Jaylen Brown", "Dirk Nowitzki", "Tim Duncan","Pau Gasol"]),
                    QuestionAnswers(question: "Which player flops a lot in the NBA even though he is a great player and hence has the most number of free throws attempted?", answers: ["Lebron James", "Demar Derozan", "James Harden", "Kevin Durant"]),
                    QuestionAnswers(question: "Which team tied the NBA record and broke the playoff record for the most consecutive misses from the 3-point range?", answers: ["Houston Rockets", "Never Happened", "Houston Rockets", "Houston Rockets"]),
                    QuestionAnswers(question: "Who is the greatest shooting guard in the NBA right now?", answers: ["Andre Roberson", "James Harden", "Garret Temple", "J.R. Smith"])],
                   correctAnswers: ["Pau Gasol", "James Harden", "Houston Rockets", "Andre Roberson"])

var dcQuiz = Quiz(subject: "DC",
                  subjectDesc: "Test you knowledge of DC",
                  image: UIImage(named: "dc")!,
                  questionsAnswers: [
                    QuestionAnswers(question: "Which of these Robins became The Red Hood?", answers: ["Dick Grayson", "Damian Wayne", "Jason Todd","Tim Drake"]),
                    QuestionAnswers(question: "Which of these heroes are not in the Justice League?", answers: ["Raven", "Green Arrow", "Lex Luthor", "Cyborg"])],
                  correctAnswers: ["Jason Todd", "Raven"])

var musicQuiz = Quiz(subject: "Music",
                     subjectDesc: "Test you knowledge of Music",
                     image: UIImage(named: "music")!,
                     questionsAnswers: [
                        QuestionAnswers(question: "Who one the most Grammys in one night?", answers: ["Quincy Jones", "Michael Jackson", "Beyonce","Bruno Mars"]),
                        QuestionAnswers(question: "Which artist has the best-selling album of all time?", answers: ["Eagles", "Michael Jackson", "The Beatles", "Pink Floyd"])],
                     correctAnswers: ["Michael Jackson", "Eagles"])


class AppData: NSObject {
    static let shared = AppData()
    
    open var subjects = ["NBA", "DC", "Music"]
    open var topicDesc = ["Test you knowledge of NBA", "Test your knowledge of DC", "Test your knowledge of Music"]
    open var images = [UIImage(named: "nba"), UIImage(named: "dc"), UIImage(named: "music")]
    
    open var quizzes: [Quiz] = [nbaQuiz, dcQuiz, musicQuiz]
    open var topicIndex = 0
    open var currQuestionIndex = 0
    open var choice = ""
    open var quizScore = 0
}
