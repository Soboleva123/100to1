import SwiftUI
import AVFoundation

struct Answer: Identifiable, Equatable {
    let id = UUID()
    let text: String
    let points: Int
}

struct Question: Identifiable, Equatable {
    let id = UUID()
    let text: String
    let answers: [Answer]
}

struct QuestionProgress: Identifiable {
    let id = UUID()
    let question: Question
    var guessedAnswers: [Answer] = []
    var completed: Bool = false
}

enum ActiveAlert: Identifiable {
    case timeOut, congrats

    var id: Int { hashValue }
}

struct ContentView: View {
    let allQuestions: [Question] = [
        Question(text: "Что берут с собой на пляж?", answers: [
            Answer(text: "Полотенце", points: 30),
            Answer(text: "Купальник", points: 25),
            Answer(text: "Солнцезащитный крем", points: 20),
            Answer(text: "Очки", points: 10),
            Answer(text: "Шляпа", points: 8),
            Answer(text: "Матрас", points: 7)
        ]),
        Question(text: "Что обычно кладут в рюкзак в поход?", answers: [
            Answer(text: "Спальный мешок", points: 30),
            Answer(text: "Котелок", points: 25),
            Answer(text: "Фонарик", points: 20),
            Answer(text: "Аптечка", points: 15),
            Answer(text: "Карта", points: 10),
            Answer(text: "Вода", points: 8)
        ]),
        Question(text: "Какие овощи используют для салата 'Оливье'?", answers: [
            Answer(text: "Картофель", points: 30),
            Answer(text: "Морковь", points: 25),
            Answer(text: "Горошек", points: 20),
            Answer(text: "Лук", points: 15),
            Answer(text: "Яйцо", points: 10),
            Answer(text: "Огурец", points: 8)
        ]),
        Question(text: "Что можно увидеть на морском берегу?", answers: [
            Answer(text: "Ракушки", points: 30),
            Answer(text: "Волну", points: 25),
            Answer(text: "Песок", points: 20),
            Answer(text: "Корабль", points: 15),
            Answer(text: "Чайку", points: 10),
            Answer(text: "Камни", points: 8)
        ]),
        Question(text: "Что кладут в букет цветов?", answers: [
            Answer(text: "Розы", points: 30),
            Answer(text: "Лилии", points: 25),
            Answer(text: "Гвоздики", points: 20),
            Answer(text: "Тюльпаны", points: 15),
            Answer(text: "Хризантемы", points: 10),
            Answer(text: "Ландыши", points: 8)
        ]),
        Question(text: "Что берут с собой на пикник?", answers: [
            Answer(text: "Корзину", points: 30),
            Answer(text: "Плед", points: 25),
            Answer(text: "Сэндвичи", points: 20),
            Answer(text: "Напитки", points: 15),
            Answer(text: "Посуда", points: 10),
            Answer(text: "Салфетки", points: 8)
        ]),
        Question(text: "Какие фрукты бывают красного цвета?", answers: [
            Answer(text: "Яблоко", points: 30),
            Answer(text: "Клубника", points: 25),
            Answer(text: "Вишня", points: 20),
            Answer(text: "Малина", points: 15),
            Answer(text: "Гранат", points: 10),
            Answer(text: "Арбуз", points: 8)
        ]),
        Question(text: "Что нужно для приготовления омлета?", answers: [
            Answer(text: "Яйца", points: 30),
            Answer(text: "Молоко", points: 25),
            Answer(text: "Соль", points: 20),
            Answer(text: "Перец", points: 15),
            Answer(text: "Масло", points: 10),
            Answer(text: "Зелень", points: 8)
        ]),
        Question(text: "Какие домашние животные часто заводят?", answers: [
            Answer(text: "Собака", points: 30),
            Answer(text: "Кошка", points: 25),
            Answer(text: "Попугай", points: 20),
            Answer(text: "Хомяк", points: 15),
            Answer(text: "Аквариумные рыбки", points: 10),
            Answer(text: "Кролик", points: 8)
        ]),
        Question(text: "Что нужно для приготовления чая?", answers: [
            Answer(text: "Вода", points: 30),
            Answer(text: "Чайный пакетик", points: 25),
            Answer(text: "Сахар", points: 20),
            Answer(text: "Лимон", points: 15),
            Answer(text: "Молоко", points: 10),
            Answer(text: "Мед", points: 8)
        ]),
        Question(text: "Какие цвета есть в радуге?", answers: [
            Answer(text: "Красный", points: 30),
            Answer(text: "Оранжевый", points: 25),
            Answer(text: "Жёлтый", points: 20),
            Answer(text: "Зелёный", points: 15),
            Answer(text: "Голубой", points: 10),
            Answer(text: "Фиолетовый", points: 8)
        ]),
        Question(text: "Что обычно кладут в школьный рюкзак?", answers: [
            Answer(text: "Тетради", points: 30),
            Answer(text: "Ручки", points: 25),
            Answer(text: "Учебники", points: 20),
            Answer(text: "Ланчбокс", points: 15),
            Answer(text: "Пенал", points: 10),
            Answer(text: "Бутылка с водой", points: 8)
            ]),
            Question(text: "Какие напитки бывают холодными?", answers: [
                Answer(text: "Сок", points: 30),
                Answer(text: "Минеральная вода", points: 25),
                Answer(text: "Лимонад", points: 20),
                Answer(text: "Коктейль", points: 15),
                Answer(text: "Квас", points: 10),
                Answer(text: "Холодный чай", points: 8)
            ]),
            Question(text: "Что обычно берут с собой в спортзал?", answers: [
                Answer(text: "Спортивная одежда", points: 30),
                Answer(text: "Кроссовки", points: 25),
                Answer(text: "Полотенце", points: 20),
                Answer(text: "Вода", points: 15),
                Answer(text: "Плеер", points: 10),
                Answer(text: "Спортивная сумка", points: 8)
            ]),
            Question(text: "Какие овощи бывают зелёного цвета?", answers: [
                Answer(text: "Огурец", points: 30),
                Answer(text: "Салат", points: 25),
                Answer(text: "Брокколи", points: 20),
                Answer(text: "Зеленый горошек", points: 15),
                Answer(text: "Перец", points: 10),
                Answer(text: "Киви", points: 8)
            ]),
            Question(text: "Что часто используется для письма?", answers: [
                Answer(text: "Ручка", points: 30),
                Answer(text: "Карандаш", points: 25),
                Answer(text: "Маркер", points: 20),
                Answer(text: "Ластик", points: 15),
                Answer(text: "Тетрадь", points: 10),
                Answer(text: "Блокнот", points: 8)
            ]),
            Question(text: "Какие виды транспорта бывают?", answers: [
                Answer(text: "Автомобиль", points: 30),
                Answer(text: "Поезд", points: 25),
                Answer(text: "Самолёт", points: 20),
                Answer(text: "Велосипед", points: 15),
                Answer(text: "Мотоцикл", points: 10),
                Answer(text: "Корабль", points: 8)
            ]),
            Question(text: "Что носят зимой?", answers: [
                Answer(text: "Шапка", points: 30),
                Answer(text: "Шарф", points: 25),
                Answer(text: "Перчатки", points: 20),
                Answer(text: "Пальто", points: 15),
                Answer(text: "Сапоги", points: 10),
                Answer(text: "Тёплые носки", points: 8)
            ]),
            Question(text: "Какие инструменты используют в саду?", answers: [
                Answer(text: "Лопата", points: 30),
                Answer(text: "Грабли", points: 25),
                Answer(text: "Секатор", points: 20),
                Answer(text: "Поливалка", points: 15),
                Answer(text: "Тачка", points: 10),
                Answer(text: "Перчатки", points: 8)
            ]),
            Question(text: "Что берут в дорогу на машине?", answers: [
                Answer(text: "Навигатор", points: 30),
                Answer(text: "Запасное колесо", points: 25),
                Answer(text: "Аптечка", points: 20),
                Answer(text: "Еда", points: 15),
                Answer(text: "Вода", points: 10),
                Answer(text: "Инструменты", points: 8)
            ]),
            Question(text: "Какие сладости любят дети?", answers: [
                Answer(text: "Шоколад", points: 30),
                Answer(text: "Мороженое", points: 25),
                Answer(text: "Конфеты", points: 20),
                Answer(text: "Пирожные", points: 15),
                Answer(text: "Жевательная резинка", points: 10),
                Answer(text: "Печенье", points: 8)
            ]),
            Question(text: "Что делают на кухне?", answers: [
                Answer(text: "Готовят", points: 30),
                Answer(text: "Моют посуду", points: 25),
                Answer(text: "Нарезают", points: 20),
                Answer(text: "Моют овощи", points: 15),
                Answer(text: "Убирают", points: 10),
                Answer(text: "Сервируют стол", points: 8)
            ]),
            Question(text: "Что нужно для рисования?", answers: [
                Answer(text: "Кисти", points: 30),
                Answer(text: "Краски", points: 25),
                Answer(text: "Палитра", points: 20),
                Answer(text: "Холст", points: 15),
                Answer(text: "Мольберт", points: 10),
                Answer(text: "Карандаши", points: 8)
            ]),
            Question(text: "Какие языки программирования знаете?", answers: [
                Answer(text: "Swift", points: 30),
                Answer(text: "Python", points: 25),
                Answer(text: "Java", points: 20),
                Answer(text: "C++", points: 15),
                Answer(text: "JavaScript", points: 10),
                Answer(text: "Kotlin", points: 8)
            ]),
            Question(text: "Что делают на уроке физики?", answers: [
                Answer(text: "Проводят опыты", points: 30),
                Answer(text: "Решают задачи", points: 25),
                Answer(text: "Изучают законы", points: 20),
                Answer(text: "Делают выводы", points: 15),
                Answer(text: "Записывают формулы", points: 10),
                Answer(text: "Обсуждают теории", points: 8)
            ])
    ]

