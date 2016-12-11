# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.25)
# Database: laravel_typicms
# Generation Time: 2016-12-11 00:30:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table typicms_block_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_block_translations`;

CREATE TABLE `typicms_block_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `block_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `block_translations_block_id_locale_unique` (`block_id`,`locale`),
  CONSTRAINT `block_translations_block_id_foreign` FOREIGN KEY (`block_id`) REFERENCES `typicms_blocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table typicms_blocks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_blocks`;

CREATE TABLE `typicms_blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table typicms_file_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_file_translations`;

CREATE TABLE `typicms_file_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `alt_attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file_translations_file_id_locale_unique` (`file_id`,`locale`),
  KEY `file_translations_locale_index` (`locale`),
  CONSTRAINT `file_translations_file_id_foreign` FOREIGN KEY (`file_id`) REFERENCES `typicms_files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table typicms_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_files`;

CREATE TABLE `typicms_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned DEFAULT NULL,
  `type` enum('a','v','d','i','o') COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `filesize` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_gallery_id_foreign` (`gallery_id`),
  CONSTRAINT `files_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `typicms_galleries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table typicms_galleries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_galleries`;

CREATE TABLE `typicms_galleries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table typicms_gallery_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_gallery_translations`;

CREATE TABLE `typicms_gallery_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_translations_gallery_id_locale_unique` (`gallery_id`,`locale`),
  UNIQUE KEY `gallery_translations_locale_slug_unique` (`locale`,`slug`),
  CONSTRAINT `gallery_translations_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `typicms_galleries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table typicms_galleryables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_galleryables`;

CREATE TABLE `typicms_galleryables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` int(10) unsigned NOT NULL,
  `galleryable_id` int(10) unsigned NOT NULL,
  `galleryable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleryables_gallery_id_foreign` (`gallery_id`),
  CONSTRAINT `galleryables_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `typicms_galleries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table typicms_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_history`;

CREATE TABLE `typicms_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `historable_id` int(10) unsigned NOT NULL,
  `historable_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `historable_table` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_history` WRITE;
/*!40000 ALTER TABLE `typicms_history` DISABLE KEYS */;

INSERT INTO `typicms_history` (`id`, `historable_id`, `historable_type`, `user_id`, `title`, `icon_class`, `locale`, `historable_table`, `action`, `created_at`, `updated_at`)
VALUES
	(1,1,'TypiCMS\\Modules\\Users\\Models\\User',NULL,'Admin Admin','fa-plus-circle',NULL,'users','created','2016-12-11 00:24:03','2016-12-11 00:24:03');

/*!40000 ALTER TABLE `typicms_history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_menu_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_menu_translations`;

CREATE TABLE `typicms_menu_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_translations_menu_id_locale_unique` (`menu_id`,`locale`),
  KEY `menu_translations_locale_index` (`locale`),
  CONSTRAINT `menu_translations_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `typicms_menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_menu_translations` WRITE;
/*!40000 ALTER TABLE `typicms_menu_translations` DISABLE KEYS */;

INSERT INTO `typicms_menu_translations` (`id`, `menu_id`, `locale`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,'fr',1,'2014-02-17 16:00:00','2014-02-17 16:00:00'),
	(2,1,'nl',1,'2014-02-17 16:00:00','2014-02-17 16:00:00'),
	(3,1,'en',1,'2014-02-17 16:00:00','2014-02-17 16:00:00'),
	(4,1,'es',1,'2014-02-17 16:00:00','2014-02-17 16:00:00'),
	(5,2,'fr',1,'2014-02-17 16:00:00','2014-02-17 16:00:00'),
	(6,2,'nl',1,'2014-02-17 16:00:00','2014-02-17 16:00:00'),
	(7,2,'en',1,'2014-02-17 16:00:00','2014-02-17 16:00:00'),
	(8,2,'es',1,'2014-02-17 16:00:00','2014-02-17 16:00:00'),
	(9,3,'fr',1,'2014-02-04 18:27:18','2014-02-04 18:35:01'),
	(10,3,'nl',1,'2014-02-04 18:27:18','2014-02-04 18:35:01'),
	(11,3,'en',1,'2014-02-04 18:27:18','2014-02-04 18:35:01'),
	(12,3,'es',1,'2014-02-04 18:27:18','2014-02-04 18:35:01');

