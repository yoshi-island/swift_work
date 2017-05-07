//
//  TableSubView.swift
//  QuoteViewer
//
//  Copyright © 2017 yoshiisland. All rights reserved.
//

import Foundation
import UIKit


class TableSubView: UIViewController {
    
    
    // varialble to get valut from previous
    var indexno = 0
    var nameSV : String?
    var imgSV : String?
    var labelSV : String?
    var labeldetailSV : String?
    
    
    @IBOutlet weak var LabelSubView: UILabel!
    @IBOutlet weak var ImageSubView: UIImageView!
    @IBOutlet weak var LabelSubViewDetail: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("func viewDidLoad loaded")
        
        LabelSubView.text = nameSV
        ImageSubView.image = UIImage(named: imgSV!)
        LabelSubViewDetail.text = labeldetailSV
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
