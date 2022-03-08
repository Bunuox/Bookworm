//
//  CoreDataUI.swift
//  Bookworm
//
//  Created by Bünyamin Kılıçer on 22.02.2022.
//

import SwiftUI

struct CoreDataUI: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            Button("Add") {
                let firstNames = ["Ginny","Harry","Hermione"]
                let lastNames = ["Grange","Lovegood","Potter"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save()
            }
        }
    }
}

struct CoreDataUI_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataUI()
    }
}
