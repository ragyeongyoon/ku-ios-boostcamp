//
//  ViewController.swift
//  MovieSearch       //
//  Created by cscoi027 on 2019. 8. 21..
//  Copyright © 2019년 rcr. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var queryField: UITextField!
    
    let cellIdentifier = "movieCell"
    var movie: [Movie] = []
    
    @IBAction func touchUpSearchButton(_ sender: UIButton) {
        guard let query: String = queryField.text,
        query.isEmpty == false else {
            print("검색어를 입력해주세요")
            return
        }
        queryField.endEditing(true)
        search(query)
    }
    
    
    func search(_ query: String) {
      print("\(query)를 검색할겁니다")
        
        let clientID = "malOwNsz6VVh3xnobXaH"
        let clientSecret = "kw_roBmkWo"
        
        let headers: [String:String] =
            ["X-Naver-Client-Id" : clientID,
             "X-Naver-Client-Secret" : clientSecret]
        
        let urlString = "https://openapi.naver.com/v1/search/movie"
        let parameters: [String: Any] = ["query": query,
                                         "display": 50]
        
        let request = Alamofire.request(urlString,
                                        method: .get,
                                        parameters: parameters,
                                        encoding: URLEncoding.queryString,
                                        headers: headers)
        
        request.response {(dataResponse) in
            print(dataResponse.error)
            
            guard let data: Data = dataResponse.data else {
                print("no data")
                return
            }
            
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let response: MovieResponse
                response = try decoder.decode(MovieResponse.self, from: data)
                
                if let items: [Movie] = response.items {
                self.movies = items
                print("\(items.count)개의 영화 검색됨")
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

