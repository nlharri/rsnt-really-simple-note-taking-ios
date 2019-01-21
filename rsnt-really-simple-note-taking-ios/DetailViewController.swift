//
//  DetailViewController.swift
//  rsnt-really-simple-note-taking-ios
//
//  Created by Németh László Harri on 2019. 01. 21..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var noteTopicLabel: UILabel!
    @IBOutlet weak var noteTextLabel: UILabel!

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = detailItem {
            if let textLabel  = noteTextLabel,
               let topicLabel = noteTopicLabel {
                topicLabel.text = detail.noteTopic
                textLabel.text  = detail.noteText
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var detailItem: ReallySimpleNote? {
        didSet {
            // Update the view.
            configureView()
        }
    }


}

