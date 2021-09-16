//
//  ViewController.swift
//  NetworkLayerBasic
//
//  Created by Vikas S on 17/09/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NetworkEngine.request(endpoint: FlickrEndPoint.getSearchResults(searchText: "iOS", page: 1)) { (result: Result<FlickrResponse,Error>) in
            switch result{
            case .success(let response):
                print("Response: \(response)")
            case .failure(let error):
                print(error)
            }
        }
    }


}

