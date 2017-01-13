//
//  OutlineTableViewController.swift
//  MobileOrg
//
//  Created by Jamie Conlon on 11/01/2017.
//  Copyright © 2017 Sean Escriva. All rights reserved.
//

import UIKit

class OutlineTableViewController: UITableViewController {

  var root: Node!
  var subNodes = [Node]()
  
 /*
  init(withNode node: Node ) {
  
    self.root = node
    nodes = self.root.sortedChildren() as! [Node]
    
    // does this work?
    super.init()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
 */
 
  @objc func rootInit(node: Node) {
    self.root = node
    subNodes = self.root.sortedChildren() as! [Node]
  }
  
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
      var rowCount = 1
      
      // TODO if (toobar is enabled in settings) {
      rowCount+=1
      // }
      
      // TODO if (tags are enabled in settings) {
      rowCount+=1
      // }
      
      // TODO if (body exists) {
      rowCount+=1
      // }
      
      rowCount+=subNodes.count
  
      return rowCount
    }
  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      if indexPath.row == 0 {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "headingCell", for: indexPath) as! HeadingCell
    
        cell.headingTextField?.text = root.heading
        
        return cell
      }
      else if indexPath.row == 1 { // TODO: && toolbar are enabled {
      let cell = self.tableView.dequeueReusableCell(withIdentifier: "toolbarCell", for: indexPath) as! ToolbarCell
        
        return cell
      }
      else if indexPath.row == 2 { // TODO: && tags are enabled {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "tagsCell", for: indexPath) as! TagsCell
        
        return cell
      }
      else if indexPath.row == 3 { // TODO: && body exists {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "bodyCell", for: indexPath) as! BodyCell
        
        return cell
      }
      else {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "subHeadingCell", for: indexPath) as! SubHeadingCell

        var subNode: Node
        subNode = self.subNodes[indexPath.row - 4] // TODO: do this properly!
        cell.subHeadingTextField?.text = subNode.heading
        
        //let storyboard = UIStoryboard(name: "Outline", bundle: nil)
        //let viewController = storyboard.instantiateInitialViewController() as! OutlineTableViewController
        //viewController.rootInit(node: subNode)
        
        //self.navigationController!.pushViewController(viewController, animated: true)
        
        return cell
      }
    }
  

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
    
    
    if indexPath.row > 3 {
    
    var subNode: Node
    subNode = self.subNodes[indexPath.row - 4] // TODO: do this properly!
    
    let storyboard = UIStoryboard(name: "Outline", bundle: nil)
    let viewController = storyboard.instantiateInitialViewController() as! OutlineTableViewController
    viewController.rootInit(node: subNode)
    
    self.navigationController?.pushViewController(viewController, animated: true)
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
