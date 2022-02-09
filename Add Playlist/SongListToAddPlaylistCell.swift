//
//  songListToAddPlaylistCell.swift
//  Go Music
//
//  Created by SimplyEntertaining on 1/25/22.
//

import Foundation
import UIKit

class SongListToAddPlaylistCell:UITableViewCell{
    @IBOutlet weak var songNameLabel: UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           self.selectionStyle = .none
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }

       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
           self.accessoryType = selected ? .checkmark : .none
       }
    
}
