//
//  ViewController.swift
//  iQuiz
//
//  Created by Anirudh Subramanyam on 10/27/18.
//  Copyright © 2018 Anirudh Subramanyam. All rights reserved.
//

import UIKit


class Quiz {
//    var image: UIImage
//    var subject: String
//    var description: String
    let subjects = ["Basketball", "DC", "Music"]
    let description = ["Test you knowledge of Basketball", "Test your knowledge of DC", "Test your knowledge of Music"]
    let images = [UIImage(named: "nba"), UIImage(named: "dc"), UIImage(named: "music")]
    
//    init(image: UIImage, subject: String, description: String){
//        self.image = image
//        self.subject = subject
//        self.description = description
//    }
}

class QuizDataSource : NSObject, UITableViewDataSource {
    
    let quiz: Quiz
    
    init(quiz: Quiz){
        self.quiz = quiz
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quiz.subjects.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! QuizViewCell
        cell.quizSubject.text = quiz.subjects[indexPath.row]
        cell.quizDescription.text = quiz.description[indexPath.row]
        cell.quizImage.image = quiz.images[indexPath.row]
        return cell
    }
    

}

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBAction func settings(_ sender: Any) {
        let uiAlert = UIAlertController(title: "Settings", message: "Check back for settings!", preferredStyle: .alert)
        uiAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(uiAlert, animated: true, completion: nil)
    }
    
    
    let dataSource = QuizDataSource(quiz: Quiz())
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = self
        
    }


}

