//
//  FriendsTableViewController.swift
//  appvk
//
//  Created by Дарья Шимко on 07.10.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    private var arrayFriends = [User]()
    private let searchController = UISearchController(searchResultsController: nil)
    private var filterResult = [User]()
    private var isEmptySearch: Bool {
        guard let text = searchController.searchBar.text else { return true }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return !isEmptySearch && searchController.isActive
    }
    
    private var section: [Character: [User]] = [:]
    private var sectionTitles = [Character]()
   
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        VKService.shared.loadFriends(token: Session.shared.token!) { [self] user in
            
            for item in user.response.items {
                self.arrayFriends.append(User("\(item.firstName) \(item.lastName)", UIImage()))
            }
            viewWillAppear(true)
        }
        
        self.tableView.register(FriendsTableCellViewTableViewCell.self, forCellReuseIdentifier: "friendCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.rowHeight = 60
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        section.removeAll()
        
        if isFiltering {
             
            for user in filterResult {
                if section[user.name.first!] != nil {
                    section[user.name.first!]?.append(user)
                }
                else {
                    section[user.name.first!] = [user]
                }
            
            }
        }
        else {
            for user in arrayFriends {
               if section[user.name.first!] != nil {
                   section[user.name.first!]?.append(user)
               }
               else {
                   section[user.name.first!] = [user]
               }
           }
        }
        sectionTitles = Array(section.keys)
        sectionTitles.sort()

        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(sectionTitles[section])
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.section[sectionTitles[section]]?.count ?? 0
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles.map{ String($0) }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      
          let vw = UIView()
          vw.backgroundColor = UIColor.systemPurple.withAlphaComponent(0.5)
          
          let titleVW = UILabel()
          titleVW.text = String(sectionTitles[section])
          titleVW.font = UIFont(name: "Arial", size: 20)
          
          titleVW.translatesAutoresizingMaskIntoConstraints = false

          vw.addSubview(titleVW)
          
          let constraintsArray = [
              titleVW.leadingAnchor.constraint(equalTo: vw.leadingAnchor, constant: 25),
              titleVW.trailingAnchor.constraint(greaterThanOrEqualTo: vw.trailingAnchor, constant: 100),
              titleVW.centerYAnchor.constraint(equalTo: vw.centerYAnchor)
          ]
      
          vw.addConstraints(constraintsArray)
          

          return vw
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as? FriendsTableCellViewTableViewCell else { fatalError() }
        guard let user = section[sectionTitles[indexPath.section]]?[indexPath.row] else { fatalError() }

        cell.config(user.avaterImage ?? UIImage(), name: user.name)
        cell.avatarView.configure()
        
        return cell
    }
}

extension FriendsTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    
    private func filterContentForSearchText(_ searchText: String) {
     
        if searchText.isEmpty {
            filterResult = arrayFriends
        }
        else {
            filterResult = arrayFriends.filter({ (User) -> Bool in
                return User.name.lowercased().contains(searchText.lowercased())
            })
        }
        
        tableView.reloadData()
    }
        
}
