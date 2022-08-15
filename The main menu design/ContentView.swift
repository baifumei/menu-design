import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    @State var show = false
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Image("PHOTO-1")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .padding(.all, 5)
                    
                    Text("Hello,")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                        .foregroundColor(.white)
                        .padding(.leading, 5)
                    
                    Text("Maruska!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.leading, 5)
                    
                    Button(action: {
                        self.index = 1
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "homekit")
                                .foregroundColor(self.index == 1 ? Color("ButtonColor") : Color.white)
                            
                            Text("Catalogue")
                                .foregroundColor(self.index == 1 ? Color("ButtonColor") : Color.white)
                                .fontWeight(.medium)
                        }.padding(.horizontal)
                            .padding(.top, 10)
                    }
                    
                    
                    Button(action: {
                        self.index = 2
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "cart.fill")
                                .foregroundColor(self.index == 2 ? Color("ButtonColor") : Color.white)
                            
                            Text("Cart")
                                .foregroundColor(self.index == 2 ? Color("ButtonColor") : Color.white)
                                .fontWeight(.medium)
                        }.padding(.horizontal)
                            .padding(.top, 10)
                    }
                    
                    Button(action: {
                        self.index = 3
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(self.index == 3 ? Color("ButtonColor") : Color.white)
                            
                            Text("Favorites")
                                .foregroundColor(self.index == 3 ? Color("ButtonColor") : Color.white)
                                .fontWeight(.medium)
                        }.padding(.horizontal)
                            .padding(.top, 10)
                    }
                    
                    
                    Button(action: {
                        self.index = 4
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        HStack {
                            Image(systemName: "bag.fill")
                                .foregroundColor(self.index == 4 ? Color("ButtonColor") : Color.white)
                            
                            Text("My order")
                                .foregroundColor(self.index == 4 ? Color("ButtonColor") : Color.white)
                                .fontWeight(.medium)
                        }.padding(.horizontal)
                            .padding(.top, 10)
                    }
                    
                    Rectangle()
                        .frame(width: 200, height: 1)
                        .foregroundColor(.white)
                        .padding()
                    
                    Button(action: {
                        //
                    }) {
                        HStack {
                            Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                                .foregroundColor(.white)
                            Text("Out")
                                .foregroundColor(.white)
                        }.padding(.horizontal)
                            .padding(.top, 10)
                    }
                    
                    Spacer()
                }
                
                Spacer(minLength: 0)
                
            }
            .padding(.top, UIApplication
                .shared
                .connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .first { $0.isKeyWindow }?.safeAreaInsets.top)
            .padding(.top, UIApplication
                .shared
                .connectedScenes
                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                .first { $0.isKeyWindow }?.safeAreaInsets.bottom)
            
            VStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                    }
                    
                    Text(self.index == 1 ? "Catalogue" : (self.index == 2 ? "Cart" : (self.index == 3 ? "Favorites" : "My order")))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                        .fontWeight(.bold)
                        .padding(.leading, 5)
                    
                    Spacer(minLength: 0)
                }.padding(.top, UIApplication
                    .shared
                    .connectedScenes
                    .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                    .first { $0.isKeyWindow }?.safeAreaInsets.top)
                .padding()
                
                GeometryReader { _ in
                    if self.index == 2 {
                        Cart()
                    }
                    else if self.index == 3 {
                        Fav()
                    }
                    else if self.index == 1 {
                        Catalogue()
                    }
                    else {
                        Order()
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(self.show ? 30 : 0)
            .scaleEffect(self.show ? 0.9 : 1)
            .offset(x: self.show ? UIScreen.main.bounds.width / 2 :  0, y: self.show ? 15 : 0)
            .rotationEffect(.init(degrees: self.show ? -2 : 0))
        }.background(Color("BackgroundColor")).edgesIgnoringSafeArea(.all)
    }
}

struct Catalogue: View {
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            HStack() {
                Item(image: "dress", name: "Dress", widths: 35, heights: 60)
                Item(image: "electronics", name: "Electro", widths: 80, heights: 60)
                Item(image: "shoes", name: "Shoes", widths: 50, heights: 60)
                Item(image: "pets", name: "For pets", widths: 60, heights: 60)
            }
            HStack {
                Item(image: "child", name: "For child", widths: 45, heights: 60)
                Item(image: "furniture", name: "Furniture", widths: 65, heights: 60)
                Item(image: "toy", name: "Toys", widths: 55, heights: 60)
                Item(image: "bags", name: "Bags", widths: 50, heights: 60)
            }
        }
    }
}


