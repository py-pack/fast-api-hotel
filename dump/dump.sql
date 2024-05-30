--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hotels (id, name, location, service, rooms_quantity, image_id) VALUES (1, 'Corpo Santo Lisbon Historical Hotel', 'Largo do Corpo Santo, 25, Лиссабон 1200-129 Португалия', '["Платная общественная парковка на территории",
"Бесплатный WiFi",
"Фитнес-центр",
"Бесплатный завтрак",
"Пешие походы",
"Пешеходные экскурсии",
"Книги, DVD, музыка для детей",
"Детские ТВ-сети"]', 354, 1);
INSERT INTO public.hotels (id, name, location, service, rooms_quantity, image_id) VALUES (2, 'Hotel Da Baixa', 'Rua da Prata, 231, Лиссабон 1100-417 Португалия', '["Гипоаллергенный номер",
"Шторы, блокирующие свет",
"Кондиционер",
"Письменный стол",
"Уборка номеров",
"Кофеварка/чайник",
"Кабельное или спутниковое ТВ",
"Душевая кабина без поддона на полу",
"Звукоизоляция номеров",
"Купальные халаты",
"Имеются номера с сообщающимися комнатами",
"Обслуживание номеров",
"Сейф",
"Телефон",
"Шкаф для одежды/встроенный гардероб",
"Бутилированная вода",
"Напольная вешалка для одежды",
"Утюг"]', 285, 2);
INSERT INTO public.hotels (id, name, location, service, rooms_quantity, image_id) VALUES (3, 'Blue Liberdade Hotel', 'Praça dos Restauradores 78, Лиссабон 1250-188 Португалия', '["Гипоаллергенный номер",
"Шторы, блокирующие свет",
"Кондиционер",
"Письменный стол",
"Уборка номеров",
"Мини-бар",
"Кабельное или спутниковое ТВ",
"Душевая кабина без поддона на полу"]', 208, 3);
INSERT INTO public.hotels (id, name, location, service, rooms_quantity, image_id) VALUES (4, 'ICON Duplo Ribeira', 'Rua De São João, 104, Порту 4050-551 Португалия', '["Гипоаллергенный номер",
"Шторы, блокирующие свет",
"Кондиционер",
"Сейф",
"Телефон",
"Услуга побудки/будильник",
"Ванна/душ",
"Бесплатные туалетные принадлежности"]', 231, 4);
INSERT INTO public.hotels (id, name, location, service, rooms_quantity, image_id) VALUES (5, 'Se Catedral Hotel Porto, Tapestry Collection By Hilton', 'Rua Chã 38 E 44, Порту 4000-164 Португалия', '["Гипоаллергенный номер",
"Шторы, блокирующие свет",
"Кондиционер",
"Письменный стол",
"Кофеварка/чайник",
"Кабельное или спутниковое ТВ",
"Диван-кровать",
"Душевая кабина без поддона на полу"]', 224, 5);
INSERT INTO public.hotels (id, name, location, service, rooms_quantity, image_id) VALUES (6, 'The House on Pink Street', 'Travessa do Corpo Santo, 29, Лиссабон 1200-045 Португалия', '["Гипоаллергенный номер",
"Шторы, блокирующие свет",
"Кондиционер",
"Письменный стол",
"Кофеварка/чайник",
"Кабельное или спутниковое ТВ",
"Диван-кровать",
"Душевая кабина без поддона на полу"]', 207, 6);


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (1, 1, 'Двухместный номер Classic', 'двуспальная кровать', 355, '["20 м2",
"Собственная ванная комната",
"Сейф",
"Минибар",
"Бесплатный Wi-Fi",
"Кофе",
"Кондиционер",
"Телевизор"]', 4, 1);
INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (2, 1, 'Двухместный номер Superior', 'Двуспальная кровать
Питание не включено
Для некурящих', 393, '["30 м2",
"Собственная ванная комната",
"Сейф",
"Минибар",
"Бесплатный Wi-Fi",
"Кофе",
"Кондиционер",
"Телевизор",
"Бутилированная вода",
"Полотенца",
"Туалетные принадлежности"]', 5, 11);
INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (5, 3, 'Двухместный номер Classic с видом на внутренний двор', 'Двуспальная кровать
Питание не включено
Тип кровати может измениться
Для некурящих', 244, '["Собственная ванная комната",
"Сейф",
"Минибар",
"Бесплатный Wi-Fi",
"Кондиционер",
"Подходит для гостей с аллергией"]', 8, 3);
INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (3, 2, 'Четырёхместные апартаменты Premier с 2 комнатами с балконом и с видом на город', 'Выбор туристов, которые хотят везде чувствовать себя как дома — апартаменты «LV Premier Baixa PR» находятся в Лиссабоне. Эти апартаменты располагаются в центре города. Утром — выпейте кофе, наблюдая из окна за жизнью города. Рядом с апартаментами можно прогуляться. Неподалёку: Núcleo Arqueológico, Музей дизайна и моды MUDE и Торговый центр Armazens do Chiado.', 479, '["Различные типы кроватей",
"Питание не включено",
"2 комнаты",
"Для некурящих",
"Собственная ванная комната"]
', 2, 2);
INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (4, 3, 'Двухместный номер Classic с видом на город', 'Двуспальная кровать
Питание не включено
Тип кровати может измениться
Для некурящих', 279, '["Собственная ванная комната",
"Сейф",
"Минибар",
"Бесплатный Wi-Fi",
"Кондиционер",
"Подходит для гостей с аллергией"]', 12, 17);
INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (6, 3, 'Двухместный номер Standard с видом на город', 'Двуспальная кровать
Питание не включено
Тип кровати может измениться
Для некурящих', 263, '["Собственная ванная комната",
"Сейф",
"Минибар",
"Бесплатный Wi-Fi",
"Кондиционер",
"Подходит для гостей с аллергией",
"Телевизор"]', 8, 13);
INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (7, 4, 'Двухместный номер Standard', 'Двуспальная кровать
Завтрак включён
Тип кровати может измениться
Для некурящих', 263, '["Собственная ванная комната",
"Сейф",
"Минибар",
"Бесплатный Wi-Fi",
"Кондиционер",
"Телевизор",
"Полотенца",
"Душ"]', 1, 4);
INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (8, 4, 'Двухместный номер Standard', 'Завтрак включён
Тип кровати может измениться
Для некурящих', 263, '["Собственная ванная комната",
"Сейф",
"Минибар",
"Бесплатный Wi-Fi",
"Кондиционер",
"Телевизор",
"Полотенца",
"Душ"]', 3, 14);
INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (10, 5, 'Номер с кроватью размера King – с оборудованным доступом (King Accessible Room)', 'Преимущества
Бесплатная отмена до 5 июня 2024
Не платите до 3 июня 2024
Бесплатный Wi-Fi', 224, '["1 кровать размера King",
"Номера для некурящих",
"Душ"]', 4, 5);
INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (9, 4, 'Номер Standard', 'Различные типы кроватей
Завтрак включён
Бесплатная отмена до 6 июня*
Оплата сейчас', 271, '["Собственная ванная комната",
"Сейф",
"Минибар",
"Бесплатный Wi-Fi",
"Кондиционер",
"Телевизор",
"Полотенца",
"Душ",
"Фен",
"Шкаф",
"Телефон",
"Отопление"]', 2, 18);
INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (11, 5, 'Номер с кроватью размера Queen (Queen Guest Room)', 'Преимущества
Бесплатная отмена до 5 июня 2024
Не платите до 3 июня 2024
Бесплатный Wi-Fi', 243, '["1 кровать размера Queen", "Площадь номера: 18 м²/194 фут²", "Номера для некурящих", "Душ", "Мини-кухня"]', 3, 15);
INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (13, 6, 'Апартаменты с 1 спальней (One-Bedroom Apartment)', 'Преимущества
Бесплатная отмена до 26 августа 2024
Не платите до 24 августа 2024
Кофе и чай, Бесплатный Wi-Fi, Питьевая вода', 286, '["1 кровать размера Queen & 1 диван-кровать",
"Площадь номера: 40 м²/431 фут²",
"Вид: Вид наружу",
"Душ",
"Мини-кухня"]', 2, 16);
INSERT INTO public.rooms (id, hotel_id, name, description, price, services, quantity, image_id) VALUES (12, 6, 'Стандартный номер-студия (Standard Studio)', 'Преимущества
Бесплатная отмена до 26 августа 2024
Не платите до 24 августа 2024
Кофе и чай, Бесплатный Wi-Fi, Питьевая вода', 267, '["1 кровать размера Queen",
"Площадь номера: 30 м²/323 фут²",
"Вид: Вид наружу",
"Душ",
"Мини-кухня"]', 4, 6);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, email, hashed_password) VALUES (1, 'vasjan@gmail.com', 'tyt_budet_hash_1');
INSERT INTO public.users (id, email, hashed_password) VALUES (2, 'masha@gmail.com', 'tyt_budet_hash_2');


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bookings (id, room_id, user_id, date_from, date_to, price) VALUES (1, 1, 2, '2024-08-22', '2024-08-25', 355);
INSERT INTO public.bookings (id, room_id, user_id, date_from, date_to, price) VALUES (2, 10, 1, '2024-10-14', '2024-10-21', 224);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_id_seq', 2, true);


--
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotels_id_seq', 6, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

