# Visual Style Guide & Content Bible — `[PROJECT_NAME]`

> Универсальный шаблон визуальной конвенции проекта.
> Этот документ отвечает на три вопроса: **как выглядит игра, какие ассеты нужны и как проверить их соответствие**.

**Версия:** `[VERSION]`  
**Дата:** `[DATE]`  
**Статус:** `[DRAFT / APPROVED]`  
**Связанный GDD:** `GDD_SURVIVAL.md`

---

## 1. Визуальное ядро

### 1.1 Краткое описание стиля

`[STYLE_DESCRIPTION: несколько предложений о форме, цвете, свете, детализации и общем настроении]`

### 1.2 Ключевые слова

`[KEYWORD_1]`, `[KEYWORD_2]`, `[KEYWORD_3]`, `[KEYWORD_4]`, `[KEYWORD_5]`

### 1.3 Визуальные принципы

1. **Силуэт:** `[SILHOUETTE_RULE]`
2. **Линия/контур:** `[OUTLINE_RULE]`
3. **Цвет:** `[COLOR_RULE]`
4. **Свет:** `[LIGHTING_RULE]`
5. **Материалы:** `[MATERIAL_RULE]`
6. **Детализация:** `[DETAIL_DENSITY_RULE]`
7. **Читаемость в игре:** `[READABILITY_RULE]`
8. **Комедийность/драматичность:** `[TONE_RULE]`

### 1.4 Что запрещено

- `[FORBIDDEN_STYLE_ELEMENT_1]`
- `[FORBIDDEN_STYLE_ELEMENT_2]`
- Текст, логотипы и watermark внутри генерируемых картинок, если они не являются частью утверждённого ассета.
- Детали, которые не читаются в игровом масштабе.
- Прямая имитация чужих IP вместо самостоятельного стилевого описания.

---

## 2. Технический art pipeline

### 2.1 Общие требования

- Форматы: `[PNG / WEBP / JPG / OTHER]`
- Цветовое пространство: `[SRGB / OTHER]`
- Alpha channel: `[REQUIRED / OPTIONAL]`
- Максимальный размер: `[MAX_TEXTURE_SIZE]`
- Импорт в Godot: `[IMPORT_RULES]`
- Naming convention: `[ASSET_NAMING_RULE]`
- Исходники: `[SOURCE_STORAGE_RULE]`
- `.import` и служебные файлы: `[COMMIT_RULE]`

### 2.2 Правила для 2D-ассетов в локациях

- Рендеринг: `Sprite2D` в 2D top-down/axonometric сцене.
- Визуальное направление: pixel art, ориентированный на Another Dead World и читаемый в масштабе локации.
- Ориентация персонажей: 4 базовых направления; диагонали — после отдельного теста.
- Поворот оружия и точка прицеливания выполняются в Godot, а не запекаются в полный спрайт.
- Тень персонажа — отдельный слой или отдельный `Sprite2D`.
- Pivot/anchor: единая точка под ногами/центром основания персонажа для всех слоёв.
- Минимальный размер персонажа на экране: `[READABLE_PIXEL_SIZE]`.
- Не делать один полный спрайт на каждую комбинацию одежды и оружия: использовать слои.

### 2.3 Pixel-art персонажный pipeline

**Базовый кадр:** `64×64 px` на один слой. Внутри кадра персонаж обычно занимает примерно 32–48 px по высоте.

**Первый спрайтшит:** 4 направления × 4–6 кадров анимации. Рекомендуемая раскладка:

```text
columns = animation frames
rows    = directions

row 0: down
row 1: left
row 2: right
row 3: up
```

Для 4 кадров это лист `256×256 px`; для 6 кадров — `384×256 px`. Каждый слой — отдельный лист с абсолютно одинаковой сеткой кадров.

Минимальные слои:

```text
shadow
legs
body
head/hair
armor/clothes
arms
weapon
fx
```

В Godot каждый слой — отдельный `Sprite2D` с одинаковыми `hframes`/`vframes`. `AnimationPlayer` синхронно меняет `frame` у всех слоёв, а `WeaponPivot` отвечает за направление оружия и прицеливание.

Порядок отрисовки:

```text
shadow → legs → body → head/hair → armor → arms → weapon → effects
```

Технические правила:

- Import Filter: nearest.
- Mipmaps: disabled.
- Texture filtering: disabled.
- Масштабирование: integer scale, когда это возможно.
- Не смешивать разные размеры кадра внутри одного персонажного набора.
- Все новые части тела должны проверяться поверх базового персонажа до создания массового контента.

