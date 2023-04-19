//
//  TableViewCell.swift
//  PostTraining
//
//  Created by prk on 19/04/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var initialTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    
    var updateHandler = {
        
    }
    
    @IBAction func updateClicked(_ sender: Any) {
        updateHandler()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
