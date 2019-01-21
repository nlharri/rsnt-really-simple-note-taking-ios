//
//  ReallySimpleNoteListCellView.swift
//  rsnt-really-simple-note-taking-ios
//
//  Created by Németh László Harri on 2019. 01. 21..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import UIKit

class ReallySimpleNoteUITableViewCell : UITableViewCell {
    private(set) var noteTopic : String = ""
    private(set) var noteText  : String = ""
 
    @IBOutlet weak var noteTopicLabel: UILabel!
    @IBOutlet weak var noteTextLabel: UILabel!
}
