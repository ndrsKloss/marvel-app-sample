//
//  ViewController.swift
//  marvel-sample-app
//
//  Created by Anderson  Kloss Maia on 02/11/17.
//  Copyright © 2017 Anderson Kloss Maia. All rights reserved.
//

import UIKit

class CharactersListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 80.0
        }
    }
    
    private var limit = 20
    private var offset = 0
    private var total = 0
    
    private let requester = CharactersListRequester()
    
    private var characters = [Character]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private lazy var getCharactersCompletion: (( (NetworkResponse<Container>) -> Void )) = { response
        in
        switch response {
            case .failure(let error):
            break
            case .success(let value):
                guard let data = value.data,
                    let total = data.total,
                    let characters = data.characters else { break }
                self.total = total
                
                DispatchQueue.main.async {
                    self.characters += characters
                    self.offset += self.limit
                }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.requester.fetchCharacters(completion: self.getCharactersCompletion, limit: self.limit, offset: self.offset)
    }
}

extension CharactersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = { (cell) -> (CharacterTableViewCell?) in
            cell?.configure(character: self.characters[indexPath.row])
            return cell
        }(tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as? CharacterTableViewCell)
        
        return cell ?? UITableViewCell()
    }
}

extension CharactersListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard self.characters.count < self.total else { return }
        
        if indexPath.row == (self.characters.count - 1) {
            self.requester.fetchCharacters(completion: self.getCharactersCompletion, limit: self.limit, offset: self.offset)
        }
    }
}
