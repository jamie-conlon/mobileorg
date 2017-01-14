//
//  OrgFileTableViewController.swift
//  MobileOrg
//
//  Created by Jamie Conlon on 13/01/2017.
//  Copyright © 2017 Sean Escriva. All rights reserved.
//

import UIKit

class OrgFileTableViewController: UITableViewController {

  var subNodes = [Node]()
  
    override func viewDidLoad() {
      super.viewDidLoad()
      
      subNodes = RootNode().sortedChildren() as! [Node]
      //self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
  }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subNodes.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orgFileCell", for: indexPath)

        cell.textLabel?.text = subNodes[indexPath.row].headingForDisplay()

        return cell
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

  
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let nextViewController = segue.destination as! OutlineTableViewController
      
      if let indexPath = self.tableView.indexPathForSelectedRow {
        nextViewController.root = NodeWithFilename(subNodes[indexPath.row].linkFile())
        nextViewController.subNodes = nextViewController.root.sortedChildren() as! [Node]
      }
    }
}


