//
//  ViewController.swift
//  marvel-sample-app
//
//  Created by Anderson  Kloss Maia on 02/11/17.
//  Copyright © 2017 Anderson Kloss Maia. All rights reserved.
//

import UIKit

class CharactersListViewController: UIViewController {
    
    private lazy var getCharactersCompletion: (( (NetworkResponse<Container>) -> Void )) = { response
        in
        switch response {
            case .failure(let error):
            break
            case .success(let value):
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CharactersListRequester().fetchCharacters(completion: self.getCharactersCompletion)
    }
    
}

