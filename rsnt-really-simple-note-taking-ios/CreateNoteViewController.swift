//
//  CreateNoteViewController.swift
//  rsnt-really-simple-note-taking-ios
//
//  Created by Németh László Harri on 2019. 01. 22..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import UIKit

class CreateNoteViewController : UIViewController {
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteTextTextView: UITextView!
    @IBOutlet weak var noteDoneButton: UIButton!
    @IBOutlet weak var noteDateLabel: UILabel!
    
    @IBAction func doneButtonClicked(_ sender: UIButton, forEvent event: UIEvent) {
        addItem()
    }
    
    private func addItem() -> Void {
        let note = ReallySimpleNote(
            noteTopic: noteTitleTextField.text!,
            noteText: noteTextTextView.text,
            noteDate: convertDate(date: NSDate()))

        ReallySimpleNoteStorage.storage.notes.append(note)
        
        performSegue(
            withIdentifier: "backToMasterView",
            sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteDateLabel.text = convertDate(date: NSDate())
    }

    private func convertDate(date: NSDate) -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        return myStringafd
    }
    

}
