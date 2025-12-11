import mysql.connector
from datetime import datetime

def get_users_with_permissions():
    """Получает всех пользователей с их ролями и правами"""
    try:
        # Подключение к базе данных cmss
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="cmss"
        )
        
        cursor = conn.cursor(dictionary=True)
        
        # SQL запрос для получения пользователей с ролями и правами
        query = """
        SELECT 
            u.user_id,
            u.username,
            u.email,
            u.first_name,
            u.last_name,
            u.created_at,
            u.is_active,
            GROUP_CONCAT(DISTINCT r.role_name ORDER BY r.role_name) as roles,
            GROUP_CONCAT(DISTINCT p.permission_name ORDER BY p.permission_name) as permissions
        FROM users u
        LEFT JOIN user_roles ur ON u.user_id = ur.user_id
        LEFT JOIN roles r ON ur.role_id = r.role_id
        LEFT JOIN role_permissions rp ON r.role_id = rp.role_id
        LEFT JOIN permissions p ON rp.permission_id = p.permission_id
        GROUP BY u.user_id, u.username, u.email, u.first_name, u.last_name, u.created_at, u.is_active
        ORDER BY u.created_at DESC
        """
        
        cursor.execute(query)
        users = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return users
        
    except mysql.connector.Error as e:
        print(f"Ошибка базы данных: {e}")
        return []

def format_datetime(dt):
    """Форматирует дату и время"""
    if isinstance(dt, datetime):
        return dt.strftime("%d.%m.%Y %H:%M")
    return dt

def print_report(users):
    """Выводит отчет в консоль"""
    print("=" * 80)
    print("ОТЧЕТ: ЗАРЕГИСТРИРОВАННЫЕ ПОЛЬЗОВАТЕЛИ С ПРАВАМИ")
    print("База данных: cmss")
    print(f"Дата формирования: {datetime.now().strftime('%d.%m.%Y %H:%M:%S')}")
    print("=" * 80)
    
    if not users:
        print("\nНет зарегистрированных пользователей")
        return
    
    print(f"\nВсего пользователей: {len(users)}")
    print("\n" + "-" * 80)
    
    for i, user in enumerate(users, 1):
        print(f"\n{i}. ПОЛЬЗОВАТЕЛЬ: {user['username']}")
        print(f"   ID: {user['user_id']}")
        print(f"   Имя: {user['first_name']} {user['last_name']}")
        print(f"   Email: {user['email']}")
        print(f"   Дата регистрации: {format_datetime(user['created_at'])}")
        print(f"   Активен: {'Да' if user['is_active'] else 'Нет'}")
        print(f"   Роли: {user['roles'] if user['roles'] else 'Не назначены'}")
        print(f"   Права: {user['permissions'] if user['permissions'] else 'Нет прав'}")
        
        if i < len(users):
            print("   " + "-" * 70)
    
    print("\n" + "=" * 80)
    
def main():
    print("Подключение к базе данных cmss...")
    
    users = get_users_with_permissions()
    print_report(users)
    
if __name__ == "__main__":
    main()