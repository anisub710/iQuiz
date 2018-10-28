//
//  QuizViewCell.swift
//  iQuiz
//
//  Created by Anirudh Subramanyam on 10/27/18.
//  Copyright © 2018 Anirudh Subramanyam. All rights reserved.
//

import UIKit

class QuizViewCell: UITableViewCell {

    @IBOutlet weak var quizImage: UIImageView!
    @IBOutlet weak var quizSubject: UILabel!
    @IBOutlet weak var quizDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
