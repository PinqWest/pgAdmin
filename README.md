# 📊 База данных недвижимости

Этот проект представляет собой базу данных для управления объектами недвижимости, их продажами, оценками и риелторами.

## 🚀 Запуск

1. Установите PostgreSQL (или другую СУБД, совместимую с SQL).
2. Создайте новую базу данных:
   ```sql
   CREATE DATABASE real_estate_db;
   ```
3. Выполните скрипт `main.sql` для создания структуры базы данных:
   ```bash
   psql -U <username> -d real_estate_db -f main.sql
   ```

## 🗄 Структура базы данных

### 1. building_types — типы зданий
| Поле       | Тип           | Описание |
|------------|--------------|----------|
| type_code  | SERIAL PK    | Код типа |
| type_name  | VARCHAR(255) | Название типа |

### 2. districts — районы
| Поле          | Тип           | Описание |
|---------------|--------------|----------|
| district_code | SERIAL PK    | Код района |
| district_name | VARCHAR(255) | Название района |

### 3. building_materials — строительные материалы
| Поле          | Тип           | Описание |
|---------------|--------------|----------|
| material_code | SERIAL PK    | Код материала |
| material_name | VARCHAR(255) | Название материала |

### 4. real_estate_objects — объекты недвижимости
| Поле            | Тип           | Описание |
|-----------------|--------------|----------|
| object_code     | SERIAL PK    | Код объекта |
| district        | INT          | Район (FK → districts) |
| address         | VARCHAR(255) | Адрес |
| floor           | SMALLINT     | Этаж |
| rooms_count     | SMALLINT     | Кол-во комнат |
| type            | SMALLINT     | Тип здания (FK → building_types) |
| status          | BOOLEAN      | Статус (активен/продан) |
| price           | INT          | Цена |
| description     | TEXT         | Описание |
| building_material | INT        | Материал (FK → building_materials) |
| area            | SMALLINT     | Площадь (м²) |
| listing_date    | DATE         | Дата размещения |

### 5. evaluation_criteria — критерии оценки
| Поле           | Тип           | Описание |
|----------------|--------------|----------|
| criterion_code | SERIAL PK    | Код критерия |
| criterion_name | VARCHAR(255) | Название критерия |

### 6. evaluations — оценки объектов
| Поле           | Тип              | Описание |
|----------------|-----------------|----------|
| evaluation_code| SERIAL PK       | Код оценки |
| object_code    | INT FK          | Объект (FK → real_estate_objects) |
| evaluation_date| DATE            | Дата оценки |
| criterion_code | SMALLINT FK     | Критерий (FK → evaluation_criteria) |
| score          | DOUBLE PRECISION| Балл |

### 7. realtors — риелторы
| Поле         | Тип           | Описание |
|--------------|--------------|----------|
| realtor_code | SERIAL PK    | Код риелтора |
| last_name    | VARCHAR(255) | Фамилия |
| first_name   | VARCHAR(255) | Имя |
| middle_name  | VARCHAR(255) | Отчество |
| phone_number | VARCHAR(255) | Телефон |

### 8. sales — продажи
| Поле       | Тип              | Описание |
|------------|-----------------|----------|
| sale_code  | SERIAL PK       | Код продажи |
| object_code| INT FK          | Объект (FK → real_estate_objects) |
| sale_date  | DATE            | Дата продажи |
| realtor_code| INT FK         | Риелтор (FK → realtors) |
| price      | DOUBLE PRECISION| Цена продажи |

## 🔗 Связи между таблицами

- `real_estate_objects.district` → `districts.district_code`
- `real_estate_objects.type` → `building_types.type_code`
- `real_estate_objects.building_material` → `building_materials.material_code`
- `evaluations.object_code` → `real_estate_objects.object_code`
- `evaluations.criterion_code` → `evaluation_criteria.criterion_code`
- `sales.object_code` → `real_estate_objects.object_code`
- `sales.realtor_code` → `realtors.realtor_code`

## 📌 Пример запроса

Получить все активные объекты недвижимости с ценой выше 5 млн:
```sql
SELECT r.object_code, r.address, r.price, d.district_name, t.type_name
FROM real_estate_objects r
JOIN districts d ON r.district = d.district_code
JOIN building_types t ON r.type = t.type_code
WHERE r.status = TRUE AND r.price > 5000000;
```

---
👤 Автор: Гарибов Хаял
