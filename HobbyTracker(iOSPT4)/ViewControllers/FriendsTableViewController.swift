//
//  FriendsTableViewController.swift
//  HobbyTracker(iOSPT4)
//
//  Created by Johnny Hicks on 11/14/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class FriendsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var friends: [Friend] = [Friend(name: "Johnny", hometown: "Provo", hobbies: ["Basketball"])]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self   //explained at 8:41pm (ios4); 8:28pm (iospt5)
        self.tableView.dataSource = self
    }
    
    // UITableview Data Source Method
    
    // 1) "Number of Rows in Section" - usually just the .count of your array.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    // 2) "Cell for row at"- Sets up the cell.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
    
        // We added this by typing "tableView.d", and using autopopulate.
        // Then we typed up the downcasting...in order to access our custom cell and it's properties (ex. our "friend" property in this instance).
        
        let friend = friends[indexPath.row] //pt4 - 8:54pm, pt5 - 8:34
        cell.friend = friend
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddFriendModalSegue" {
            if let addFriendVC = segue.destination as? AddFriendViewController {
                addFriendVC.delegate = self
            }
            // Step "b" from below.
            // Set this VC as the delegate for the Add Friend VC
        }
    }
}

extension FriendsTableViewController: AddFriendDelegate {
    func friendWasCreated(_ friend: Friend) {
        friends.append(friend)
        tableView.reloadData()
    }
    //Step "a" from below.
    
    
    // We come here right after step 3 on the delegator class (here meaning "AddFriendViewController").
    // ...4: Go over to the delegate code file and set it up (below).
        // a) Adopt and conform to delegate's protocol.
        // b) Set self as delegate when AddFriendViewController is created.
}
