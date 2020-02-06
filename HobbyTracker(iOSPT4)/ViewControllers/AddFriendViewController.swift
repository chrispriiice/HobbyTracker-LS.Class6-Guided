//
//  AddFriendViewController.swift
//  HobbyTracker(iOSPT4)
//
//  Created by Chris Price on 11/20/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

// 1: Create a protocol with the delegate name.
// 2: Create a delegate property on the Delegator.
// 3: When needed, call the delegate's method on the delegator.
// 4: Set up the delegate.
    // Adopt and conform to delegate's protocol.
    // Set self as delegate when AddFriendViewController is created.

protocol AddFriendDelegate { // Step 1
    func friendWasCreated(_ friend: Friend)
}


class AddFriendViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hometownTextField: UITextField!
    @IBOutlet weak var hobby1TextField: UITextField!
    @IBOutlet weak var hobby2TextField: UITextField!
    @IBOutlet weak var hobby3TextField: UITextField!
    
    // This object is a stand in for the TableView which is the actual delegate.
    var delegate: AddFriendDelegate? // Step 2
    // We declared the protocol in this file, but this file does not CONFORM to this protocol.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil) // Typed in using autocomplete. 9pm
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, // Making sure the user input something.
            let hometown = hometownTextField.text,
            !name.isEmpty,
            !hometown.isEmpty else { return }
        
        var friend = Friend(name: name, hometown: hometown, hobbies: [])
        
        if let hobby1 = hobby1TextField.text,
            !hobby1.isEmpty {
            friend.hobbies.append(hobby1)
        }
        
        if let hobby2 = hobby2TextField.text,
            !hobby2.isEmpty {
            friend.hobbies.append(hobby2)
        }
        if let hobby3 = hobby3TextField.text,
            !hobby3.isEmpty {
            friend.hobbies.append(hobby3)
        }
        
        delegate?.friendWasCreated(friend) // Step 3
    }
}
