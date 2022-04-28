//
//  MainTableViewController.swift
//  Rick&Morty
//
//  Created by Kirill Khristenko on 28.04.2022.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private var rickAndMorty: RickAndMorty?
    private var characters: [Result] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        fetchData(from: URLS.rickandmortyapi.rawValue)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterCell
        let result = characters[indexPath.row]
        cell.configure(with: result)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let char = characters[indexPath.row]
        let charViewController = segue.destination as! CharacterViewController
        charViewController.character = char
    }

    @IBAction func updateData(_ sender: UIBarButtonItem) {
        sender.tag == 1 ? fetchData(from: rickAndMorty?.info.next) : fetchData(from: rickAndMorty?.info.prev)
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) {  rickAndMorty in
            self.rickAndMorty = rickAndMorty
            self.characters = rickAndMorty.results ?? []
            self.tableView.reloadData()
            
        }
    }
   
}
