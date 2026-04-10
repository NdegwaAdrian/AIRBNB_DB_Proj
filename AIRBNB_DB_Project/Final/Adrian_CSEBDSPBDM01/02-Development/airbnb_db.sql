-- ============================================================
--  AIRBNB REPLICA DATABASE
--  Course: CSEBDSPBDM01 | Build a Data Mart in SQL
--  Phase 2 – Development
--  DBMS: SQLite 3.45
-- ============================================================
--  All primary keys follow the naming convention:
--  <table_name>_id  (e.g. users_id, listings_id, ...)
--  Foreign keys reference the originating table's PK name.
-- ============================================================

PRAGMA foreign_keys = ON;

-- ============================================================
-- 1. USERS
--    Central account table; all roles reference this entity.
-- ============================================================
CREATE TABLE IF NOT EXISTS users (
    users_id    INTEGER PRIMARY KEY AUTOINCREMENT,
    email       VARCHAR(255) NOT NULL UNIQUE,
    password    VARCHAR(255) NOT NULL,
    created_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (email, password, created_at, updated_at) VALUES
('alice.smith@email.com',      'hashed_pw_001', '2023-01-05 09:00:00', '2023-01-05 09:00:00'),
('bob.jones@email.com',        'hashed_pw_002', '2023-01-08 10:30:00', '2023-01-08 10:30:00'),
('carla.müller@email.com',     'hashed_pw_003', '2023-01-12 11:00:00', '2023-02-01 08:00:00'),
('david.chen@email.com',       'hashed_pw_004', '2023-02-01 14:00:00', '2023-02-01 14:00:00'),
('elena.russo@email.com',      'hashed_pw_005', '2023-02-10 09:45:00', '2023-02-10 09:45:00'),
('frank.nguyen@email.com',     'hashed_pw_006', '2023-02-15 12:00:00', '2023-02-15 12:00:00'),
('grace.lee@email.com',        'hashed_pw_007', '2023-03-01 08:30:00', '2023-03-01 08:30:00'),
('henry.brown@email.com',      'hashed_pw_008', '2023-03-05 10:00:00', '2023-03-05 10:00:00'),
('iris.patel@email.com',       'hashed_pw_009', '2023-03-10 13:00:00', '2023-03-10 13:00:00'),
('jack.wilson@email.com',      'hashed_pw_010', '2023-03-15 15:30:00', '2023-03-15 15:30:00'),
('karen.thomas@email.com',     'hashed_pw_011', '2023-04-01 09:00:00', '2023-04-01 09:00:00'),
('liam.martin@email.com',      'hashed_pw_012', '2023-04-05 11:00:00', '2023-04-05 11:00:00'),
('mia.garcia@email.com',       'hashed_pw_013', '2023-04-10 14:00:00', '2023-04-10 14:00:00'),
('noah.white@email.com',       'hashed_pw_014', '2023-04-15 16:00:00', '2023-04-15 16:00:00'),
('olivia.clark@email.com',     'hashed_pw_015', '2023-05-01 08:00:00', '2023-05-01 08:00:00'),
('peter.hall@email.com',       'hashed_pw_016', '2023-05-05 10:30:00', '2023-05-05 10:30:00'),
('quinn.adams@email.com',      'hashed_pw_017', '2023-05-10 12:00:00', '2023-05-10 12:00:00'),
('rachel.baker@email.com',     'hashed_pw_018', '2023-05-15 14:30:00', '2023-05-15 14:30:00'),
('sam.nelson@email.com',       'hashed_pw_019', '2023-06-01 09:00:00', '2023-06-01 09:00:00'),
('tina.carter@email.com',      'hashed_pw_020', '2023-06-05 11:00:00', '2023-06-05 11:00:00');

-- ============================================================
-- 2. USER_PROFILES
-- ============================================================
CREATE TABLE IF NOT EXISTS user_profiles (
    user_profiles_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    users_id          INTEGER NOT NULL REFERENCES users(users_id) ON DELETE CASCADE,
    first_name        VARCHAR(100) NOT NULL,
    last_name         VARCHAR(100) NOT NULL,
    bio               TEXT,
    phone             VARCHAR(30),
    profile_photo     VARCHAR(500),
    language_pref     VARCHAR(10) DEFAULT 'en'
);

INSERT INTO user_profiles (users_id, first_name, last_name, bio, phone, profile_photo, language_pref) VALUES
(1,  'Alice',   'Smith',   'Loves city breaks and boutique stays.',         '+49301234001', 'photos/alice.jpg',   'en'),
(2,  'Bob',     'Jones',   'Backpacker turned digital nomad.',              '+49301234002', 'photos/bob.jpg',     'en'),
(3,  'Carla',   'Müller',  'Berlin-based host with two apartments.',        '+49301234003', 'photos/carla.jpg',   'de'),
(4,  'David',   'Chen',    'Frequent traveller for work and leisure.',      '+49301234004', 'photos/david.jpg',   'zh'),
(5,  'Elena',   'Russo',   'Host in Rome; passionate about architecture.',  '+39061234005', 'photos/elena.jpg',   'it'),
(6,  'Frank',   'Nguyen',  'Budget traveller exploring Europe.',            '+33123456006', 'photos/frank.jpg',   'fr'),
(7,  'Grace',   'Lee',     'Superhost in Amsterdam with 3 listings.',       '+31201234007', 'photos/grace.jpg',   'en'),
(8,  'Henry',   'Brown',   'Business traveller based in London.',           '+44201234008', 'photos/henry.jpg',   'en'),
(9,  'Iris',    'Patel',   'Food blogger who travels for cuisine.',         '+91221234009', 'photos/iris.jpg',    'en'),
(10, 'Jack',    'Wilson',  'Solo traveller and photographer.',              '+1212123010',  'photos/jack.jpg',    'en'),
(11, 'Karen',   'Thomas',  'Host in Barcelona with a beachfront flat.',     '+34931234011', 'photos/karen.jpg',   'es'),
(12, 'Liam',    'Martin',  'Graduate student travelling during holidays.',  '+49301234012', 'photos/liam.jpg',    'de'),
(13, 'Mia',     'Garcia',  'Yoga retreat host in the Spanish countryside.', '+34711234013', 'photos/mia.jpg',     'es'),
(14, 'Noah',    'White',   'Tech consultant travelling monthly.',           '+1415123014',  'photos/noah.jpg',    'en'),
(15, 'Olivia',  'Clark',   'Superhost in Paris with 5-star reviews.',       '+33141234015', 'photos/olivia.jpg',  'fr'),
(16, 'Peter',   'Hall',    'Adventure traveller and host in Zurich.',       '+41441234016', 'photos/peter.jpg',   'de'),
(17, 'Quinn',   'Adams',   'Minimalist traveller; loves design hotels.',    '+1347123017',  'photos/quinn.jpg',   'en'),
(18, 'Rachel',  'Baker',   'Retired teacher hosting in Edinburgh.',         '+44131234018', 'photos/rachel.jpg',  'en'),
(19, 'Sam',     'Nelson',  'Surfer and host near Lisbon.',                  '+35121234019', 'photos/sam.jpg',     'pt'),
(20, 'Tina',    'Carter',  'Interior designer hosting a luxury loft.',     '+49301234020', 'photos/tina.jpg',    'en');

-- ============================================================
-- 3. USER_ROLES
-- ============================================================
CREATE TABLE IF NOT EXISTS user_roles (
    user_roles_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    users_id       INTEGER NOT NULL REFERENCES users(users_id) ON DELETE CASCADE,
    role           VARCHAR(20) NOT NULL CHECK(role IN ('guest','host','admin'))
);

INSERT INTO user_roles (users_id, role) VALUES
(1,  'guest'), (2,  'guest'), (3,  'host'),  (4,  'guest'),
(5,  'host'),  (6,  'guest'), (7,  'host'),  (8,  'guest'),
(9,  'guest'), (10, 'guest'), (11, 'host'),  (12, 'guest'),
(13, 'host'),  (14, 'guest'), (15, 'host'),  (16, 'host'),
(17, 'guest'), (18, 'host'),  (19, 'host'),  (20, 'host'),
-- Multi-role users (guest + host)
(1,  'host'),  (4,  'host');

-- ============================================================
-- 4. USER_SESSIONS
-- ============================================================
CREATE TABLE IF NOT EXISTS user_sessions (
    user_sessions_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    users_id          INTEGER NOT NULL REFERENCES users(users_id) ON DELETE CASCADE,
    login_time        DATETIME NOT NULL,
    logout_time       DATETIME,
    device_info       VARCHAR(255)
);

INSERT INTO user_sessions (users_id, login_time, logout_time, device_info) VALUES
(1,  '2024-01-10 08:00:00', '2024-01-10 09:30:00', 'Chrome/Windows 11'),
(2,  '2024-01-11 09:00:00', '2024-01-11 10:00:00', 'Safari/macOS'),
(3,  '2024-01-12 07:30:00', '2024-01-12 08:45:00', 'Firefox/Ubuntu'),
(4,  '2024-01-13 10:00:00', '2024-01-13 11:30:00', 'Chrome/Android'),
(5,  '2024-01-14 06:00:00', '2024-01-14 07:00:00', 'Safari/iPhone'),
(6,  '2024-01-15 12:00:00', '2024-01-15 13:00:00', 'Edge/Windows 10'),
(7,  '2024-01-16 08:30:00', '2024-01-16 09:15:00', 'Chrome/macOS'),
(8,  '2024-01-17 09:45:00', '2024-01-17 10:45:00', 'Chrome/Windows 11'),
(9,  '2024-01-18 11:00:00', '2024-01-18 12:00:00', 'Safari/iPad'),
(10, '2024-01-19 14:00:00', '2024-01-19 15:30:00', 'Firefox/Windows 10'),
(11, '2024-01-20 07:00:00', '2024-01-20 08:00:00', 'Chrome/Android'),
(12, '2024-01-21 09:00:00', '2024-01-21 10:00:00', 'Safari/macOS'),
(13, '2024-01-22 10:30:00', '2024-01-22 11:30:00', 'Chrome/Windows 11'),
(14, '2024-01-23 13:00:00', '2024-01-23 14:00:00', 'Edge/Windows 10'),
(15, '2024-01-24 08:00:00', '2024-01-24 09:30:00', 'Safari/iPhone'),
(16, '2024-01-25 09:00:00', '2024-01-25 10:00:00', 'Chrome/macOS'),
(17, '2024-01-26 11:00:00', '2024-01-26 12:00:00', 'Firefox/Linux'),
(18, '2024-01-27 14:00:00', '2024-01-27 15:00:00', 'Chrome/Windows 11'),
(19, '2024-01-28 08:30:00', '2024-01-28 09:30:00', 'Safari/macOS'),
(20, '2024-01-29 10:00:00', NULL,                   'Chrome/Windows 11');

-- ============================================================
-- 5. HOST_VERIFICATION
-- ============================================================
CREATE TABLE IF NOT EXISTS host_verification (
    host_verification_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    users_id              INTEGER NOT NULL REFERENCES users(users_id) ON DELETE CASCADE,
    document_type         VARCHAR(50) NOT NULL,
    status                VARCHAR(20) NOT NULL CHECK(status IN ('pending','approved','rejected')),
    verified_at           DATETIME
);

INSERT INTO host_verification (users_id, document_type, status, verified_at) VALUES
(3,  'passport',        'approved', '2023-01-15 10:00:00'),
(5,  'national_id',     'approved', '2023-02-12 11:00:00'),
(7,  'passport',        'approved', '2023-03-03 09:30:00'),
(11, 'driving_licence', 'approved', '2023-04-03 14:00:00'),
(13, 'passport',        'approved', '2023-04-12 10:00:00'),
(15, 'national_id',     'approved', '2023-05-03 09:00:00'),
(16, 'passport',        'approved', '2023-05-07 11:30:00'),
(18, 'driving_licence', 'approved', '2023-05-17 13:00:00'),
(19, 'passport',        'approved', '2023-06-03 10:00:00'),
(20, 'national_id',     'approved', '2023-06-07 11:00:00'),
(1,  'passport',        'approved', '2023-06-10 09:00:00'),
(4,  'national_id',     'pending',  NULL),
(2,  'passport',        'rejected', NULL),
(6,  'driving_licence', 'pending',  NULL),
(8,  'passport',        'pending',  NULL),
(9,  'national_id',     'pending',  NULL),
(10, 'driving_licence', 'pending',  NULL),
(12, 'passport',        'pending',  NULL),
(14, 'national_id',     'pending',  NULL),
(17, 'passport',        'pending',  NULL);

-- ============================================================
-- 6. LISTINGS
-- ============================================================
CREATE TABLE IF NOT EXISTS listings (
    listings_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    host_id      INTEGER NOT NULL REFERENCES users(users_id),
    title        VARCHAR(255) NOT NULL,
    description  TEXT,
    address      VARCHAR(255),
    city         VARCHAR(100),
    country      VARCHAR(100),
    latitude     REAL,
    longitude    REAL,
    created_at   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO listings (host_id, title, description, address, city, country, latitude, longitude, created_at) VALUES
(3,  'Cosy Studio in Mitte',              'Bright studio in the heart of Berlin.',              'Unter den Linden 12',    'Berlin',      'Germany',     52.5170, 13.3888, '2023-02-01 10:00:00'),
(3,  'Modern 2BR in Prenzlauer Berg',     'Spacious flat with balcony and fast WiFi.',          'Schönhauser Allee 5',   'Berlin',      'Germany',     52.5383, 13.4141, '2023-02-05 11:00:00'),
(5,  'Roman Rooftop Apartment',           'Stunning views over the Forum Romanum.',             'Via Sacra 7',            'Rome',        'Italy',       41.8902, 12.4922, '2023-02-11 09:00:00'),
(7,  'Canal-Side Flat in Jordaan',        'Authentic Amsterdam experience on the canal.',       'Prinsengracht 44',       'Amsterdam',   'Netherlands', 52.3740, 4.8840,  '2023-03-02 10:00:00'),
(7,  'Compact Room near Rijksmuseum',     'Perfect for solo travellers or couples.',            'Museumstraat 3',         'Amsterdam',   'Netherlands', 52.3600, 4.8852,  '2023-03-06 11:00:00'),
(7,  'Houseboat on Amstel River',         'Unique floating accommodation in the city centre.',  'Amstel 88',              'Amsterdam',   'Netherlands', 52.3641, 4.9008,  '2023-03-08 12:00:00'),
(11, 'Beachfront Studio in Barceloneta', 'Steps from the beach with sea views.',               'Pg. Marítim 18',         'Barcelona',   'Spain',       41.3791, 2.1891,  '2023-04-03 09:00:00'),
(13, 'Rural Yoga Retreat Villa',          'Peaceful countryside villa with private pool.',      'Camino de la Sierra 2',  'Granada',     'Spain',       37.1773, -3.5986, '2023-04-12 10:00:00'),
(15, 'Parisian Loft in Le Marais',        'Stylish loft in the most vibrant Paris district.',  'Rue de Bretagne 21',     'Paris',       'France',      48.8629, 2.3589,  '2023-05-03 08:00:00'),
(15, 'Montmartre Artist Studio',          'Charming studio with Sacré-Cœur views.',            'Rue Lepic 34',           'Paris',       'France',      48.8856, 2.3354,  '2023-05-04 09:00:00'),
(16, 'Alpine Chalet in Zürich',           'Modern chalet with mountain and lake views.',        'Tödistrasse 9',          'Zürich',      'Switzerland', 47.3769, 8.5417,  '2023-05-07 10:00:00'),
(18, 'Historic Flat in Old Town Edinburgh','Georgian townhouse with original features.',        'Royal Mile 55',          'Edinburgh',   'UK',          55.9486, -3.1999, '2023-05-17 11:00:00'),
(19, 'Surfer Cottage near Cascais',       'Cosy cottage 5 min walk from surf beach.',          'Rua do Farol 3',         'Cascais',     'Portugal',    38.6979, -9.4215, '2023-06-03 09:00:00'),
(20, 'Luxury Loft in Berlin Mitte',       'Designer loft with high-end finishes.',             'Friedrichstraße 100',    'Berlin',      'Germany',     52.5210, 13.3880, '2023-06-07 10:00:00'),
(1,  'Garden Apartment in Kreuzberg',     'Quiet garden flat in a vibrant neighbourhood.',     'Bergmannstraße 22',      'Berlin',      'Germany',     52.4893, 13.3884, '2023-06-12 11:00:00'),
(5,  'Trastevere Hideaway',               'Authentic Roman neighbourhood charm.',               'Via della Lungaretta 9', 'Rome',        'Italy',       41.8881, 12.4695, '2023-06-15 09:00:00'),
(11, 'Gothic Quarter Piso',               'Classic Spanish flat in the oldest district.',       'Carrer del Bisbe 4',     'Barcelona',   'Spain',       41.3831, 2.1770,  '2023-06-18 10:00:00'),
(13, 'Andalusian Cave House',             'Unique cave dwelling with modern amenities.',        'Cuesta de los Chinos 6', 'Guadix',      'Spain',       37.2990, -3.1370, '2023-06-20 11:00:00'),
(16, 'Lake Geneva Studio',                'Compact studio with balcony over the lake.',         'Quai du Mont-Blanc 7',   'Geneva',      'Switzerland', 46.2044, 6.1432,  '2023-06-22 12:00:00'),
(18, 'Seaside Cottage in St Andrews',     'Cosy cottage near the famous golf course.',         'Links Road 11',          'St Andrews',  'UK',          56.3398, -2.7967, '2023-06-25 09:00:00');

-- ============================================================
-- 7. LISTING_PHOTOS
-- ============================================================
CREATE TABLE IF NOT EXISTS listing_photos (
    listing_photos_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    listings_id        INTEGER NOT NULL REFERENCES listings(listings_id) ON DELETE CASCADE,
    photo_url          VARCHAR(500) NOT NULL
);

INSERT INTO listing_photos (listings_id, photo_url) VALUES
(1,  'listings/1/photo1.jpg'), (1,  'listings/1/photo2.jpg'),
(2,  'listings/2/photo1.jpg'), (2,  'listings/2/photo2.jpg'),
(3,  'listings/3/photo1.jpg'), (3,  'listings/3/photo2.jpg'),
(4,  'listings/4/photo1.jpg'), (4,  'listings/4/photo2.jpg'),
(5,  'listings/5/photo1.jpg'), (5,  'listings/5/photo2.jpg'),
(6,  'listings/6/photo1.jpg'), (7,  'listings/7/photo1.jpg'),
(8,  'listings/8/photo1.jpg'), (8,  'listings/8/photo2.jpg'),
(9,  'listings/9/photo1.jpg'), (9,  'listings/9/photo2.jpg'),
(10, 'listings/10/photo1.jpg'),(11, 'listings/11/photo1.jpg'),
(12, 'listings/12/photo1.jpg'),(13, 'listings/13/photo1.jpg');

-- ============================================================
-- 8. LISTING_RULES
-- ============================================================
CREATE TABLE IF NOT EXISTS listing_rules (
    listing_rules_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    listings_id       INTEGER NOT NULL REFERENCES listings(listings_id) ON DELETE CASCADE,
    rule_text         TEXT NOT NULL
);

INSERT INTO listing_rules (listings_id, rule_text) VALUES
(1,  'No smoking indoors.'),
(1,  'No parties or events.'),
(2,  'No smoking indoors.'),
(3,  'Quiet hours after 22:00.'),
(3,  'No pets allowed.'),
(4,  'Shoes off at the entrance.'),
(4,  'No smoking indoors.'),
(5,  'No smoking indoors.'),
(6,  'Maximum 2 guests.'),
(7,  'Beach towels provided; no sand inside.'),
(7,  'No smoking indoors.'),
(8,  'Yoga sessions start at 07:00; guests must be quiet before.'),
(9,  'No smoking indoors.'),
(9,  'No pets allowed.'),
(10, 'Quiet hours after 23:00.'),
(11, 'Ski equipment may be stored in the basement.'),
(12, 'No smoking indoors.'),
(13, 'Wetsuits must be rinsed outside.'),
(14, 'No parties or events.'),
(15, 'Children welcome; baby gate available on request.');

-- ============================================================
-- 9. LISTING_PRICING
-- ============================================================
CREATE TABLE IF NOT EXISTS listing_pricing (
    listing_pricing_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    listings_id         INTEGER NOT NULL REFERENCES listings(listings_id) ON DELETE CASCADE,
    base_price          DECIMAL(10,2) NOT NULL,
    cleaning_fee        DECIMAL(10,2) NOT NULL DEFAULT 0,
    service_fee         DECIMAL(10,2) NOT NULL DEFAULT 0,
    weekly_discount     REAL NOT NULL DEFAULT 0,
    monthly_discount    REAL NOT NULL DEFAULT 0
);

INSERT INTO listing_pricing (listings_id, base_price, cleaning_fee, service_fee, weekly_discount, monthly_discount) VALUES
(1,  75.00,  15.00, 10.00, 0.05, 0.10),
(2,  110.00, 20.00, 15.00, 0.07, 0.12),
(3,  150.00, 25.00, 20.00, 0.08, 0.15),
(4,  130.00, 20.00, 18.00, 0.06, 0.10),
(5,  85.00,  10.00, 12.00, 0.05, 0.10),
(6,  200.00, 30.00, 25.00, 0.10, 0.18),
(7,  120.00, 20.00, 15.00, 0.07, 0.12),
(8,  180.00, 30.00, 22.00, 0.09, 0.16),
(9,  160.00, 25.00, 20.00, 0.08, 0.14),
(10, 95.00,  15.00, 12.00, 0.05, 0.10),
(11, 220.00, 35.00, 28.00, 0.10, 0.20),
(12, 100.00, 18.00, 14.00, 0.06, 0.11),
(13, 90.00,  15.00, 12.00, 0.05, 0.10),
(14, 250.00, 40.00, 30.00, 0.12, 0.22),
(15, 80.00,  12.00, 10.00, 0.05, 0.10),
(16, 140.00, 22.00, 18.00, 0.07, 0.13),
(17, 100.00, 16.00, 13.00, 0.05, 0.10),
(18, 70.00,  10.00,  9.00, 0.04, 0.08),
(19, 115.00, 18.00, 15.00, 0.06, 0.11),
(20, 110.00, 17.00, 14.00, 0.06, 0.11);

-- ============================================================
-- 10. AMENITIES
-- ============================================================
CREATE TABLE IF NOT EXISTS amenities (
    amenities_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    name          VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO amenities (name) VALUES
('WiFi'), ('Air Conditioning'), ('Heating'), ('Kitchen'), ('Washing Machine'),
('Dryer'), ('TV'), ('Pool'), ('Gym'), ('Parking'),
('Elevator'), ('Balcony'), ('Garden'), ('Fireplace'), ('Hot Tub'),
('Workspace'), ('BBQ Grill'), ('Dishwasher'), ('Baby Cot'), ('Pets Allowed');

-- ============================================================
-- 11. LISTING_AMENITIES  [TERNARY: Listing × Amenity × Host]
-- ============================================================
CREATE TABLE IF NOT EXISTS listing_amenities (
    listing_amenities_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    listings_id           INTEGER NOT NULL REFERENCES listings(listings_id) ON DELETE CASCADE,
    amenities_id          INTEGER NOT NULL REFERENCES amenities(amenities_id),
    host_id               INTEGER NOT NULL REFERENCES users(users_id),
    UNIQUE(listings_id, amenities_id)
);

INSERT INTO listing_amenities (listings_id, amenities_id, host_id) VALUES
(1, 1,3),(1,3,3),(1,4,3),(1,7,3),
(2, 1,3),(2,2,3),(2,4,3),(2,5,3),(2,12,3),
(3, 1,5),(3,2,5),(3,7,5),(3,12,5),
(4, 1,7),(4,3,7),(4,4,7),(4,11,7),
(5, 1,7),(5,3,7),(5,7,7),
(6, 1,7),(6,3,7),(6,4,7),(6,15,7),
(7, 1,11),(7,2,11),(7,4,11),(7,10,11),
(8, 1,13),(8,4,13),(8,8,13),(8,13,13),
(9, 1,15),(9,2,15),(9,4,15),(9,16,15),
(10,1,15),(10,3,15),(10,4,15),
(11,1,16),(11,3,16),(11,7,16),(11,14,16),(11,15,16),
(12,1,18),(12,3,18),(12,4,18),(12,14,18),
(13,1,19),(13,3,19),(13,13,19),
(14,1,20),(14,2,20),(14,4,20),(14,16,20),(14,18,20),
(15,1,1),(15,3,1),(15,4,1),(15,13,1),(15,20,1),
(16,1,5),(16,2,5),(16,3,5),
(17,1,11),(17,3,11),(17,4,11),
(18,1,13),(18,3,13),(18,4,13),
(19,1,16),(19,3,16),(19,7,16),(19,12,16),
(20,1,18),(20,3,18),(20,4,18),(20,14,18);

-- ============================================================
-- 12. AVAILABILITY_CALENDAR
-- ============================================================
CREATE TABLE IF NOT EXISTS availability_calendar (
    availability_calendar_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    listings_id               INTEGER NOT NULL REFERENCES listings(listings_id) ON DELETE CASCADE,
    date                      DATE NOT NULL,
    is_available              INTEGER NOT NULL DEFAULT 1 CHECK(is_available IN (0,1)),
    UNIQUE(listings_id, date)
);

INSERT INTO availability_calendar (listings_id, date, is_available) VALUES
(1,'2024-07-01',1),(1,'2024-07-02',1),(1,'2024-07-03',0),(1,'2024-07-04',0),
(2,'2024-07-01',1),(2,'2024-07-05',1),(2,'2024-07-10',0),
(3,'2024-07-01',1),(3,'2024-07-02',0),(3,'2024-07-08',1),
(4,'2024-07-01',1),(4,'2024-07-03',1),(4,'2024-07-07',0),
(5,'2024-07-01',1),(5,'2024-07-06',1),(5,'2024-07-09',0),
(6,'2024-07-01',0),(6,'2024-07-04',1),(6,'2024-07-11',1),
(7,'2024-07-01',1),(7,'2024-07-05',0),(7,'2024-07-12',1),
(8,'2024-07-01',1),(8,'2024-07-02',1),(8,'2024-07-15',0),
(9,'2024-07-01',1),(9,'2024-07-06',0),(9,'2024-07-13',1),
(10,'2024-07-01',1),(10,'2024-07-07',1),(10,'2024-07-14',0);

-- ============================================================
-- 13. RESERVATIONS
-- ============================================================
CREATE TABLE IF NOT EXISTS reservations (
    reservations_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    listings_id      INTEGER NOT NULL REFERENCES listings(listings_id),
    guest_id         INTEGER NOT NULL REFERENCES users(users_id),
    check_in         DATE NOT NULL,
    check_out        DATE NOT NULL,
    total_price      DECIMAL(10,2) NOT NULL,
    status           VARCHAR(20) NOT NULL CHECK(status IN ('pending','confirmed','cancelled','completed')),
    created_at       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO reservations (listings_id, guest_id, check_in, check_out, total_price, status, created_at) VALUES
(1,  2,  '2024-07-05', '2024-07-10', 400.00,  'completed', '2024-06-01 10:00:00'),
(3,  4,  '2024-07-08', '2024-07-12', 650.00,  'completed', '2024-06-05 11:00:00'),
(4,  6,  '2024-07-03', '2024-07-07', 560.00,  'completed', '2024-06-07 09:00:00'),
(9,  8,  '2024-07-10', '2024-07-15', 850.00,  'completed', '2024-06-10 10:00:00'),
(11, 10, '2024-07-14', '2024-07-21', 1610.00, 'completed', '2024-06-12 11:00:00'),
(2,  12, '2024-07-20', '2024-07-25', 580.00,  'confirmed', '2024-06-15 09:00:00'),
(7,  14, '2024-07-22', '2024-07-28', 750.00,  'confirmed', '2024-06-17 10:00:00'),
(12, 17, '2024-08-01', '2024-08-05', 430.00,  'confirmed', '2024-06-20 11:00:00'),
(13, 6,  '2024-08-03', '2024-08-08', 480.00,  'confirmed', '2024-06-22 09:00:00'),
(14, 9,  '2024-08-05', '2024-08-10', 1300.00, 'confirmed', '2024-06-25 10:00:00'),
(5,  1,  '2024-08-10', '2024-08-14', 360.00,  'pending',   '2024-07-01 08:00:00'),
(8,  2,  '2024-08-12', '2024-08-17', 930.00,  'pending',   '2024-07-03 09:00:00'),
(15, 4,  '2024-08-15', '2024-08-20', 420.00,  'pending',   '2024-07-05 10:00:00'),
(16, 6,  '2024-08-18', '2024-08-22', 590.00,  'pending',   '2024-07-07 11:00:00'),
(6,  10, '2024-08-20', '2024-08-25', 1050.00, 'pending',   '2024-07-09 09:00:00'),
(10, 12, '2024-09-01', '2024-09-05', 400.00,  'cancelled', '2024-07-10 10:00:00'),
(17, 14, '2024-09-05', '2024-09-10', 520.00,  'cancelled', '2024-07-12 11:00:00'),
(18, 17, '2024-09-08', '2024-09-12', 300.00,  'cancelled', '2024-07-14 09:00:00'),
(19, 8,  '2024-09-10', '2024-09-15', 600.00,  'confirmed', '2024-07-15 10:00:00'),
(20, 9,  '2024-09-12', '2024-09-17', 590.00,  'confirmed', '2024-07-16 11:00:00');

-- ============================================================
-- 14. RESERVATION_GUESTS  [TERNARY: Reservation × Guest × Listing]
-- ============================================================
CREATE TABLE IF NOT EXISTS reservation_guests (
    reservation_guests_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    reservations_id        INTEGER NOT NULL REFERENCES reservations(reservations_id) ON DELETE CASCADE,
    listings_id            INTEGER NOT NULL REFERENCES listings(listings_id),
    guest_name             VARCHAR(150) NOT NULL,
    age                    INTEGER NOT NULL
);

INSERT INTO reservation_guests (reservations_id, listings_id, guest_name, age) VALUES
(1,  1,  'Sophie Smith',      28),
(1,  1,  'Tom Smith',         30),
(2,  3,  'Lucas Chen',        25),
(3,  4,  'Amelia Nguyen',     32),
(3,  4,  'Marco Nguyen',      34),
(4,  9,  'Priya Brown',       27),
(5,  11, 'Ethan Wilson',      22),
(5,  11, 'Zoe Wilson',        24),
(6,  2,  'Oliver Martin',     29),
(7,  7,  'Ava Garcia',        31),
(7,  7,  'Mateo Garcia',      33),
(8,  12, 'Sophia Adams',      26),
(9,  13, 'Aiden Nguyen',      28),
(10, 14, 'Mia Thomas',        30),
(10, 14, 'James Thomas',      32),
(11, 5,  'Charlotte Lee',     23),
(12, 8,  'Benjamin Russo',    35),
(13, 15, 'Lily Clark',        27),
(14, 16, 'Noah Hall',         29),
(15, 6,  'Emma Nelson',       26);

-- ============================================================
-- 15. RESERVATION_PAYMENTS  [TERNARY: Reservation × Guest × Payment Method]
-- ============================================================
CREATE TABLE IF NOT EXISTS reservation_payments (
    reservation_payments_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    reservations_id          INTEGER NOT NULL REFERENCES reservations(reservations_id) ON DELETE CASCADE,
    guest_id                 INTEGER NOT NULL REFERENCES users(users_id),
    amount                   DECIMAL(10,2) NOT NULL,
    method                   VARCHAR(50) NOT NULL,
    status                   VARCHAR(20) NOT NULL CHECK(status IN ('pending','completed','refunded')),
    paid_at                  DATETIME
);

INSERT INTO reservation_payments (reservations_id, guest_id, amount, method, status, paid_at) VALUES
(1,  2,  400.00,  'credit_card', 'completed', '2024-06-01 10:05:00'),
(2,  4,  650.00,  'PayPal',      'completed', '2024-06-05 11:05:00'),
(3,  6,  560.00,  'credit_card', 'completed', '2024-06-07 09:05:00'),
(4,  8,  850.00,  'credit_card', 'completed', '2024-06-10 10:05:00'),
(5,  10, 1610.00, 'bank_transfer','completed','2024-06-12 11:05:00'),
(6,  12, 580.00,  'credit_card', 'completed', '2024-06-15 09:05:00'),
(7,  14, 750.00,  'PayPal',      'completed', '2024-06-17 10:05:00'),
(8,  17, 430.00,  'credit_card', 'completed', '2024-06-20 11:05:00'),
(9,  6,  480.00,  'credit_card', 'completed', '2024-06-22 09:05:00'),
(10, 9,  1300.00, 'bank_transfer','completed','2024-06-25 10:05:00'),
(11, 1,  360.00,  'credit_card', 'pending',   NULL),
(12, 2,  930.00,  'PayPal',      'pending',   NULL),
(13, 4,  420.00,  'credit_card', 'pending',   NULL),
(14, 6,  590.00,  'credit_card', 'pending',   NULL),
(15, 10, 1050.00, 'bank_transfer','pending',  NULL),
(16, 12, 400.00,  'credit_card', 'refunded',  '2024-07-10 12:00:00'),
(17, 14, 520.00,  'PayPal',      'refunded',  '2024-07-12 13:00:00'),
(18, 17, 300.00,  'credit_card', 'refunded',  '2024-07-14 11:00:00'),
(19, 8,  600.00,  'credit_card', 'completed', '2024-07-15 10:05:00'),
(20, 9,  590.00,  'bank_transfer','completed','2024-07-16 11:05:00');

-- ============================================================
-- 16. PAYOUTS_TO_HOSTS
-- ============================================================
CREATE TABLE IF NOT EXISTS payouts_to_hosts (
    payouts_to_hosts_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    reservations_id      INTEGER NOT NULL REFERENCES reservations(reservations_id),
    host_id              INTEGER NOT NULL REFERENCES users(users_id),
    amount               DECIMAL(10,2) NOT NULL,
    payout_date          DATETIME NOT NULL
);

INSERT INTO payouts_to_hosts (reservations_id, host_id, amount, payout_date) VALUES
(1,  3,  364.00,  '2024-07-06 12:00:00'),
(2,  5,  591.50,  '2024-07-09 12:00:00'),
(3,  7,  509.60,  '2024-07-04 12:00:00'),
(4,  15, 773.50,  '2024-07-11 12:00:00'),
(5,  16, 1465.10, '2024-07-15 12:00:00'),
(6,  3,  527.80,  '2024-07-21 12:00:00'),
(7,  7,  682.50,  '2024-07-23 12:00:00'),
(8,  18, 391.30,  '2024-08-02 12:00:00'),
(9,  19, 436.80,  '2024-08-04 12:00:00'),
(10, 20, 1183.00, '2024-08-06 12:00:00'),
(19, 19, 546.00,  '2024-09-11 12:00:00'),
(20, 20, 537.10,  '2024-09-13 12:00:00'),
(1,  3,  36.00,   '2024-07-06 12:05:00'),
(2,  5,  58.50,   '2024-07-09 12:05:00'),
(3,  7,  50.40,   '2024-07-04 12:05:00'),
(4,  15, 76.50,   '2024-07-11 12:05:00'),
(5,  16, 144.90,  '2024-07-15 12:05:00'),
(6,  3,  52.20,   '2024-07-21 12:05:00'),
(7,  7,  67.50,   '2024-07-23 12:05:00'),
(8,  18, 38.70,   '2024-08-02 12:05:00');

-- ============================================================
-- 17. REVIEWS
-- ============================================================
CREATE TABLE IF NOT EXISTS reviews (
    reviews_id    INTEGER PRIMARY KEY AUTOINCREMENT,
    reservations_id INTEGER NOT NULL REFERENCES reservations(reservations_id),
    listings_id   INTEGER NOT NULL REFERENCES listings(listings_id),
    reviewer_id   INTEGER NOT NULL REFERENCES users(users_id),
    rating        INTEGER NOT NULL CHECK(rating BETWEEN 1 AND 5),
    review_text   TEXT,
    created_at    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO reviews (reservations_id, listings_id, reviewer_id, rating, review_text, created_at) VALUES
(1,  1,  2,  5, 'Absolutely lovely studio. Carla was a fantastic host!',               '2024-07-11 10:00:00'),
(2,  3,  4,  5, 'Breathtaking rooftop views. Elena was incredibly welcoming.',          '2024-07-13 11:00:00'),
(3,  4,  6,  4, 'Great canal-side location. A few minor maintenance issues.',           '2024-07-08 09:00:00'),
(4,  9,  8,  5, 'The Parisian loft exceeded all expectations. Highly recommend.',       '2024-07-16 10:00:00'),
(5,  11, 10, 5, 'Peter''s alpine chalet is a dream. Stunning views and top amenities.','2024-07-22 11:00:00'),
(1,  1,  3,  5, 'Bob and Sophie were ideal guests. Left the apartment spotless.',       '2024-07-12 09:00:00'),
(2,  3,  5,  5, 'David was respectful and communicative throughout.',                  '2024-07-14 10:00:00'),
(3,  4,  7,  4, 'Frank was a reliable guest. Would host again.',                        '2024-07-09 08:00:00'),
(4,  9,  15, 5, 'Henry was an outstanding guest. Five stars.',                          '2024-07-17 09:00:00'),
(5,  11, 16, 5, 'Jack took great care of the chalet.',                                  '2024-07-23 10:00:00'),
(6,  2,  12, 4, 'Well-equipped flat. Check-in was straightforward.',                   '2024-07-26 11:00:00'),
(7,  7,  14, 5, 'The beachfront studio was exactly as described. Loved every minute.',  '2024-07-29 09:00:00'),
(8,  12, 17, 4, 'Edinburgh flat has great character. Slightly cold at night.',          '2024-08-06 10:00:00'),
(9,  13, 6,  5, 'The surf cottage is magical. Sam is a wonderful host.',               '2024-08-09 11:00:00'),
(10, 14, 9,  5, 'The luxury loft was worth every cent. Impeccable design.',            '2024-08-11 09:00:00'),
(6,  2,  3,  4, 'Liam was a tidy and considerate guest.',                               '2024-07-27 10:00:00'),
(7,  7,  11, 5, 'Noah was a pleasure to host. Highly recommend.',                       '2024-07-30 11:00:00'),
(8,  12, 18, 4, 'Quinn was polite and kept the flat clean.',                            '2024-08-07 09:00:00'),
(9,  13, 19, 5, 'Frank was a brilliant guest. Surfed all day, quiet at night.',         '2024-08-10 10:00:00'),
(10, 14, 20, 5, 'Iris treated the loft with great care. Would host again.',            '2024-08-12 11:00:00');

-- ============================================================
-- 18. REVIEW_REPLIES
-- ============================================================
CREATE TABLE IF NOT EXISTS review_replies (
    review_replies_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    reviews_id         INTEGER NOT NULL REFERENCES reviews(reviews_id) ON DELETE CASCADE,
    users_id           INTEGER NOT NULL REFERENCES users(users_id),
    reply_text         TEXT NOT NULL,
    created_at         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO review_replies (reviews_id, users_id, reply_text, created_at) VALUES
(1,  3,  'Thank you so much, Alice! You are welcome back anytime.',               '2024-07-12 08:00:00'),
(2,  5,  'Grazie mille, David! It was a pleasure having you.',                    '2024-07-14 09:00:00'),
(3,  7,  'Thank you for the feedback, Frank. We are fixing the maintenance.',     '2024-07-09 10:00:00'),
(4,  15, 'Merci beaucoup, Henry! So glad you enjoyed the loft.',                  '2024-07-17 11:00:00'),
(5,  16, 'Thank you, Jack! Come back in winter for the skiing!',                  '2024-07-23 09:00:00'),
(11, 3,  'Thank you, Liam! Lovely having you.',                                   '2024-07-27 10:00:00'),
(12, 11, 'So glad you enjoyed Barceloneta, Noah!',                                '2024-07-30 11:00:00'),
(13, 18, 'Thank you, Quinn! Extra blankets now available.',                        '2024-08-07 09:00:00'),
(14, 19, 'Obrigado, Frank! Come back next surf season!',                           '2024-08-10 10:00:00'),
(15, 20, 'Thank you, Iris! You were a perfect guest.',                             '2024-08-12 11:00:00'),
(6,  3,  'Thank you, Bob! Both of you were wonderful.',                            '2024-07-13 08:00:00'),
(7,  5,  'David was such a respectful guest. Five stars from me too.',             '2024-07-15 09:00:00'),
(8,  7,  'Thank you, Grace! Feedback is always welcome.',                          '2024-07-10 10:00:00'),
(9,  15, 'Thank you, Olivia! Henry was an absolute pleasure.',                     '2024-07-18 11:00:00'),
(10, 16, 'Thank you, Peter! Jack was excellent.',                                  '2024-07-24 09:00:00'),
(16, 3,  'Liam was tidy and polite. Highly recommended guest.',                    '2024-07-28 10:00:00'),
(17, 11, 'Noah kept everything immaculate. Would host again.',                     '2024-07-31 11:00:00'),
(18, 18, 'Quinn was considerate and left the flat in great shape.',                '2024-08-08 09:00:00'),
(19, 19, 'Frank was superb. Exactly the kind of guest we love.',                   '2024-08-11 10:00:00'),
(20, 20, 'Iris was a delight. Five stars without hesitation.',                     '2024-08-13 11:00:00');

-- ============================================================
-- 19. MESSAGES
-- ============================================================
CREATE TABLE IF NOT EXISTS messages (
    messages_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    sender_id    INTEGER NOT NULL REFERENCES users(users_id),
    receiver_id  INTEGER NOT NULL REFERENCES users(users_id),
    listings_id  INTEGER NOT NULL REFERENCES listings(listings_id),
    message_text TEXT NOT NULL,
    sent_at      DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO messages (sender_id, receiver_id, listings_id, message_text, sent_at) VALUES
(2,  3,  1,  'Hi Carla, is the studio available from July 5?',           '2024-05-28 10:00:00'),
(3,  2,  1,  'Yes, it is! Feel free to book.',                           '2024-05-28 11:00:00'),
(4,  5,  3,  'Hello Elena, can we get early check-in?',                  '2024-06-01 09:00:00'),
(5,  4,  3,  'Of course, I can arrange 11am check-in.',                  '2024-06-01 10:00:00'),
(6,  7,  4,  'Is parking available near the listing?',                   '2024-06-03 12:00:00'),
(7,  6,  4,  'There is a public car park 200m away.',                    '2024-06-03 13:00:00'),
(8,  15, 9,  'Is the loft suitable for remote work?',                    '2024-06-06 10:00:00'),
(15, 8,  9,  'Absolutely, there is a dedicated workspace with fast WiFi.','2024-06-06 11:00:00'),
(10, 16, 11, 'Is the hot tub shared or private?',                        '2024-06-08 14:00:00'),
(16, 10, 11, 'It is exclusively for our guests.',                        '2024-06-08 15:00:00'),
(12, 3,  2,  'Can we bring a dog?',                                      '2024-06-11 09:00:00'),
(3,  12, 2,  'Sorry, no pets policy at this listing.',                   '2024-06-11 10:00:00'),
(14, 11, 7,  'What is the distance to the beach?',                       '2024-06-13 11:00:00'),
(11, 14, 7,  'Only a 2-minute walk!',                                    '2024-06-13 12:00:00'),
(17, 18, 12, 'Is breakfast included?',                                   '2024-06-16 08:00:00'),
(18, 17, 12, 'The flat has a full kitchen for self-catering.',            '2024-06-16 09:00:00'),
(6,  19, 13, 'Are wetsuits available to rent?',                          '2024-06-18 10:00:00'),
(19, 6,  13, 'Yes, board and wetsuit rental is next door.',               '2024-06-18 11:00:00'),
(9,  20, 14, 'Is the loft accessible by wheelchair?',                    '2024-06-21 09:00:00'),
(20, 9,  14, 'Yes, there is a lift and step-free access throughout.',    '2024-06-21 10:00:00');

-- ============================================================
-- 20. FAVORITES
-- ============================================================
CREATE TABLE IF NOT EXISTS favorites (
    favorites_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    users_id      INTEGER NOT NULL REFERENCES users(users_id) ON DELETE CASCADE,
    listings_id   INTEGER NOT NULL REFERENCES listings(listings_id) ON DELETE CASCADE,
    UNIQUE(users_id, listings_id)
);

INSERT INTO favorites (users_id, listings_id) VALUES
(1,3),(1,9),(1,11),(2,4),(2,7),(4,1),(4,14),(6,8),(6,13),(8,9),
(8,11),(9,14),(10,11),(10,6),(12,2),(12,15),(14,7),(14,3),(17,9),(17,12);

-- ============================================================
-- 21. SEARCH_HISTORY
-- ============================================================
CREATE TABLE IF NOT EXISTS search_history (
    search_history_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    users_id           INTEGER NOT NULL REFERENCES users(users_id) ON DELETE CASCADE,
    search_city        VARCHAR(100),
    search_dates       VARCHAR(50),
    filters            TEXT,
    searched_at        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO search_history (users_id, search_city, search_dates, filters, searched_at) VALUES
(1,'Rome',      '2024-07-08 to 2024-07-12', '{"price_max":200,"amenities":["WiFi","Pool"]}',        '2024-05-30 09:00:00'),
(2,'Berlin',    '2024-07-05 to 2024-07-10', '{"price_max":100}',                                     '2024-05-27 10:00:00'),
(4,'Amsterdam', '2024-07-03 to 2024-07-07', '{"rooms":2}',                                           '2024-06-02 11:00:00'),
(6,'Amsterdam', '2024-07-01 to 2024-07-05', '{"price_max":150}',                                     '2024-06-04 09:00:00'),
(8,'Paris',     '2024-07-10 to 2024-07-15', '{"amenities":["Workspace"]}',                           '2024-06-07 10:00:00'),
(9,'Berlin',    '2024-08-05 to 2024-08-10', '{"amenities":["Kitchen","Dishwasher"]}',                '2024-06-22 11:00:00'),
(10,'Zürich',   '2024-07-14 to 2024-07-21', '{"amenities":["Hot Tub","Fireplace"]}',                 '2024-06-09 09:00:00'),
(12,'Berlin',   '2024-07-20 to 2024-07-25', '{"price_max":130}',                                     '2024-06-12 10:00:00'),
(14,'Barcelona','2024-07-22 to 2024-07-28', '{"amenities":["Parking"]}',                             '2024-06-14 11:00:00'),
(17,'Edinburgh','2024-08-01 to 2024-08-05', '{"price_max":120}',                                     '2024-06-17 09:00:00'),
(1,'Paris',     '2024-08-10 to 2024-08-14', '{"price_max":200}',                                     '2024-06-28 10:00:00'),
(2,'Granada',   '2024-08-12 to 2024-08-17', '{"amenities":["Pool","Garden"]}',                       '2024-07-01 11:00:00'),
(4,'Paris',     '2024-08-15 to 2024-08-20', '{"price_max":180}',                                     '2024-07-03 09:00:00'),
(6,'Geneva',    '2024-08-18 to 2024-08-22', '{"amenities":["Balcony"]}',                             '2024-07-05 10:00:00'),
(10,'Amsterdam','2024-08-20 to 2024-08-25', '{"price_max":250}',                                     '2024-07-07 11:00:00'),
(12,'Cascais',  '2024-09-01 to 2024-09-05', '{"amenities":["Garden"]}',                              '2024-07-08 09:00:00'),
(14,'Guadix',   '2024-09-05 to 2024-09-10', '{"amenities":["Pool"]}',                                '2024-07-10 10:00:00'),
(17,'Berlin',   '2024-09-08 to 2024-09-12', '{"price_max":100}',                                     '2024-07-12 11:00:00'),
(8,'Cascais',   '2024-09-10 to 2024-09-15', '{"amenities":["Garden","WiFi"]}',                       '2024-07-13 09:00:00'),
(9,'Berlin',    '2024-09-12 to 2024-09-17', '{"price_max":300,"amenities":["Kitchen","Dishwasher"]}','2024-07-14 10:00:00');

-- ============================================================
-- 22. SUPPORT_TICKETS
-- ============================================================
CREATE TABLE IF NOT EXISTS support_tickets (
    support_tickets_id  INTEGER PRIMARY KEY AUTOINCREMENT,
    users_id            INTEGER NOT NULL REFERENCES users(users_id) ON DELETE CASCADE,
    subject             VARCHAR(255) NOT NULL,
    description         TEXT NOT NULL,
    status              VARCHAR(20) NOT NULL CHECK(status IN ('open','in_progress','resolved','closed')),
    created_at          DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO support_tickets (users_id, subject, description, status, created_at) VALUES
(2,  'Check-in instructions missing', 'I did not receive check-in instructions for listing 1.',    'resolved',    '2024-07-04 10:00:00'),
(4,  'Incorrect amenities listed',    'The pool shown in listing 3 was not available on arrival.', 'resolved',    '2024-07-10 11:00:00'),
(6,  'Refund request',                'Cancelled reservation 16 due to illness. Awaiting refund.', 'resolved',    '2024-07-11 09:00:00'),
(8,  'Payment failed',                'My credit card was declined when booking listing 9.',        'resolved',    '2024-06-09 10:00:00'),
(10, 'Host unresponsive',             'No reply from host of listing 11 for 48 hours.',            'in_progress', '2024-06-11 11:00:00'),
(12, 'Booking not confirmed',         'Reservation 6 shows pending for 5 days.',                   'resolved',    '2024-06-16 09:00:00'),
(14, 'Noisy neighbours complaint',    'Listing 7 was adjacent to a construction site.',             'closed',      '2024-07-25 10:00:00'),
(17, 'Cleanliness issue',             'Listing 12 was not cleaned before our arrival.',             'in_progress', '2024-08-02 11:00:00'),
(6,  'WiFi not working',              'WiFi was down for 2 days during our stay at listing 13.',   'resolved',    '2024-08-06 09:00:00'),
(9,  'Billing dispute',               'Charged twice for reservation 10.',                          'in_progress', '2024-08-07 10:00:00'),
(1,  'Cannot add listing',            'Getting an error when trying to publish listing 15.',        'open',        '2024-07-02 08:00:00'),
(2,  'Review not posted',             'My review for reservation 1 did not appear.',                'resolved',    '2024-07-12 09:00:00'),
(4,  'Account login issue',           'Cannot log in after password reset.',                        'resolved',    '2024-07-04 10:00:00'),
(6,  'Payout delay',                  'Expected payout for reservation 3 is 3 days late.',          'resolved',    '2024-07-08 11:00:00'),
(8,  'Incorrect total price',         'Total shown at checkout did not match final charge.',         'closed',      '2024-07-16 09:00:00'),
(9,  'Profile photo not uploading',   'Profile image upload fails with a server error.',             'open',        '2024-08-10 10:00:00'),
(10, 'Cancellation policy unclear',   'Not sure if reservation 15 qualifies for a full refund.',    'in_progress', '2024-07-10 11:00:00'),
(12, 'Duplicate reservation',         'Booked listing 2 twice by accident.',                        'resolved',    '2024-06-16 09:00:00'),
(14, 'Missing payout',                'Host payout for reservation 7 not received.',                'resolved',    '2024-07-24 10:00:00'),
(17, 'Spam message received',         'Received a suspicious message from an unknown user.',         'closed',      '2024-08-03 11:00:00');

-- ============================================================
-- TEST QUERIES
-- ============================================================

-- TEST 1: All confirmed/completed reservations with guest name and listing title
SELECT r.reservations_id, up.first_name || ' ' || up.last_name AS guest,
       l.title, r.check_in, r.check_out, r.total_price, r.status
FROM reservations r
JOIN user_profiles up ON r.guest_id = up.users_id
JOIN listings l       ON r.listings_id = l.listings_id
WHERE r.status IN ('confirmed','completed')
ORDER BY r.check_in;

-- TEST 2: Average rating per listing (minimum 1 review)
SELECT l.listings_id, l.title, l.city,
       ROUND(AVG(rv.rating),2) AS avg_rating,
       COUNT(rv.reviews_id)    AS total_reviews
FROM listings l
JOIN reviews rv ON l.listings_id = rv.listings_id
GROUP BY l.listings_id
HAVING COUNT(rv.reviews_id) >= 1
ORDER BY avg_rating DESC;

-- TEST 3: Total revenue per host (completed payments only)
SELECT up.first_name || ' ' || up.last_name AS host,
       SUM(rp.amount) AS total_revenue
FROM payouts_to_hosts ph
JOIN user_profiles up ON ph.host_id = up.users_id
JOIN reservation_payments rp ON ph.reservations_id = rp.reservations_id
WHERE rp.status = 'completed'
GROUP BY ph.host_id
ORDER BY total_revenue DESC;

-- TEST 4: Ternary join — listing amenities with host name
SELECT l.title, a.name AS amenity, up.first_name || ' ' || up.last_name AS configured_by_host
FROM listing_amenities la
JOIN listings l      ON la.listings_id = l.listings_id
JOIN amenities a     ON la.amenities_id = a.amenities_id
JOIN user_profiles up ON la.host_id = up.users_id
ORDER BY l.title, a.name
LIMIT 20;

-- TEST 5: Ternary join — reservation guests per listing and reservation
SELECT rg.reservation_guests_id, r.reservations_id, l.title, rg.guest_name, rg.age
FROM reservation_guests rg
JOIN reservations r ON rg.reservations_id = r.reservations_id
JOIN listings l     ON rg.listings_id = l.listings_id
ORDER BY r.reservations_id;

-- TEST 6: Ternary join — payments linked to guest and reservation
SELECT rp.reservation_payments_id, r.reservations_id,
       up.first_name || ' ' || up.last_name AS guest,
       rp.amount, rp.method, rp.status
FROM reservation_payments rp
JOIN reservations r    ON rp.reservations_id = r.reservations_id
JOIN user_profiles up  ON rp.guest_id = up.users_id
ORDER BY rp.reservation_payments_id;

-- TEST 7: Open support tickets with user details
SELECT st.support_tickets_id, up.first_name || ' ' || up.last_name AS user,
       st.subject, st.status, st.created_at
FROM support_tickets st
JOIN user_profiles up ON st.users_id = up.users_id
WHERE st.status IN ('open','in_progress')
ORDER BY st.created_at;
