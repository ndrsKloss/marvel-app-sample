//
//  CharactersListRequests.swift
//  marvel-sample-app
//
//  Created by Anderson  Kloss Maia on 02/11/17.
//  Copyright © 2017 Anderson Kloss Maia. All rights reserved.
//

import Foundation

class CharactersListRequester: NetworkRequestable {
    
    private let timeStamp = Date().timeIntervalSince1970.description
    
    private var baseURL: String? {
        get {
            guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
                let info = readPlist(file: path),
                let baseURL = info["Base URL"] as? String else { return nil }
            
            return baseURL
        }
    }

    private var marvelPublicKey: String? {
        get {
            guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
                let info = readPlist(file: path),
                let publicKey = info["Marvel public API key"] as? String else { return nil }
            
            return publicKey
        }
    }
    
    // Sure this is wrong
    private var marvelPrivateKey: String? {
        get {
            guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
                let info = readPlist(file: path),
                let publicKey = info["Marvel private API key"] as? String else { return nil }
            
            return publicKey
        }
    }
    
    private var hash: String? {
        get {
            guard let publicKey = self.marvelPublicKey,
                let privateKey = self.marvelPrivateKey,
                let hash = "\(self.timeStamp)\(privateKey)\(publicKey)".md5() else { return nil }
            return hash
        }
    }
}

extension CharactersListRequester {
    func fetchCharacters() {
        guard let baseURL = self.baseURL,
            let publicKey = self.marvelPublicKey,
            let hash = self.hash else {
                return
        }
        
        let queryItems = [
            URLQueryItem(name: "ts", value: self.timeStamp),
            URLQueryItem(name: "apikey", value: publicKey),
            URLQueryItem(name: "hash", value: hash)
        ]
        
        self.getCharacters(baseURL: baseURL, queryItems: queryItems)
    }
}
