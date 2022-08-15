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
                    if self.index == 1 {
                        Catalogue()
                    }
                    else if self.index == 2 {
                        Cart()
                    }
                    else if self.index == 3 {
                        Fav()
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
        Text("Catalogue")
            .padding()
    }
}

struct Cart: View {
    var body: some View {
        Text("Cart")
            .padding()
    }
}

struct Fav: View {
    var body: some View {
        VStack {
            HStack {
                Goods(image: "bicycle", name: "Giant Bicycle KR085", price: "22 550 rub.", widths: 100, heights: 60)
                Goods(image: "mixer", name: "Mixer KitchenAid", price: "50 250 rub.", widths: 100, heights: 60)
            }
            HStack{
                Goods(image: "badminton", name: "Badminton Racket N1", price: "2 700 rub.", widths: 70, heights: 80)
                Goods(image: "shampoo", name: "Lotion/Shampoo LOreal", price: "3 100 rub.", widths: 90, heights: 70)
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
                .frame(width: 165, height: 140)
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
        }.padding(4)
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
        Section(header: Text("Order calendar:")) {
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
