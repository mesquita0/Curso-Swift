//
//  ContentView.swift
//  Map Countries
//
//  Created by Student13 on 18/10/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    let locations: [Location] = [
        Location(name: "Brazil", coordinate: CLLocationCoordinate2D(latitude: -10.53034, longitude: -54.24177), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50) , flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/1200px-Flag_of_Brazil.svg.png", description: """
Brazil is the largest country in South America and the fifth largest nation in the world. It forms an enormous triangle on the eastern side of the continent with a 4,500-mile (7,400-kilometer) coastline along the Atlantic Ocean. It has borders with every South American country except Chile and Ecuador.

The Brazilian landscape is very varied. It is most well known for its dense forests, including the Amazon, the world's largest jungle, in the north. But there are also dry grasslands (called pampas), rugged hills, pine forests, sprawling wetlands, immense plateaus, and a long coastal plain.

Northern Brazil is dominated by the Amazon River and the jungles that surround it. The Amazon is not one river but a network of many hundreds of waterways. Its total length stretches 4,250 miles (6,840 kilometers). Thousands of species live in the river, including the infamous piranha and the boto, or pink river dolphin.
"""), Location(name: "United States of America", coordinate: CLLocationCoordinate2D(latitude: 40, longitude: -95), span: MKCoordinateSpan(latitudeDelta: 65, longitudeDelta: 65), flag: "https://cdn.britannica.com/33/4833-050-F6E415FE/Flag-United-States-of-America.jpg", description: """
The United States of America is the world's third largest country in size and nearly the third largest in terms of population. Located in North America, the country is bordered on the west by the Pacific Ocean and to the east by the Atlantic Ocean. Along the northern border is Canada and the southern border is Mexico. There are 50 states and the District of Columbia.

More than twice the size of the European Union, the United States has high mountains in the West and a vast central plain. The lowest point in the country is in Death Valley which is at -282 feet (-86 meters) and the highest peak is Denali (Mt. McKinley) at 20,320 feet (6,198 meters).
"""), Location(name: "Australia", coordinate: CLLocationCoordinate2D(latitude: -25, longitude: 134), span: MKCoordinateSpan(latitudeDelta: 45, longitudeDelta: 45), flag: "https://cdn.britannica.com/78/6078-050-18D5DEFE/Flag-Australia.jpg", description: """
Australia is the only country in the world that covers an entire continent. It is one of the largest countries on Earth. Although it is rich in natural resources and has a lot of fertile land, more than one-third of Australia is desert.

Most Australian cities and farms are located in the southwest and southeast, where the climate is more comfortable. There are dense rain forests in the northeast. The famous outback (remote rural areas) contains the country's largest deserts, where there are scorching temperatures, little water, and almost no vegetation.

Running around the eastern and southeastern edge of Australia is the Great Dividing Range. This 2,300-mile (3,700-kilometer) stretch of mountain sends water down into Australia's most important rivers and the Great Artesian Basin, the largest groundwater source in the world.
"""), Location(name: "Spain", coordinate: CLLocationCoordinate2D(latitude: 40.8, longitude: -3.3), span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15), flag: "https://cdn.britannica.com/36/4336-050-056AC114/Flag-Spain.jpg", description: """
Spain occupies most of the Iberian Peninsula, stretching south from the Pyrenees Mountains to the Strait of Gibraltar, which separates Spain from Africa. To the east lies the Mediterranean Sea, including Spain's Balearic Islands. Spain also rules two cities in North Africa and the Canary Islands in the Atlantic.

The interior of Spain is a high, dry plateau surrounded and crisscrossed by mountain ranges. Rivers run to the coasts, creating good farmland. Still, the interior of the country gets very hot in summer and very cold and dry in the winter. Droughts are common.

Plants and trees grow so well on the northwestern coast, in Galicia and along the Bay of Biscay, that the area is called Green Spain. Rain, trapped by the mountains farther inland, is frequent. Beech and oak trees flourish here. Numerous coves and inlets break up the coastline.

The southern and eastern coasts of Spain, from the fertile Andalusian plain up to the Pyrenees, are often swept by warm winds called sirocco winds. These winds originate in northern Africa and keep temperatures along the Mediterranean coast milder than the interior.
""")]
    @State private var location: Location
    @State private var region: MKCoordinateRegion
    @State private var showingSheet: Bool
    
    init() {
        _location = State(initialValue: locations[0])
        _region = State(initialValue: MKCoordinateRegion(center: locations[0].coordinate, span: locations[0].span))
        _showingSheet = State(initialValue: false)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("World Map")
                    .font(.title)
                    .bold()
                Text(location.name)
                    .padding(.bottom, 10)
                Map(coordinateRegion: $region, annotationItems: locations) { loc in
                    MapAnnotation(coordinate: loc.coordinate) {
                        Button {
                            showingSheet.toggle()
                        } label: {
                            VStack(spacing: 0) {
                                  Image(systemName: "mappin.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.red)
                                  Image(systemName: "arrowtriangle.down.fill")
                                    .font(.caption)
                                    .foregroundColor(.red)
                                    .offset(x: 0, y: -5)
                            }
                        }
                        .sheet(isPresented: $showingSheet) {
                            CountryDetails(location: location)
                        }
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(locations) { loc in
                            Button (loc.name) {
                                location = loc
                                region = MKCoordinateRegion(center: loc.coordinate, span: loc.span)
                            }
                            .buttonStyle(.bordered)
                            .background(.blue)
                            .foregroundColor(.white)
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                        }
                    }
                }
                .padding(.top, 5)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
