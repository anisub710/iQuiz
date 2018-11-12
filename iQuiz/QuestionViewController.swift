//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Anirudh Subramanyam on 11/4/18.
//  Copyright © 2018 Anirudh Subramanyam. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var appData = AppData.shared
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
    @IBOutlet weak var submit: UIButton!
    
    weak var prevChoice: UIButton!   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submit.isEnabled = false
        submit.backgroundColor = UIColor.lightGray
        fillData()
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(gestureHandler))
        left.direction = .left
        let right = UISwipeGestureRecognizer(target: self, action: #selector(gestureHandler))
        right.direction = .right
        self.view.addGestureRecognizer(left)
        self.view.addGestureRecognizer(right)
    }
    
    @objc func gestureHandler(gesture: UISwipeGestureRecognizer) -> Void {
        switch gesture.direction{
        case UISwipeGestureRecognizer.Direction.right:
            appData.currQuestionIndex = 0
            appData.quizScore = 0
            performSegue(withIdentifier: "segueBack", sender: self)
        case UISwipeGestureRecognizer.Direction.left:
            if submit.isEnabled {performSegue(withIdentifier: "segueGoToAnswer", sender: self)}
        default:
            break
        }
    }
    
    func fillData() {
        let currIndex = appData.topicIndex
        let currQuizAnswer = appData.quizzes[currIndex].questions
        question.text = currQuizAnswer[appData.currQuestionIndex].text
        let answers = currQuizAnswer[appData.currQuestionIndex].answers
        choice1.setTitle(answers[0], for: [])
        choice2.setTitle(answers[1], for: [])
        choice3.setTitle(answers[2], for: [])
        choice4.setTitle(answers[3], for: [])
    }
    
    @IBAction func choose(_ sender: UIButton) {
        if prevChoice != nil {
            prevChoice.backgroundColor = UIColor.blue
            prevChoice.setTitleColor(UIColor.white, for: [])
        }
        submit.isEnabled = true
        submit.backgroundColor = UIColor.green
        prevChoice = sender
        sender.backgroundColor = UIColor.yellow
        sender.setTitleColor(UIColor.black, for: [])
        appData.choice = (sender.titleLabel?.text)!
    }
    @IBAction func submit(_ sender: Any) {
        performSegue(withIdentifier: "segueGoToAnswer", sender: self)
    }
    @IBAction func back(_ sender: Any) {
        appData.currQuestionIndex = 0
        appData.quizScore = 0
        performSegue(withIdentifier: "segueBack", sender: self)
    }
}
