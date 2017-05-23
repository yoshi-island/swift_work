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
    
    
    func get_lists() -> (Array<Any>, Array<Any>, Array<Any>){

        // get section list  // fixme: duplicated function
        var section_list = ["default"]
        for line in dataListFormat {
            section_list.append(line[4])
        }
        var section_list_format = Set(section_list) // removed duplicated
        section_list_format.removeFirst()
        let section_list_array = Array(section_list_format) // convert to array
        print("section_list_array is ",section_list_array)
        
        // devide dataListFormat by section(4th field)
        // fixme: seems swift cannot generate lists for each sections. then, generate bigger number of lists and remove lists if it's to be unused -> max section number is 10!!
        let section_list1 = [["","","","",""]]
        let section_list2 = [["","","","",""]]
        let section_list3 = [["","","","",""]]
        let section_list4 = [["","","","",""]]
        let section_list5 = [["","","","",""]]
        let section_list6 = [["","","","",""]]
        let section_list7 = [["","","","",""]]
        let section_list8 = [["","","","",""]]
        let section_list9 = [["","","","",""]]
        let section_list10 = [["","","","",""]]
        var section_lists = [section_list1,section_list2,section_list3,section_list4,section_list5,section_list6,section_list7,section_list8,section_list9,section_list10]
        // set lists for each sections
        var n1 = 0
        for line in section_list_array{
            section_lists[n1].append(["","","","",line])
            section_lists[n1].removeFirst()
            n1 = n1 + 1
        }
        var section_lists_format = Array(section_lists[0..<section_list_array.count])
        // for mat section lists
        for line1 in dataListFormat {
            var n2 = 0
            for line2 in section_lists_format {
                if line1[4] == line2[0][4]{
                    section_lists_format[n2].append(line1)
                }
                n2 += 1
            }
        }
        print("section_lists_format is ",section_lists_format)
        
        // get number of rows in section
        var n3 = 0
        var number_of_rows = [0]
        for _ in section_lists_format {
            number_of_rows.append(section_lists_format[n3].count - 1)
            n3 += 1
        }
        number_of_rows.removeFirst()
        print("number_of_rows is ",number_of_rows)
        
        return (section_lists_format, number_of_rows, section_list_array)
        // section_lists_format is  [[["", "", "", "", "sec1"], ["織田信長", "img1", "鳴かぬなら", "鳴かぬなら殺してしまえホトトギス", "sec1"], ["豊臣秀吉", "img2", "鳴かぬなら", "鳴かぬなら鳴かせてみせようホトトギス", "sec1"]], [["", "", "", "", "sec2"], ["徳川家康", "img3", "鳴かぬなら", "鳴かぬなら鳴くまで待とうホトトギス", "sec2"], ["デカルト", "img4", "我思う", "我思うゆえに我あり", "sec2"], ["アリストテレス", "img5", "我々の性格は", "我々の性格は我々の行動の結果なり", "sec2"]], [["", "", "", "", "sec3"], ["プラトン", "img6", "自分に打ち勝つことが", "自分に打ち勝つことが最も偉大な勝利なり", "sec3"]]]
        // number_of_rows is  [2, 3, 1]
    }

    
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
        //print(dataList ?? "default data")
        for line in dataList! {
            let l = line.components(separatedBy: ",")
            dataListFormat.append(l)
        }
        dataListFormat.removeFirst() // remove label object // fixme
        dataListFormat.removeLast() // remove blank object // fixme
        print("dataListFormat is ",dataListFormat)
        
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
        
        let section_lists_format = get_lists()
        let number_of_sections = section_lists_format.0.count - 1 + 1
        print("number_of_sections is ", number_of_sections)
        
        return number_of_sections
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return 0
        
        print("func tableView numberOfRowsInSection loaded")
        
        var number_of_rows = get_lists().1
        
        // fixme: max section number is 10!
        switch section{
        case 0:
            return number_of_rows[0] as! Int
        case 1:
            return number_of_rows[1] as! Int
        case 2:
            return number_of_rows[2] as! Int
        case 3:
            return number_of_rows[3] as! Int
        case 4:
            return number_of_rows[4] as! Int
        case 5:
            return number_of_rows[5] as! Int
        case 6:
            return number_of_rows[6] as! Int
        case 7:
            return number_of_rows[7] as! Int
        case 8:
            return number_of_rows[8] as! Int
        case 9:
            return number_of_rows[9] as! Int
        case 10:
            return number_of_rows[10] as! Int
        default:
            return 0
        }
 
        
    }
    
    
    // set title to section
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("dataListFormat is ",dataListFormat)
        
        
        
        var section_list_array = get_lists().2
        
        
        // fixme: max section number is 10!
        switch section{
        case 0:
            return section_list_array[0] as? String
        case 1:
            return section_list_array[1] as? String
        case 2:
            return section_list_array[2] as? String
        case 3:
            return section_list_array[3] as? String
        case 4:
            return section_list_array[4] as? String
        case 5:
            return section_list_array[5] as? String
        case 6:
            return section_list_array[6] as? String
        case 7:
            return section_list_array[7] as? String
        case 8:
            return section_list_array[8] as? String
        case 9:
            return section_list_array[9] as? String
        case 10:
            return section_list_array[10] as? String
        default:
            return "Section \(section)"
        }
 

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
        
        print("func tableView cellForRowAt is loaded")

        // Configure the cell...
        
        /*
        // get section list  // fixme: duplicated function
        var section_list = ["default"] // fixme to get empty list
        for line in dataListFormat {
            section_list.append(line[4])
        }
        var section_list_format = Set(section_list) // removed duplicated
        section_list_format.removeFirst() // fixme
        print("section_list_format is ", section_list_format)
        
        // convert to array
        var section_list_array = Array(section_list_format)
        print("section_list_array is ", section_list_array)
        
        // get section and data list // fixme 
        var datalist_0 = ["default"] // fixme to get empty list
        var datalist_1 = ["default"] // fixme to get empty list
        var datalist_2 = ["default"] // fixme to get empty list
        datalist_0.removeFirst()
        datalist_1.removeFirst()
        datalist_2.removeFirst()

        print(type(of: dataListFormat[0][4]))
        print(dataListFormat[0][4])
        print(type(of: section_list_array[0]))
        print(section_list_array[0])
        
        print("datalist_0 is ",datalist_0)
        print("datalist_1 is ",datalist_1)
        print("datalist_2 is ",datalist_2)
        */
        
        let get_lists_result = get_lists()
        let section_lists_format = get_lists_result.0 as? [[[String]]]
        let number_of_rows = get_lists_result.1
        let section_list_array = get_lists_result.2
        print("indexPath.row is ",indexPath.row)
        print("dataListFormat is ", dataListFormat)
        
        // put data in cell // fixme max 10 sections
        if indexPath.section == 0 {
            
            print("section_lists_format?[0][indexPath.row + 1][1] is ",section_lists_format?[0][indexPath.row + 1][1] ?? "DefaultImage")
            
            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(named:"\(section_lists_format![0][indexPath.row + 1][1])")
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "\(section_lists_format![0][indexPath.row + 1][0])"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "\(section_lists_format![0][indexPath.row + 1][2])"
            
            let c = "\(indexPath.row)"
            print(c)
            
            return cell
        }
        else if indexPath.section == 1 {
            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(named:"\(section_lists_format![1][indexPath.row + 1][1])")
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "\(section_lists_format![1][indexPath.row + 1][0])"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "\(section_lists_format![1][indexPath.row + 1][2])"
            
            let c = "\(indexPath.row)"
            print(c)
            
            return cell
        }
        else if indexPath.section == 2 {
            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(named:"\(section_lists_format![2][indexPath.row + 1][1])")
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "\(section_lists_format![2][indexPath.row + 1][0])"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "\(section_lists_format![2][indexPath.row + 1][2])"
            
            let c = "\(indexPath.row)"
            print(c)
            
            return cell
        }
        else if indexPath.section == 3 {
            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(named:"\(section_lists_format![3][indexPath.row + 1][1])")
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "\(section_lists_format![3][indexPath.row + 1][0])"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "\(section_lists_format![3][indexPath.row + 1][2])"
            
            let c = "\(indexPath.row)"
            print(c)
            
            return cell
        }
        else if indexPath.section == 4 {
            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(named:"\(section_lists_format![4][indexPath.row + 1][1])")
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "\(section_lists_format![4][indexPath.row + 1][0])"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "\(section_lists_format![4][indexPath.row + 1][2])"
            
            let c = "\(indexPath.row)"
            print(c)
            
            return cell
        }
        else if indexPath.section == 5 {
            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(named:"\(section_lists_format![5][indexPath.row + 1][1])")
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "\(section_lists_format![5][indexPath.row + 1][0])"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "\(section_lists_format![5][indexPath.row + 1][2])"
            
            let c = "\(indexPath.row)"
            print(c)
            
            return cell
        }
        else if indexPath.section == 6 {
            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(named:"\(section_lists_format![6][indexPath.row + 1][1])")
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "\(section_lists_format![6][indexPath.row + 1][0])"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "\(section_lists_format![6][indexPath.row + 1][2])"
            
            let c = "\(indexPath.row)"
            print(c)
            
            return cell
        }
        else if indexPath.section == 7 {
            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(named:"\(section_lists_format![7][indexPath.row + 1][1])")
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "\(section_lists_format![7][indexPath.row + 1][0])"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "\(section_lists_format![7][indexPath.row + 1][2])"
            
            let c = "\(indexPath.row)"
            print(c)
            
            return cell
        }
        else if indexPath.section == 8 {
            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(named:"\(section_lists_format![8][indexPath.row + 1][1])")
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "\(section_lists_format![8][indexPath.row + 1][0])"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "\(section_lists_format![8][indexPath.row + 1][2])"
            
            let c = "\(indexPath.row)"
            print(c)
            
            return cell
        }
        else if indexPath.section == 9 {
            let imageView = tableView.viewWithTag(1) as! UIImageView
            imageView.image = UIImage(named:"\(section_lists_format![9][indexPath.row + 1][1])")
            
            let label1 = tableView.viewWithTag(2) as! UILabel
            label1.text = "\(section_lists_format![9][indexPath.row + 1][0])"
            
            let label2 = tableView.viewWithTag(3) as! UILabel
            label2.text = "\(section_lists_format![9][indexPath.row + 1][2])"
            
            let c = "\(indexPath.row)"
            print(c)
            
            return cell
        }

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