### 2.3 Таблица технических пресетов

| Категория | Исходный размер | Финальный формат | Alpha | Godot import | Папка |
|---|---:|---|---|---|---|
| Персонаж/враг | `[SIZE]` | `[FORMAT]` | `[YES/NO]` | `[SETTINGS]` | `[PATH]` |
| Предмет | `[SIZE]` | `[FORMAT]` | `[YES/NO]` | `[SETTINGS]` | `[PATH]` |
| Карта/иллюстрация | `[SIZE]` | `[FORMAT]` | `[YES/NO]` | `[SETTINGS]` | `[PATH]` |
| Текстура окружения | `[SIZE]` | `[FORMAT]` | `[YES/NO]` | `[SETTINGS]` | `[PATH]` |
| UI | `[SIZE]` | `[FORMAT]` | `[YES/NO]` | `[SETTINGS]` | `[PATH]` |

---

## 3. Палитра и материалы

### 3.1 Палитра

| Роль | Цвет | Применение |
|---|---|---|
| Primary | `[HEX/RGB]` | `[USE]` |
| Secondary | `[HEX/RGB]` | `[USE]` |
| Accent | `[HEX/RGB]` | `[USE]` |
| Danger | `[HEX/RGB]` | `[USE]` |
| Reward | `[HEX/RGB]` | `[USE]` |
| Neutral | `[HEX/RGB]` | `[USE]` |

### 3.2 Материалы окружения

| Материал | Поверхность | Цвет/текстура | Особенность |
|---|---|---|---|
| `[MATERIAL]` | `[SURFACE]` | `[PALETTE]` | `[DETAIL]` |

### 3.3 Свет и атмосфера

- Основной источник света: `[LIGHT_SOURCE]`
- Цветовая температура: `[TEMPERATURE]`
- Контраст: `[CONTRAST]`
- Туман/объёмный свет: `[FOG_RULE]`
- VFX-сигналы опасности и награды: `[VFX_LANGUAGE]`

---

## 4. Prompt conventions

### 4.1 Общий prompt prefix

```text
[STYLE_PREFIX]
```

### 4.2 Общий negative prompt

```text
[NEGATIVE_PROMPT]
```

### 4.3 Персонаж/враг

```text
Create a [CHARACTER_ROLE] for [PROJECT_NAME].
Concept: [CHARACTER_CONCEPT].
Silhouette: [SILHOUETTE].
Pose and view: [POSE_AND_VIEW].
Style: [STYLE_DESCRIPTION].
Background: transparent, centered composition, safe padding.
Technical: [FORMAT_AND_SIZE], no text, no logo, no watermark.
```

### 4.4 Предмет/лут

```text
Create a game item sprite for [ITEM_ID].
Object: [OBJECT_DESCRIPTION].
Function communicated by shape: [GAMEPLAY_READABILITY].
Style: [STYLE_DESCRIPTION].
Composition: centered, strong silhouette, transparent background.
Technical: [FORMAT_AND_SIZE], no text, no logo, no watermark.
```

### 4.5 Карта/иллюстрация

```text
Create vertical card art for [CARD_ID].
Action or effect: [CARD_EFFECT].
Scene: [SCENE_DESCRIPTION].
Composition: [COMPOSITION].
Style: [STYLE_DESCRIPTION].
Technical: [FORMAT_AND_SIZE], [BACKGROUND_RULE], no text, no logo, no watermark.
```

### 4.6 Текстура окружения

```text
Create a seamless texture for [SURFACE].
Material and details: [MATERIAL_DESCRIPTION].
Palette: [PALETTE].
Style: [STYLE_DESCRIPTION].
Technical: seamless, tileable, [FORMAT_AND_SIZE], no text, no logo, no watermark.
```

### 4.7 UI иконка/рамка

```text
Create a readable game UI asset for [UI_ID].
Meaning: [MEANING].
Shape and materials: [SHAPE_AND_MATERIALS].
Style: [STYLE_DESCRIPTION].
Composition: centered, safe padding, readable at [SMALL_SIZE].
Technical: [FORMAT_AND_SIZE], transparent background, no text, no logo, no watermark.
```

---

## 5. Content bible

Названия ниже являются рабочими ID. Каждый ассет должен иметь игровую роль, место использования и приоритет.

### 5.1 Персонажи и враги

