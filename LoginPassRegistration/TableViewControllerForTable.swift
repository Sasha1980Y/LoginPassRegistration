//
//  TableViewControllerForTable.swift
//  LoginPassRegistration
//
//  Created by AlexanderYakovenko on 6/13/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit

class TableViewControllerForTable: UITableViewController {

    let sections: [String] = ["Section 1"]
    let s1Data:[String] = ["Row 1","Row 2","Row 3"]
    //let s2Data:[String] = ["Row 1","Row 2","Row 3"]
    //let s3Data:[String] = ["Row 1","Row 2","Row 3"]
    
    var sectionData: [Int: [String]] = [:]
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        sectionData = [0: s1Data]
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // number rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (sectionData[section]?.count)!
    }
    
    
    // title section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section 1" //sections[section]
    }
    
    // number of section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 //sections.count
    }
    
    // heigth of section
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    // view for section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "HeaderCell") //as! HeaderViewCell
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! PrototypViewCell
        cell.textLabel?.text = sectionData[indexPath.section]?[indexPath.row]

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
