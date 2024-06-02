import SwiftUI

struct ContentView: View {
    @State private var isDark  = false



    var body: some View {
        ZStack{
            GradientColorForApp(isDark: $isDark)
            VStack(spacing: 4)
            {
                //MainDay Detail
                MainDayWheaterDetail(dayLocation: "Nepal, Kapilvastu", dayIcon:isDark ? "moon.stars.fill": "sun.max.fill", dayTemp: 31)

                .padding(.bottom,50)

                HStack(spacing:20)
                {
                    DayOfWeek(NameofDay: "TUE", dayOfWeek: 30, IconName: "cloud.sun.rain.fill")
                    DayOfWeek(NameofDay: "TUE", dayOfWeek: 28, IconName: "cloud.rain.fill")
                    DayOfWeek(NameofDay: "TUE", dayOfWeek: 13, IconName: "snowflake")

                }

                Spacer()
                Button{
                    isDark.toggle()

                }label:{
                    Text("Change the Theme")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font( .system(size: 18, weight: .heavy,design: .default))
                        .cornerRadius(10)
                }
                Spacer()

            }
        }
    }
}

#Preview {
    ContentView()
}


struct DayOfWeek: View {
    var NameofDay: String
    var dayOfWeek: Int
    var IconName: String
    var body: some View {
            VStack()
            {
                Text(NameofDay)
                    .font(.system(size: 30,weight: .medium,design: .default))
                    .foregroundColor(.white)
                Image(systemName: IconName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:80,height: 80)

                Text("\(dayOfWeek)°")
                    .font(.system(size: 40,weight: .medium,design: .default))
                    .foregroundColor(.white)
            }


    }
}
//For Background Color of the main screen
struct GradientColorForApp: View {
    //using Blinding Concepts
    @Binding var isDark : Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors:[isDark ? .black : .blue, isDark ? .gray : Color("lightBlue")] ),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MainDayWheaterDetail: View
{
    var dayLocation : String
    var dayIcon: String
    var dayTemp: Int
    var body: some View
    {
        Text(dayLocation)
            .font(.system(size: 32,weight: .medium,design: .default))
            .foregroundColor(.white)
            .padding()
        VStack
        {
            Image(systemName: dayIcon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:150,height: 150)
            Text("\(dayTemp)°")
                .font(.system(size: 60,weight: .medium,design: .default))
                .foregroundColor(.white)
            
        }
    }
}
