//
//  ViewController.swift
//  MyPostMan
//
//  Created by Rohit on 10/09/2020.
//  Copyright © 2020 RP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getRequest()
    }

    
    func postRequest() {
        
        var request = URLRequest(url: URL(string: "https://Google.com")!)
        request.timeoutInterval = 10
        request.httpMethod = "POST"
        let arguments = ["":""]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: arguments, options: [])
        } catch {
            print(error)
        }
        
        
        let headerFields: [String : String] = ["Content-Type":"application/json; charset=utf-8"]
        for header in headerFields {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("Invalid response : \(response.statusCode)")
                }
            }
            
            if let data = data {
                
                if let str = String(data: data, encoding: String.Encoding.utf8) {
                    print("Response: \(str)")
                }
            }
        }
        task.resume()
    }
    
    
    func getRequest() {
        
        var request = URLRequest(url: URL(string: "https://Google.com")!)
        request.timeoutInterval = 10
        request.httpMethod = "GET"
        
        
        let headerFields: [String : String] = ["Content-Type":"application/json; charset=utf-8"]
        for header in headerFields {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode != 200 {
                    print("Invalid response : \(response.statusCode)")
                }
            }
            
            if let data = data {
                
                if let str = String(data: data, encoding: String.Encoding.utf8) {
                    print("Response: \(str)")
                }
            }
        }
        task.resume()
    }
    

}