    @State private var progresses: [QuestionProgress] = []
    @State private var selectedProgressIndex: Int? = nil
    @State private var userInput = ""
    @State private var score = 0
    @State private var message = ""
    @State private var timeRemaining = 90
    @State private var timerRunning = false
    @State private var activeAlert: ActiveAlert? = nil
    @FocusState private var isInputFocused: Bool

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var correctSound: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "correct", withExtension: "mp3") else { return nil }
        return try? AVAudioPlayer(contentsOf: url)
    }()

    var wrongSound: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "wrong", withExtension: "mp3") else { return nil }
        return try? AVAudioPlayer(contentsOf: url)
    }()

    var body: some View {
        
        VStack {
            if let index = selectedProgressIndex {
                let progress = progresses[index]
                VStack(spacing: 15) {
                    Text(progress.question.text)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Text("Осталось времени: \(timeRemaining) сек")
                        .foregroundColor(timeRemaining <= 10 ? .red : .primary)
                    
                    TextField("Введите ответ", text: $userInput, onCommit: {
                        if timerRunning {
                            checkAnswer(for: index)
                            DispatchQueue.main.async {
                                userInput = ""
                                isInputFocused = true
                            }
                        }
                    })
                    .focused($isInputFocused)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(!timerRunning)
                    
                    Button("Ответить", systemImage: "checkmark.circle.fill") {
                        checkAnswer(for: index)
                        DispatchQueue.main.async {
                            userInput = ""
                            isInputFocused = true
                        }
                    }
                    .disabled(!timerRunning)
                    .buttonStyle(.borderedProminent)
                    
                    Text("Очки: \(score)")
                    
                    List(progress.guessedAnswers.sorted { $0.points > $1.points }) { answer in
                        HStack {
                            Text(answer.text)
                            Spacer()
                            Text("+\(answer.points)")
                        }
                    }
                    
                    Text(message)
                        .foregroundColor(.red)
                    Button("Вернуться к списку") {
                                            selectedProgressIndex = nil
                                            timerRunning = false
                                            userInput = ""
                                        }
                                        .buttonStyle(.bordered)
                                    }
                                    .padding()
                                } else {
                                    ScrollView{
                                        VStack(spacing: 15) {
                                            Text("Выберите вопрос:")
                                                .font(.headline)

                                            ScrollView {
                                                VStack(spacing: 10) {
                                                    ForEach(progresses.indices, id: \.self) { i in
                                                        let progress = progresses[i]
                                                        Button(action: {
                                                            selectedProgressIndex = i
                                                            timeRemaining = 90
                                                            timerRunning = true
                                                            activeAlert = nil
                                                            message = ""
                                                            userInput = ""
                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                                isInputFocused = true
                                                            }
                                                        }) {
                                                            HStack {
                                                                Text(progress.question.text)
                                                                Spacer()
                                                                if progress.guessedAnswers.count == progress.question.answers.count {
                                                                    Text("✅").foregroundColor(.green)
                                                                } else if !progress.guessedAnswers.isEmpty {
                                                                    Text("⏳").foregroundColor(.orange)
                                                                } else {
                                                                    Text("🆕").foregroundColor(.blue)
                                                                }
                                                            }
                                                            .padding()
                                                            .background(Color(.systemGray6))
                                                            .cornerRadius(8)
                                                        }
                                                    }
                                    }
                                                .padding(.vertical)
                                                .padding(.bottom)
                                            }
                                            .padding()
                                        }
                                    }
                                    .padding()
                                }
                            }
                            .onAppear {
                                progresses = allQuestions.map { QuestionProgress(question: $0) }
                            }
                            .onReceive(timer) { _ in
                                if timerRunning && timeRemaining > 0 {
                                    timeRemaining -= 1
                                } else if timerRunning {
                                    timerRunning = false
                                    if let index = selectedProgressIndex,
                                       progresses[index].guessedAnswers.count < progresses[index].question.answers.count {
                                        activeAlert = .timeOut
                                    }
                                }
                            }
                            .alert(item: $activeAlert) { alertType in
                                switch alertType {
                                case .timeOut:
                                    return Alert(
                                        title: Text("Время вышло!"),
                                        message: Text("Хотите попробовать ещё 90 секунд или перейти к следующему вопросу?"),
                                        primaryButton: .default(Text("Ещё 90 секунд"), action: {
                                            timeRemaining = 90
                                            timerRunning = true
                                            activeAlert = nil
                                        }),
                                        secondaryButton: .cancel(Text("Следующий вопрос"), action: {
                                            if let index = selectedProgressIndex {
                                                if progresses[index].guessedAnswers.count == progresses[index].question.answers.count {
                                                    progresses[index].completed = true
                                                }
                                            }
                                            selectedProgressIndex = nil
                                            activeAlert = nil
                                        })
                                    )
                                case .congrats:
                                    return Alert(
                                        title: Text("Поздравляем!"),
                                        message: Text("Вы угадали все ответы."),
                                        dismissButton: .default(Text("Следующий вопрос"), action: {
                                                                if let index = selectedProgressIndex {
                                                                    progresses[index].completed = true
                                                                    selectedProgressIndex = nil
                                                                }
                                                                activeAlert = nil
                                                            })
                                                        )
                                                    }
                                                }
                                            }

                                            func checkAnswer(for index: Int) {
                                                let trimmed = userInput.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
                                                let question = progresses[index].question

                                                if let match = question.answers.first(where: { $0.text.lowercased() == trimmed }) {
                                                    if !progresses[index].guessedAnswers.contains(match) {
                                                        progresses[index].guessedAnswers.append(match)
                                                        score += match.points
                                                        message = "Верно!"
                                                        correctSound?.play()
                                                    } else {
                                                        message = "Уже было!"
                                                        wrongSound?.play()
                                                    }
                                                } else {
                                                    message = "Неверно!"
                                                    wrongSound?.play()
                                                }

                                                userInput = ""

                                                if progresses[index].guessedAnswers.count == question.answers.count {
                                                    progresses[index].completed = true
                                                    timerRunning = false
                                                    activeAlert = .congrats
                                                }
                                            }
                                        }
#Preview {
    ContentView()
}
