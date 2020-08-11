//
//  WeekWeatherTableViewCell.swift
//  Sky
//
//  Created by apple on 2020/8/11.
//  Copyright © 2020 Mars. All rights reserved.
//

import UIKit

class WeekWeatherTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "WeekWeatherCell"
       
   @IBOutlet weak var week: UILabel!
   @IBOutlet weak var date: UILabel!
   @IBOutlet weak var temperature: UILabel!
   @IBOutlet weak var weatherIcon: UIImageView!
   @IBOutlet weak var humid: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
