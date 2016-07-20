//
//  DetailChallengeViewController.swift
//  Gamin
//
//  Created by yiling on 7/17/16.
//  Copyright © 2016 yiling. All rights reserved.
//
import UIKit
import GoogleMaps

class DetailChallengeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()//43.678102, 7.223950
        
        let camera = GMSCameraPosition.cameraWithLatitude(43.67,
                                                          longitude: 7.223, zoom: 6)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(43.678102, 7.223950)
        marker.title = "Yiling's House  "
        marker.snippet = "Australia"
        marker.map = mapView

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
