//
//  ViewController.swift
//  Quick Share
//
//  Created by Abhishek Thakur on 12/05/19.
//  Copyright © 2019 Abhishek Thakur. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var assetCollection: PHAssetCollection?
    var photos: PHFetchResult<PHAsset>?

    @IBOutlet weak var tableView: UITableView!
    let reuseIdentifier = "tableViewCell"
    var dummyObject = ["hi","there","iam","Abhushe"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let collection = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        
        if(collection.firstObject != nil)
        {
            
            self.assetCollection = collection.firstObject! as PHAssetCollection
            
            let option = PHFetchOptions()
            option.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
            
            option.sortDescriptors = [ NSSortDescriptor(key: "creationDate", ascending: false)]
            
            
            self.photos = PHAsset.fetchAssets(in: assetCollection!, options: option)
        }
        else{
            
            print("Nothing found")
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier{
            if(id == "ShowFullImageSegue"){
                let newVc = segue.destination as! ShowImageViewController
                var indexpath = self.tableView.indexPath(for: sender as! UITableViewCell)
                if let asset = self.photos?[(indexpath!.row)]{
                    newVc.asset = asset
                    
                }
            }
        }
    }
    
    // Defineing each table or poppulated
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: myTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! myTableViewCell
        
        if let asset = self.photos?[indexPath.row]{
            PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: 320, height: 240), contentMode: .aspectFill, options: nil, resultHandler:{ (result, info) in
                if let image = result {
                    cell.myImageview?.image = image
                }
            })
        }
        cell.myImageview.image = UIImage(named: "polaroid")
        return cell
    }
    // Handling each table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyObject.count
    }


}

