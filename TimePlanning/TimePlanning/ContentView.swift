//
//  ContentView.swift
//  TimePlanning
//
//  Created by 沙睿 on 2021/4/14.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    @State var viewsSource = [String]()
    @State var cols = [GridItem]()
    var body: some View {
        GeometryReader { geometry in
            VStack {
                WidgetItem(columns: $cols, viewsSource: $viewsSource)
                SwiftUIViewPlanDefault().fixedSize().frame(width: 200, height: 200)
            }
            .onAppear() {
                initializeTheData()
            }
        }
    }
    
    private func initializeTheData() {
        self.cols = []
        let index = 2
        for _ in 0..<index {
            self.cols.append(GridItem(.flexible(),spacing: 5))
        }
        self.viewsSource.append("SwiftUIViewClock")
        self.viewsSource.append("SwiftUIViewClock")
        self.viewsSource.append("SwiftUIViewClock")
    }
    
   
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
