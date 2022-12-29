//
//  CategoriesViewController.swift
//  WallpaperEngineApp
//
//  Created by Deniz Gülbahar on 8.07.2022.
//

import UIKit

class CategoriesViewController: UIViewController {
    
    var categories = [String]()
    
    private let categoriesTableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Wallpapers"
        view.addSubview(categoriesTableView)
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        categoryAppends()
    }
    
    private func categoryAppends() {
        categories.append("Landscape Wallpapers")
        categories.append("Popular Wallpapers")
        categories.append("Recommended Wallpapers")
        categories.append("Cool Wallpapers")
    }
    
    override func viewDidLayoutSubviews() {
        categoriesTableView.frame = view.bounds
      }
    }

extension CategoriesViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = categories[indexPath.row]
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model
        cell.textLabel?.textAlignment = .center
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = Constants.cornerRadius
        cell.backgroundColor = .systemBlue
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoriesTableView.deselectRow(at: indexPath, animated: true)
        let model = categories[indexPath.row]
        if model == categories[0] {
            let vc = LandscapeViewController()
            vc.title = "Landscape Wallpapers"
            navigationItem.backButtonTitle = ""
            navigationController?.pushViewController(vc, animated: true)
        }
        if model == categories[1] {
            let vc = PopularViewController()
            vc.title = "Popular Wallpapers"
            navigationItem.backButtonTitle = ""
            navigationController?.pushViewController(vc, animated: true)
            
        }
        if model == categories[2] {
            let vc = RecommendedViewController()
            vc.title = "Recommended Wallpapers"
            navigationItem.backButtonTitle = ""
            navigationController?.pushViewController(vc, animated: true)
            
        }
        if model == categories[3] {
            let vc = CoolViewController()
            vc.title = "Cool Wallpapers"
            navigationItem.backButtonTitle = ""
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}





