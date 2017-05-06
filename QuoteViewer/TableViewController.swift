//
//  TableViewController.swift
//  QuoteViewer
//
//  Copyright © 2017 yoshiisland. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // set variables
    let TableList = ["Nobunaga", "Hideyoshi", "Ieyasu"]
    let TableListDetail = ["Koroshiteshimae", "Nakasetemiseyou", "Nakumadematou"]
    let ImageList = [ "img1", "img2", "img3"]
    
    var indexno = 0
    var result : String?
    var resultimg : String?    
    let quoteLabel = "test"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //navigationItem.backBarButtonItem = BackBotton
        
        print("func viewDidLoad loaded")
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return 0
        
        print("func numberOfSections loaded")
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return 0
        
        print("func tableView numberOfRowsInSection loaded")
        
        return self.TableList.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        
    let img = UIImage(named:"\(ImageList[indexPath.row])")
     
     // Configure the cell...
        
        let imageView = tableView.viewWithTag(1) as! UIImageView
        imageView.image = img
        
        let label1 = tableView.viewWithTag(2) as! UILabel
        label1.text = "\(TableList[indexPath.row])"
        
        let label2 = tableView.viewWithTag(3) as! UILabel
        label2.text = "\(TableListDetail[indexPath.row])"
        
        let c = "\(indexPath.row)"
        print(c)
        
        
        //cell.textLabel?.text = self.TableList[indexPath.row]
        
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

    
    
    
    // get cell label value
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
        print("func tableView didHighlightRowAt loaded")
        
        print(TableList[indexPath.row])
        result = TableList[indexPath.row]
        resultimg = ImageList[indexPath.row]
        indexno = indexPath.row
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: false)
        
        print("func tableView didSelectRowAt loaded")
    }
    
    override func prepare(for segue : UIStoryboardSegue, sender: Any?){
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "toTableSubView" {

            print("func prepare loaded")
            print("result is " + result!)
            print("result image is " + resultimg!)
            
            let TableSV = segue.destination as! TableSubView
            TableSV.indexno = self.indexno
            TableSV.quoteLabel = self.result
            TableSV.quoteImage = self.resultimg
    
            
            
        }
    }
    
    
}
