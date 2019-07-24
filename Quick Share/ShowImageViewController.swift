//
//  ShowImageViewController.swift
//  Quick Share
//
//  Created by Abhishek Thakur on 18/07/19.
//  Copyright © 2019 Abhishek Thakur. All rights reserved.
//

import UIKit
import Photos
import Social

class ShowImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var asset: PHAsset?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        if let myasset = asset{
            
            PHImageManager.default().requestImage(for: myasset, targetSize: CGSize(width: self.view.frame.width, height: self.view.frame.width * 0.5625), contentMode: .aspectFill, options: nil, resultHandler:{ (result, info) in
                if let image = result {
                    self.imageView.image = image
                }
                
            })
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //Handling all sharing button action
    @IBAction func shareButtonClicked(_ sender: UIButton){
        
        switch sender.tag {
        case 0:
            if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook){
                shareFacebookTwitter(vc: vc);
                
            }
            break
        case 1:if let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter){
            shareFacebookTwitter(vc: vc);
        }
            break
        case 2: print("twitter")
            break
        case 4: print("whatsapp")
        default:
            print("No social media ")
        }
        
    }
    
    
    func    shareFacebookTwitter(vc: SLComposeViewController){
        vc.setInitialText("Look this great picture")
        vc.add(imageView.image)
        
        
    }


}
