//
//  MenuViewController.swift
//  SlideInTransition
//
//  Created by Gary Tokman on 1/12/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case profile
    case editProfile
    case contacts
    case logout
}

class MenuViewController: UITableViewController {

    @IBOutlet weak var buttonImage: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    var didTapMenuType: ((MenuType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let imagef = UIImageView()
         
        
        
//         let imageData = (defaultImage!.pngData() as! NSData)
         

//         let imaged = currentMO.value(forKey: "imageData") as? NSData ??  imageData
        
//        if(DBManage.shared.images != nil){
//        buttonImage.setImage(DBManage.shared.images[0], for: UIControl.State.normal)
//        }
      
        buttonImage.layer.cornerRadius = buttonImage.frame.width/2
        buttonImage.clipsToBounds  = true
               nameLbl.textColor = .black
        nameLbl.text! =  DBManage.shared.namesText as? String ?? "fsd"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let defaultImage = UIImage(named: "18942381")
                
        DBManage.shared.images.append(defaultImage!)
        
          buttonImage.setBackgroundImage(DBManage.shared.images[0], for: UIControl.State.normal)
        
        nameLbl.text = DBManage.shared.namesText
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            print("Dismissing: \(menuType)")
            self?.didTapMenuType?(menuType)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "abc") as! UITableViewCell
        
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        
        
        cell.layer.borderColor = UIColor.red as! CGColor
        return cell
    }
}
