//
//  CourseTableViewCell.swift
//  FavThings
//
//  Created by Ayaulym on 21.11.2025.
//

import UIKit

struct CourseItem {
    let courseBook: UIImage
    let title: String
    let professor: String
    let reason: String
}
class CourseTableViewCell: UITableViewCell {
    @IBOutlet private weak var courseImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var professorLabel: UILabel!
    @IBOutlet private weak var reasonLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure(course: CourseItem){
        courseImageView.image = course.courseBook
        titleLabel.text = course.title
        professorLabel.text = course.professor
        reasonLabel.text = course.reason
    }
}
