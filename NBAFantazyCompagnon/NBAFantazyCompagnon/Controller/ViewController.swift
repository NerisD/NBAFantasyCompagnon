//
//  ViewController.swift
//  NBAFantazyCompagnon
//
//  Created by Dimitri SMITH on 15/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let urlString = "https://free-nba.p.rapidapi.com/players"
    var teams = [Player]()
    
    
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
                
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("free-nba.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        request.setValue("19494243fcmsh2d4e3a3767f24f2p1b483fjsn2e9fade51108", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print(error)
                }
                return
            }
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let result = try decoder.decode(Players.self, from: data)
                //teams = result.data
                print(result.data)
            } catch {
                print("error with my API", error.localizedDescription)
            }
        }.resume()
        
        
    }
}


