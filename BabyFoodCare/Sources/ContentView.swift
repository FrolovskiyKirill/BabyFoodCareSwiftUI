import SwiftUI

public struct ContentView: View {
    public init() {}

    public var body: some View {
        HStack {
            Text("Hello, World!")
            Button("fgh") {
                fetchFoodData()
            }
        }

            .padding()
    }
    
    func fetchFoodData() {
        // Убедитесь, что URL корректен. Замените "makar.com/food" на правильный URL, если нужно.
        guard let url = URL(string: "https://makarbass.ru/kir/food") else {
            print("Некорректный URL")
            return
        }
        
        // Создаем задачу для URLSession
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Обработка ошибки
            if let error = error {
                print("Ошибка при выполнении запроса: (error.localizedDescription)")
                return
            }
            
            // Проверка полученных данных
            guard let data = data else {
                print("Данные не получены")
                return
            }
            
            // Преобразуем данные в строку для вывода
            if let responseString = String(data: data, encoding: .utf8) {
                print("Ответ от сервера:")
                print(responseString)
            } else {
                print("Не удалось преобразовать данные в строку")
            }
        }
        
        // Запускаем задачу
        task.resume()
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
