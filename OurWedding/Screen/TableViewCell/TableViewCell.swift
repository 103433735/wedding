//
//  TableViewCell.swift
//  OurWedding
//
//  Created by Bich.DN on 31/7/24.
//

import UIKit
enum ContentPosition {
    case right
    case left
}
class TableViewCell: UITableViewCell {

    @IBOutlet weak var ivRight: UIImageView!
    @IBOutlet weak var ivLeft: UIImageView!
    @IBOutlet weak var vPoint: UIView!
    @IBOutlet weak var rightEvent: UILabel!
    @IBOutlet weak var rightDate: UILabel!
    @IBOutlet weak var leftDate: UILabel!
    @IBOutlet weak var leftEvent: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }

    func configUI() {
        vPoint.layer.cornerRadius = vPoint.layer.frame.height / 2
    }
    
    func bindingData(position: ContentPosition, time: String, event: String, image: UIImage) {
        switch position {
        case .right:
            leftDate.text = time
            leftEvent.text = event
            ivRight.image = image
            
            rightDate.isHidden = true
            rightEvent.isHidden = true
            ivRight.isHidden = false
            
            leftDate.isHidden = false
            leftEvent.isHidden = false
            ivLeft.isHidden = true
        case .left:
            rightDate.text = time
            rightEvent.text = event
            ivLeft.image = image
            
            rightDate.isHidden = false
            rightEvent.isHidden = false
            ivLeft.isHidden = false
            
            leftDate.isHidden = true
            leftEvent.isHidden = true
            ivRight.isHidden = true
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
