//
//  MyTableViewController.swift
//  Segmented-Control-15-07-2017
//
//  Created by Soeng Saravit on 7/15/17.
//  Copyright © 2017 Soeng Saravit. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    var data = ["Apple", "Pear", "Strawberry", "Avocado", "Banana", "Grape", "Melon", "Orange", "Peach", "Kiwi"]
    
    var filterData = [String]()
    
    var searchController:UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        filterData = data
        self.searchController = UISearchController(searchResultsController: nil)
        self.searchController.searchResultsUpdater = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.delegate = self
        self.tableView.tableHeaderView = searchController.searchBar

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = filterData[indexPath.row]

        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = self.searchController.searchBar.text {
            filterData = data.filter({ (results) -> Bool in
                return results.lowercased().contains(searchText.lowercased())
            })
        }else {
            filterData = data
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchController.isActive = false
        filterData = data
        self.tableView.reloadData()
    }

}
