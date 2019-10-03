//
//  StateListTableViewController.swift
//  representitives
//
//  Created by Matthew O'Connor on 10/3/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return States.all.count
        }

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)

            let state = States.all[indexPath.row]
            
            cell.textLabel?.text = state

            return cell
        }
       
        // MARK: - Navigation

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "stateDetailSegue" {
                guard let destinationVC = segue.destination as? StateDetailTableViewController, let index = tableView.indexPathForSelectedRow else { return }
                
                destinationVC.state = States.all[index.row]
            }
        }
    }
