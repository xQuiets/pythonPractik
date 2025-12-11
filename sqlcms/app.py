from flask import Flask, request
import mysql.connector

app = Flask(__name__)

# Конфигурация базы данных
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'cmss'
}

def check_user_in_db(username, password):
    """Проверяет пользователя в базе данных"""
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor(dictionary=True)
        
        # Ищем пользователя по username
        query = "SELECT * FROM users WHERE username = %s"
        cursor.execute(query, (username,))
        user = cursor.fetchone()
        
        cursor.close()
        conn.close()
        
        if user:
            # Проверяем пароль (сравниваем с password_hash из БД)
            if user['password_hash'] == password:  # Простое сравнение
                return True, user
        return False, None
        
    except Exception as e:
        print(f"Ошибка базы данных: {e}")
        return False, None

# Задание 4: Простой роут
@app.route('/')
def index():
    return '<h1>Веб-сервер работает!</h1><p><a href="/login">Перейти к авторизации</a></p>'

# Задания 5, 6, 7: Авторизация
@app.route('/login', methods=['GET', 'POST'])
def login():
    # Форма авторизации
    html_form = '''
    <h2>Авторизация</h2>
    <form method="POST">
        Логин: <input type="text" name="username"><br><br>
        Пароль: <input type="password" name="password"><br><br>
        <input type="submit" value="Войти">
    </form>
    '''
    
    if request.method == 'POST':
        username = request.form.get('username', '')
        password = request.form.get('password', '')
        
        print(f"Получены данные из формы:")
        print(f"Логин: {username}")
        print(f"Пароль: {password}")
        
        # Проверка в базе данных
        is_valid, user = check_user_in_db(username, password)
        
        # Задание 7: Результат
        if is_valid:
            print(f"✅ Успешная авторизация для пользователя: {username}")
            print(f"   ID: {user['user_id']}")
            print(f"   Имя: {user['first_name']} {user['last_name']}")
            print(f"   Email: {user['email']}")
            result = '<p style="color: green;"> Успешная авторизация</p>'
        else:
            print("❌ Неверный логин или пароль")
            result = '<p style="color: red;"> Неверный логин или пароль</p>'
        
        return html_form + result
    
    return html_form

if __name__ == '__main__':
    print("\nСервер: http://127.0.0.1:5000")
    app.run(debug=True)