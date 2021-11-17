//
//  ViewController.swift
//  NBAFantazyCompagnon
//
//  Created by Dimitri SMITH on 15/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    //let urlString = "https://free-nba.p.rapidapi.com/players"
    var urlComponent = URLComponents()
    var numberOfPage = 0
    let perPage = "100"
    
    
    
    
    
    
    
    var players = [Player]()
    
    
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let myURL = composeMyUrl()
        print(myURL)
        
        // Do any additional setup after loading the view.
                
//        let url = URL(string: urlString)
//        var request = URLRequest(url: url!)
//        request.httpMethod = "GET"
//        request.setValue("free-nba.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
//        request.setValue("19494243fcmsh2d4e3a3767f24f2p1b483fjsn2e9fade51108", forHTTPHeaderField: "X-RapidAPI-Key")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data = data else {
//                if let error = error {
//                    print(error)
//                }
//                return
//            }
//            do {
//                let decoder = JSONDecoder()
//                //decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let result = try decoder.decode(Players.self, from: data)
//
//                print(result)
//
//            } catch {
//                print("error with my API", error.localizedDescription)
//            }
//        }.resume()
        
        
    }
    
    func composeMyUrl () -> String {
        urlComponent.scheme = "https"
        urlComponent.host = "free-nba.p.rapidapi.com"
        urlComponent.path = "/players"
        urlComponent.queryItems = [
            URLQueryItem(name: "per_page", value: perPage),
            URLQueryItem(name: "page", value: String(numberOfPage))
        ]
        
        return urlComponent.url!.absoluteString
    }
    
    func createURL(with oneString:String) -> URL {
        return URL(string: oneString)!
    }
    
    func numberOfPagesFromData () {
        let urlString = composeMyUrl()
        let url = createURL(with: urlString)
        var request = URLRequest(url: url)
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
                let result = try decoder.decode(Players.self, from: data)
                
                print(result.meta.total_pages)
                self.numberOfPage = result.meta.total_pages
                
            } catch {
                print("error with my API", error.localizedDescription)
            }
            }.resume()
    }
    
    func parseJSONinArray () {
        let urlString = composeMyUrl()
        let url = createURL(with: urlString)
        var request = URLRequest(url: url)
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
                let result = try decoder.decode(Players.self, from: data)
                
                for player in result.data {
                    self.players.append(player)
                }
                
                
                
            } catch {
                print("error with my API", error.localizedDescription)
            }
            }.resume()
    }
    
}