/*!40000 ALTER TABLE `typicms_menu_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_menulink_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_menulink_translations`;

CREATE TABLE `typicms_menulink_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menulink_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menulink_translations_menulink_id_locale_unique` (`menulink_id`,`locale`),
  KEY `menulink_translations_locale_index` (`locale`),
  CONSTRAINT `menulink_translations_menulink_id_foreign` FOREIGN KEY (`menulink_id`) REFERENCES `typicms_menulinks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_menulink_translations` WRITE;
/*!40000 ALTER TABLE `typicms_menulink_translations` DISABLE KEYS */;

INSERT INTO `typicms_menulink_translations` (`id`, `menulink_id`, `locale`, `status`, `title`, `url`, `created_at`, `updated_at`)
VALUES
	(1,1,'fr',1,'Accueil','','2014-03-28 00:00:00','2014-03-28 00:00:00'),
	(2,1,'nl',1,'Home','','2014-03-28 00:00:00','2014-03-28 00:00:00'),
	(3,1,'en',1,'Home','','2014-03-28 00:00:00','2014-03-28 00:00:00'),
	(4,1,'es',1,'Inicio','','2014-03-28 00:00:00','2014-03-28 00:00:00'),
	(5,2,'fr',1,'Contact','','2014-03-28 00:00:00','2014-03-28 13:29:27'),
	(6,2,'nl',1,'Contact','','2014-03-28 00:00:00','2014-03-28 13:29:27'),
	(7,2,'en',1,'Contact','','2014-03-28 00:00:00','2014-03-28 13:29:27'),
	(8,2,'es',1,'Contacto','','2014-03-28 00:00:00','2014-03-28 13:29:27'),
	(9,3,'fr',1,'Contact','','2014-03-28 17:20:16','2014-03-28 13:30:40'),
	(10,3,'nl',1,'Contact','','2014-03-28 17:20:16','2014-03-28 13:30:40'),
	(11,3,'en',1,'Contact','','2014-03-28 17:20:16','2014-03-28 13:30:40'),
	(12,3,'es',1,'Contact','','2014-03-28 17:20:16','2014-03-28 13:30:40'),
	(13,4,'fr',1,'Conditions d’utilisation','','2014-03-28 17:20:43','2014-03-28 17:20:51'),
	(14,4,'nl',1,'Gebruiksvoorwaarden','','2014-03-28 17:20:43','2014-03-28 17:20:47'),
	(15,4,'en',1,'Terms of use','','2014-03-28 17:20:43','2014-03-28 17:20:44'),
	(16,4,'es',1,'Términos de uso','','2014-03-28 17:20:43','2014-03-28 17:20:51'),
	(17,5,'fr',1,'Facebook','https://www.facebook.com','2014-03-28 18:30:11','2014-03-28 18:30:17'),
	(18,5,'nl',1,'Facebook','https://www.facebook.com','2014-03-28 18:30:11','2014-03-28 18:30:17'),
	(19,5,'en',1,'Facebook','https://www.facebook.com','2014-03-28 18:30:11','2014-03-28 18:30:17'),
	(20,5,'es',1,'Facebook','https://www.facebook.com','2014-03-28 18:30:11','2014-03-28 18:30:17'),
	(21,6,'fr',1,'Twitter','https://twitter.com','2014-03-28 18:31:35','2014-03-28 18:31:47'),
	(22,6,'nl',1,'Twitter','https://twitter.com','2014-03-28 18:31:35','2014-03-28 18:31:44'),
	(23,6,'en',1,'Twitter','https://twitter.com','2014-03-28 18:31:35','2014-03-28 18:31:42'),
	(24,6,'es',1,'Twitter','https://twitter.com','2014-03-28 18:31:35','2014-03-28 18:31:47');

/*!40000 ALTER TABLE `typicms_menulink_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_menulinks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_menulinks`;

CREATE TABLE `typicms_menulinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_categories` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menulinks_menu_id_foreign` (`menu_id`),
  KEY `menulinks_parent_id_foreign` (`parent_id`),
  CONSTRAINT `menulinks_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `typicms_menus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `menulinks_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `typicms_menulinks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_menulinks` WRITE;
/*!40000 ALTER TABLE `typicms_menulinks` DISABLE KEYS */;

