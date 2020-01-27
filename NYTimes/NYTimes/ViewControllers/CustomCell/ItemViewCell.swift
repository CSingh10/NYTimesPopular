//
//  ItemViewCell.swift
//  NYTimes
//
//  Created by Chandan Singh on 26/01/20.
//  Copyright © 2019 @Personal. All rights reserved.
//

import UIKit

class ItemViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var byLine: UILabel!
    @IBOutlet weak var sampleImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: Instance Methods -
    
    public func setCellData(itemData: ItemInfo){
        self.titleLabel.text = itemData.title
        self.byLine.text = itemData.byLine
        self.publishedDate.text = itemData.publishedDate
        self.sampleImageView.layer.cornerRadius = self.sampleImageView.layer.frame.height/2
        self.sampleImageView.layer.masksToBounds = true
        
    }

}
