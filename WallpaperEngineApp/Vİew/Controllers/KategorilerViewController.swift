//
//  ViewController.swift
//  WallpaperMVCApp
//
//  Created by Deniz Gülbahar on 6.07.2022.
//

import UIKit

class KategorilerViewController: UIViewController {

    private let tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        fetchWallpapers()
    }
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    
    func fetchWallpapers() {
        
        let url = URL(string:"https://pixabay.com/api/?key=28515317-c4e539f98cb8a2d58ce67acab&q=landscape&image_type=photo&pretty=true")
         guard let url = url else {
             return
         }
        
         URLSession.shared.dataTask(with: url) {  data,response,error in
                 
                 guard error == nil || data != nil else {
                     print("Error")
                     return
                 }
                 do {
             
                     let response = try JSONDecoder().decode(HitsResponse.self, from: data!)
                 
                     if let receivedWallpapers = response.hits {
                     
                         self.wallpapers = receivedWallpapers
                 }
                 
                 DispatchQueue.main.async {
                     self.tableView.reloadData()
                 }
                 
                 
             } catch {
                 print(error.localizedDescription)
             }
             
         } .resume()
     }

    
}

extension KategorilerViewController:UITableViewDelegate,UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wallpapers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = wallpapers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = String("\(model.previewWidth)X\(model.previewHeight)")
        return cell
    }
}
