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
 
  // this is only temp until scene before it is made.
  @objc func rootInit(node: Node) {
    self.root = node
    subNodes = self.root.sortedChildren() as! [Node]
  }
  
  
    override func viewDidLoad() {
      super.viewDidLoad()
      
      self.tableView.estimatedRowHeight = 300
      self.tableView.rowHeight = UITableViewAutomaticDimension
      
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
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
      else if indexPath.row == 1 { // TODO: && toolbar is enabled {
      let cell = self.tableView.dequeueReusableCell(withIdentifier: "toolbarCell", for: indexPath) as! ToolbarCell
        
        return cell
      }
      else if indexPath.row == 2 { // TODO: && tags are enabled {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "tagsCell", for: indexPath) as! TagsCell
        cell.tagsTextField?.text = root.tags
        
        return cell
      }
      else if indexPath.row == 3 { // TODO: && body exists {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "bodyCell", for: indexPath) as! BodyCell
        
        if root.body == nil {
          cell.bodyTextView?.text = "+"
        } else {
          cell.bodyTextView?.text = root.body
        }

        cell.bodyTextView?.delegate = self
        return cell
      }
      else {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "subHeadingCell", for: indexPath) as! SubHeadingCell

        var subNode: Node
        subNode = self.subNodes[indexPath.row - 4] // TODO: do this properly!
        cell.subHeadingTextField?.text = subNode.heading
        
        return cell
      }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

      let nextViewController = segue.destination as! OutlineTableViewController
      
      if let indexPath = self.tableView.indexPathForSelectedRow {
        nextViewController.root = self.subNodes[indexPath.row - 4]
        nextViewController.subNodes = nextViewController.root.sortedChildren() as! [Node]
      }
    }
}

extension OutlineTableViewController: UITextViewDelegate {
  func textViewDidChange(_ textView: UITextView) {
    let currentOffset = tableView.contentOffset
    UIView.setAnimationsEnabled(false)
    tableView.beginUpdates()
    tableView.endUpdates()
    UIView.setAnimationsEnabled(true)
    tableView.setContentOffset(currentOffset, animated: false)
  }
}
