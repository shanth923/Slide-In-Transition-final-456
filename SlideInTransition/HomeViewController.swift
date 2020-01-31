//
//  ViewController.swift
//  SlideInTransition
//
//  Created by Gary Tokman on 1/12/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let transiton = SlideInTransition()
    var topView: UIView?
    var imagePicke = UIImagePickerController()
    var textfield1:UITextField!
    var buttonImage2:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController else { return }
        menuViewController.didTapMenuType = { menuType in
            self.transitionToNew(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }

    func transitionToNew(_ menuType: MenuType) {
        let title = String(describing: menuType).capitalized
        self.title = title

        topView?.removeFromSuperview()
        switch menuType {
        case .profile:
//            let view = UIView()
//            view.backgroundColor = .yellow
//            view.frame = self.view.bounds
//            self.view.addSubview(view)
            
            print("gdfg")
            self.topView = view
          case .editProfile:
            let view1 = UIView()
            view1.backgroundColor = .systemBlue
            view1.frame = self.view.bounds
            self.view.addSubview(view1)
            
            buttonImage2 = UIButton()
            buttonImage2.frame = CGRect(x: 105, y: 200, width: 150, height: 150)
            buttonImage2.layer.cornerRadius = buttonImage2.frame.width/2
             buttonImage2.setBackgroundImage(UIImage(named: "18942381"), for: UIControl.State.normal)
            buttonImage2.clipsToBounds  = true
            buttonImage2.addTarget(self, action: #selector(buttonTarget), for: UIControl.Event.touchUpInside)
            buttonImage2.backgroundColor = .yellow
            view1.addSubview(buttonImage2)
            
             textfield1 = UITextField()
            textfield1.frame = CGRect(x: 80, y: 400, width: 220, height: 50)
            textfield1.placeholder = "Name"
            textfield1.backgroundColor = .white
            textfield1.layer.cornerRadius = 15.0
            textfield1.layer.borderWidth = 2.0
            textfield1.layer.borderColor = UIColor.red.cgColor
            view1.addSubview(textfield1)
            
            
            var sumbitBtn = UIButton()
            sumbitBtn.frame = CGRect(x: 90, y: 500, width: 200, height: 50)
            sumbitBtn.backgroundColor  = .systemYellow
            sumbitBtn.setTitle("SUBMIT", for: UIControl.State.normal)
            sumbitBtn.addTarget(self, action: #selector(imageButtonActionc(object:)), for: UIControl.Event.touchUpInside)
            sumbitBtn.layer.cornerRadius = 5
            sumbitBtn.layer.borderWidth = 1
            sumbitBtn.layer.borderColor = UIColor.black.cgColor
            view1.addSubview(sumbitBtn)
           
            
        case .contacts:
            
           let view4 = UIView()
              view4.backgroundColor = .systemYellow
              view4.frame = self.view.bounds
              self.view.addSubview(view4)
              
            var label3 = UILabel()
              label3.frame = CGRect(x: 100, y: 400, width: 200, height: 60)
              label3.backgroundColor = .systemBlue
              label3.text = "no contacts added"
              view4.addSubview(label3)
            
        case .logout:
            
            let view3 = UIView()
            view3.backgroundColor = .systemYellow
            view3.frame = self.view.bounds
            self.view.addSubview(view3)
            
          var label3 = UILabel()
            label3.frame = CGRect(x: 100, y: 400, width: 200, height: 60)
            label3.backgroundColor = .systemBlue
            label3.text = "LOGOUT successfully"
            view3.addSubview(label3)
            
            
            
            print("soemtin")
        default:
            break
        }
    }
    
    @objc func buttonTarget(){
        
        print("dgdfgdfg")
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum)){

             imagePicke.delegate = self
             imagePicke.sourceType = .savedPhotosAlbum
             imagePicke.allowsEditing = true


            present(imagePicke, animated: true, completion: nil)


          }
    }
    
    
    
      @objc func imageButtonActionc(object:Any){
            
        print("dfgfdg")
            DBManage.shared.namesText = textfield1.text!               
           }
        
    //    picker view method
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey : Any]) {
              DBManage.shared.images = [UIImage]()
            
            if  let pickedImage:UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage{

                buttonImage2.setImage(pickedImage, for: UIControl.State.normal)

                DBManage.shared.images.append(pickedImage)

            }

            dismiss(animated: true, completion: nil)

        }

}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = true
        return transiton
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transiton.isPresenting = false
        return transiton
    }
}

