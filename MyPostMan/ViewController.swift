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
        
        
        
    }

    @IBAction func openClima(_ sender: Any) {
        openClimaApp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    
    func openClimaApp() {
        
        let alert = UIAlertController(title: "Open Clima!", message: "Do you want to open Clima app?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction.init(title: "Open", style: .default, handler: { (action) in
            let url = "shamaliclima://"
            
            if UIApplication.shared.canOpenURL(URL(string: url)!){
                UIApplication.shared.open(URL(string: url)!, options: [:]) { (success) in
                    if success{
                        print("Opened Clima")
                    } else{
                    }
                }
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    }
    
    
    func postRequest() {
        
        var request = URLRequest(url: URL(string: "https://Google.com")!)
        request.timeoutInterval = 10
        request.httpMethod = "POST"
        let arguments = ["userName":"Shamali","Password":"******"]
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

