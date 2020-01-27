//
//  ItemDetailsVC.swift
//  NYTimes
//
//  Created by Chandan Singh on 20/10/19.
//  Copyright © 2019 @Personal. All rights reserved.
//

import UIKit

class ItemDetailsVC: UIViewController {

    var itemDetailsData: ItemInfo?
    
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemSourceLabel: UILabel!
    @IBOutlet weak var itemAbstractLabel: UILabel!
    @IBOutlet weak var linkView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.initialise()
    }
    

    // MARK: - Instance Methods -
    
    func initialise() {
        self.itemTitleLabel.text = self.itemDetailsData?.title
        self.itemSourceLabel.text = "Source: " + (self.itemDetailsData?.source)!
        self.itemAbstractLabel.text = self.itemDetailsData?.abstract
        self.linkView.text = self.itemDetailsData?.urlString
    }

    // MARK: - UIControl Methods -
    
    @IBAction func cancelTapped(_ sender: Any) {
        self.modalTransitionStyle = .flipHorizontal
        self.dismiss(animated: true, completion: nil)
    }
    
}
