-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 27, 2023 at 07:44 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `goodsalenew.ru`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `created_at`, `updated_at`, `title`, `description`, `price`, `picture`, `user_id`, `city`, `status_id`) VALUES
(12, '2023-02-20 16:08:55', '2023-02-20 16:08:55', 'BMW 3 серии 320d VII (G2x)', 'Салонам не беспокоить, буду хамить. Возможна продажа через салон в кредит. Так же возможен трейд ин. (я не салон)\r\n\r\nВ продаже популярный и надежный седан от немецкого концерна - BMW 320d (G20) в богатой комплектация M Sport в сером цвете с красивым спортивным салоном.\r\nЗа все время эксплуатации по факту 2 владельца.\r\nТехническое обслуживание проводилось по регламенту у дилера BMW\r\nПоследние ТО на 84 394 км\r\nВ комплектацию автомобиля входит:\r\n- LED Fog Lights\r\n- Система обогрева рулевого колеса\r\n- Спортивные тормоза М\r\n- Спортивный комплект стиль М\r\n- Автоматическая система кондиционирования\r\n- Круиз-контроль с функцией подтормаживанием\r\n- Спортивная ходовая часть М\r\n- Кожаное рулевое колесо в М-стиле\r\n- Активная защита пешеходов', '2490000', 'JUEkTUWFR61h5UEa7jzznldintjuh5647B6t5SB8.webp', 4, 'Санкт-Петербург улица Маршала Захарова, 10', 3),
(13, '2023-02-20 16:11:52', '2023-02-20 16:11:52', 'Toyota Camry VIII (XV70)', 'Комплектация prestige safety. 1 владелец, автомобиль покупался в лизинг на мою организацию, выкуплен на меня 10 месяцев назад. Ездила супруга. GSM сигнализация star line. Аудио система JBL . 2 комплекта ключей. резина зима лето. Шумоизоляция в 3 слоя всего автомобиля кроме крыши. На 60000 сделано ТО. Жена наехала на ветку которая упала, повредила бампер крыло пер. зад. Торг.', '2200000', 'RJklZl3BRZUgnNEZ92Wkd1igdeIksGIhl62fd9Oj.webp', 4, 'Москва, Егорьевск', 3),
(14, '2023-02-20 16:15:16', '2023-02-20 16:15:16', 'BMW 3 серии 320d VII (G2x)', 'Немецкая сборка. М-пакет, комплектация Pure, лазерные фары (в пленке), диски 19\", шины разноширокие. Своевременное обслуживание. Пройдены все ТО у официального дилера. Не участвовала в ДТП. Сервисная книжка электронная. Комплект зимних шин в подарок. Непрокуренный салон. Идеальное состояние. Нет ни одного крашеного элемента, готов на все проверки и диагностику. Сделан сход-развал. Сделано ТО 1000 км назад с заменой топливного фильтра. Гаражное хранение.\r\nНемецкая сборка. М-пакет, комплектация Pure, лазерные фары (в пленке), диски 19\", шины разноширокие. Своевременное обслуживание. Пройдены все ТО у официального дилера. Не участвовала в ДТП. Сервисная книжка электронная. Комплект зимних шин в подарок. Непрокуренный салон. Идеальное состояние. Нет ни одного крашеного элемента, готов на все проверки и диагностику. Сделан сход-развал. Сделано ТО 1000 км назад с заменой топливного фильтра. Гаражное хранение.\r\nНемецкая сборка. М-пакет, комплектация Pure, лазерные фары (в пленке), диски 19\", шины разноширокие. Своевременное обслуживание. Пройдены все ТО у официального дилера. Не участвовала в ДТП. Сервисная книжка электронная. Комплект зимних шин в подарок. Непрокуренный салон. Идеальное состояние. Нет ни одного крашеного элемента, готов на все проверки и диагностику. Сделан сход-развал. Сделано ТО 1000 км назад с заменой топливного фильтра. Гаражное хранение.', '3300000', 'Ij2z3H3oWgvBPgCANWZcje6IkB0CkZxmC9Xpu8Kn.webp', 4, 'Медведково Москва Широкая улица, 14к2', 3),
(19, '2023-02-27 16:16:05', '2023-02-27 16:17:22', 'Land Rover Range Rover IV', 'Комплектация SE ( люк, панорама, доводчики дверей, контроль слепых зон, адаптивный свет, массаж, вентиляция всех сидений и многое другое -все работает штатно). Все ТО проходились во время, замена масла каждые 9 000 км, все чеки и заказ наряды имеются. Салон в отличном состоянии, все системы работают исправно. Автомобиль в родной краске. На автомобиль оформлялась дополнительная гарантия на двигатель, АКПП и др основные узлы и агрегаты и действует до августа 23 г ( ей не пользовались) и перейдет новому владельцу. Зимняя и летняя резина. Настоящий, живой РР. Пробег честный . Любые проверки за ваш счет . По факту 3 владельца , птс дубликат из -за количества записей двух владельцев. Я собственник , продаю сам и показываю машину тоже сам. Возможен адекватный торг у капота . Автосалонам просьба не беспокоить.', '3680000', 'dsOgzMGCceHL30t0xbboxqfpIL8Rig1MhTqBLJ1o.webp', 4, 'Санкт-Петербург', 3),
(20, '2023-02-27 16:18:55', '2023-02-27 16:18:55', 'Mazda Roadster IV (ND)', 'Родстер в отличном состоянии\r\nЭптс на руках\r\nВы будите первым хозяином\r\nПомогу с доставкой транспортной компанией\r\nАукцион есть', '1500000', 'Lz3dxIqWitZgJEa0chJvTAViBOkFvxby0urF5eNl.webp', 4, 'Владивосток', 3),
(21, '2023-02-27 16:28:18', '2023-02-27 16:31:39', 'BMW 3 серии 320d VII (G2x)', 'Местная дилерская! Не путайте с полупустыми ввезёнными машинами!\r\n\r\nПо машине- она ЛУЧШАЯ в своём классе и у меня лучшее её исполнение-\r\nBMW 320d G20 190лс 2019г\r\n-В документах я 1-й физ. собственник, т.к. она висела на балансе у дилера Атлас БМВ Сочи, я за ней летал из Питера и мало того что она жила в идеальном климате, и я хранил ее в тёплом паркинге всё время!\r\n-Пробег 63т\r\n-Так как я брал на пробеге 50, весь этот пробег обслуживание было исключительно дилер, я же в связи с ситуации в стране, в дилер не поехал как привёз ее в Питер, а поехал в проверенный около-дилер bmw и полностью обслуживал её там, пройдено ТО (масла,фильтра,тормозная жидкость и антифриз,термостат,диски/колодки)\r\n-Был несерьезный инцидент у дилера, зацепили крыло и поцарапали фару, там же в дилере поменяли, я проверял лично*, был пустяк, можно не акцентировать даже внимание.\r\n-Кузов в идеальнейшем состоянии-покрыт керамикой всю жизнь авто (недавно обновляли), фары в плёнке\r\n-Дополнительные опции:\r\n-M пакет\r\n-Лазерная оптика\r\n-М спорт pro тормозная система\r\n-Опционные диски r18\r\n- Навигация (CarPlay)\r\n- Память сидений\r\n- Двойные стёкла\r\n- Камера заднего вида с бесключевым доступом,багажник с ноги открывается, проведя ногой под бампером\r\n- Автопарковка\r\n- Спойлер лезвие багажник\r\n- Чёрные ноздри (ориг серебро отдам)\r\n- М зеркала (ориг синие отдам)\r\n\r\nДва новых комплекта резины (зима,лето) идут комплектом с машиной\r\n\r\nМашину продаёт моя мама, т.к. я уже пол года живу в Дубае.', '3450000', 'XZlwDj9HcdHDVktzrwLsqkSTXBTfvIFjfpGsN0dW.webp', 6, 'Нарвская, Санкт-Петербург, площадь Стачек, 2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(13, '2014_10_12_000000_create_users_table', 1),
(14, '2014_10_12_100000_create_password_resets_table', 1),
(15, '2019_08_19_000000_create_failed_jobs_table', 1),
(16, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(17, '2023_02_08_220920_add_phone_num_to_users', 2),
(18, '2023_02_08_224553_create_ads_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone_num` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `phone_num`) VALUES
(4, 'Станислав Коптелин', 'stan.koptelin1@yandex.ru', NULL, '$2y$10$P1GGLaNRBVzkzrueiIX57OAJVc6HZfsM0/LNZ/kglflER.7B5LcIK', NULL, '2023-02-15 14:31:28', '2023-02-23 11:59:52', '89877178413'),
(5, 'Станислав', 'stan.koptelin21@yandex.ru', NULL, '$2y$10$8.k08Hsl9ye0vRoySgLsnukBriYsfxw/qRtOwqk13eHCUJZ3Yd65i', NULL, '2023-02-21 06:58:41', '2023-02-21 06:59:53', '89877178412'),
(6, 'Станислав Коптелин', 'stan.koptelin123@123', NULL, '$2y$10$b8dtJk2apA0.U/8lZZhiKu3BUtGkR5dBoeK6WY0lNPRVipW6I.k02', NULL, '2023-02-21 07:22:52', '2023-02-27 16:32:33', '89877178412'),
(7, 'Николай', 'stan.koptelin27@yandex.ru', NULL, '$2y$10$X3Vflj4U9utdpyfPJatOfO4gFkijWohkqDn8.6K1D/hUv3O.ADu26', NULL, '2023-02-27 16:19:53', '2023-02-27 16:19:53', '89877178412');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ads_title_index` (`title`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
