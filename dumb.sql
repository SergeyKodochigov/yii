DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;

INSERT INTO `news` (`id`, `name`, `content`)
VALUES
	(1,'В США разрешено применение финглимода для лечения детей с рассеянным ','В рамках клинического исследования через 24 месяцев терапии финглимодом у 86% пациентов не было рецидивов, тогда как в контрольной группе только у 46% обошлось без обострений.'),
	(2,'ИНВИТРО станет единоличным ','В ИНВИТРО сообщили, что бренд ЛЕЧУ будет сохранен, причем в публичном пространстве его связь с родительским брендом INVITRO будет поддержана путем коммуникационных мероприятий.'),
	(3,'Минфин предложил увеличить финансирование Минздрава','Основная программа, на которую предлагается выделить дополнительные средства – «Развитие здравоохранения».'),
	(4,'25% пациентов поставили \"неуд\" своим поликлиникам','Оптимизация здравоохранения, увы, не оправдала надежд тех, ради кого она и была затеяна по всей стране. Хотелось бы думать, что чиновники от здравоохранения надеялись в результате объединения поликлиник в амбулаторно-поликлинические центры уйти от очереде'),
	(5,'Как уберечь сердце от «отдыха» на даче','Дачная жизнь для человека немолодого, особенно живущего в мегаполисе, конечно, — настоящее спасение. Цветочки-листочки, зеленая, еще не запыленная травка, воздух… Релакс! Но только при условии, если на своих шести сотках… ничего не делать. Хотя такое вряд'),
	(6,'Старейшему учёному надоело жить, и он решил добровольно умереть','Самый старейший учёный из Австралии 104-летний Дэвид Гудолл, страдающий неизлечимым заболеванием и испытывающий невыносимые боли, решил отправиться в последний путь в Швейцарию, чтобы пройти процедуру эвтаназии и безболезненно умереть со спокойной душой');

/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`)
VALUES
	(5,'alex','dssv3dHmd-M1qEkjKV_c3BgjR7w1RJPH','$2y$13$t4DVDuEaDLiiIbQzxLDa1.whJzGCL6KGizb6I6sqroG6jxi8pMFhi',NULL,'super.tchervon2011@yandex.ru',10,1526320460,1526320460);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