INSERT INTO `typicms_menulinks` (`id`, `menu_id`, `page_id`, `parent_id`, `position`, `target`, `class`, `icon_class`, `has_categories`, `created_at`, `updated_at`)
VALUES
	(1,1,1,NULL,1,'','',NULL,0,'2014-03-28 22:08:05','2014-03-28 18:58:25'),
	(2,1,2,NULL,2,'','',NULL,0,'2014-03-28 23:18:49','2014-03-28 18:58:25'),
	(3,2,2,NULL,1,'','',NULL,0,'2014-03-28 17:20:16','2014-03-28 13:32:46'),
	(4,2,3,NULL,2,'','',NULL,0,'2014-03-28 17:20:43','2014-03-28 17:31:37'),
	(5,3,0,NULL,1,'_blank','btn-facebook','fa fa-facebook fa-fw',0,'2014-03-28 18:30:11','2014-03-28 18:30:17'),
	(6,3,0,NULL,2,'_blank','btn-twitter','fa fa-twitter fa-fw',0,'2014-03-28 18:31:35','2014-03-28 18:31:47');

/*!40000 ALTER TABLE `typicms_menulinks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_menus`;

CREATE TABLE `typicms_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_menus` WRITE;
/*!40000 ALTER TABLE `typicms_menus` DISABLE KEYS */;

INSERT INTO `typicms_menus` (`id`, `name`, `class`, `created_at`, `updated_at`)
VALUES
	(1,'main','','2013-09-03 22:05:21','2014-02-17 16:00:00'),
	(2,'footer','','2013-09-03 22:05:42','2014-02-17 16:00:00'),
	(3,'social','','2014-02-04 18:27:18','2014-02-17 16:00:00');

/*!40000 ALTER TABLE `typicms_menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_migrations`;

CREATE TABLE `typicms_migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_migrations` WRITE;
/*!40000 ALTER TABLE `typicms_migrations` DISABLE KEYS */;

INSERT INTO `typicms_migrations` (`migration`, `batch`)
VALUES
	('2012_12_06_225921_create_users_table',1),
	('2012_12_06_225922_create_password_resets_table',1),
	('2013_08_29_174626_create_pages_table',1),
	('2013_09_03_084147_create_menus_tables',1),
	('2013_09_03_084148_create_menulinks_tables',1),
	('2013_10_29_224632_create_settings_table',1),
	('2014_02_28_223553_create_translations_table',1),
	('2014_05_09_095101_create_galleries_table',1),
	('2014_05_09_110000_create_files_table',1),
	('2014_05_28_103804_create_galleryable_table',1),
	('2014_06_19_090602_create_blocks_table',1),
	('2014_11_03_151402_create_history_table',1),
	('2016_12_11_002335_create_permission_tables',1);

/*!40000 ALTER TABLE `typicms_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_page_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_page_translations`;

CREATE TABLE `typicms_page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page_translations_page_id_locale_unique` (`page_id`,`locale`),
  UNIQUE KEY `page_translations_locale_uri_unique` (`locale`,`uri`),
  KEY `page_translations_locale_index` (`locale`),
  CONSTRAINT `page_translations_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `typicms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_page_translations` WRITE;
/*!40000 ALTER TABLE `typicms_page_translations` DISABLE KEYS */;

INSERT INTO `typicms_page_translations` (`id`, `page_id`, `locale`, `slug`, `uri`, `title`, `body`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `created_at`, `updated_at`)
VALUES
	(1,1,'fr','',NULL,'Accueil','<h1>Accueil</h1>',1,'','','','2014-03-28 16:00:00','2014-03-28 16:00:00'),
	(2,1,'nl','',NULL,'Home','<h1>Home</h1>',1,'','','','2014-03-28 16:00:00','2014-03-28 16:00:00'),
	(3,1,'en','',NULL,'Home','<h1>Home</h1>',1,'','','','2014-03-28 16:00:00','2014-03-28 16:00:00'),
	(4,1,'es','',NULL,'Inicio','<h1>Inicio</h1>',1,'','','','2014-03-28 16:00:00','2014-03-28 16:00:00'),
	(5,2,'fr','contact','contact','Contact','<h1>Contact</h1>',1,'','','','2014-03-28 16:00:00','2014-03-28 16:00:00'),
	(6,2,'nl','contact','contact','Contact','<h1>Contact</h1>',1,'','','','2014-03-28 16:00:00','2014-03-28 16:00:00'),
	(7,2,'en','contact','contact','Contact','<h1>Contact</h1>',1,'','','','2014-03-28 16:00:00','2014-03-28 16:00:00'),
	(8,2,'es','contacto','contacto','Contacto','<h1>Contacto</h1>',1,'','','','2014-03-28 16:00:00','2014-03-28 16:00:00'),
	(9,3,'fr','conditions-d-utilisation','conditions-d-utilisation','Conditions d’utilisation','<h1>Conditions d’utilisation</h1>',1,'','','','2014-03-28 16:00:00','2014-03-28 16:00:00'),
	(10,3,'nl','gebruiksvoorwaarden','gebruiksvoorwaarden','Gebruiksvoorwaarden','<h1>Gebruiksvoorwaarden</h1>',1,'','','','2014-03-28 16:00:00','2014-03-28 16:00:00'),
	(11,3,'en','terms-of-use','terms-of-use','Terms of use','<h1>Terms of use</h1>',1,'','','','2014-03-28 16:00:00','2014-03-28 16:00:00'),
	(12,3,'es','termino-de-uso','terminos-de-uso','Términos de uso','<h1>Términos de uso</h1>',1,'','','','2014-03-28 16:00:00','2014-03-28 16:00:00');

