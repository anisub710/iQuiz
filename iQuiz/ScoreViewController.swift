//
//  ScoreViewController.swift
//  iQuiz
//
//  Created by Anirudh Subramanyam on 11/10/18.
//  Copyright © 2018 Anirudh Subramanyam. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    var appData = AppData.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        displayResults()
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(gestureHandler))
        right.direction = .right
        self.view.addGestureRecognizer(right)
    }
    
    @objc func gestureHandler(gesture: UISwipeGestureRecognizer) -> Void {
        switch gesture.direction{
        case UISwipeGestureRecognizer.Direction.right:
            appData.quizScore = 0
            appData.currQuestionIndex = 0
            performSegue(withIdentifier: "segueGoBackToQuiz", sender: self)
        default:
            break
        }
    }
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var scoreDisplay: UILabel!
    func displayResults(){
        let score = appData.quizScore
        let total = appData.quizzes[appData.topicIndex].questions.count
        result.text = (score == total) ? "Perfect Score!" : "Almost!"
        scoreDisplay.text = "\(score)/\(total)"
    }
    
    @IBAction func finishQuiz(_ sender: Any) {
        appData.quizScore = 0
        appData.currQuestionIndex = 0
        performSegue(withIdentifier: "segueGoBackToQuiz", sender: self)
    }
    

}
