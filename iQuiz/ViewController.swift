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
    let storage = UserDefaults.standard
    @IBAction func settings(_ sender: Any) {
        let uiAlert = UIAlertController(title: "Settings", message: "Change URL to get quizzes", preferredStyle: .alert)
        uiAlert.addTextField { (url) in
            url.text = ""
        }
        uiAlert.addAction(UIAlertAction(title: "Check now", style: .default, handler: { (action) in
            self.appData.defaultUrl = uiAlert.textFields![0].text!
            self.getData()
        }))
        uiAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(uiAlert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appData.topicIndex = indexPath.row
        performSegue(withIdentifier: "segueGoToQuestion", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appData.quizzes.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! QuizViewCell        
        cell.quizSubject.text = appData.quizzes[indexPath.row].title
        cell.quizDescription.text = appData.quizzes[indexPath.row].desc        
        cell.quizImage.image = (appData.quizzes[indexPath.row].image != nil) ? UIImage(named: appData.quizzes[indexPath.row].image!) : UIImage(named: appData.defaultImages[indexPath.row])
        return cell
    }
    
    func getData(){
        if Reachability.isConnected(){
            guard let url = URL(string: appData.defaultUrl) else {return}
            URLSession.shared.dataTask(with: url){(data, response, err) in
                if err != nil {
                    let uiAlert = UIAlertController(title: "Error Downloading Data", message: "Check your connection or URL", preferredStyle: .alert)
                    uiAlert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { (action) in
                        self.getData()
                    }))
                    uiAlert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                    self.present(uiAlert, animated: true, completion: nil)
                    NSLog("Error: \(String(describing: err))")
                }
                if let httpResponse = response as? HTTPURLResponse {
                    NSLog("Response: \(httpResponse.statusCode)")
                }
                guard let data = data else {return}
                do{
                    let quizzes = try JSONDecoder().decode([Quiz].self, from: data)
                    self.appData.quizzes = quizzes
//                    let encodedData = NSKeyedArchiver.archivedData(withRootObject: quizzes)
                    let encodedData = try? PropertyListEncoder().encode(quizzes)
                    self.storage.set(encodedData, forKey: "Quiz")
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }catch let jsonErr {
                    NSLog("Error serializing json: \(jsonErr)")
                }
            }.resume()
            NSLog("internet connected")
        }else {
            let uiAlert = UIAlertController(title: "Offline", message: "Network is offline! Check your connection.", preferredStyle: .alert)
            uiAlert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { (action) in
                self.getData()
            }))
            uiAlert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(uiAlert, animated: true, completion: nil)
            if let data = self.storage.object(forKey: "Quiz") as? Data {
                self.appData.quizzes = try! PropertyListDecoder().decode([Quiz].self, from: data)
            }
//            self.appData.quizzes = NSKeyedUnarchiver.unarchiveObject(with: decoded as! Data) as? [Quiz] ?? [Quiz]()
//            self.appData.quizzes = NSKeyedUnarchiver.unarchivedObject(ofClasses: [AnyClass], from: <#T##Data#>)
            NSLog("internet connection not available")
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }


}