/*!40000 ALTER TABLE `typicms_page_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_pages`;

CREATE TABLE `typicms_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `meta_robots_no_index` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `meta_robots_no_follow` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `is_home` tinyint(1) NOT NULL DEFAULT '0',
  `redirect` tinyint(1) NOT NULL DEFAULT '0',
  `no_cache` tinyint(1) NOT NULL DEFAULT '0',
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `module` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_parent_id_foreign` (`parent_id`),
  CONSTRAINT `pages_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `typicms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_pages` WRITE;
/*!40000 ALTER TABLE `typicms_pages` DISABLE KEYS */;

INSERT INTO `typicms_pages` (`id`, `meta_robots_no_index`, `meta_robots_no_follow`, `image`, `position`, `parent_id`, `private`, `is_home`, `redirect`, `no_cache`, `css`, `js`, `module`, `template`, `created_at`, `updated_at`)
VALUES
	(1,'','',NULL,0,NULL,0,1,0,0,'','',NULL,'home','2014-03-28 21:57:44','2014-03-28 20:26:35'),
	(2,'','',NULL,0,NULL,0,0,0,0,'','',NULL,'','2014-03-28 21:52:13','2014-03-28 21:08:14'),
	(3,'','',NULL,0,NULL,0,0,0,0,'','',NULL,'','2014-03-28 21:58:30','2014-03-28 20:59:15');

/*!40000 ALTER TABLE `typicms_pages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_password_resets`;

CREATE TABLE `typicms_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table typicms_permission_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_permission_role`;

CREATE TABLE `typicms_permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `typicms_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `typicms_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_permission_role` WRITE;
/*!40000 ALTER TABLE `typicms_permission_role` DISABLE KEYS */;

INSERT INTO `typicms_permission_role` (`permission_id`, `role_id`)
VALUES
	(1,1),
	(2,1),
	(3,1),
	(4,1),
	(5,1),
	(6,1),
	(7,1),
	(8,1),
	(9,1),
	(10,1),
	(11,1),
	(12,1),
	(13,1),
	(14,1),
	(15,1),
	(16,1),
	(17,1),
	(18,1),
	(19,1),
	(20,1),
	(21,1),
	(22,1),
	(23,1),
	(24,1),
	(25,1),
	(26,1),
	(27,1),
	(28,1),
	(29,1),
	(30,1),
	(31,1),
	(32,1),
	(33,1),
	(34,1),
	(35,1),
	(36,1),
	(37,1),
	(38,1),
	(39,1),
	(40,1),
	(41,1),
	(42,1),
	(43,1),
	(44,1),
	(45,1),
	(46,1),
	(47,1),
	(48,1),
	(49,1),
	(50,1),
	(51,1),
	(52,1),
	(53,1),
	(54,1),
	(55,1),
	(56,1),
	(57,1),
	(58,1),
	(59,1),
	(60,1),
	(61,1),
	(62,1),
	(63,1),
	(64,1),
	(65,1),
	(66,1),
	(67,1),
	(68,1),
	(69,1),
	(70,1),
	(1,2),
	(2,2);

