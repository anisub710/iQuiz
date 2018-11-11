//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Anirudh Subramanyam on 11/10/18.
//  Copyright © 2018 Anirudh Subramanyam. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    var appData = AppData.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnswer()
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(gestureHandler))
        left.direction = .left
        let right = UISwipeGestureRecognizer(target: self, action: #selector(gestureHandler))
        right.direction = .right
        self.view.addGestureRecognizer(left)
        self.view.addGestureRecognizer(right)
    }
    
    @objc func gestureHandler(gesture: UISwipeGestureRecognizer) -> Void {
        switch gesture.direction{
        case UISwipeGestureRecognizer.Direction.left:
            appData.currQuestionIndex = 0
            appData.quizScore = 0
            performSegue(withIdentifier: "segueAnswerToQuiz", sender: self)
        case UISwipeGestureRecognizer.Direction.right:
            chooseSegue()
        default:
            break
        }
    }
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var result: UILabel!
    func showAnswer() {
        let currIndex = appData.topicIndex
        let currQuizAnswer = appData.quizzes[currIndex].questionsAnswers
        question.text = currQuizAnswer[appData.currQuestionIndex].question
        let userAnswer = appData.choice
        let correctAnswer = appData.quizzes[currIndex].correctAnswers[appData.currQuestionIndex]
        if appData.currQuestionIndex + 1 < currQuizAnswer.count {
            nextButton.setTitle("Next", for: [])
        } else {
            nextButton.setTitle("Finish", for: [])
        }
        
        result.text = (correctAnswer == userAnswer) ? "Congratulations! you chose the right answer: \(correctAnswer)" : "Oh no! you chose the wrong answer: \(userAnswer). The correct answer is \(correctAnswer)"
        appData.quizScore += (correctAnswer == userAnswer) ? 1 : 0
    }
    @IBAction func back(_ sender: Any) {
        appData.currQuestionIndex = 0
        appData.quizScore = 0
        performSegue(withIdentifier: "segueAnswerToQuiz", sender: self)
    }
    @IBAction func onNext(_ sender: Any) {
        chooseSegue()
    }
    
    func chooseSegue(){
        let currQuizAnswer = appData.quizzes[appData.topicIndex].questionsAnswers
        question.text = currQuizAnswer[appData.currQuestionIndex].question
        if appData.currQuestionIndex + 1 < currQuizAnswer.count {
            appData.currQuestionIndex += 1
            performSegue(withIdentifier: "segueToNextQuestion", sender: self)
        } else {
            appData.currQuestionIndex = 0
            performSegue(withIdentifier: "segueGoToScore", sender: self)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
