//
//  ViewController.swift
//  Segmented-Control-15-07-2017
//
//  Created by Soeng Saravit on 7/15/17.
//  Copyright © 2017 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var data = [
                ["⚽️ Soccer", "⛳️ Golf", "🏀 Basketball", "🏈 American Football", "⚾️ Baseball", "🎾 Tennis", "🏐 Valleyball", "🏸 Badminton"],
                ["🍎 Apple", "🍐 Pear", "🍓 Strawberry", "🥑 Avocado", "🍌 Banana", "🍇 Grape", "🍈 Melon", "🍊 Orange", "🍑 Peach", "🥝 Kiwi"]
                ]
    var p:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CustomCell")
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[p].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! TableViewCell
        
        let text = (data[p][indexPath.row]).components(separatedBy: " ")
        cell.configureCell(title: text[1], accessory: text[0])
        
        return cell
    }

    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        p = self.segmentedControl.selectedSegmentIndex
        self.tableView.reloadData()
    }
    
}