/*!40000 ALTER TABLE `typicms_permission_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_permission_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_permission_user`;

CREATE TABLE `typicms_permission_user` (
  `user_id` int(10) unsigned NOT NULL,
  `permission_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`),
  KEY `permission_user_permission_id_foreign` (`permission_id`),
  CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `typicms_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `typicms_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table typicms_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_permissions`;

CREATE TABLE `typicms_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_permissions` WRITE;
/*!40000 ALTER TABLE `typicms_permissions` DISABLE KEYS */;

INSERT INTO `typicms_permissions` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'change-locale',NULL,NULL),
	(2,'update-preferences',NULL,NULL),
	(3,'index-history',NULL,NULL),
	(4,'destroy-history',NULL,NULL),
	(5,'dashboard',NULL,NULL),
	(6,'index-settings',NULL,NULL),
	(7,'index-blocks',NULL,NULL),
	(8,'show-block',NULL,NULL),
	(9,'create-block',NULL,NULL),
	(10,'store-block',NULL,NULL),
	(11,'edit-block',NULL,NULL),
	(12,'update-block',NULL,NULL),
	(13,'sort-blocks',NULL,NULL),
	(14,'destroy-block',NULL,NULL),
	(15,'index-files',NULL,NULL),
	(16,'show-file',NULL,NULL),
	(17,'create-file',NULL,NULL),
	(18,'store-file',NULL,NULL),
	(19,'edit-file',NULL,NULL),
	(20,'update-file',NULL,NULL),
	(21,'sort-files',NULL,NULL),
	(22,'destroy-file',NULL,NULL),
	(23,'index-galleries',NULL,NULL),
	(24,'show-gallery',NULL,NULL),
	(25,'create-gallery',NULL,NULL),
	(26,'store-gallery',NULL,NULL),
	(27,'edit-gallery',NULL,NULL),
	(28,'update-gallery',NULL,NULL),
	(29,'sort-galleries',NULL,NULL),
	(30,'destroy-gallery',NULL,NULL),
	(31,'index-menus',NULL,NULL),
	(32,'show-menu',NULL,NULL),
	(33,'create-menu',NULL,NULL),
	(34,'store-menu',NULL,NULL),
	(35,'edit-menu',NULL,NULL),
	(36,'update-menu',NULL,NULL),
	(37,'sort-menus',NULL,NULL),
	(38,'destroy-menu',NULL,NULL),
	(39,'index-pages',NULL,NULL),
	(40,'show-page',NULL,NULL),
	(41,'create-page',NULL,NULL),
	(42,'store-page',NULL,NULL),
	(43,'edit-page',NULL,NULL),
	(44,'update-page',NULL,NULL),
	(45,'sort-pages',NULL,NULL),
	(46,'destroy-page',NULL,NULL),
	(47,'index-roles',NULL,NULL),
	(48,'show-role',NULL,NULL),
	(49,'create-role',NULL,NULL),
	(50,'store-role',NULL,NULL),
	(51,'edit-role',NULL,NULL),
	(52,'update-role',NULL,NULL),
	(53,'sort-roles',NULL,NULL),
	(54,'destroy-role',NULL,NULL),
	(55,'index-translations',NULL,NULL),
	(56,'show-translation',NULL,NULL),
	(57,'create-translation',NULL,NULL),
	(58,'store-translation',NULL,NULL),
	(59,'edit-translation',NULL,NULL),
	(60,'update-translation',NULL,NULL),
	(61,'sort-translations',NULL,NULL),
	(62,'destroy-translation',NULL,NULL),
	(63,'index-users',NULL,NULL),
	(64,'show-user',NULL,NULL),
	(65,'create-user',NULL,NULL),
	(66,'store-user',NULL,NULL),
	(67,'edit-user',NULL,NULL),
	(68,'update-user',NULL,NULL),
	(69,'sort-users',NULL,NULL),
	(70,'destroy-user',NULL,NULL);

/*!40000 ALTER TABLE `typicms_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_role_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_role_user`;

CREATE TABLE `typicms_role_user` (
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`user_id`),
  KEY `role_user_user_id_foreign` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `typicms_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `typicms_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table typicms_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_roles`;

CREATE TABLE `typicms_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_roles` WRITE;
/*!40000 ALTER TABLE `typicms_roles` DISABLE KEYS */;

INSERT INTO `typicms_roles` (`id`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'administrator',NULL,NULL),
	(2,'visitor',NULL,NULL);

/*!40000 ALTER TABLE `typicms_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_settings`;

CREATE TABLE `typicms_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'config',
  `key_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_settings` WRITE;
/*!40000 ALTER TABLE `typicms_settings` DISABLE KEYS */;

