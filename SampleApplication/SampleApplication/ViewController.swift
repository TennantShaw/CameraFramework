//
//  ViewController.swift
//  SampleApplication
//
//  Created by Tennant on 1/17/18.
//  Copyright © 2018 Tennant Shaw. All rights reserved.
//

import UIKit
import CameraFramework

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Framework Version: \(CameraViewController.getVersion()!)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func startButtonTapped() {
        let camera = CameraViewController.init()
        camera.delegate = self
        camera.position = .back
        present(camera, animated: true, completion: nil)
    }

}


extension ViewController: CameraControllerDelagate {
    func stillImageCaptured(controller: CameraViewController, image: UIImage) {
        self.imageView.image = image
        controller.dismiss(animated: true, completion: nil)
    }
    
    func cancelButtonTapped(controller: CameraViewController) {
        controller.dismiss(animated: true, completion: nil)
    }

}
