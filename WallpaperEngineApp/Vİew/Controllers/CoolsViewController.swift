//
//  CoolsViewController.swift
//  WallpaperMVCApp
//
//  Created by Deniz Gülbahar on 13.07.2022.
//

import UIKit

class CoolsViewController: UIViewController {
    
        private var wallpapers = [HitsModel]()
        
        private var collectionView:UICollectionView?
        
        override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        fetchWallpapers()

        }
        
        private func configureCollectionView() {
            
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 1
            layout.minimumInteritemSpacing = 1
            layout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1)
            let size = (view.width - 4)/3
            layout.itemSize = CGSize(width: size, height: size)  // Square
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            
            guard let collectionView = collectionView else {
                return
            }
            view.addSubview(collectionView)
            collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier:CollectionViewCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            collectionView?.frame = view.bounds
            
        }
        
        func fetchWallpapers() {
            let qstring = "&q=cool"
            let url = URL(string:"\(MovieHelper.baseURL)?key=\(MovieHelper.apiKey)\(qstring)&image_type=photo&pretty=true")
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
                         self.collectionView?.reloadData()
                     }
                     
                     
                 } catch {
                     print(error.localizedDescription)
                 }
                 
             } .resume()
         }

        
    }

    extension CoolsViewController:UICollectionViewDelegate,
                                      UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return wallpapers.count
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let model = wallpapers[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
            cell.configure(with: model)
            return cell
        }
        func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: true)
            let model = wallpapers[indexPath.row]
            let vc = ImageSizesViewController(model: model)
            vc.title = "Image Sizes"
            vc.model = model
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }

   
    

 