INSERT INTO `typicms_settings` (`id`, `group_name`, `key_name`, `value`, `created_at`, `updated_at`)
VALUES
	(1,'config','webmaster_email','info@example.com','2013-11-20 20:06:24','2014-03-18 12:48:01'),
	(2,'config','google_analytics_code',NULL,'2013-11-20 20:06:24','2013-11-20 20:06:24'),
	(3,'config','lang_chooser','1','2013-11-20 20:06:24','2014-03-18 12:48:01'),
	(4,'fr','website_title','Site web sans titre','2013-11-20 20:06:24','2014-03-18 12:48:01'),
	(5,'fr','status','1','2013-11-20 20:06:24','2014-03-18 12:48:01'),
	(6,'nl','website_title','Untitled website','2013-11-20 20:06:24','2014-03-18 12:48:01'),
	(7,'nl','status','1','2013-11-20 20:06:24','2014-03-18 12:48:01'),
	(8,'en','website_title','Untitled website','2013-11-20 20:06:24','2014-03-18 12:48:01'),
	(9,'en','status','1','2013-11-20 20:06:24','2014-03-18 12:48:01'),
	(10,'es','website_title','Website sin título','2013-11-20 20:06:24','2014-03-18 12:48:01'),
	(11,'es','status','1','2013-11-20 20:06:24','2014-03-18 12:48:01'),
	(12,'config','welcome_message','Welcome to the administration panel of TypiCMS.','2014-03-18 12:48:01','2014-03-18 12:48:01'),
	(13,'config','auth_public','0','2014-03-18 12:48:01','2014-03-18 12:48:01'),
	(14,'config','register','0','2014-03-18 12:48:01','2014-03-18 12:48:01'),
	(15,'config','admin_locale','en','2014-03-22 12:48:01','2014-03-22 12:48:01');

/*!40000 ALTER TABLE `typicms_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_translation_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_translation_translations`;

CREATE TABLE `typicms_translation_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `translation_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `translation` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translation_translations_translation_id_locale_unique` (`translation_id`,`locale`),
  KEY `translation_translations_locale_index` (`locale`),
  CONSTRAINT `translation_translations_translation_id_foreign` FOREIGN KEY (`translation_id`) REFERENCES `typicms_translations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_translation_translations` WRITE;
/*!40000 ALTER TABLE `typicms_translation_translations` DISABLE KEYS */;

