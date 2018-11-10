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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var choice1: UIButton!
    
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    @IBOutlet weak var choice4: UIButton!
    func fillData() {
        let currIndex = appData.topicIndex
        let questions = Array(appData.quizzes[currIndex].questionsAnswers.keys)
        question.text = questions[appData.currQuestion]
        let answers = Array(appData.quizzes[currIndex].questionsAnswers)[appData.currQuestion].value
        choice1.setTitle(answers[0], for: [])
        choice2.setTitle(answers[1], for: [])
        choice3.setTitle(answers[2], for: [])
        choice4.setTitle(answers[3], for: [])
//        question.text = questions[0]
//        switch currIndex {
//        case 0:
//            NSLog("Changed to NBA")
//            question.text =
//        case 1:
//            NSLog("Changed to DC")
//            question.text = "DC"
//        case 2:
//            question.text = "Music"
//        default:
//            break
//        }
    }
    
    @IBAction func submit(_ sender: Any) {
    }
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "segueBack", sender: self)
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
