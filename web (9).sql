-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 30 avr. 2025 à 11:17
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `web`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin_forum_messages`
--

CREATE TABLE `admin_forum_messages` (
  `id` int(11) NOT NULL,
  `account_number` bigint(20) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `reply_to` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin_forum_messages`
--

INSERT INTO `admin_forum_messages` (`id`, `account_number`, `pseudo`, `message`, `timestamp`, `reply_to`) VALUES
(6, 2585290798616987, '', 'bien', '2025-04-13 21:41:15', NULL),
(9, 2585290798616987, '', 'neww', '2025-04-13 21:45:30', NULL),
(10, 2585290798616987, '', 'satt', '2025-04-14 21:21:39', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `admin_passwords`
--

CREATE TABLE `admin_passwords` (
  `id` int(11) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admin_passwords`
--

INSERT INTO `admin_passwords` (`id`, `password_hash`, `created_at`) VALUES
(1, '$2y$10$ctB62OQ9cflslkTNwPlFgOlyQSPhZCPu9/1p5CRNiebCGcKRo/D4K', '2025-04-10 19:33:49');

-- --------------------------------------------------------

--
-- Structure de la table `captcha`
--

CREATE TABLE `captcha` (
  `id` int(11) NOT NULL,
  `image_path` varchar(255) NOT NULL,
  `solution` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `captcha`
--

INSERT INTO `captcha` (`id`, `image_path`, `solution`) VALUES
(1, 'to.PNG', 'token'),
(3, 'ac.PNG', 'access'),
(4, 'ba.PNG', 'balance'),
(5, 'pri.PNG', 'privacy'),
(6, 'pro.PNG', 'protect');

-- --------------------------------------------------------

--
-- Structure de la table `crypto_addresses`
--

CREATE TABLE `crypto_addresses` (
  `id` int(11) NOT NULL,
  `crypto_type` enum('BTC','XMR','ETH') NOT NULL,
  `address` varchar(255) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `crypto_addresses`
--

INSERT INTO `crypto_addresses` (`id`, `crypto_type`, `address`, `date`) VALUES
(206, 'XMR', '49G5yzABuUhcN5ZhB8P1m5oq7MwJJ2rK5H9uF4rNnoYxqjmMZyU32pnMP6tugpXcmtB6gF7xYk5g9Tp8iAzLMomKcYX5D9bUXH4h9t5t58ynxtf', '2025-04-23 18:14:26'),
(208, 'ETH', '0xD1d4d32A69F1f8CbaC53961C6F5A47c9b3f82aF4', '2025-04-23 18:14:26'),
(209, 'XMR', '9XaULYh9jJS6qngz1Hp9eR2AWYcU8N3GeCCu9XY8bfyEvnpcvfu6vjc9cVmApY6Xf9g6c2dk4e63fgg72ykR2crFwTTWKM12Vdq31eBYpdS4b1ah', '2025-04-23 18:14:26'),
(211, 'ETH', '0xF9F3036dE7cE5e68723863e9D84f8a6E9dC551E2', '2025-04-23 18:14:26'),
(212, 'XMR', '48Ww1A2RtCuR5JjXNwU3m3B7sFQ6Fhv8VqgStQ2y7C4kYxyyZj9NYkQ4tCfm5v2Jcb5qYX4NK8Qz6VJ1w7HZaokFXpqUqA7p5u5z7L4oyyYzSy1u', '2025-04-23 18:14:26');

-- --------------------------------------------------------

--
-- Structure de la table `crypto_reserves`
--

CREATE TABLE `crypto_reserves` (
  `id` int(11) NOT NULL,
  `crypto_name` varchar(50) DEFAULT NULL,
  `reserve_amount` decimal(20,8) DEFAULT NULL,
  `withdraw_enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `crypto_reserves`
--

INSERT INTO `crypto_reserves` (`id`, `crypto_name`, `reserve_amount`, `withdraw_enabled`) VALUES
(1, 'bitcoin', 0.03809022, 1),
(2, 'ethereum', 0.35736715, 0),
(3, 'monero', 11.00036585, 1);

-- --------------------------------------------------------

--
-- Structure de la table `disputes`
--

CREATE TABLE `disputes` (
  `id` int(11) NOT NULL,
  `account_number` bigint(20) NOT NULL,
  `dispute_type` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('pending','resolved','closed') DEFAULT 'pending',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `disputes`
--

INSERT INTO `disputes` (`id`, `account_number`, `dispute_type`, `description`, `status`, `timestamp`) VALUES
(6, 3407938122249006, 'fraud_attempts', 'probleme faut site en ligne', 'closed', '2025-04-13 18:46:49'),
(9, 2585290798616987, 'fraud_attempts', 'je sui sarnaquer', 'pending', '2025-04-23 13:48:04'),
(10, 2585290798616987, 'other', 'i have buy a vexium for 5$ and i receive anything ...', 'pending', '2025-04-23 19:29:26');

-- --------------------------------------------------------

--
-- Structure de la table `dispute_messages`
--

CREATE TABLE `dispute_messages` (
  `id` int(11) NOT NULL,
  `dispute_id` int(11) NOT NULL,
  `account_number` bigint(20) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `dispute_messages`
--

INSERT INTO `dispute_messages` (`id`, `dispute_id`, `account_number`, `message`, `timestamp`) VALUES
(10, 6, 3407938122249006, 'vous avez vue ?', '2025-04-13 18:47:03'),
(11, 6, 2585290798616987, 'ouiu', '2025-04-13 18:49:20'),
(12, 6, 2585290798616987, 'cc', '2025-04-14 19:21:31');

-- --------------------------------------------------------

--
-- Structure de la table `fees`
--

CREATE TABLE `fees` (
  `id` int(11) NOT NULL,
  `fee_type` varchar(50) DEFAULT NULL,
  `fee_percent` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fees`
--

INSERT INTO `fees` (`id`, `fee_type`, `fee_percent`) VALUES
(1, 'buy', 1);

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `account_number` bigint(20) DEFAULT NULL,
  `message` text NOT NULL,
  `show_pseudo` tinyint(1) DEFAULT 1,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `reply_to` int(11) DEFAULT NULL,
  `pseudo` varchar(255) NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `account_number`, `message`, `show_pseudo`, `timestamp`, `reply_to`, `pseudo`) VALUES
(20, 2585290798616987, 'sqddsqqds', 1, '2025-04-13 19:19:10', NULL, 'admin'),
(21, 2585290798616987, 'tu veut te faire ban ?', 0, '2025-04-13 19:28:03', 20, 'admin'),
(22, 2585290798616987, 'dsfsfd', 1, '2025-04-13 19:28:22', NULL, 'admin'),
(23, 3407938122249006, 'yoooooooooooo', 0, '2025-04-14 20:08:03', NULL, 'admin'),
(24, 2585290798616987, 'qsdqsd', 0, '2025-04-15 16:14:44', NULL, 'admin'),
(25, 2585290798616987, 'qsdqsd', 1, '2025-04-15 16:14:48', NULL, 'admin'),
(26, 2585290798616987, 'ccccccccccccccccccccccccc', 0, '2025-04-15 16:14:58', NULL, 'admin'),
(27, 2585290798616987, 'xxxxxxxxxxxxxxx', 1, '2025-04-15 16:15:04', NULL, 'admin'),
(28, 3407938122249006, 'oiuhiuioug', 0, '2025-04-15 16:53:04', NULL, 'qsdqsd'),
(29, 3407938122249006, 'qsdqds', 1, '2025-04-15 16:53:10', NULL, 'qsdqsd'),
(30, 2585290798616987, 'reponse', 0, '2025-04-16 20:33:14', 29, 'admin'),
(31, 2585290798616987, 'yoyoyo', 0, '2025-04-16 20:37:47', NULL, 'Alpha03'),
(32, 2585290798616987, 'yoyoyo', 1, '2025-04-16 20:37:55', NULL, 'Alpha03');

-- --------------------------------------------------------

--
-- Structure de la table `page_blocks`
--

CREATE TABLE `page_blocks` (
  `id` int(11) NOT NULL,
  `account_number` varchar(50) NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `blocked_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `target_all_users` tinyint(1) DEFAULT 0,
  `target_all_admins` tinyint(1) DEFAULT 0,
  `block_ultimate` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `security_fees`
--

CREATE TABLE `security_fees` (
  `id` int(11) NOT NULL,
  `fee_percent` decimal(5,2) DEFAULT 0.10,
  `description` varchar(255) DEFAULT 'Micro frais pour garantir la couverture des frais'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `security_fees`
--

INSERT INTO `security_fees` (`id`, `fee_percent`, `description`) VALUES
(1, 50.00, 'Micro frais de sécurité pour garantir les transactions');

-- --------------------------------------------------------

--
-- Structure de la table `superadmin_passwords`
--

CREATE TABLE `superadmin_passwords` (
  `id` int(11) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `superadmin_passwords`
--

INSERT INTO `superadmin_passwords` (`id`, `password_hash`) VALUES
(1, '$2y$10$Wm9/U6xVwElLbxO4RAtq8OZOKQzh8LlNdTlG9Hdb0FR1kyOnk9RHm');

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `wallet_code` char(16) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `transactions`
--

INSERT INTO `transactions` (`id`, `account_number`, `wallet_code`, `created_at`) VALUES
(12, '3407938122249006', '775C89036718E945', '2025-04-29 16:45:31'),
(13, '2585290798616987', 'E579214137BC36A0', '2025-04-29 17:02:35');

-- --------------------------------------------------------

--
-- Structure de la table `transaction_crypto`
--

CREATE TABLE `transaction_crypto` (
  `id` int(11) NOT NULL,
  `account_number` bigint(20) NOT NULL,
  `crypto_type` varchar(10) DEFAULT NULL,
  `crypto_address` varchar(255) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL,
  `price` decimal(18,8) NOT NULL,
  `status` enum('pending','completed','failed') DEFAULT 'pending',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaction_type` enum('buy','sell') NOT NULL DEFAULT 'buy'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `transaction_crypto`
--

INSERT INTO `transaction_crypto` (`id`, `account_number`, `crypto_type`, `crypto_address`, `amount`, `price`, `status`, `timestamp`, `transaction_type`) VALUES
(121, 2585290798616987, 'BTC', 'btc1adlfpoagfpqgjpqogjaz', 1.00000000, 0.00045843, 'pending', '2025-04-23 19:13:17', 'sell'),
(122, 2585290798616987, 'ETH', '0x32Be343B94f860124dC4fEe278FDCBD38C102D88', 0.12075194, 0.00328339, 'failed', '2025-04-23 19:15:02', 'buy'),
(123, 2585290798616987, 'BTC', '3FZbgi29cpjq2GJv4Tgf3Jp6wQy2kKYu3jr', 0.12075194, 0.00008347, 'failed', '2025-04-23 19:15:55', 'buy'),
(124, 2585290798616987, 'BTC', 'qdsdqsddddddddd', 1.00000000, 0.00045801, 'pending', '2025-04-23 19:16:58', 'sell'),
(125, 2585290798616987, 'BTC', '1P7hTzxhE3H57yZC1gWmjVjBrH9V5FLeX3L', 0.00746730, 0.00008347, 'completed', '2025-04-29 15:06:21', 'buy');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `secret_pseudo` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code_pin` char(6) NOT NULL,
  `account_number` bigint(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `wallet_balance` decimal(18,8) DEFAULT 0.00000000,
  `role` enum('user','admin','superadmin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `pseudo`, `secret_pseudo`, `password`, `code_pin`, `account_number`, `created_at`, `wallet_balance`, `role`) VALUES
(51, 'velim', 'secret', '$2y$10$wcS.ABTGJoqMGVdre9HJv.LW4CumMfaCBcW9kOJtBB2fVSrYz/eDe', '111222', 2585290798616987, '2025-04-11 16:14:35', 2.00000000, 'superadmin'),
(52, 'qsdqsd', 'secssssssss', '$2y$10$bwNk1Bdzav9lai5QjUq61u7BW4JHWs/4fOE5poLed8nRhzibVOkNm', '111222', 3407938122249006, '2025-04-11 16:35:40', 247.88121509, 'superadmin'),
(54, 'qdqqdqs', 'fqsfqsfsqf', '$2y$10$wcS.ABTGJoqMGVdre9HJv.LW4CumMfaCBcW9kOJtBB2fVSrYz/eDe', '111111', 2088073789639927, '2025-04-19 11:14:15', 0.00000000, 'user'),
(55, 'qsddsq', 'qsdqsd', '$2y$10$EQC1o0NevRRZuoJwrXyTAuy34pEAGd4Jp2iTivyP5bJoQy0xbQ3h2', '112111', 5415904342194359, '2025-04-19 11:19:18', 9.68943533, 'user');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin_forum_messages`
--
ALTER TABLE `admin_forum_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reply_to` (`reply_to`),
  ADD KEY `account_number` (`account_number`);

--
-- Index pour la table `admin_passwords`
--
ALTER TABLE `admin_passwords`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `captcha`
--
ALTER TABLE `captcha`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `crypto_addresses`
--
ALTER TABLE `crypto_addresses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `address` (`address`);

--
-- Index pour la table `crypto_reserves`
--
ALTER TABLE `crypto_reserves`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `disputes`
--
ALTER TABLE `disputes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `dispute_messages`
--
ALTER TABLE `dispute_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dispute_id` (`dispute_id`),
  ADD KEY `account_number` (`account_number`);

--
-- Index pour la table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fee_type` (`fee_type`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_number` (`account_number`);

--
-- Index pour la table `page_blocks`
--
ALTER TABLE `page_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `security_fees`
--
ALTER TABLE `security_fees`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `superadmin_passwords`
--
ALTER TABLE `superadmin_passwords`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wallet_code` (`wallet_code`);

--
-- Index pour la table `transaction_crypto`
--
ALTER TABLE `transaction_crypto`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pseudo` (`pseudo`),
  ADD UNIQUE KEY `secret_pseudo` (`secret_pseudo`),
  ADD UNIQUE KEY `account_number` (`account_number`),
  ADD UNIQUE KEY `account_number_2` (`account_number`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin_forum_messages`
--
ALTER TABLE `admin_forum_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `admin_passwords`
--
ALTER TABLE `admin_passwords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `captcha`
--
ALTER TABLE `captcha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `crypto_addresses`
--
ALTER TABLE `crypto_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT pour la table `crypto_reserves`
--
ALTER TABLE `crypto_reserves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `disputes`
--
ALTER TABLE `disputes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `dispute_messages`
--
ALTER TABLE `dispute_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `page_blocks`
--
ALTER TABLE `page_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT pour la table `security_fees`
--
ALTER TABLE `security_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `superadmin_passwords`
--
ALTER TABLE `superadmin_passwords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `transaction_crypto`
--
ALTER TABLE `transaction_crypto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `admin_forum_messages`
--
ALTER TABLE `admin_forum_messages`
  ADD CONSTRAINT `admin_forum_messages_ibfk_1` FOREIGN KEY (`reply_to`) REFERENCES `admin_forum_messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_forum_messages_ibfk_2` FOREIGN KEY (`account_number`) REFERENCES `users` (`account_number`) ON DELETE CASCADE;

--
-- Contraintes pour la table `dispute_messages`
--
ALTER TABLE `dispute_messages`
  ADD CONSTRAINT `dispute_messages_ibfk_1` FOREIGN KEY (`dispute_id`) REFERENCES `disputes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dispute_messages_ibfk_2` FOREIGN KEY (`account_number`) REFERENCES `users` (`account_number`) ON DELETE CASCADE;

--
-- Contraintes pour la table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`account_number`) REFERENCES `users` (`account_number`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
