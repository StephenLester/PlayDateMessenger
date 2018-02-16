//
//  NewMessageController.swift
//  PlayDateGroupMessenger
//
//  Created by Steve Lester on 2/5/18.
//  Copyright © 2018 Steve Lester. All rights reserved.
//

import UIKit
import Firebase

class NewMessageViewController: UITableViewController{
    
    
    let searchbar = UISearchBar(frame: CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height: 40))
//    fileprivate let searchBarHight = CGFloat(40)
    var filteredSearchBar = [User]()
    var isSearching: Bool = false
    
    
    let cellId = "cellId"
    
    var users = [User]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.title = "Search UserNames"
        
        
        
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "NewMessageImage"))
        fetchUser()
        

       
        view.addSubview(searchbar)
        
        tableView.tableHeaderView = searchbar
        searchbar.returnKeyType = UIReturnKeyType.done
        searchbar.backgroundColor = UIColor.clear
        searchbar.delegate = self
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        searchbar.text = ""
//        
//    }
    
    func fetchUser() {
        Database.database().reference().child("users").observe(.childAdded, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = User(dictionary: dictionary)
                user.id = snapshot.key
                self.users.append(user)
                
                //this will crash because of background thread, so lets use dispatch_async to fix
                DispatchQueue.main.async(execute: {
                    self.tableView.reloadData()
                })
                
                //                user.name = dictionary["name"]
            }
            
        }, withCancel: nil)
    }
    
    @objc func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return filteredSearchBar.count
        }
        return users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! UserTableViewCell
        cell.backgroundColor = UIColor.clear
        
        if isSearching {
        let user = filteredSearchBar[indexPath.row]
        cell.textLabel?.text = user.name
        //cell.detailTextLabel?.text = user.email
        
        if let profileImageUrl = user.profileImageUrl {
            cell.profileImageView.loadImageUsingCacheWithUrlString(profileImageUrl)
            
            } else {
            
            let user = users[indexPath.row]
            cell.textLabel?.text = user.name
            //cell.detailTextLabel?.text = user.email
            
            if let profileImageUrl = user.profileImageUrl {
                cell.profileImageView.loadImageUsingCacheWithUrlString(profileImageUrl)
                }
            }
        }
    return cell
    }
        
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    var messagesController: MessagesTableViewController?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true) {
            print("Dismiss completed")
            if self.isSearching {
                let user = self.filteredSearchBar[indexPath.row]
                self.messagesController?.showChatControllerForUser(user)
            } else {
                let user = self.users[indexPath.row]
                self.messagesController?.showChatControllerForUser(user)
            }
        }
    }
    
}


extension NewMessageViewController: UISearchBarDelegate {
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        isSearching = false
//    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSearching = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            isSearching = true
            guard let usersString = searchBar.text else { return }
            filteredSearchBar = users.filter({$0.name?.range(of: usersString) != nil})
            filteredSearchBar.sort {$0.name! < $1.name!}
            isSearching = (filteredSearchBar.count == 0) ? false : true
            tableView.reloadData()
        }
    }
}

