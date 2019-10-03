//
//  StateDetailTableViewController.swift
//  representitives
//
//  Created by Matthew O'Connor on 10/3/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var representatives: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var state: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = state
        self.tableView.estimatedRowHeight = 82
        self.tableView.rowHeight = 82
        if let state = state {
            RepresentativeController.searchRepresentatives(forState: state) { (repArray) in
                self.representatives = repArray
                DispatchQueue.main.async {
                }
                
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representatives.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? RepTableViewCell else { return UITableViewCell() }

        cell.representative = representatives[indexPath.row]

        return cell
    }
}
