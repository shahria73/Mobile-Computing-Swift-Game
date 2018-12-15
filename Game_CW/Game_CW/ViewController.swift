//
//  ViewController.swift
//  Game_CW
//
//  Created by Kabir on 03/12/2018.
//  Copyright © 2018 Kabir. All rights reserved.
//

import UIKit

protocol subviewDelegate{
    func changeBehavior ()
}


class ViewController: UIViewController, subviewDelegate {
    
    //var location = CGPoint(x: 0, y: 0)
    
    let W = UIScreen.main.bounds.width
    let H = UIScreen.main.bounds.height
    
    func changeBehavior() {
        collisionBehaviour.removeAllBoundaries()
        collisionBehaviour.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: planeImage.frame))
    }
    
    
    var dynamicBehavior: UIDynamicItemBehavior!
    var collisionBehaviour: UICollisionBehavior!
    var dynamicAnimator: UIDynamicAnimator!
    //var dynamicItemBehaviour:  UIDynamicItemBehavior!
    var gravityBehavior: UIGravityBehavior!

    
    
    let  birdArray = [0, 2, 4, 6, 8, 12, 14, 16, 18]
    let  birdArray1 = [1.5, 3.5, 5.5, 7.5, 9.5, 11.5, 13.5, 15.5, 17.5]
    let  coinArray = [0, 2, 6, 8, 12, 16, 18, 22, 26]
    let  coinArray1 = [0, 2.5, 5, 6.5, 8.8, 12.8, 14.8, 16.9, 17.8, 19]
    
    
    @IBOutlet weak var roadImage: UIImageView!
    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var planeImage: Plane!
    @IBOutlet weak var skyView: UIImageView!
    
    
    
    //override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)  {
        
      //  let touch: UITouch! = touches.first
        
       // location = touch.location(in: self.view)
        
       // Plane.center = location
        
        
    //}
    
  //  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
   //     let touch : UITouch! =  touches.first! as UITouch
        
   //     location = touch.location(in: self.view)
        
    //    Plane.center = location
    
      //  }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        planeImage.myDelegate = self
        
        dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        dynamicBehavior = UIDynamicItemBehavior(items: [])
        dynamicAnimator.addBehavior(dynamicBehavior)
        
        gravityBehavior = UIGravityBehavior(items: [])
        collisionBehaviour = UICollisionBehavior(items: [])
        dynamicAnimator.addBehavior(collisionBehaviour)
        collisionBehaviour.addBoundary(withIdentifier: "barrier" as NSCopying, for: UIBezierPath(rect: planeImage.frame))

        
        
        // certre of plane after starting games
        //Plane.center = CGPoint(x: 70, y: 150)
        
        //moving road array
        var imageArray: [UIImage]!
        var imageArray2: [UIImage]!
        var imageArray3: [UIImage]!
       
        
        imageArray = [UIImage(named: "road1.png")!,
                      UIImage(named: "road2.png")!,
                      UIImage(named: "road3.png")!,
                      UIImage(named: "road4.png")!,
                      UIImage(named: "road5.png")!,
                      UIImage(named: "road6.png")!,
                      UIImage(named: "road7.png")!,
                      UIImage(named: "road8.png")!,
                      UIImage(named: "road9.png")!,
                      UIImage(named: "road10.png")!,
                      UIImage(named: "road11.png")!,
                      UIImage(named: "road12.png")!,
                      UIImage(named: "road13.png")!,
                      UIImage(named: "road14.png")!,
                      UIImage(named: "road15.png")!,
                      UIImage(named: "road16.png")!,
                      UIImage(named: "road17.png")!,
                      UIImage(named: "road18.png")!,
                      UIImage(named: "road19.png")!,]
        
        roadImage.image = UIImage.animatedImage(with: imageArray, duration: 1)
        roadImage.frame = CGRect(x:0, y:0, width: W*1, height: H*1)
        
        //moving road array
        
        imageArray2 = [UIImage(named: "tree1.png")!,
                       UIImage(named: "tree2.png")!,
                       UIImage(named: "tree3.png")!,
                       UIImage(named: "tree4.png")!,
                       UIImage(named: "tree5.png")!,
                       UIImage(named: "tree6.png")!,
                       UIImage(named: "tree7.png")!,
                       UIImage(named: "tree7.png")!,
                       UIImage(named: "tree9.png")!,
                       UIImage(named: "tree10.png")!,
                       UIImage(named: "tree11.png")!,
                       UIImage(named: "tree12.png")!,
                       UIImage(named: "tree13.png")!,
                       UIImage(named: "tree14.png")!,
                       UIImage(named: "tree15.png")!,
                       UIImage(named: "tree16.png")!,
                       UIImage(named: "tree17.png")!]
        
        treeImage.image = UIImage.animatedImage(with: imageArray2, duration: 1)
        treeImage.frame = CGRect(x:0, y:H*(-0.2), width: W*(1), height: H*1)

        
        imageArray3 =  [UIImage(named: "plane1.png")!,
                        UIImage(named: "plane2.png")!,
                        UIImage(named: "plane3.png")!,
                        UIImage(named: "plane4.png")!,
                        UIImage(named: "plane5.png")!,
                        UIImage(named: "plane6.png")!,
                        UIImage(named: "plane7.png")!,
                        UIImage(named: "plane8.png")!,
                        UIImage(named: "plane9.png")!,
                        UIImage(named: "plane10.png")!,
                        UIImage(named: "plane11.png")!,
                        UIImage(named: "plane11.png")!,
                        UIImage(named: "plane12.png")!,
                        UIImage(named: "plane13.png")!,
                        UIImage(named: "plane14.png")!,
                        UIImage(named: "plane15.png")!]
        
        planeImage.image = UIImage.animatedImage(with: imageArray3, duration: 4)
        planeImage.frame = CGRect(x:0, y:H*(0.3), width: W*(0.2), height: H*(0.2))

        
        
        //Making flying crows
        //Creating a new UIImageView from scratch
        
        
        //let birdView = UIImageView(image:nil)
        //let birdView2 = UIImageView(image:nil)
        //let birdView3 = UIImageView(image:nil)
        //let birdView4 = UIImageView(image:nil)
        //var imageArray4: [UIImage]!
        
        for index in 0...8{
            let delay = Double(self.birdArray[index])
            let when = DispatchTime.now() + delay
            
            DispatchQueue.main.asyncAfter(deadline: when){
                let birdView = UIImageView(image:nil)
                var imageArray4: [UIImage]
                
                
                imageArray4 =  [UIImage(named: "bird1.png")!,
                                UIImage(named: "bird2.png")!,
                                UIImage(named: "bird3.png")!,
                                UIImage(named: "bird4.png")!,
                                UIImage(named: "bird5.png")!,
                                UIImage(named: "bird6.png")!,
                                UIImage(named: "bird7.png")!,
                                UIImage(named: "bird8.png")!,
                                UIImage(named: "bird9.png")!,
                                UIImage(named: "bird10.png")!]
                
            
        //Assign an image to the image view
        
        
        //Assign the size and position of the image view
        birdView.image = UIImage.animatedImage(with: imageArray4, duration: 2)
        birdView.frame = CGRect(x:self.W, y: CGFloat(arc4random_uniform(UInt32(self.H))), width: self.W*(0.25), height: self.H*(0.25))
        
        //birdView2.image = UIImage.animatedImage(with: imageArray4, duration: 1)
        //birdView2.frame = CGRect(x:500, y: 200, width: 80, height: 100)
        
        //birdView3.image = UIImage.animatedImage(with: imageArray4, duration: 1)
        //birdView3.frame = CGRect(x:400, y: 200, width: 80, height: 100)
        
        //birdView4.image = UIImage.animatedImage(with: imageArray4, duration: 1)
        //birdView4.frame = CGRect(x:300, y: 300, width: 80, height: 100)
        
        
        //Add the image view to the main view
        self.view.addSubview(birdView)
        //self.view.addSubview(birdView2)
        //self.view.addSubview(birdView3)
        //self.view.addSubview(birdView4)
       
        self.view.bringSubviewToFront(birdView)
                
        self.dynamicBehavior.addItem(birdView)
        self.dynamicBehavior.addLinearVelocity(CGPoint(x: -400, y:0), for: birdView)
        self.collisionBehaviour.addItem(birdView)
        //self.birdDynamicAnimator = UIDynamicAnimator(referenceView: self.view)
        //self.birdDynamicItemBehaviour = UIDynamicItemBehavior(items: [birdView])
        //self.birdDynamicAnimator.addBehavior(self.birdDynamicItemBehaviour)
    
        //add one item at a time
        //self.birdDynamicItemBehaviour.addItem(birdView)
        //self.birdDynamicItemBehaviour.addItem(birdView2)
        //self.birdDynamicItemBehaviour.addItem(birdView3)
        //self.birdDynamicItemBehaviour.addItem(birdView4)
        
        
        //self.birdDynamicItemBehaviour.addLinearVelocity(CGPoint(x: -100, y:0), for: birdView)
        //self.birdDynamicItemBehaviour.addLinearVelocity(CGPoint(x: -100, y:0), for: birdView2)
        //self.birdDynamicItemBehaviour.addLinearVelocity(CGPoint(x: -100, y:0), for: birdView3)
        //self.birdDynamicItemBehaviour.addLinearVelocity(CGPoint(x: -100, y:0), for: birdView4)
        
            }
            
            
        }
        
        for index in 0...8{
            let delay = Double(self.coinArray[index])
            let when = DispatchTime.now() + delay
            
            DispatchQueue.main.asyncAfter(deadline: when){
                let coinView = UIImageView(image:nil)
                var imageArray5: [UIImage]
                
                
                imageArray5 =  [UIImage(named: "star coin rotate 1.png")!,
                                UIImage(named: "star coin rotate 2.png")!,
                                UIImage(named: "star coin rotate 3.png")!,
                                UIImage(named: "star coin rotate 4.png")!,
                                UIImage(named: "star coin rotate 5.png")!,
                                UIImage(named: "star coin rotate 6.png")!]
                
                
                //Assign an image to the image view
                
                
                //Assign the size and position of the image view
                coinView.image = UIImage.animatedImage(with: imageArray5, duration: 2)
                coinView.frame = CGRect(x:self.W, y: CGFloat(arc4random_uniform(UInt32(self.H))), width: self.W*(0.03), height: self.H*(0.12))
                
        
                
                
                //Add the image view to the main view
                self.view.addSubview(coinView)
                self.view.bringSubviewToFront(coinView)
                
                self.dynamicBehavior.addItem(coinView)
                self.dynamicBehavior.addLinearVelocity(CGPoint(x: -400, y:50), for: coinView)
                self.collisionBehaviour.addItem(coinView)
                //collisionBehaviour.action = coinArray.removeFromSuperview()
                
                
                
                
            }
            
            
        }
        
        for index in 0...7{
            let delay = Double(self.coinArray1[index])
            let when = DispatchTime.now() + delay
            
            DispatchQueue.main.asyncAfter(deadline: when){
                let coinView = UIImageView(image:nil)
                var imageArray5: [UIImage]
                
                
                imageArray5 =  [UIImage(named: "star coin rotate 1.png")!,
                                UIImage(named: "star coin rotate 2.png")!,
                                UIImage(named: "star coin rotate 3.png")!,
                                UIImage(named: "star coin rotate 4.png")!,
                                UIImage(named: "star coin rotate 5.png")!,
                                UIImage(named: "star coin rotate 6.png")!]
                
                
                //Assign an image to the image view
                
                
                //Assign the size and position of the image view
                coinView.image = UIImage.animatedImage(with: imageArray5, duration: 1)
                coinView.frame = CGRect(x:self.W, y: CGFloat(arc4random_uniform(UInt32(self.H))), width: self.W*(0.03), height: self.H*(0.12))
                
                
                
                
                //Add the image view to the main view
                self.view.addSubview(coinView)
                self.view.bringSubviewToFront(coinView)
                
                self.dynamicBehavior.addItem(coinView)
                //self.dynamicBehavior.addLinearVelocity(CGPoint(x: -400, y:50), for: coinView)
                self.collisionBehaviour.addItem(coinView)
                
                
                
                
                
            }
            
            
        }
        

        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

