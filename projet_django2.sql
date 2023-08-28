-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 28 août 2023 à 02:48
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_django2`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_user'),
(22, 'Can change user', 6, 'change_user'),
(23, 'Can delete user', 6, 'delete_user'),
(24, 'Can view user', 6, 'view_user'),
(25, 'Can add matiere', 7, 'add_matiere'),
(26, 'Can change matiere', 7, 'change_matiere'),
(27, 'Can delete matiere', 7, 'delete_matiere'),
(28, 'Can view matiere', 7, 'view_matiere'),
(29, 'Can add projettest', 8, 'add_projettest'),
(30, 'Can change projettest', 8, 'change_projettest'),
(31, 'Can delete projettest', 8, 'delete_projettest'),
(32, 'Can view projettest', 8, 'view_projettest'),
(33, 'Can add projet', 9, 'add_projet'),
(34, 'Can change projet', 9, 'change_projet'),
(35, 'Can delete projet', 9, 'delete_projet'),
(36, 'Can view projet', 9, 'view_projet'),
(37, 'Can add matieretest', 10, 'add_matieretest'),
(38, 'Can change matieretest', 10, 'change_matieretest'),
(39, 'Can delete matieretest', 10, 'delete_matieretest'),
(40, 'Can view matieretest', 10, 'view_matieretest'),
(41, 'Can add filiere', 11, 'add_filiere'),
(42, 'Can change filiere', 11, 'change_filiere'),
(43, 'Can delete filiere', 11, 'delete_filiere'),
(44, 'Can view filiere', 11, 'view_filiere'),
(45, 'Can add devoir', 12, 'add_devoir'),
(46, 'Can change devoir', 12, 'change_devoir'),
(47, 'Can delete devoir', 12, 'delete_devoir'),
(48, 'Can view devoir', 12, 'view_devoir'),
(49, 'Can add cour', 13, 'add_cour'),
(50, 'Can change cour', 13, 'change_cour'),
(51, 'Can delete cour', 13, 'delete_cour'),
(52, 'Can view cour', 13, 'view_cour');

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_cour`
--

