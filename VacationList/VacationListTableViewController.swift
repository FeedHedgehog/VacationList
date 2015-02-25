//
//  VacationListTableViewController.swift
//  VacationList
//
//  Created by Liulu on 14/10/23.
//  Copyright (c) 2014年 Liulu. All rights reserved.
//

import UIKit

class VacationListTableViewController: UITableViewController {

    var vacationList=[Vacation]()
    
    func loadInitData(){
        let vacation1=Vacation()
        vacation1.place="小飞是个猪"
        vacation1.visited=true
        vacationList.append(vacation1)
        
        let vacation2=Vacation()
        vacation2.place="小飞是个狗"
        vacation2.visited=false
        vacationList.append(vacation2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.loadInitData()
        self.navigationItem.leftBarButtonItem=self.editButtonItem()
    }
    
    //编辑的动画效果
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.setEditing(editing, animated: true)
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            //删除数组所在行
            vacationList.removeAtIndex(indexPath.row)
            //删除单元格所在行
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return vacationList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PCell", forIndexPath: indexPath) as UITableViewCell

        let v1=vacationList[indexPath.row]
        cell.textLabel?.text=v1.place
        // Configure the cell...
        if v1.visited{
            cell.accessoryType=UITableViewCellAccessoryType.Checkmark
        }
        else{
            cell.accessoryType=UITableViewCellAccessoryType.None
        }
        //cell.selected=vacationList[indexPath.row].visited
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let v1=vacationList[indexPath.row]
        v1.visited = !v1.visited
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        tableView.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
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
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToLIst(segue: UIStoryboardSegue!){
        //back and Done
        let source=segue.sourceViewController as AddVacationInfo
        let v1 = source.vacation
        if v1.place != ""{
            vacationList.append(v1)
        }
    }

}
