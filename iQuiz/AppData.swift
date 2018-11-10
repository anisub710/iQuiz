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
    var questionsAnswers: [String : [String]]
    var correctAnswers: [String]
}

var nbaQuiz = Quiz(subject: "NBA", subjectDesc: "Test you knowledge of NBA", image: UIImage(named: "nba")!, questionsAnswers: ["Which one of these players was enrolled in medical school before joining the NBA?": ["Jaylen Brown", "Dirk Nowitzki", "Tim Duncan","Pau Gasol"], "Which player flops a lot in the NBA even though he is a great player and hence has the most number of free throws attempted?": ["Lebron James", "Demar Derozan", "James Harden", "Kevin Durant"], "Which team tied the NBA record and broke the playoff record for the most consecutive misses from the 3-point range?" : ["Houston Rockets", "No team has ever choked so hard in the history of the NBA", "Houston Rockets", "Houston Rockets"], "Who is the greatest shooting guard in the NBA right now?": ["Andre Roberson", "James Harden", "Garret Temple", "J.R. Smith"]
    ], correctAnswers: ["Pau Gasol", "James Harden", "Houston Rockets", "Andre Roberson"])
var dcQuiz = Quiz(subject: "DC", subjectDesc: "Test you knowledge of DC", image: UIImage(named: "dc")!, questionsAnswers: ["Which of these Robins became The Red Hood": ["Dick Grayson", "Damian Wayne", "Jason Todd","Tim Drake"], "Which of these heroes are not in the Justice League?": ["Raven", "Green Arrow", "Lex Luthor", "Cyborg"]
    ], correctAnswers: ["Jason Todd", "Raven"])
var musicQuiz = Quiz(subject: "Music", subjectDesc: "Test you knowledge of Music", image: UIImage(named: "music")!, questionsAnswers: ["Who one the most Grammys in one night?": ["Quincy Jones", "Michael Jackson", "Beyonce","Bruno Mars"], "Which is the best-selling album of all time?": ["Eagles - Their Greatest Hits", "Michael Jackson - Thriller", "The Beatles - The Beatles", "Pink Floyd - The Wall"]
    ], correctAnswers: ["Jason Todd", "Raven"])

class AppData: NSObject {
    static let shared = AppData()
    var score = 0
    
    open var subjects = ["NBA", "DC", "Music"]
    open var topicDesc = ["Test you knowledge of NBA", "Test your knowledge of DC", "Test your knowledge of Music"]
    open var images = [UIImage(named: "nba"), UIImage(named: "dc"), UIImage(named: "music")]
    
    open var quizzes: [Quiz] = [nbaQuiz, dcQuiz, musicQuiz]
    open var topicIndex = 0
    open var currQuestion = 0
}