CREATE TABLE `djangoapp_cour` (
  `id` bigint(20) NOT NULL,
  `intituleCour` varchar(3000) NOT NULL,
  `fichierCour` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `date_creation` date NOT NULL,
  `matiere_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_devoir`
--

CREATE TABLE `djangoapp_devoir` (
  `id` bigint(20) NOT NULL,
  `date_soumission` datetime(6) NOT NULL,
  `fichier_soumis` varchar(100) NOT NULL,
  `commentaires` longtext NOT NULL,
  `etudiant_id` bigint(20) DEFAULT NULL,
  `projet_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_filiere`
--

CREATE TABLE `djangoapp_filiere` (
  `id` bigint(20) NOT NULL,
  `nomFiliere` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `djangoapp_filiere`
--

INSERT INTO `djangoapp_filiere` (`id`, `nomFiliere`) VALUES
(6, 'CS'),
(7, 'IG'),
(9, 'Electronique'),
(10, 'e-commerce');

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_filiere_matieres`
--

CREATE TABLE `djangoapp_filiere_matieres` (
  `id` bigint(20) NOT NULL,
  `filiere_id` bigint(20) NOT NULL,
  `matiere_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `djangoapp_filiere_matieres`
--

INSERT INTO `djangoapp_filiere_matieres` (`id`, `filiere_id`, `matiere_id`) VALUES
(36, 6, 5),
(37, 6, 6),
(16, 6, 9),
(54, 6, 11),
(55, 6, 12),
(18, 7, 5),
(19, 7, 6),
(20, 7, 7),
(21, 7, 8),
(22, 7, 9),
(27, 9, 5),
(28, 9, 6),
(29, 9, 7),
(31, 9, 9),
(56, 9, 12),
(43, 10, 5),
(44, 10, 6),
(45, 10, 7),
(46, 10, 8),
(47, 10, 9);

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_matiere`
--

CREATE TABLE `djangoapp_matiere` (
  `id` bigint(20) NOT NULL,
  `nomMatiere` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `djangoapp_matiere`
--

INSERT INTO `djangoapp_matiere` (`id`, `nomMatiere`) VALUES
(5, 'CCNA'),
(6, 'PYTHON'),
(7, 'JAVA'),
(8, 'SYSTEM'),
(9, 'IT240'),
(11, 'CSC240'),
(12, 'NET302');

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_matieretest`
--

CREATE TABLE `djangoapp_matieretest` (
  `id` bigint(20) NOT NULL,
  `nomMatiere` varchar(3000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_matieretest_projets`
--

CREATE TABLE `djangoapp_matieretest_projets` (
  `id` bigint(20) NOT NULL,
  `matieretest_id` bigint(20) NOT NULL,
  `projettest_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_projet`
--

CREATE TABLE `djangoapp_projet` (
  `id` bigint(20) NOT NULL,
  `intituleProjet` varchar(3000) NOT NULL,
  `fichierProjet` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `date_creation` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `devoir_soumis` varchar(100) DEFAULT NULL,
  `etudiant_id` bigint(20) DEFAULT NULL,
  `matiere_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `djangoapp_projet`
--

INSERT INTO `djangoapp_projet` (`id`, `intituleProjet`, `fichierProjet`, `description`, `date_creation`, `deadline`, `devoir_soumis`, `etudiant_id`, `matiere_id`) VALUES
(2, 'tp2', 'devoirs/github-git-cheat-sheet.pdf', 'xdfdvv', '2023-08-27', '2023-08-01', '', NULL, 5),
(3, 'tp3', 'devoirs/github-git-cheat-sheet_1kBCWFS.pdf', 'pl;', '2023-08-27', '2023-08-01', '', NULL, 6),
(4, 'tp4', 'devoirs/github-git-cheat-sheet_yGa0ZP2.pdf', 'gctf', '2023-08-27', '2023-08-01', '', NULL, 6),
(5, 'tp10', 'devoirs/github-git-cheat-sheet_EovFr6R.pdf', 'io0i', '2023-08-27', '2023-08-01', '', NULL, 5),
(6, 'tp10', 'devoirs/github-git-cheat-sheet_hBWdnwL.pdf', 'lkl', '2023-08-27', '2023-08-01', '', NULL, 5);

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_projettest`
--

CREATE TABLE `djangoapp_projettest` (
  `id` bigint(20) NOT NULL,
  `intituleProjet` varchar(3000) NOT NULL,
  `fichierProjet` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `date_creation` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `devoir_soumis` varchar(100) DEFAULT NULL,
  `etudiant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_user`
--

CREATE TABLE `djangoapp_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `numero` int(10) UNSIGNED DEFAULT NULL CHECK (`numero` >= 0),
  `is_etudiant` tinyint(1) DEFAULT NULL,
  `is_enseignat` tinyint(1) DEFAULT NULL,
  `is_administrateur` tinyint(1) DEFAULT NULL,
  `filire_etudiant_id` bigint(20) DEFAULT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `djangoapp_user`
--

INSERT INTO `djangoapp_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `numero`, `is_etudiant`, `is_enseignat`, `is_administrateur`, `filire_etudiant_id`, `birth_date`) VALUES
(4, 'pbkdf2_sha256$600000$qAIg7WmZnsf8FgKTq8bybj$dD9Exf8l1156v1fkEegyVviWn3pK4aF6Si6RSLQFjkE=', NULL, 0, 'kind', 'ASSEMA', 'basta', 'rachadassema16@gmail.com', 0, 1, '2023-08-27 08:10:47.818850', 33444, NULL, NULL, 1, NULL, '2002-08-28'),
(5, 'pbkdf2_sha256$600000$N2AMpaRqaB72Zj4OE0voiM$xztLv6DT24UFnG7har125VcCt8J+3F9oXSihJ1glGVg=', '2023-08-27 08:28:47.666857', 0, 'AYENA', 'Adebayor', 'Gaou', 'rachadassema16@gmail.com', 0, 1, '2023-08-27 08:28:41.867847', 15, NULL, 1, NULL, NULL, '2002-08-28'),
(6, 'pbkdf2_sha256$600000$EkNH6ZP2ncQ3uINYW12Lky$vg6aJU75fE6Yzyd3xMzLtK/CiwBAg6UNCtoj/35Vhmk=', '2023-08-27 08:57:45.493103', 0, 'BATANA', 'k______________d_________B', 'basta', 'rachadassema16@gmail.com', 0, 1, '2023-08-27 08:57:41.148104', 123456, 1, NULL, NULL, NULL, '2002-08-28'),
(7, 'pbkdf2_sha256$600000$0ZMJsObNLxaQlBf4MF4oKS$82Vw/l87DnNJgXh6ddnaidOtRVxnUcnWCilUv/9/zw4=', '2023-08-27 16:30:45.490920', 0, 'kadi-jolie', 'ASSEMA', 'kadiratou', 'rachad.assema@ipnetinstitute.com', 0, 1, '2023-08-27 14:38:44.360393', 5666666, NULL, NULL, 1, NULL, '2002-08-28'),
(8, 'pbkdf2_sha256$600000$RDReMoB52ZQ4JovRNf3UDQ$T8GkHvwnM+c8jEmyf9T4hMbUwWdfh29x9bESBXTRtHE=', NULL, 0, 'queen', 'r________h_________d', 'ouro-nille', 'rachadassema16@gmail.com', 0, 1, '2023-08-27 15:20:43.064277', 56666, NULL, NULL, 1, NULL, '2002-08-28'),
(9, 'pbkdf2_sha256$600000$DAoKZrBDC7PVhvriq8vIDl$tUO4m71W8aAgfbxUIcvVYVq0WvUVMqUw9kRXus+j+QE=', NULL, 0, 'adjo', 'r________h_________d', 'basta', 'rachadassema16@gmail.com', 0, 1, '2023-08-27 15:24:08.983575', 123456, NULL, NULL, 1, NULL, '2002-08-28'),
(10, 'pbkdf2_sha256$600000$l2rg4Q3ejjT1mXgix8kIty$MvEtvDGkLlETEyo8CJzgVkuptlcPF0GcW8madh7KpEg=', NULL, 0, 'didi_b', 'r________h_________d', 'assema', 'rachad.assema@ipnetinstitute.com', 0, 1, '2023-08-27 15:45:44.449261', 123456, NULL, NULL, 1, NULL, '2002-08-28'),
(11, 'pbkdf2_sha256$600000$SpTLnBRweKE4lljwNieKFq$WEHbXCtD9jbFDIIEnMb/h8rZ7WAXDlevIKFnBJAVyTo=', '2023-08-27 20:53:54.596667', 0, 'TOYI', 'scdvfdfd', 'ali ouro-nille', 'rachadassema16@gmail.com', 0, 1, '2023-08-27 16:43:00.080259', 33444, NULL, 1, NULL, NULL, NULL),
(12, 'pbkdf2_sha256$600000$uVXzA1trNoymHwjJwDz82s$jGDyKHWX9QjDgpNm4cOweDdaVtV3PN8f93MGZFnP+rw=', '2023-08-27 20:41:27.839524', 0, 'Ali', 'd______________h________r', 'assema', 'rachadassema16@gmail.com', 0, 1, '2023-08-27 18:50:38.000369', 334, 1, NULL, NULL, 7, '2002-08-28');

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_user_groups`
--

CREATE TABLE `djangoapp_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_user_matiere_enseignant`
--

CREATE TABLE `djangoapp_user_matiere_enseignant` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `matiere_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `djangoapp_user_matiere_enseignant`
--

INSERT INTO `djangoapp_user_matiere_enseignant` (`id`, `user_id`, `matiere_id`) VALUES
(5, 5, 5),
(6, 5, 6),
(7, 5, 7),
(8, 11, 5),
(9, 11, 6),
(10, 11, 7),
(11, 11, 8),
(12, 11, 9),
(13, 11, 11);

-- --------------------------------------------------------

--
-- Structure de la table `djangoapp_user_user_permissions`
--

CREATE TABLE `djangoapp_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(13, 'djangoApp', 'cour'),
(12, 'djangoApp', 'devoir'),
(11, 'djangoApp', 'filiere'),
(7, 'djangoApp', 'matiere'),
(10, 'djangoApp', 'matieretest'),
(9, 'djangoApp', 'projet'),
(8, 'djangoApp', 'projettest'),
(6, 'djangoApp', 'user'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-08-27 00:38:52.132252'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-08-27 00:38:52.892861'),
(3, 'auth', '0001_initial', '2023-08-27 00:38:58.069758'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-08-27 00:39:00.318908'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-08-27 00:39:00.439313'),
(6, 'auth', '0004_alter_user_username_opts', '2023-08-27 00:39:00.501274'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-08-27 00:39:00.601212'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-08-27 00:39:00.649184'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-08-27 00:39:00.685160'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-08-27 00:39:00.770112'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-08-27 00:39:00.833066'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-08-27 00:39:01.098904'),
(13, 'auth', '0011_update_proxy_permissions', '2023-08-27 00:39:01.165314'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-08-27 00:39:01.227961'),
(15, 'djangoApp', '0001_initial', '2023-08-27 00:39:34.492721'),
(16, 'admin', '0001_initial', '2023-08-27 00:39:38.080823'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-08-27 00:39:38.173824'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-27 00:39:38.386564'),
(19, 'sessions', '0001_initial', '2023-08-27 00:39:39.098629'),
(20, 'djangoApp', '0002_user_birth_date', '2023-08-27 07:27:28.105792');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bq6g1gcc7l3bfgj3crf13cekmerladp8', '.eJxVjMEOwiAQRP-FsyFQKAWP3vsNZJfdStVAUtqT8d9tkx70NMm8N_MWEbY1x63xEmcSV6G1uPyWCOnJ5SD0gHKvMtWyLjPKQ5EnbXKsxK_b6f4dZGh5X0MAIrYGJqd6tEoPMCWnnfVM1BkcWCOAJZM8BrSo0IPb04Uu9Mah-HwBMBE44Q:1qaMle:X6l8aV73lotWe5QG4Touol37VAyU4UYIL2F1rGiT1Jc', '2023-09-10 20:53:54.652631'),
('f54fv16tlth5ddpp61z7zr9yb854kxsu', '.eJxVjDsOwjAQBe_iGllOWMcWJT1nsPZnHECOFCdVxN0hUgpo38y8zSRcl5LWpnMaxVxMMKffjZCfWncgD6z3yfJUl3kkuyv2oM3eJtHX9XD_Dgq28q3PwN4jO2QMWYcOenCeJBBRFI0dZ4mg3EtgAiBEYohILg9I3mdn3h8X7TmX:1qaIMH:QCBKRbq3gSDzu2un9uYhdLl7Sy03i-LvvhvkwY3hUbk', '2023-09-10 16:11:25.233961');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `djangoapp_cour`
--
ALTER TABLE `djangoapp_cour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `djangoApp_cour_matiere_id_3e7d703e_fk_djangoApp_matiere_id` (`matiere_id`);

--
-- Index pour la table `djangoapp_devoir`
--
ALTER TABLE `djangoapp_devoir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `djangoApp_devoir_etudiant_id_e719d7d2_fk_djangoApp_user_id` (`etudiant_id`),
  ADD KEY `djangoApp_devoir_projet_id_a233158a_fk_djangoApp_projet_id` (`projet_id`);

--
-- Index pour la table `djangoapp_filiere`
--
ALTER TABLE `djangoapp_filiere`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `djangoapp_filiere_matieres`
--
ALTER TABLE `djangoapp_filiere_matieres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `djangoApp_filiere_matieres_filiere_id_matiere_id_f66e189a_uniq` (`filiere_id`,`matiere_id`),
  ADD KEY `djangoApp_filiere_ma_matiere_id_bac37be6_fk_djangoApp` (`matiere_id`);

--
-- Index pour la table `djangoapp_matiere`
--
ALTER TABLE `djangoapp_matiere`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `djangoapp_matieretest`
--
ALTER TABLE `djangoapp_matieretest`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `djangoapp_matieretest_projets`
--
ALTER TABLE `djangoapp_matieretest_projets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `djangoApp_matieretest_pr_matieretest_id_projettes_61e7a71b_uniq` (`matieretest_id`,`projettest_id`),
  ADD KEY `djangoApp_matieretes_projettest_id_3a4e5e92_fk_djangoApp` (`projettest_id`);

--
-- Index pour la table `djangoapp_projet`
--
ALTER TABLE `djangoapp_projet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `djangoApp_projet_etudiant_id_0c4c4ec9_fk_djangoApp_user_id` (`etudiant_id`),
  ADD KEY `djangoApp_projet_matiere_id_cc58a282_fk_djangoApp_matiere_id` (`matiere_id`);

--
-- Index pour la table `djangoapp_projettest`
--
ALTER TABLE `djangoapp_projettest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `djangoApp_projettest_etudiant_id_2eb5bac1_fk_djangoApp_user_id` (`etudiant_id`);

--
-- Index pour la table `djangoapp_user`
--
ALTER TABLE `djangoapp_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `djangoApp_user_filire_etudiant_id_a583e356_fk_djangoApp` (`filire_etudiant_id`);

--
-- Index pour la table `djangoapp_user_groups`
--
ALTER TABLE `djangoapp_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `djangoApp_user_groups_user_id_group_id_9fc32d3d_uniq` (`user_id`,`group_id`),
  ADD KEY `djangoApp_user_groups_group_id_a05ec6ee_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `djangoapp_user_matiere_enseignant`
--
ALTER TABLE `djangoapp_user_matiere_enseignant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `djangoApp_user_matiere_e_user_id_matiere_id_f48fdfe4_uniq` (`user_id`,`matiere_id`),
  ADD KEY `djangoApp_user_matie_matiere_id_0f69eb1a_fk_djangoApp` (`matiere_id`);

--
-- Index pour la table `djangoapp_user_user_permissions`
--
ALTER TABLE `djangoapp_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `djangoApp_user_user_perm_user_id_permission_id_b45897f1_uniq` (`user_id`,`permission_id`),
  ADD KEY `djangoApp_user_user__permission_id_f2bff8a4_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_djangoApp_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT pour la table `djangoapp_cour`
--
ALTER TABLE `djangoapp_cour`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `djangoapp_devoir`
--
ALTER TABLE `djangoapp_devoir`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `djangoapp_filiere`
--
ALTER TABLE `djangoapp_filiere`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `djangoapp_filiere_matieres`
--
ALTER TABLE `djangoapp_filiere_matieres`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `djangoapp_matiere`
--
ALTER TABLE `djangoapp_matiere`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `djangoapp_matieretest`
--
ALTER TABLE `djangoapp_matieretest`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `djangoapp_matieretest_projets`
--
ALTER TABLE `djangoapp_matieretest_projets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `djangoapp_projet`
--
ALTER TABLE `djangoapp_projet`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `djangoapp_projettest`
--
ALTER TABLE `djangoapp_projettest`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `djangoapp_user`
--
ALTER TABLE `djangoapp_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `djangoapp_user_groups`
--
ALTER TABLE `djangoapp_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `djangoapp_user_matiere_enseignant`
--
ALTER TABLE `djangoapp_user_matiere_enseignant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `djangoapp_user_user_permissions`
--
ALTER TABLE `djangoapp_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `djangoapp_cour`
--
ALTER TABLE `djangoapp_cour`
  ADD CONSTRAINT `djangoApp_cour_matiere_id_3e7d703e_fk_djangoApp_matiere_id` FOREIGN KEY (`matiere_id`) REFERENCES `djangoapp_matiere` (`id`);

--
-- Contraintes pour la table `djangoapp_devoir`
--
ALTER TABLE `djangoapp_devoir`
  ADD CONSTRAINT `djangoApp_devoir_etudiant_id_e719d7d2_fk_djangoApp_user_id` FOREIGN KEY (`etudiant_id`) REFERENCES `djangoapp_user` (`id`),
  ADD CONSTRAINT `djangoApp_devoir_projet_id_a233158a_fk_djangoApp_projet_id` FOREIGN KEY (`projet_id`) REFERENCES `djangoapp_projet` (`id`);

--
-- Contraintes pour la table `djangoapp_filiere_matieres`
--
ALTER TABLE `djangoapp_filiere_matieres`
  ADD CONSTRAINT `djangoApp_filiere_ma_filiere_id_ef87173b_fk_djangoApp` FOREIGN KEY (`filiere_id`) REFERENCES `djangoapp_filiere` (`id`),
  ADD CONSTRAINT `djangoApp_filiere_ma_matiere_id_bac37be6_fk_djangoApp` FOREIGN KEY (`matiere_id`) REFERENCES `djangoapp_matiere` (`id`);

--
-- Contraintes pour la table `djangoapp_matieretest_projets`
--
ALTER TABLE `djangoapp_matieretest_projets`
  ADD CONSTRAINT `djangoApp_matieretes_matieretest_id_d5c55c34_fk_djangoApp` FOREIGN KEY (`matieretest_id`) REFERENCES `djangoapp_matieretest` (`id`),
  ADD CONSTRAINT `djangoApp_matieretes_projettest_id_3a4e5e92_fk_djangoApp` FOREIGN KEY (`projettest_id`) REFERENCES `djangoapp_projettest` (`id`);

--
-- Contraintes pour la table `djangoapp_projet`
--
ALTER TABLE `djangoapp_projet`
  ADD CONSTRAINT `djangoApp_projet_etudiant_id_0c4c4ec9_fk_djangoApp_user_id` FOREIGN KEY (`etudiant_id`) REFERENCES `djangoapp_user` (`id`),
  ADD CONSTRAINT `djangoApp_projet_matiere_id_cc58a282_fk_djangoApp_matiere_id` FOREIGN KEY (`matiere_id`) REFERENCES `djangoapp_matiere` (`id`);

--
-- Contraintes pour la table `djangoapp_projettest`
--
ALTER TABLE `djangoapp_projettest`
  ADD CONSTRAINT `djangoApp_projettest_etudiant_id_2eb5bac1_fk_djangoApp_user_id` FOREIGN KEY (`etudiant_id`) REFERENCES `djangoapp_user` (`id`);

--
-- Contraintes pour la table `djangoapp_user`
--
ALTER TABLE `djangoapp_user`
  ADD CONSTRAINT `djangoApp_user_filire_etudiant_id_a583e356_fk_djangoApp` FOREIGN KEY (`filire_etudiant_id`) REFERENCES `djangoapp_filiere` (`id`);

--
-- Contraintes pour la table `djangoapp_user_groups`
--
ALTER TABLE `djangoapp_user_groups`
  ADD CONSTRAINT `djangoApp_user_groups_group_id_a05ec6ee_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `djangoApp_user_groups_user_id_5368d735_fk_djangoApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `djangoapp_user` (`id`);

--
-- Contraintes pour la table `djangoapp_user_matiere_enseignant`
--
ALTER TABLE `djangoapp_user_matiere_enseignant`
  ADD CONSTRAINT `djangoApp_user_matie_matiere_id_0f69eb1a_fk_djangoApp` FOREIGN KEY (`matiere_id`) REFERENCES `djangoapp_matiere` (`id`),
  ADD CONSTRAINT `djangoApp_user_matie_user_id_364377e6_fk_djangoApp` FOREIGN KEY (`user_id`) REFERENCES `djangoapp_user` (`id`);

--
-- Contraintes pour la table `djangoapp_user_user_permissions`
--
ALTER TABLE `djangoapp_user_user_permissions`
  ADD CONSTRAINT `djangoApp_user_user__permission_id_f2bff8a4_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `djangoApp_user_user__user_id_25de7dc3_fk_djangoApp` FOREIGN KEY (`user_id`) REFERENCES `djangoapp_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_djangoApp_user_id` FOREIGN KEY (`user_id`) REFERENCES `djangoapp_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
