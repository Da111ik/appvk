//
//  GroupTableViewController.swift
//  appvk
//
//  Created by Дарья Шимко on 10.10.2020.
//

import UIKit

class GroupTableViewController: UITableViewController {

    var addButton = UIBarButtonItem()
    var searchBar = UISearchBar()
    var arrayGroups = [Group]()
    private var filterGoups = [Group]()
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        
        VKService.shared.loadGroups(token: Session.shared.token!) { [self] groups in
            
            for item in groups.response.items {
                self.arrayGroups.append(Group(item.name, UIImage()))
            }
            
            self.filterGoups = self.arrayGroups
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 60
        
        searchBar.delegate = self
        filterGoups = arrayGroups
        
        tableView.register(GroupTableViewCell.self, forCellReuseIdentifier: "groupCell")
        
        setup()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterGoups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupTableViewCell else {
            fatalError()
        }

        cell.nameGroup.text = filterGoups[indexPath.row].name
        cell.imageGroup.image = filterGoups[indexPath.row].avatarImage
        
        cell.config(filterGoups[indexPath.row].name, image: filterGoups[indexPath.row].avatarImage ?? UIImage())
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            arrayGroups.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .bottom)
            tableView.endUpdates()
            
        }
        
    }
    
    func setup() {
        
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
      
    }

    func addGroup(newStringGroup: String) {
     
        guard !newStringGroup.isEmpty else { return }
        
        var existGroup = false
        
        for currentGroup in arrayGroups {
            if currentGroup.name == newStringGroup {
                existGroup = true
                break
            }
        }
        
        if !existGroup {
            let newGroup = Group(newStringGroup, UIImage())
            arrayGroups.insert(newGroup, at: 0)
            tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .right)
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension GroupTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            filterGoups = arrayGroups
        }
        else {
            filterGoups = arrayGroups.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
        tableView.reloadData()
    }
}
