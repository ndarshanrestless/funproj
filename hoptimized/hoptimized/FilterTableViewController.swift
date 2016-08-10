//
//  FilterTableViewController.swift
//  hoptimized
//
//  Created by Darshan Nagarajappa on 8/9/16.
//  Copyright © 2016 darshanproject. All rights reserved.
//

import UIKit

class FilterTableViewController: UITableViewController {

    // MARK: Properties
    var filters = [Filter]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // load the filters fields
        loadFilters()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadFilters() {
        let filter1 = Filter(filterName: "Ambience", filterRank: "1st")!
        let filter2 = Filter(filterName: "Drinks Quality", filterRank: "1st")!
        let filter3 = Filter(filterName: "Hospitality", filterRank: "1st")!
        let filter4 = Filter(filterName: "Quality of Men", filterRank: "1st")!
        let filter5 = Filter(filterName: "Quality of Women", filterRank: "1st")!
        let filter6 = Filter(filterName: "Price Level", filterRank: "1st")!
        
        filters += [filter1, filter2, filter3, filter4, filter5, filter6]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.count
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "FilterTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
                                                               forIndexPath: indexPath) as! FilterTableViewCell

        // Configure the cell...
        let filter = filters[indexPath.row]
        
        
        cell.nameLabel.text = filter.filterName
        cell.rankValue.text = filter.filterRank

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "UpdateRank" {
            let pickerDetailViewController = segue.destinationViewController as! PickerViewController
            
            // Get the cell that generated this segue.
            if let selectedMealCell = sender as? FilterTableViewCell {
                let indexPath = tableView.indexPathForCell(selectedMealCell)!
                let selectedFilter = filters[indexPath.row]
                pickerDetailViewController.recevedFilterName = selectedFilter.filterName
            }
        }
        
        else {
            print("Error: prepareForSegue cannot be here.")
        }

    }

    // to get the value back from the pickerview !
    @IBAction func unwindToFilterList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? PickerViewController, chosenValue = sourceViewController.chosenValue {
            print("Chosevalue is %s", chosenValue.text)
            // todo: update the filter rank value now !!
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                // Update an existing meal.
                filters[selectedIndexPath.row].filterRank = chosenValue.text!
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            }
            else
            {
                print("Error: unwindToFilterList cannot be here.")
                
            }
            
        }
        
    }

}
