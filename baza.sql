/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 10.4.25-MariaDB : Database - laravel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`laravel` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `laravel`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name`,`created_at`,`updated_at`) values 
(1,'Hrana',NULL,NULL),
(2,'Piće',NULL,NULL),
(3,'Slatkiši',NULL,NULL);

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',1),
(5,'2023_04_29_145917_create_products_table',1),
(6,'2023_04_29_150029_create_categories_table',1),
(7,'2023_04_29_150056_create_orders_table',1),
(8,'2023_04_29_150627_create_reviews_table',1),
(9,'2023_04_29_154540_add_admin_to_users_table',1);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('pending','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `user_id` bigint(20) unsigned NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`items`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `orders` */

insert  into `orders`(`id`,`status`,`user_id`,`items`,`created_at`,`updated_at`) values 
(1,'pending',2,'[15]','2023-09-13 16:41:08','2023-09-13 16:41:08'),
(2,'pending',11,'[2,4,9,12]','2023-09-13 16:41:08','2023-09-13 16:41:08'),
(3,'pending',8,'[4,7,9,11,14]','2023-09-13 16:41:08','2023-09-13 16:41:08'),
(4,'pending',15,'[2,1]','2023-09-13 16:48:32','2023-09-13 16:48:32');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`created_at`,`updated_at`) values 
(5,'App\\Models\\User',15,'auth_token','b5a264d9e68f8280d9bccd19dc6e340c4c146bd7c899299359ab4eab64da7dbc','[\"*\"]',NULL,'2023-09-13 16:47:51','2023-09-13 16:47:51'),
(6,'App\\Models\\User',15,'ilija@gmail.com_Token','700d5335a1dbb8ce62b48d69329313a017e74eb502db43bb04ea686f30b3dc11','[\"\"]','2023-09-13 16:48:39','2023-09-13 16:48:05','2023-09-13 16:48:39'),
(9,'App\\Models\\User',15,'ilija@gmail.com_Token','eacc5c097a0b12d2c08294d81637493a674a2ffce0f121c54b22335fbff02410','[\"\"]','2023-09-13 16:54:50','2023-09-13 16:54:00','2023-09-13 16:54:50'),
(13,'App\\Models\\User',15,'ilija@gmail.com_Token','713044da97e0b47981089f5437fdf14c7460835c2ec8d94fd3bbba7eca464f8b','[\"\"]','2023-09-13 16:58:08','2023-09-13 16:57:14','2023-09-13 16:58:08'),
(24,'App\\Models\\User',15,'ilija@gmail.com_Token','6ccef7623201acedcc2a8a60789b71025f2497a9956af7180659a32315cc1880','[\"\"]','2023-09-13 18:56:05','2023-09-13 18:51:53','2023-09-13 18:56:05'),
(30,'App\\Models\\User',15,'ilija@gmail.com_Token','3422a79672f306f941fc8f5bbfa3714f4fd68d20a2237fdf6824ad8b9f52dced','[\"\"]','2023-09-15 22:57:39','2023-09-15 22:56:42','2023-09-15 22:57:39'),
(31,'App\\Models\\User',15,'ilija@gmail.com_Token','420e92fd6e1f84619d0beff0258dc6d7dc4bccc9bee49576327ec0bb6ba90582','[\"\"]','2023-09-15 23:00:22','2023-09-15 22:59:02','2023-09-15 23:00:22'),
(32,'App\\Models\\User',15,'ilija@gmail.com_Token','348fd12e8a695fd90792ac731de61d12bbb738587a20a98290474b76451ff086','[\"\"]','2023-09-15 23:00:51','2023-09-15 23:00:32','2023-09-15 23:00:51'),
(34,'App\\Models\\User',11,'marija@example.com_Token','97eea4457d41723ed0b8bdd12b35a5aaba3cbd612af94230f610bf2bd8fd2d58','[\"\"]','2023-09-15 23:02:13','2023-09-15 23:01:41','2023-09-15 23:02:13'),
(35,'App\\Models\\User',11,'marija@example.com_Token','8940e24307e56fdc5cb506823d5ed192e4b2e65bd34ef89cb71b5d66f4f2d78f','[\"\"]','2023-09-15 23:02:30','2023-09-15 23:02:25','2023-09-15 23:02:30');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`name`,`description`,`price`,`image_url`,`category_id`,`created_at`,`updated_at`) values 
(1,'Milk','Fresh milk from local farms',1.99,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6SRU5obMaQCtUqtJxr6UouLZzIDQGNRmf8wo7SB1Z_Qkv1-vFKl7rZhpFW5kGvm1K0bo&usqp=CAU',1,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(2,'Bread','Sliced white bread',2.49,'https://assets.bonappetit.com/photos/5c62e4a3e81bbf522a9579ce/16:9/w_4000,h_2250,c_limit/milk-bread.jpg',1,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(3,'Eggs','Farm-fresh eggs',3.99,'https://media.istockphoto.com/id/1028690210/photo/set-of-egg-isolated.jpg?s=612x612&w=0&k=20&c=Twc1V5iG4XmGT-_6JQ7Wqejk19D_sK6OI84sxTs8W7U=',1,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(4,'Cheese','Aged cheddar cheese',5.99,'https://media.istockphoto.com/id/1127471287/photo/cheese-on-white.jpg?s=612x612&w=0&k=20&c=m8kJAfayGrBoqKceiwGAq7SaEDrbZCyPzklYOm3_MBk=',1,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(5,'Juice','100% pure orange juice',2.99,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqoYpBTgbOYO7OWI6juWOhRcMQA2q9safgKbYaWmmMupcOZWbt46yEy0tDqWgwtFtVb_E&usqp=CAU',1,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(6,'Milk','Fresh milk from local farms',1.99,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6SRU5obMaQCtUqtJxr6UouLZzIDQGNRmf8wo7SB1Z_Qkv1-vFKl7rZhpFW5kGvm1K0bo&usqp=CAU',2,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(7,'Bread','Sliced white bread',2.49,'https://assets.bonappetit.com/photos/5c62e4a3e81bbf522a9579ce/16:9/w_4000,h_2250,c_limit/milk-bread.jpg',2,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(9,'Cheese','Aged cheddar cheese',5.99,'https://media.istockphoto.com/id/1127471287/photo/cheese-on-white.jpg?s=612x612&w=0&k=20&c=m8kJAfayGrBoqKceiwGAq7SaEDrbZCyPzklYOm3_MBk=',2,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(10,'Juice','100% pure orange juice',4.99,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqoYpBTgbOYO7OWI6juWOhRcMQA2q9safgKbYaWmmMupcOZWbt46yEy0tDqWgwtFtVb_E&usqp=CAU',2,'2023-09-13 16:41:08','2023-09-13 16:55:56'),
(11,'Milk','Fresh milk from local farms',1.99,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT6SRU5obMaQCtUqtJxr6UouLZzIDQGNRmf8wo7SB1Z_Qkv1-vFKl7rZhpFW5kGvm1K0bo&usqp=CAU',3,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(12,'Bread','Sliced white bread',2.49,'https://assets.bonappetit.com/photos/5c62e4a3e81bbf522a9579ce/16:9/w_4000,h_2250,c_limit/milk-bread.jpg',3,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(13,'Eggs','Farm-fresh eggs',3.99,'https://media.istockphoto.com/id/1028690210/photo/set-of-egg-isolated.jpg?s=612x612&w=0&k=20&c=Twc1V5iG4XmGT-_6JQ7Wqejk19D_sK6OI84sxTs8W7U=',3,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(14,'Cheese','Aged cheddar cheese',5.99,'https://media.istockphoto.com/id/1127471287/photo/cheese-on-white.jpg?s=612x612&w=0&k=20&c=m8kJAfayGrBoqKceiwGAq7SaEDrbZCyPzklYOm3_MBk=',3,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(15,'Juice','100% pure orange juice',2.99,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqoYpBTgbOYO7OWI6juWOhRcMQA2q9safgKbYaWmmMupcOZWbt46yEy0tDqWgwtFtVb_E&usqp=CAU',3,'2023-09-13 16:41:08','2023-09-13 16:41:08');

/*Table structure for table `reviews` */

DROP TABLE IF EXISTS `reviews`;

CREATE TABLE `reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reviews` */

insert  into `reviews`(`id`,`rating`,`comment`,`user_id`,`product_id`,`created_at`,`updated_at`) values 
(1,5,'Odličan proizvod, preporučujem svima!',1,1,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(2,4,'Dobar proizvod, ali malo skuplji od konkurencije.',2,2,'2023-09-13 16:41:08','2023-09-13 16:41:08'),
(3,2,'Proizvod je veoma lošeg kvaliteta.',3,3,'2023-09-13 16:41:08','2023-09-13 16:41:08');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`,`admin`) values 
(1,'Kaleb Franecki','dicki.albin@example.net','2023-09-13 16:41:07','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','vgQ7i69PfO','2023-09-13 16:41:07','2023-09-13 16:41:07',0),
(2,'Marlon Casper V','camden.harvey@example.com','2023-09-13 16:41:07','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','XJfLCjyadB','2023-09-13 16:41:07','2023-09-13 16:41:07',0),
(3,'Mrs. Muriel Walsh V','joyce51@example.org','2023-09-13 16:41:07','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Boayji4BoW','2023-09-13 16:41:07','2023-09-13 16:41:07',0),
(4,'Pinkie Schmeler MD','prosacco.bonnie@example.org','2023-09-13 16:41:07','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','EFnSjY0ma8','2023-09-13 16:41:07','2023-09-13 16:41:07',0),
(5,'Anna Abshire','jake28@example.org','2023-09-13 16:41:07','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','0f1do6zpWc','2023-09-13 16:41:07','2023-09-13 16:41:07',0),
(6,'Miss Sydnee Abernathy','weffertz@example.net','2023-09-13 16:41:07','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','4F6JeWAkxr','2023-09-13 16:41:07','2023-09-13 16:41:07',0),
(7,'Lorna O\'Reilly','gene78@example.net','2023-09-13 16:41:07','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','AfVolbAXqs','2023-09-13 16:41:07','2023-09-13 16:41:07',0),
(8,'Jaydon Kling IV','dorthy96@example.net','2023-09-13 16:41:07','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','kAPn4OK4Oe','2023-09-13 16:41:07','2023-09-13 16:41:07',0),
(9,'Cristopher Gottlieb','egoldner@example.net','2023-09-13 16:41:07','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','oqFY2WDvlI','2023-09-13 16:41:07','2023-09-13 16:41:07',0),
(10,'Jevon Tremblay','hester.price@example.net','2023-09-13 16:41:07','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','2YGIGEjTIH','2023-09-13 16:41:07','2023-09-13 16:41:07',0),
(11,'Marija','marija@example.com',NULL,'$2y$10$5LeFqRvndWb3yvLq9hs8M.3MPefz5WXWJSXIpDattwZcljtz44vLq','gvgjvj','2023-09-13 16:41:07','2023-09-13 16:41:07',0),
(12,'Jelena','jelena@example.com',NULL,'$2y$10$5IBM5HkWGV7/zUKMPukHYOOERJ7exQt.S8TME0mXuEY5089.aHjFO',NULL,'2023-09-13 16:41:07','2023-09-13 16:41:07',0),
(13,'Jovana','jovana@example.com',NULL,'$2y$10$JqtXDIDsD7/Yk5KIV/lM5.cvfiMzuybrUa4/iRcg1TregH2GlL/3u','js247','2023-09-13 16:41:07','2023-09-13 16:41:07',1),
(15,'ilija','ilija@gmail.com',NULL,'$2y$10$5ZL7iyZaF0prx7Y1sOP0C.Y4bekHb564VooKHS5eD5sdFaxqth5iK','ilija','2023-09-13 16:47:51','2023-09-13 16:47:51',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
