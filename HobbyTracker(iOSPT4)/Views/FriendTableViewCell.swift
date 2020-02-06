//
//  FriendTableViewCell.swift
//  HobbyTracker(iOSPT4)
//
//  Created by Chris Price on 11/20/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

// We are defining this custom class because we are making a custom cell. Usually we dont HAVE to have a .swift file for a TableViewCell.

class FriendTableViewCell: UITableViewCell {
    
    // Mark: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var hobbiesLabel: UILabel!
    
    var friend: Friend? {
        didSet {
            self.updateViews()
        }
    }
    // Optional because we haven't initialize an instance of a friend yet.
    // After we set the value of friend, then we want to update our views to reflect the changes.
    
    private func updateViews() {
        guard let friend = friend else { return }
        
        nameLabel.text = friend.name
        hometownLabel.text = friend.hometown
        hobbiesLabel.text = "\(friend.hobbies.count) hobbies" // 3 hobbies
    }
}
