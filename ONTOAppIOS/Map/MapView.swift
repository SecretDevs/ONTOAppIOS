//
// Created by Ivanov Ivan on 24.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @ObservedObject var viewModel = MapViewModel()

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        view.delegate = context.coordinator
        /*let annotation = ShopPointAnnotation(address: "address", phone: "+7-999-888-77-33")
        annotation.title = "ONTO pet shop"
        let latitude = 59.986117
        let longitude = 30.392396
        annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        view.addAnnotation(annotation)*/
        for shop in viewModel.shops {
            let annotation = ShopPointAnnotation(address: "address", phone: "+7-999-888-77-33")
            annotation.title = shop.name
            let latitude = shop.location.latitude
            let longitude = shop.location.longitude
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
            view.addAnnotation(annotation)
        }
    }

    func makeCoordinator() -> MapViewCoordinator{
        MapViewCoordinator(self)
    }

    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        var mapViewController: MapView

        init(_ control: MapView) {
            self.mapViewController = control
        }

        func mapView(_ mapView: MKMapView, viewFor
        annotation: MKAnnotation) -> MKAnnotationView?{
            if annotation is MKUserLocation { return nil }

            if #available(iOS 11.0, *) {
                if annotation is MKClusterAnnotation { return nil }
            }

            let customAnnotationViewIdentifier = "MyAnnotation"

            var pin = mapView.dequeueReusableAnnotationView(withIdentifier: customAnnotationViewIdentifier)
            if pin == nil {
                pin = CustomAnnotationView(annotation: annotation, reuseIdentifier: customAnnotationViewIdentifier)
            } else {
                pin?.annotation = annotation
            }
            pin?.image = UIImage(named: "shop_marker")
            return pin
        }
    }


}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}