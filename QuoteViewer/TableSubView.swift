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
    var quoteLabel : String?
    var quoteImage : String?
    
    
    let SubViewDetail = [ "殺してしまえホトトギス", "鳴かせてみせようホトトギス", "鳴くまで待とうホトトギス"]
    
    
    @IBOutlet weak var LabelSubView: UILabel!
    @IBOutlet weak var ImageSubView: UIImageView!
    @IBOutlet weak var LabelSubViewDetail: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("func viewDidLoad loaded")
        
        LabelSubView.text = quoteLabel
        ImageSubView.image = UIImage(named: quoteImage!)
        LabelSubViewDetail.text = SubViewDetail[indexno]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