| ID | Отображаемое имя | Роль | Где используется | Силуэт/идея | Ассет | Приоритет | Статус |
|---|---|---|---|---|---|---|---|
| `[ENTITY_ID]` | `[NAME]` | `[ROLE]` | `[LOCATION]` | `[VISUAL_CONCEPT]` | `[ASSET_TYPE]` | `[P0/P1/P2]` | `[TODO/READY]` |

### 5.2 NPC и события

| ID | Функция | Сцена/зона | Визуальная идея | Ассет | Приоритет | Статус |
|---|---|---|---|---|---|---|
| `[NPC_ID]` | `[FUNCTION]` | `[LOCATION]` | `[CONCEPT]` | `[ASSET_TYPE]` | `[P0/P1/P2]` | `[STATUS]` |

### 5.3 Предметы и ресурсы

| ID | Тип | Эффект/роль | Визуальная идея | Ассет | Приоритет | Статус |
|---|---|---|---|---|---|---|
| `[ITEM_ID]` | `[TYPE]` | `[EFFECT]` | `[CONCEPT]` | `[ASSET_TYPE]` | `[P0/P1/P2]` | `[STATUS]` |

### 5.4 Карты/способности

| ID | Тип | Эффект | Визуальная сцена | Рамка/редкость | Приоритет | Статус |
|---|---|---|---|---|---|---|
| `[CARD_ID]` | `[TYPE]` | `[EFFECT]` | `[SCENE]` | `[RARITY]` | `[P0/P1/P2]` | `[STATUS]` |

### 5.5 Энкаунтеры и маркеры

| ID | Тип | Значение игроку | Цвет/символ | Где используется | Статус |
|---|---|---|---|---|---|
| `[ICON_ID]` | `[ENCOUNTER_TYPE]` | `[MEANING]` | `[COLOR_SYMBOL]` | `[LOCATION]` | `[STATUS]` |

### 5.6 Окружение и текстуры

| ID | Поверхность/объект | Где используется | Материал и детали | Формат | Статус |
|---|---|---|---|---|---|
| `[TEXTURE_ID]` | `[SURFACE]` | `[LOCATION]` | `[CONCEPT]` | `[FORMAT]` | `[STATUS]` |

### 5.7 UI, портреты и рамки

| ID | Тип | Использование | Размер/формат | Связанный экран | Статус |
|---|---|---|---|---|---|
| `[UI_ID]` | `[TYPE]` | `[USE]` | `[SIZE/FORMAT]` | `[SCREEN]` | `[STATUS]` |

---

## 6. P0-набор для первого визуального прохода

В первый проход входят только ассеты, необходимые для проверки читаемости и core loop:

1. `[P0_ASSET_1]`
2. `[P0_ASSET_2]`
3. `[P0_ASSET_3]`
4. `[P0_ASSET_4]`
5. `[P0_ASSET_5]`

Критерии P0:

- ассет используется в реальном игровом сценарии;
- его роль понятна без текста;
- он соответствует палитре и силуэту;
- он читается в целевом масштабе;
- он оптимизирован для целевой платформы.

---

## 7. Asset review checklist

### Художественная проверка

- [ ] Соответствует визуальному ядру.
- [ ] Совпадает с утверждённой палитрой.
- [ ] Имеет читаемый силуэт.
- [ ] Не содержит случайного текста, логотипов или watermark.
- [ ] Не нарушает правила IP/референсов.

### Техническая проверка

- [ ] Правильный формат и размер.
- [ ] Правильный alpha/background.
- [ ] Правильное имя файла и папка.
- [ ] Корректно импортируется в Godot.
- [ ] Не создаёт лишние draw calls или слишком большой размер сборки.
- [ ] Проверен в сцене, а не только отдельно.

### Игровая проверка

- [ ] Ассет имеет конкретную роль в GDD.
- [ ] Игрок понимает его назначение.
- [ ] Он не теряется на фоне окружения.
- [ ] Варианты одной категории визуально согласованы.

---

## 8. Naming convention

```text
[category]_[semantic_name]_[variant]
```

Примеры-шаблоны:

- `[enemy]_[role]_[variant]`
- `[item]_[type]_[variant]`
- `[card]_[effect]_[variant]`
- `[tex]_[surface]_[variant]`
- `[ui]_[screen_or_function]_[variant]`

Запрещать в именах: пробелы, непредсказуемые номера, `final_final`, названия без игровой роли.

---

## 9. Журнал визуальных решений

| Дата | Решение | Причина | Затронутые категории |
|---|---|---|---|
| `[DATE]` | `[DECISION]` | `[RATIONALE]` | `[CATEGORIES]` |
