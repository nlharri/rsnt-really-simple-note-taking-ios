//
//  CreateNoteViewController.swift
//  rsnt-really-simple-note-taking-ios
//
//  Created by Németh László Harri on 2019. 01. 22..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import UIKit

class CreateNoteViewController : UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteTextTextView: UITextView!
    @IBOutlet weak var noteDoneButton: UIButton!
    @IBOutlet weak var noteDateLabel: UILabel!
    
    @IBAction func noteTitleChanged(_ sender: UITextField, forEvent event: UIEvent) {
        //if sender.text?.isEmpty ?? true,
        //   noteTextTextView.text?.isEmpty ?? true {
        if ( sender.text?.isEmpty ?? true ) || ( noteTextTextView.text?.isEmpty ?? true ) {
            noteDoneButton.isEnabled = false
        } else {
            noteDoneButton.isEnabled = true
        }
    }
    
    @IBAction func doneButtonClicked(_ sender: UIButton, forEvent event: UIEvent) {
        addItem()
    }
    
    private func addItem() -> Void {
        let note = ReallySimpleNote(
            noteTopic: noteTitleTextField.text!,
            noteText: noteTextTextView.text,
            noteDate: ReallySimpleNoteDateHelper.convertDate(date: NSDate()))
        ReallySimpleNoteStorage.storage.addNote(noteToBeAdded: note)
        
        performSegue(
            withIdentifier: "backToMasterView",
            sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextTextView.delegate = self
        noteDateLabel.text = ReallySimpleNoteDateHelper.convertDate(date: NSDate())
        noteTextTextView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        noteTextTextView.layer.borderWidth = 1.0
        noteTextTextView.layer.cornerRadius = 5
    }

    func textViewDidChange(_ textView: UITextView) { //Handle the text changes here
        if ( noteTitleTextField.text?.isEmpty ?? true ) || ( textView.text?.isEmpty ?? true ) {
            noteDoneButton.isEnabled = false
        } else {
            noteDoneButton.isEnabled = true
        }
    }

}
