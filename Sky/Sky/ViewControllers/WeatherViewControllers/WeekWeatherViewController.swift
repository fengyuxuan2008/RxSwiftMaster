//
//  WeekWeatherViewController.swift
//  Sky
//
//  Created by apple on 2020/8/11.
//  Copyright © 2020 Mars. All rights reserved.
//

import UIKit

class WeekWeatherViewController: WeatherViewController {

    @IBOutlet weak var weekWeatherTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


}

extension WeekWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}