INSERT INTO `typicms_translation_translations` (`id`, `translation_id`, `locale`, `translation`, `created_at`, `updated_at`)
VALUES
	(1,1,'fr','En savoir plus','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(2,1,'en','More','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(3,1,'nl','Meer','2014-02-28 22:50:51','2014-02-28 22:50:51'),
	(4,1,'es','Saber más','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(5,2,'fr','Aller au contenu','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(6,2,'en','Skip to content','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(7,2,'nl','Naar inhoud','2014-02-28 22:50:51','2014-02-28 22:50:51'),
	(8,2,'es','Ir al contenido','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(9,3,'fr','Français','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(10,3,'en','Français','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(11,3,'nl','Français','2014-02-28 22:50:51','2014-02-28 22:50:51'),
	(12,3,'es','Francés','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(13,4,'fr','English','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(14,4,'en','English','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(15,4,'nl','English','2014-02-28 22:50:51','2014-02-28 22:50:51'),
	(16,4,'es','Inglés','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(17,5,'fr','Nederlands','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(18,5,'en','Nederlands','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(19,5,'nl','Nederlands','2014-02-28 22:50:51','2014-02-28 22:50:51'),
	(20,5,'es','Holandés','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(21,6,'fr','Espagnol','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(22,6,'en','Spanish','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(23,6,'nl','Spanish','2014-02-28 22:50:51','2014-02-28 22:50:51'),
	(24,6,'es','Español','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(25,7,'fr','Chercher','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(26,7,'en','Search','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(27,7,'nl','Zoeken','2014-02-28 22:50:51','2014-02-28 22:50:51'),
	(28,7,'es','Buscar','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(29,8,'fr','Merci','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(30,8,'en','Thank you','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(31,8,'nl','Dank u','2014-02-28 22:50:51','2014-02-28 22:50:51'),
	(32,8,'es','Gracias','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(33,9,'fr','Veuillez s’il vous plaît corriger les erreurs ci-dessous','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(34,9,'en','Please correct the errors below','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(35,9,'nl','Gelieve de onderstaande fouten te corrigeren','2014-02-28 22:50:51','2014-02-28 22:50:51'),
	(36,9,'es','Por favor solucionado los siguientes errores','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(37,10,'fr','Ajouter au calendrier','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(38,10,'en','Add to calendar','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(39,10,'nl','Toevoegen aan Agenda','2014-02-28 22:50:51','2014-02-28 22:50:51'),
	(40,10,'es','Añadir al calendario','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(41,11,'fr','Toutes les actualités','2014-02-28 15:39:28','2014-02-28 15:39:28'),
	(42,11,'nl','Alle nieuws','2014-02-28 15:39:28','2014-02-28 15:39:28'),
	(43,11,'en','All news','2014-02-28 15:39:28','2014-02-28 15:39:28'),
	(44,11,'es','Todas las noticias','2014-02-28 15:39:28','2014-02-28 15:39:28'),
	(45,12,'fr','Tous les événements','2014-02-28 15:40:04','2014-02-28 15:40:04'),
	(46,12,'nl','Alle evenementen','2014-02-28 15:40:04','2014-02-28 15:40:04'),
	(47,12,'en','All events','2014-02-28 15:40:04','2014-02-28 15:40:04'),
	(48,12,'es','Todos los eventos','2014-02-28 15:40:04','2014-02-28 15:40:04'),
	(49,13,'fr','Partenaires','2014-02-28 15:40:35','2014-02-28 15:40:35'),
	(50,13,'nl','Partners','2014-02-28 15:40:35','2014-02-28 15:40:35'),
	(51,13,'en','Partners','2014-02-28 15:40:35','2014-02-28 15:40:35'),
	(52,13,'es','Socios','2014-02-28 15:40:35','2014-02-28 15:40:35'),
	(53,14,'fr','Dernières actualités','2014-02-28 15:41:21','2014-02-28 15:41:21'),
	(54,14,'nl','Laatste Nieuws','2014-02-28 15:41:21','2014-02-28 15:41:21'),
	(55,14,'en','Latest news','2014-02-28 15:41:21','2014-02-28 15:41:21'),
	(56,14,'es','Últimas noticias','2014-02-28 15:41:21','2014-02-28 15:41:21'),
	(57,15,'fr','Prochains événements','2014-02-28 15:41:54','2014-02-28 15:41:54'),
	(58,15,'nl','Aankomende evenementen','2014-02-28 15:41:54','2014-02-28 15:41:54'),
	(59,15,'en','Incoming events','2014-02-28 15:41:54','2014-02-28 15:41:54'),
	(60,15,'es','Próximos eventos','2014-02-28 15:41:54','2014-02-28 15:41:54'),
	(61,16,'fr','Erreur :code','2014-02-28 16:35:45','2014-02-28 16:35:45'),
	(62,16,'nl','Error :code','2014-02-28 16:35:45','2014-02-28 16:35:45'),
	(63,16,'en','Error :code','2014-02-28 16:35:45','2014-02-28 16:35:45'),
	(64,16,'es','Error :code','2014-02-28 16:35:45','2014-02-28 16:35:45'),
	(65,17,'fr','Désolé, vous n’êtes pas autorisé à voir cette page','2014-02-28 16:38:43','2014-02-28 16:38:43'),
	(66,17,'nl','Sorry, u bent niet bevoegd om deze pagina te bekijken','2014-02-28 16:38:43','2014-02-28 16:38:43'),
	(67,17,'en','Sorry, you are not authorized to view this page','2014-02-28 16:38:43','2014-02-28 16:38:43'),
	(68,17,'es','Disculpe, usted no está autorizado a ver esta página','2014-02-28 16:38:43','2014-02-28 16:38:43'),
	(69,18,'fr','Souhaitez-vous visiter notre :a_openpage d’accueil:a_close ?','2014-02-28 16:40:40','2014-02-28 16:40:40'),
	(70,18,'nl','Wilt u onze :a_openhomepage:a_close te bezoeken?','2014-02-28 16:40:40','2014-02-28 16:40:40'),
	(71,18,'en','Go to our :a_openhomepage:a_close?','2014-02-28 16:40:40','2014-02-28 16:40:40'),
	(72,18,'es','Ir a la página de :a_openinicio:a_close ?','2014-02-28 16:40:40','2014-02-28 16:40:40'),
	(73,19,'fr','Désolé, cette page n’a pas été trouvée','2014-02-28 16:42:18','2014-02-28 16:42:18'),
	(74,19,'nl','Sorry, deze pagina is niet gevonden','2014-02-28 16:42:18','2014-02-28 16:42:18'),
	(75,19,'en','Sorry, this page was not found','2014-02-28 16:42:18','2014-02-28 16:42:18'),
	(76,19,'es','Disculpe, la página no ha sido encontrada','2014-02-28 16:42:18','2014-02-28 16:42:18'),
	(77,20,'fr','Désolé, une erreur serveur est survenue','2014-02-28 16:44:46','2014-02-28 16:44:46'),
	(78,20,'nl','Sorry, er is een serverfout opgetreden','2014-02-28 16:44:46','2014-02-28 16:44:46'),
	(79,20,'en','Sorry, a server error occurred','2014-02-28 16:44:46','2014-02-28 16:44:46'),
	(80,20,'es','Disculpe, ha ocurrido un error en el servidor','2014-02-28 16:44:46','2014-02-28 16:44:46'),
	(81,21,'fr','Aller à la navigation','2016-02-15 16:44:46','2016-02-15 16:44:46'),
	(82,21,'nl','Open navigatie','2016-02-15 16:44:46','2016-02-15 16:44:46'),
	(83,21,'en','Open navigation','2016-02-15 16:44:46','2016-02-15 16:44:46'),
	(84,21,'es','Ir a la navegación','2016-02-15 16:44:46','2016-02-15 16:44:46');

/*!40000 ALTER TABLE `typicms_translation_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_translations`;

CREATE TABLE `typicms_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_translations` WRITE;
/*!40000 ALTER TABLE `typicms_translations` DISABLE KEYS */;

INSERT INTO `typicms_translations` (`id`, `group`, `key`, `created_at`, `updated_at`)
VALUES
	(1,'db','More','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(2,'db','Skip to content','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(3,'db','languages.fr','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(4,'db','languages.en','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(5,'db','languages.nl','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(6,'db','languages.es','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(7,'db','Search','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(8,'db','message when contact form is sent','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(9,'db','message when errors in form','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(10,'db','Add to calendar','2014-02-28 22:50:19','2014-02-28 22:50:19'),
	(11,'db','All news','2014-02-28 15:39:28','2014-02-28 15:39:28'),
	(12,'db','All events','2014-02-28 15:40:04','2014-02-28 15:40:04'),
	(13,'db','Partners','2014-02-28 15:40:35','2014-02-28 15:40:35'),
	(14,'db','Latest news','2014-02-28 15:41:21','2014-02-28 15:41:21'),
	(15,'db','Incoming events','2014-02-28 15:41:54','2014-02-28 15:41:54'),
	(16,'db','Error :code','2014-02-28 16:35:45','2014-02-28 16:35:45'),
	(17,'db','Sorry, you are not authorized to view this page','2014-02-28 16:38:43','2014-02-28 16:38:43'),
	(18,'db','Go to our homepage?','2014-02-28 16:40:40','2014-02-28 16:40:40'),
	(19,'db','Sorry, this page was not found','2014-02-28 16:42:18','2014-02-28 16:42:18'),
	(20,'db','Sorry, a server error occurred','2014-02-28 16:44:46','2014-02-28 16:44:46'),
	(21,'db','Open navigation','2016-02-15 16:44:46','2016-02-15 16:44:46');

/*!40000 ALTER TABLE `typicms_translations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table typicms_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `typicms_users`;

CREATE TABLE `typicms_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `superuser` tinyint(1) NOT NULL DEFAULT '0',
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferences` text COLLATE utf8_unicode_ci,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `typicms_users` WRITE;
/*!40000 ALTER TABLE `typicms_users` DISABLE KEYS */;

INSERT INTO `typicms_users` (`id`, `email`, `password`, `activated`, `superuser`, `first_name`, `last_name`, `preferences`, `token`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'admin@localhost.com','$2y$10$/rJ1.WGnCShh34/48Qu9eOsZl5QQSFUiEQH/0ZgqslncE1ZfF/AJy',1,1,'Admin','Admin',NULL,'kGe8u7zRBn4DrBNzyvtqqi8jSdSA5Y',NULL,'2016-12-11 00:24:03','2016-12-11 00:24:03');

/*!40000 ALTER TABLE `typicms_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
