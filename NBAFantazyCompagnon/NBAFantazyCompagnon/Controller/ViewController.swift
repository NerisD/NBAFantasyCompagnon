//
//  ViewController.swift
//  NBAFantazyCompagnon
//
//  Created by Dimitri SMITH on 15/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var playerTableView: UITableView!
    @IBOutlet var searchTextField: UITextField!
    
    // API for rapid API to get all info
    var urlComponent = URLComponents()
    var numberOfPage = 0
    let perPage = "100"
    var players = [Player]()
    var finalArray = [Player]()
    var nameSearch = ""
    
    // API to get the image Of Players
    var urlComponentForImage = URLComponents()
    var playerIDForImage = ""
    
    // API to get all NBA data ID for the Image API
    var urlComponentAllNBA = URLComponents()
    
    
    
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        playerTableView.dataSource = self
        playerTableView.delegate = self
        searchTextField.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //searchByName(name: nameSearch)

    }
    
    func composeMyUrl () -> String {
        urlComponent.scheme = "https"
        urlComponent.host = "free-nba.p.rapidapi.com"
        urlComponent.path = "/players"
        urlComponent.queryItems = [
            URLQueryItem(name: "per_page", value: perPage),
            URLQueryItem(name: "page", value: String(numberOfPage)),
            URLQueryItem(name: "search", value: nameSearch)
        ]
        
        return urlComponent.url!.absoluteString
    }
    func composeURLForImage () -> String {
        urlComponentForImage.scheme = "https"
        urlComponentForImage.host = "ak-static.cms.nba.com"
        urlComponentForImage.path = "wp-content/uploads/headshots/nba/latest/260x190/\(playerIDForImage).png"
        
        return urlComponentForImage.url!.absoluteString
    }
    func composeURLForAllNBAPlayer () -> String {
        urlComponentAllNBA.scheme = "https"
        urlComponentAllNBA.host = "ak-static.cms.nba.com"
        urlComponentAllNBA.path = "data.nba.net/data/10s/prod/v1/2021/players.json"
        
        return urlComponentAllNBA.url!.absoluteString
    }
    func createURL(with oneString:String) -> URL {
        return URL(string: oneString)!
    }
    func numberOfPagesFromData (){
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
                
                //print(result.meta.total_pages)
                self.numberOfPage = result.meta.total_pages
                print("Nombre de Pages : \(self.numberOfPage)")
                
            } catch {
                print("error with my API", error.localizedDescription)
            }
            }.resume()
        
    }
    func buildArrayOfPlayer (numberToLoop: Int) {
        
        for number in 1...numberToLoop {
            numberOfPage = number
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
        print(players.count)
        
    }
    func searchByName (name:String) {
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
                
                self.numberOfPage = result.meta.total_pages
                print("Nombre de Pages : \(self.numberOfPage)")
                self.players = result.data
                
                if (self.players.count <= 0) {
                    print("No Player found ! ")
                    return
                }
                
                DispatchQueue.main.async {
//                    self.arradata = jsonFromWeb.news
//                    self.tableview.reloadData()
//                    for index in 0...self.players.count-1 {
//                        print(self.players[index])
//                    }
                    self.playerTableView.reloadData()
                }
                
                
            } catch {
                print("error with my API", error.localizedDescription)
            }
            }.resume()
    }
    func saveAllNBAPlayer () {
        let urlForAllNBAPlayer = createURL(with: composeURLForAllNBAPlayer())
        var request = URLRequest (url: urlForAllNBAPlayer)
        request.httpMethod = "GET"
        
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
                
                self.numberOfPage = result.meta.total_pages
                print("Nombre de Pages : \(self.numberOfPage)")
                self.players = result.data
                
                if (self.players.count <= 0) {
                    print("No Player found ! ")
                    return
                }
                
                DispatchQueue.main.async {
//                    self.arradata = jsonFromWeb.news
//                    self.tableview.reloadData()
//                    for index in 0...self.players.count-1 {
//                        print(self.players[index])
//                    }
                    self.playerTableView.reloadData()
                }
                
                
            } catch {
                print("error with my API", error.localizedDescription)
            }
            }.resume()
            
            
        }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PlayerCellView
        
        cell.firstName.text = players[indexPath.row].first_name
        cell.lastName.text = players[indexPath.row].last_name
        
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameSearch = textField.text!
        searchByName(name: nameSearch)
        
        searchTextField.resignFirstResponder()
        
        return true
    }
    
    
}


