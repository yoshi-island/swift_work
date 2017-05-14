//
//  TableViewController.swift
//  QuoteViewer
//
//  Copyright © 2017 yoshiisland. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // set variables
    var dataListFormat = [["名前", "画像", "ラベル", "内容"]]
    
    var indexno = 0
    var nameSV : String?
    var imgSV : String?
    var labelSV : String?
    var labeldetailSV : String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //navigationItem.backBarButtonItem = BackBotton
        
        print("func viewDidLoad loaded")
        
        
        // get csv file path
        let csvPath = Bundle.main.path(forResource: "QuoteList", ofType: "csv")
        print("csvPath is " + csvPath!)
        
        // get csv data
        let csvData = try? NSString(contentsOfFile: csvPath!, encoding: String.Encoding.utf8.rawValue)
        
        // format scv data
        let dataList = csvData?.components(separatedBy: "\n")
        print(dataList ?? "default data")
        for line in dataList! {
            let l = line.components(separatedBy: ",")
            print(l)
            dataListFormat.append(l)
        }
        
        dataListFormat.removeFirst()
        dataListFormat.removeLast()
        print(dataListFormat)
        
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
        
        // get section list // fixme: duplicated function
        var section_list = ["default"]
        for line in dataListFormat {
            print(line[4])
            section_list.append(line[4])
        }
        var section_list_format = Set(section_list)
        section_list_format.removeFirst()
        print(section_list_format) // removed duplicated
        
        return section_list_format.count
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return 0
        
        print("func tableView numberOfRowsInSection loaded")
        
        return self.dataListFormat.count
    }
    
    
    // set title to section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("dataListFormat is ",dataListFormat)
        print("section is", section)
        
        // get section list  // fixme: duplicated function
        var section_list = ["default"]
        for line in dataListFormat {
            print(line[4])
            section_list.append(line[4])
        }
        var section_list_format = Set(section_list)
        section_list_format.removeFirst()
        print(section_list_format) // removed duplicated
        print("section_list_format is ", section_list_format)
        
        // convert to array
        let section_list_array = Array(section_list_format)
        
        let section_title = section_list_array
        print("section_title is ", section_title)
        return section_title[section]
        //return "Section \(section)"

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
        
    let img = UIImage(named:"\(dataListFormat[indexPath.row][1])")
    print("func tableView cellForRowAt is loaded")
        
        switch(indexPath.section) {
        case 0:
            // Configure the cell...
            
            print("func tableView cellForRowAt case 0 loaded")
            
            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = img
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "\(dataListFormat[indexPath.row][0])"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "\(dataListFormat[indexPath.row][2])"
            
            let c = "\(indexPath.row)"
            print(c)
            
            return cell
        
 
        case 1:
            
            print("func tableView cellForRowAt case 1 loaded")

            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = img
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "hogehoge"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "hogehoge"
            
            let c = "\(indexPath.row)"
            print(c)
            
            return cell
            
        default:
            
            print("func tableView cellForRowAt default loaded")

            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = img
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "hoge"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "hoge"
            
            let c = "\(indexPath.row)"
            print(c)
        
            
            return cell
            
        }
 
            
        //cell.textLabel?.text = self.TableList[indexPath.row]

        
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
        
        print(dataListFormat[indexPath.row])
        nameSV = dataListFormat[indexPath.row][0]
        imgSV = dataListFormat[indexPath.row][1]
        labelSV = dataListFormat[indexPath.row][2]
        labeldetailSV = dataListFormat[indexPath.row][3]
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
            
            // pass var to SubView
            let TableSV = segue.destination as! TableSubView
            TableSV.indexno = self.indexno
            TableSV.nameSV = self.nameSV
            TableSV.imgSV = self.imgSV
            TableSV.labelSV = self.labelSV
            TableSV.labeldetailSV = self.labeldetailSV
            
        }
    }
    
    
}