struct Item: View {
    let image: String
    let name: String
    let widths: CGFloat
    let heights: CGFloat
    
    var body: some View {
        Button(action: {
            //
        }) {
            VStack(alignment: .center) {
                Image(image)
                    .resizable()
                    .frame(width: widths, height: heights)
                Text(name)
                    .foregroundColor(.black)
            }.padding(2).padding(.leading)
        }
    }
}

struct Cart: View {
    var body: some View {
        VStack {
            List {
                Good(image: "bicycle", name: "Giant Bicycle KR085", price: 22550)
                Good(image: "mixer", name: "KitchenAid KSM150PSER Artisan Tilt-Head Stand Mixer", price: 50250)
            }
        }
    }
}

struct Good: View {
    let image: String
    let name: String
    let price: Int
    
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 110, height: 80)
                            .foregroundColor(Color("BGColor2"))
                            .shadow(color: .black.opacity(0.4), radius: 1)
                        Image(image)
                            .resizable()
                            .frame(width: 100, height: 70)
                    }.padding(5)
                    
                    VStack {
                        Text("\(price) rub.")
                            .fontWeight(.bold)
                        Text(name)
                    }
                }
                Divider()
                
                HStack {
                    Button(action: {
                        //
                    }) {
                        HStack {
                            Image(systemName: "heart.circle.fill")
                                .foregroundColor(.red)
                            Text("In favorite")
                                .foregroundColor(.black)
                        }
                    }.buttonStyle(PlainButtonStyle())
                        .padding(2)
                    
                    Button(action: {
                        //
                    }) {
                        HStack {
                            Image(systemName: "trash")
                                .foregroundColor(.black)
                            Text("Delete")
                                .foregroundColor(.black)
                        }
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }.padding(5)
            .listRowBackground(Color("BGColor"))
    }
}

struct Fav: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Goods(image: "bicycle", name: "Giant Bicycle KR085", price: "22 550 rub.", widths: 100, heights: 60)
                Goods(image: "mixer", name: "Mixer KitchenAid", price: "50 250 rub.", widths: 100, heights: 60)
            }
            HStack {
                Goods(image: "badminton", name: "Badminton racket n1", price: "2 700 rub.", widths: 70, heights: 80)
                Goods(image: "shampoo", name: "Shampoo LOreal", price: "3 100 rub.", widths: 90, heights: 70)
            }
            HStack {
                Goods(image: "airpods", name: "Apple AirPods", price: "15 300 rub.", widths: 90, heights: 70)
                Goods(image: "macbook", name: "Apple MacBook Air 13 M1", price: "159 000 rub.", widths: 90, heights: 60)
            }
        }
    }
}

struct Goods: View {
    let image: String
    let name: String
    let price: String
    let widths: CGFloat
    let heights: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 170, height: 140)
                .shadow(color: .purple, radius: 3)
                .foregroundColor(Color("BGColor2"))
            Button(action: {
                //
            }) {
                VStack {
                    Image(image)
                        .resizable()
                        .frame(width: widths, height: heights)
                        
                    Text(name)
                        .foregroundColor(.black)
                    Text(price)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
            }
            Image(systemName: "heart.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.red)
                .offset(x: 60, y: -50)
        }.padding(7)
    }
}

struct Order: View {
    var body: some View {
        VStack {
            List {
                Sections(orderNumber: "№ 019202", sum: "5 750 rub.", delivaryDate: "29.03.2022", orderDate: "27.03.2022")
                Sections(orderNumber: "№ 392083", sum: "2 900 rub.", delivaryDate: "22.02.2022", orderDate: "18.02.2022")
                Sections(orderNumber: "№ 262176", sum: "3 520 rub.", delivaryDate: "03.02.2022", orderDate: "01.02.2022")
                Sections(orderNumber: "№ 837295", sum: "7 600 rub.", delivaryDate: "23.01.2022", orderDate: "22.01.2022")
                
                
            }
        }
    }
}

struct Sections: View {
    let orderNumber: String
    let sum: String
    let delivaryDate: String
    let orderDate: String
    
    var body: some View {
        Section {
            VStack(alignment: .leading) {
                Text("Order from \(orderDate)")
                    .fontWeight(.heavy)
                Text(orderNumber)
                
                Divider()
                
                HStack {
                    Text("Delivery date:").fontWeight(.bold)
                    Text(delivaryDate)
                }
                Text("Delivery to the pickup poin")
                
                Divider()
                
                Text(sum)
                    .fontWeight(.bold)
            }
        }.listRowBackground(Color("BGColor"))
    }
}
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
