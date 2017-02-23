//
//  CustomTableViewCell.swift
//  PageViewTut
//
//  Created by kraft on 2/23/17.
//  Copyright © 2017 yesbolapple. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    var imageInd:Int = 1 {
        didSet{
            imageRest.image = UIImage(named: "\(imageInd)")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var ratingStar: CosmosView!
    
    
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var imageRest: UIImageView!{
        didSet{
            imageRest.image = UIImage(named: "\(imageInd)")
        }
    }
    
    
    
    
    
    
    
}
