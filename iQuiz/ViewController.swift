//
//  ViewController.swift
//  iQuiz
//
//  Created by Anirudh Subramanyam on 10/27/18.
//  Copyright © 2018 Anirudh Subramanyam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var appData = AppData.shared
    
    @IBAction func settings(_ sender: Any) {
        let uiAlert = UIAlertController(title: "Settings", message: "Check back for settings!", preferredStyle: .alert)
        uiAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(uiAlert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appData.topicIndex = indexPath.row
        performSegue(withIdentifier: "segueGoToQuestion", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appData.subjects.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! QuizViewCell
        cell.quizSubject.text = appData.quizzes[indexPath.row].subject
        cell.quizDescription.text = appData.quizzes[indexPath.row].subjectDesc
        cell.quizImage.image = appData.quizzes[indexPath.row].image
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }


}

