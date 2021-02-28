/*
 Navicat Premium Data Transfer

 Source Server         : LOCALHOST
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : wablass

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 01/03/2021 06:48:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `level` enum('1','2','3') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '2' COMMENT '1 = ADMIN\r\n2 = CS\r\n3 = Member',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', '1');
INSERT INTO `account` VALUES (2, 'cs1', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2');
INSERT INTO `account` VALUES (3, 'member1', '7c4a8d09ca3762af61e59520943dc26494f8941b', '3');

-- ----------------------------
-- Table structure for autoreply
-- ----------------------------
DROP TABLE IF EXISTS `autoreply`;
CREATE TABLE `autoreply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `response` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `case_sensitive` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of autoreply
-- ----------------------------
INSERT INTO `autoreply` VALUES (1, 'mau', 'iya', '0');

-- ----------------------------
-- Table structure for blast
-- ----------------------------
DROP TABLE IF EXISTS `blast`;
CREATE TABLE `blast`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomor` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pesan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `media` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jadwal` datetime(0) NOT NULL,
  `make_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blast
-- ----------------------------
INSERT INTO `blast` VALUES (1, 'a:0:{}', 'Hallo', NULL, '2021-02-27 11:03:00', 'Admin');

-- ----------------------------
-- Table structure for google_form
-- ----------------------------
DROP TABLE IF EXISTS `google_form`;
CREATE TABLE `google_form`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `form_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `target` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pesan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for google_form_pesan
-- ----------------------------
DROP TABLE IF EXISTS `google_form_pesan`;
CREATE TABLE `google_form_pesan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nomor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pesan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lisensi
-- ----------------------------
DROP TABLE IF EXISTS `lisensi`;
CREATE TABLE `lisensi`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `serial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_date` date NULL DEFAULT NULL,
  `end_date` date NULL DEFAULT NULL,
  `addtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lisensi
-- ----------------------------
INSERT INTO `lisensi` VALUES (6, 3, 'RH2NEF-FW6U2J-KE5YQD-LISENSI', '2021-03-01', '2021-03-17', '2021-03-01 06:44:20');

-- ----------------------------
-- Table structure for nomor
-- ----------------------------
DROP TABLE IF EXISTS `nomor`;
CREATE TABLE `nomor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nomor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `make_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pengaturan
-- ----------------------------
DROP TABLE IF EXISTS `pengaturan`;
CREATE TABLE `pengaturan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chunk` int(11) NOT NULL,
  `wa_gateway_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nomor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `api_key` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '310ea2abbaafe1844ac63f57ff20860b78e77c40',
  `callback` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengaturan
-- ----------------------------
INSERT INTO `pengaturan` VALUES (1, 100, 'http://127.0.0.1:8091', '085784516803', '81c26427df7b8715b0a5a5532312b72b03e41daf', NULL);

-- ----------------------------
-- Table structure for pesan
-- ----------------------------
DROP TABLE IF EXISTS `pesan`;
CREATE TABLE `pesan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_blast` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nomor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pesan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `media` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` enum('MENUNGGU JADWAL','GAGAL','TERKIRIM') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'MENUNGGU JADWAL',
  `jadwal` datetime(0) NOT NULL,
  `tiap_bulan` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `last_month` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `make_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `time` timestamp(0) NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for receive_chat
-- ----------------------------
DROP TABLE IF EXISTS `receive_chat`;
CREATE TABLE `receive_chat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pesan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nomor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pesan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `from_me` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `nomor_saya` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_pesan`(`id_pesan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 166 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of receive_chat
-- ----------------------------
INSERT INTO `receive_chat` VALUES (1, '3EB03B25B1672594D8C6', '085608743393', 'hol', '1', '081229193164', '2021-02-19 13:18:07');
INSERT INTO `receive_chat` VALUES (2, '3EB0922DB219AEC0D886', '085608743393', '', '1', '081229193164', '2021-02-19 17:08:02');
INSERT INTO `receive_chat` VALUES (3, '3EB0093CC42602FF6B5D', '085608743393', '', '1', '081229193164', '2021-02-19 17:20:49');
INSERT INTO `receive_chat` VALUES (4, '3EB06A3428BDCF20A14D', '085608743393', '', '1', '081229193164', '2021-02-19 17:21:06');
INSERT INTO `receive_chat` VALUES (5, '3EB015FBB924D0FCCB21', '085608743393', 'asd', '1', '081229193164', '2021-02-19 17:21:11');
INSERT INTO `receive_chat` VALUES (6, '3EB0CFC55BCFA2C8F7F2', '085608743393', 'sss.txt', '0', '081229193164', '2021-02-19 17:32:49');
INSERT INTO `receive_chat` VALUES (7, '3EB0B032795E1E4B1CF5', '085608743393', 'asd', '1', '081229193164', '2021-02-19 17:36:48');
INSERT INTO `receive_chat` VALUES (8, '3EB0B90109A04F22F3A8', '085608743393', '123', '1', '081229193164', '2021-02-24 10:08:48');
INSERT INTO `receive_chat` VALUES (9, '3EB0035D5A85065BF01E', '085608743393', 'tetst', '0', '081229193164', '2021-02-24 10:51:42');
INSERT INTO `receive_chat` VALUES (10, '3EB00166F2122C65B0E0', '085608743393', 'halo', '0', '081229193164', '2021-02-24 10:51:58');
INSERT INTO `receive_chat` VALUES (11, '3EB0E25F11E0FE531CC1', '085608743393', 'halo', '0', '081229193164', '2021-02-24 10:58:36');
INSERT INTO `receive_chat` VALUES (12, '3EB0DE308D7635B69A76', '085608743393', 'dls;k', '0', '081229193164', '2021-02-24 11:01:18');
INSERT INTO `receive_chat` VALUES (13, '3EB04B1ED4F5DE79BA05', '085608743393', 'halooo', '0', '081229193164', '2021-02-24 11:01:26');
INSERT INTO `receive_chat` VALUES (14, '3EB01E30F26A656624C3', '085608743393', 'iya', '0', '081229193164', '2021-02-24 11:10:33');
INSERT INTO `receive_chat` VALUES (15, '3EB07A8B78FB720AA8B8', '085608743393', 'haloo', '0', '081229193164', '2021-02-24 13:08:44');
INSERT INTO `receive_chat` VALUES (16, '3EB0A3C6ABA1C6241328', '085608743393', 'iya', '0', '081229193164', '2021-02-24 13:22:55');
INSERT INTO `receive_chat` VALUES (17, '3EB0E5B66BE890FE725D', '085608743393', 'hay', '0', '081229193164', '2021-02-24 13:24:33');
INSERT INTO `receive_chat` VALUES (18, '3EB0AEFAF04ED4DB20B7', '085608743393', '', '0', '081229193164', '2021-02-24 13:28:11');
INSERT INTO `receive_chat` VALUES (19, '3EB05078202B8D247E00', '085608743393', '', '0', '081229193164', '2021-02-24 13:32:54');
INSERT INTO `receive_chat` VALUES (20, '3EB01BBA7532373611C7', '085608743393', 'ini test pesan pada 24/02/21 06:32:36', '1', '081229193164', '2021-02-24 14:01:24');
INSERT INTO `receive_chat` VALUES (21, '3EB054894066C5237B16', '085608743393', 'ini test pesan pada 24/02/21 07:07:45', '1', '081229193164', '2021-02-24 14:07:53');
INSERT INTO `receive_chat` VALUES (22, '3EB0C538B445FED2D1D9', '085608743393', 'ini test pesan pada 24/02/21 07:07:54', '1', '081229193164', '2021-02-24 14:08:00');
INSERT INTO `receive_chat` VALUES (23, '3EB0D70208F62C6929B2', '085608743393', 'ini test pesan pada 24/02/21 07:32:04', '1', '081229193164', '2021-02-24 14:32:10');
INSERT INTO `receive_chat` VALUES (24, '3EB06E3DFF11341DE1F2', '085608743393', 'iya', '0', '081229193164', '2021-02-24 14:34:13');
INSERT INTO `receive_chat` VALUES (25, 'D3A55576398245B13C168021A7AAF873', '085608743393', 'Hay', '1', '081229193164', '2021-02-25 05:50:15');
INSERT INTO `receive_chat` VALUES (26, '5FF5E3928D7B355998DB06A7175FBF57', '085608743393', 'Ok', '0', '081229193164', '2021-02-25 06:00:02');
INSERT INTO `receive_chat` VALUES (27, 'E9DE5B81C18A3D6F72378893280AB19D', '085608743393', 'Sip', '0', '081229193164', '2021-02-25 06:02:40');
INSERT INTO `receive_chat` VALUES (28, 'EDE6E2D72219A678A2012549CC09453E', '085608743393', 'Halo', '1', '081229193164', '2021-02-25 06:03:11');
INSERT INTO `receive_chat` VALUES (29, '3EB05B10BFF5B557F0ED', '085608743393', 'Hi', '0', '081229193164', '2021-02-25 09:15:20');
INSERT INTO `receive_chat` VALUES (30, '3EB0C2D29EE8189BEFDA', '085608743393', '!ping', '0', '081229193164', '2021-02-25 09:15:41');
INSERT INTO `receive_chat` VALUES (31, '3EB071F34BD07FC63998', '085608743393', '!chats', '0', '081229193164', '2021-02-25 09:16:25');
INSERT INTO `receive_chat` VALUES (32, '3EB02E808B721DF6C6AE', '085608743393', 'Hi', '0', '081229193164', '2021-02-25 09:23:18');
INSERT INTO `receive_chat` VALUES (33, 'C5CD66C40E4B285325E9326D3A36D9C5', '085608743393', 'Yed', '1', '081229193164', '2021-02-25 09:23:36');
INSERT INTO `receive_chat` VALUES (34, '3EB041FB63A462497D30', '085608743393', '!ping', '0', '081229193164', '2021-02-25 10:41:23');
INSERT INTO `receive_chat` VALUES (35, '3EB0E09F2CAD474F32BD', '085608743393', 'ini test pesan pada 25/02/21 05:06:01', '1', '081229193164', '2021-02-25 12:06:07');
INSERT INTO `receive_chat` VALUES (36, '3EB013AC6DCE16E744EB', '085608743393', 'ok', '0', '081229193164', '2021-02-25 12:06:19');
INSERT INTO `receive_chat` VALUES (37, '3EB0D44251B56E934587', '085608743393', 'hay', '0', '081229193164', '2021-02-25 12:46:06');
INSERT INTO `receive_chat` VALUES (38, '3EB067051013E8038DBA', '085608743393', 'iya', '0', '081229193164', '2021-02-25 12:47:28');
INSERT INTO `receive_chat` VALUES (39, '3EB0933873F784178F4E', '085608743393', 'oke', '0', '081229193164', '2021-02-25 12:49:29');
INSERT INTO `receive_chat` VALUES (40, '3EB00C2FBBE10EF83953', '085608743393', 'mas', '0', '081229193164', '2021-02-25 12:50:19');
INSERT INTO `receive_chat` VALUES (41, '3EB0A0EEEB34C60DCB0D', '085608743393', 'ya', '0', '081229193164', '2021-02-25 12:51:37');
INSERT INTO `receive_chat` VALUES (42, '3EB02FC79C8136DC502C', '085608743393', 'ini', '0', '081229193164', '2021-02-25 12:52:13');
INSERT INTO `receive_chat` VALUES (43, '3EB05974D4DF08E1F66B', '085608743393', 'aem', '0', '081229193164', '2021-02-25 12:55:11');
INSERT INTO `receive_chat` VALUES (44, '3EB05B541B2DEE762B66', '085608743393', 'halo', '0', '081229193164', '2021-02-25 12:57:20');
INSERT INTO `receive_chat` VALUES (45, '3EB0033294B877946833', '085608743393', 'hak', '0', '081229193164', '2021-02-25 13:08:08');
INSERT INTO `receive_chat` VALUES (46, '3EB0F47BDB19CC3BF213', '085608743393', 'tets', '0', '081229193164', '2021-02-25 13:10:13');
INSERT INTO `receive_chat` VALUES (47, '3EB001BEAB6A55C3CF27', '085608743393', 'mas', '0', '081229193164', '2021-02-25 13:29:13');
INSERT INTO `receive_chat` VALUES (48, '3EB0002FDDE041892E6C', '085608743393', 'halo', '0', '081229193164', '2021-02-25 14:55:50');
INSERT INTO `receive_chat` VALUES (49, '3EB0321176F59304D080', '085608743393', 'holoo', '1', '081229193164', '2021-02-26 06:08:19');
INSERT INTO `receive_chat` VALUES (50, '3EB0B8CC2A9C6C1194D7', '085608743393', 'sfhf', '1', '081229193164', '2021-02-26 07:01:38');
INSERT INTO `receive_chat` VALUES (51, '3EB09B3818CA95AFC7DA', '085232843165', 'bisa ?', '1', '081229193164', '2021-02-21 08:25:00');
INSERT INTO `receive_chat` VALUES (52, '3EB0C3F99A446AEF6409', '085232843165', 'sipasdamsa', '1', '081229193164', '2021-02-21 08:29:45');
INSERT INTO `receive_chat` VALUES (53, '97F383383B3D95763EBA21E6C060F880', '085232843165', 'dor', '1', '081229193164', '2021-02-22 06:41:46');
INSERT INTO `receive_chat` VALUES (54, 'EF60ED826703B68930AAD7807321BBF2', '085232843165', 'hali', '0', '081229193164', '2021-02-22 06:41:54');
INSERT INTO `receive_chat` VALUES (55, '986CE91030948507DE81D282AF5A9115', '085232843165', 'ini siapa', '0', '081229193164', '2021-02-22 06:41:57');
INSERT INTO `receive_chat` VALUES (56, '3EB0296FB10C69195A82', '085232843165', 'sd', '1', '081229193164', '2021-02-23 14:21:18');
INSERT INTO `receive_chat` VALUES (57, '3EB019970E871B1E863A', '085232843165', 'sd', '1', '081229193164', '2021-02-23 14:21:28');
INSERT INTO `receive_chat` VALUES (58, '3EB0494D2E6AD973205A', '085232843165', 'sd', '1', '081229193164', '2021-02-23 14:21:59');
INSERT INTO `receive_chat` VALUES (59, '3EB0B830D0B24C8405FB', '085232843165', 'sa', '0', '081229193164', '2021-02-23 14:22:04');
INSERT INTO `receive_chat` VALUES (60, '3EB089B9D3F251764465', '085232843165', 'sd', '1', '081229193164', '2021-02-23 14:22:22');
INSERT INTO `receive_chat` VALUES (61, '3EB00C3BBDCB755B2046', '085232843165', 'sd', '1', '081229193164', '2021-02-23 14:22:30');
INSERT INTO `receive_chat` VALUES (62, '3EB0D4AFBC96510AB80D', '085232843165', 'ok', '0', '081229193164', '2021-02-23 14:33:22');
INSERT INTO `receive_chat` VALUES (63, '3EB0839378F81E7129DF', '085232843165', 'k12', '1', '081229193164', '2021-02-23 15:31:01');
INSERT INTO `receive_chat` VALUES (64, '3EB042B1AAC84BCC404C', '085232843165', 'k12', '1', '081229193164', '2021-02-23 15:34:18');
INSERT INTO `receive_chat` VALUES (65, '3EB022623EA596084708', '085232843165', 'test', '1', '081229193164', '2021-02-24 04:35:31');
INSERT INTO `receive_chat` VALUES (66, '3EB0F063748F33DC2972', '085232843165', 'test', '1', '081229193164', '2021-02-24 04:35:49');
INSERT INTO `receive_chat` VALUES (67, '3EB0A10B4BE3EBF14C8F', '085232843165', 'test', '1', '081229193164', '2021-02-24 05:10:11');
INSERT INTO `receive_chat` VALUES (68, '3EB021BEE08DEF1583F6', '085232843165', 'test2', '1', '081229193164', '2021-02-24 05:21:35');
INSERT INTO `receive_chat` VALUES (69, '3EB01032819B00EC6D0C', '085232843165', 'test2', '1', '081229193164', '2021-02-24 05:23:04');
INSERT INTO `receive_chat` VALUES (70, '3EB0216997DDA3724ECB', '085232843165', 'test223', '1', '081229193164', '2021-02-24 05:23:16');
INSERT INTO `receive_chat` VALUES (71, '3EB06C8518A097780BFB', '085232843165', 'test223', '1', '081229193164', '2021-02-24 05:26:08');
INSERT INTO `receive_chat` VALUES (72, '3EB0129426593CBD3E2C', '085232843165', 'test223', '1', '081229193164', '2021-02-24 05:32:41');
INSERT INTO `receive_chat` VALUES (73, '3EB07517CB4E3BC7E5C5', '085232843165', 'test223', '1', '081229193164', '2021-02-24 05:33:08');
INSERT INTO `receive_chat` VALUES (74, '3EB01AF9EB2D8B604E0A', '085232843165', 'haloo', '1', '081229193164', '2021-02-24 05:33:14');
INSERT INTO `receive_chat` VALUES (75, '3EB0C14979F45D639A74', '085232843165', '', '1', '081229193164', '2021-02-24 05:34:12');
INSERT INTO `receive_chat` VALUES (76, '3EB0EE7D60DE28E6E3D8', '085232843165', 'holoo', '1', '081229193164', '2021-02-24 05:34:47');
INSERT INTO `receive_chat` VALUES (77, '3EB05ED4F12AC4660250', '085232843165', 'holoo', '1', '081229193164', '2021-02-24 05:35:17');
INSERT INTO `receive_chat` VALUES (78, '3EB010855668F8DCBE38', '085232843165', '', '1', '081229193164', '2021-02-24 05:47:22');
INSERT INTO `receive_chat` VALUES (79, '3EB0267F770D8A389201', '085232843165', 'haloo', '1', '081229193164', '2021-02-24 05:47:29');
INSERT INTO `receive_chat` VALUES (80, '3EB0CFA68EFE94DE6207', '085232843165', 'holoo', '1', '081229193164', '2021-02-24 05:47:54');
INSERT INTO `receive_chat` VALUES (81, '3EB026711BD6C4A9AF66', '085232843165', 'haloo', '1', '081229193164', '2021-02-24 06:17:50');
INSERT INTO `receive_chat` VALUES (82, '3EB0FB6EF4292F9D191A', '085232843165', 'haloo', '1', '081229193164', '2021-02-24 06:53:30');
INSERT INTO `receive_chat` VALUES (83, '3EB00BDF8EC02196AE2B', '085232843165', 'FOto Bagus', '1', '081229193164', '2021-02-24 06:54:50');
INSERT INTO `receive_chat` VALUES (84, '3EB099F01ADB971FF6AF', '085232843165', '123', '1', '081229193164', '2021-02-24 10:07:45');
INSERT INTO `receive_chat` VALUES (85, '3EB0D85CDF52F7257233', '085232843165', 'ini test pesan pada 24/02/21 05:31:27', '1', '081229193164', '2021-02-24 12:32:14');
INSERT INTO `receive_chat` VALUES (86, '3EB055206164531C7DE8', '085232843165', 'ini test pesan pada 24/02/21 06:21:29', '1', '081229193164', '2021-02-24 13:22:29');
INSERT INTO `receive_chat` VALUES (87, '3EB0CBF103E1F1323625', '085232843165', 'jo', '1', '081229193164', '2021-02-25 06:20:50');
INSERT INTO `receive_chat` VALUES (88, '3EB099BE93C7CC06AC2B', '085232843165', 'ini test pesan pada 24/02/21 23:19:42', '1', '081229193164', '2021-02-25 06:22:38');
INSERT INTO `receive_chat` VALUES (89, '5EFE715D14CCA5358182337B7D863195', '085232843165', 'Siap', '0', '081229193164', '2021-02-25 06:23:15');
INSERT INTO `receive_chat` VALUES (90, 'D7FFF198A67089706650BF5335ED6BC7', '085232843165', 'Ya', '0', '081229193164', '2021-02-25 06:24:44');
INSERT INTO `receive_chat` VALUES (91, '3EB08BCE9068CCE5A2F8', '085232843165', 'ini test pesan pada 24/02/21 23:22:39', '1', '081229193164', '2021-02-25 06:25:07');
INSERT INTO `receive_chat` VALUES (92, '3EB0905310CA5F938945', '085232843165', 'ini test pesan pada 24/02/21 23:25:08', '1', '081229193164', '2021-02-25 06:35:33');
INSERT INTO `receive_chat` VALUES (93, '3EB0357C28A13D8717B6', '085232843165', 'ini test pesan pada 25/02/21 14:03:05', '1', '081229193164', '2021-02-25 21:03:16');
INSERT INTO `receive_chat` VALUES (94, '3EB0EBE3828B246EF4DD', '085232843165', 'hy', '1', '081229193164', '2021-02-26 06:04:21');
INSERT INTO `receive_chat` VALUES (95, '3EB0F970CB9CBB057B9A', '085232843165', 'jbjbkj', '1', '081229193164', '2021-02-26 06:07:50');
INSERT INTO `receive_chat` VALUES (96, '3EB08BB728D2A266A09F', '085232843165', 'mau', '0', '081229193164', '2021-02-26 06:44:26');
INSERT INTO `receive_chat` VALUES (97, '3EB0F5A4F5466C8F4CF6', '085232843165', 'test', '1', '081229193164', '2021-02-26 06:58:26');
INSERT INTO `receive_chat` VALUES (98, '3EB0BEB5F8AAB326B347', '085232843165', 'test', '1', '081229193164', '2021-02-26 06:58:50');
INSERT INTO `receive_chat` VALUES (99, '3EB0D2BC9A72BE69B807', '085232843165', 'test', '1', '081229193164', '2021-02-26 07:00:21');
INSERT INTO `receive_chat` VALUES (100, '3EB046A6A74DE0FD3163', '085232843165', 'test', '1', '081229193164', '2021-02-26 07:01:19');
INSERT INTO `receive_chat` VALUES (101, 'BMCZTEGH60SKCZKKFWHM', '08883723227-1614012205', 'Selamat datang Kak ini adalah link untuk pembeli / Buyer : http://147.139.192.236/autorekber/index.php/T0Kmjs#cta', '1', '081229193164', '2021-02-22 23:43:28');
INSERT INTO `receive_chat` VALUES (102, 'BAZ3CZ1CIILXBCIVACMI', '08883723227-1614012146', 'Selamat datang Kak ini adalah link untuk pembeli / Buyer : http://147.139.192.236/autorekber/index.php/JY04uN#cta', '1', '081229193164', '2021-02-22 23:42:28');
INSERT INTO `receive_chat` VALUES (103, 'MFHRYDXUQCUEB1QCZQ3Z', '08883723227-1614010255', 'Selamat datang Kak ini adalah link untuk pembeli / Buyer : http://147.139.192.236/autorekber/index.php/7W1ucH#cta', '1', '081229193164', '2021-02-22 23:10:57');
INSERT INTO `receive_chat` VALUES (104, '3EB0A08B6DE38EAF75F2', '085238414091', 'Halo Moh.zulfani , Siti dikabarin kurir Ninja 13 SBY katanya *paketan da sampe.* cocok ga kak ?', '1', '081229193164', '2021-02-21 12:59:17');
INSERT INTO `receive_chat` VALUES (105, 'FB69F8C7779214769FD2D779EB7EFF55', '085238414091', 'Alhamdulillah sesuai dengan apa yang saya pesan kak', '0', '081229193164', '2021-02-21 16:53:15');
INSERT INTO `receive_chat` VALUES (106, '3EB0AD7A6A689A0A8A98', '081805408854', 'Halo I Made Heri Purnomo, Siti dikabarin kurir Ninja 13 SBY katanya *paketan da sampe.* cocok ga kak ?', '1', '081229193164', '2021-02-21 12:59:57');
INSERT INTO `receive_chat` VALUES (107, '613351E05082193F548364883A3881C9', '081805408854', 'gk cocok', '0', '081229193164', '2021-02-21 13:00:18');
INSERT INTO `receive_chat` VALUES (108, '1DB12E71D655CEEA33F283CB40990106', '081805408854', 'jelek banget', '0', '081229193164', '2021-02-21 13:00:20');
INSERT INTO `receive_chat` VALUES (109, '7F0EC7DD9BF23428015323C08DBD3431', '081805408854', 'kecil', '0', '081229193164', '2021-02-21 13:00:23');
INSERT INTO `receive_chat` VALUES (110, 'DFBA143F95FB355876111D2E3F4E6415', '081805408854', 'gk yangka kainya gtu', '0', '081229193164', '2021-02-21 13:00:33');
INSERT INTO `receive_chat` VALUES (111, '7EB602793753CEB352D7386ED2BB90E5', '081805408854', 'intinya nyesel sekali belinya , sya coment dlu aplikasi , biar gk banyak orang k tipu', '0', '081229193164', '2021-02-21 13:01:42');
INSERT INTO `receive_chat` VALUES (112, 'A76A2F44C9048A63C0B7085BBED75ED4', '081805408854', 'untung gk bsa coment d d aplikasi \njngn kya gtu lah mba jualan\nkasian yg beli , ini bener bener jauh, sya kaya baru kali ini d tipu beli online', '0', '081229193164', '2021-02-21 13:05:51');
INSERT INTO `receive_chat` VALUES (113, 'ORHPMMXODGFFJGBF129E', '08883723227-1612148462', 'Selamat datang Kak ini adalah link untuk pembeli / Buyer : http://127.0.0.1:8000/UV8qc8#cta', '1', '081229193164', '2021-02-01 10:03:09');
INSERT INTO `receive_chat` VALUES (114, 'JGIR5XCRUBT1IAVOGESH', '08883723227-1612148462', 'Selamat datang Kak ini adalah link untuk pembeli / Buyer : \r\n http://127.0.0.1:8000/UV8qc8#cta', '1', '081229193164', '2021-02-01 10:03:51');
INSERT INTO `receive_chat` VALUES (115, '9CBE84985F491297A42C941F13529A5D', '08883723227-1612148462', '2', '0', '081229193164', '2021-02-01 11:23:23');
INSERT INTO `receive_chat` VALUES (116, 'A9550A7BE250821C1C524FDD5068F93A', '08883723227-1612148462', '3', '0', '081229193164', '2021-02-01 13:08:49');
INSERT INTO `receive_chat` VALUES (117, 'GI7NWGNSRQUBVYFYMXBC', '08883723227-1612148462', '*Internet Banking*\r\n* Login ke internet banking Bank BRI Anda\r\n* Pilih menu Pembayaran lalu klik menu BRIVA\r\n* Pilih rekening sumber dan masukkan Kode Bayar (0000000001) lalu klik Kirim\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Masukkan kata sandi ibanking lalu klik Request untuk mengirim m-PIN ke nomor HP Anda\r\n* Periksa HP Anda dan masukkan m-PIN yang diterima lalu klik Kirim\r\n*Aplikasi BRImo*\r\n* Login ke aplikasi BRImo Anda\r\n* Pilih menu BRIVA\r\n* Pilih sumber dana dan masukkan Nomor Pembayaran (0000000001) lalu klik Lanjut\r\n* Klik Lanjut\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Klik Konfirmasi\r\n* Klik Lanjut\r\n* Masukkan kata sandi ibanking Anda\r\n* Klik Lanjut\r\n', '1', '081229193164', '2021-02-08 11:37:52');
INSERT INTO `receive_chat` VALUES (118, 'NVWZUOIRJYBOB5RQ2ZBX', '08883723227-1612148462', '*Internet Banking*\r\n* Login ke internet banking Bank BRI Anda\r\n* Pilih menu Pembayaran lalu klik menu BRIVA\r\n* Pilih rekening sumber dan masukkan Kode Bayar (0000000001) lalu klik Kirim\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Masukkan kata sandi ibanking lalu klik Request untuk mengirim m-PIN ke nomor HP Anda\r\n* Periksa HP Anda dan masukkan m-PIN yang diterima lalu klik Kirim\r\n\r\n*Aplikasi BRImo*\r\n* Login ke aplikasi BRImo Anda\r\n* Pilih menu BRIVA\r\n* Pilih sumber dana dan masukkan Nomor Pembayaran (0000000001) lalu klik Lanjut\r\n* Klik Lanjut\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Klik Konfirmasi\r\n* Klik Lanjut\r\n* Masukkan kata sandi ibanking Anda\r\n* Klik Lanjut\r\n\r\n', '1', '081229193164', '2021-02-08 11:39:07');
INSERT INTO `receive_chat` VALUES (119, 'F1REG7XCAJCN12S5HBQF', '08883723227-1612148462', '*Internet Banking*\r\n* Login ke internet banking Bank BRI Anda\r\n* Pilih menu Pembayaran lalu klik menu BRIVA\r\n* Pilih rekening sumber dan masukkan Kode Bayar (0000000001) lalu klik Kirim\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Masukkan kata sandi ibanking lalu klik Request untuk mengirim m-PIN ke nomor HP Anda\r\n* Periksa HP Anda dan masukkan m-PIN yang diterima lalu klik Kirim\r\n\r\n*Aplikasi BRImo*\r\n* Login ke aplikasi BRImo Anda\r\n* Pilih menu BRIVA\r\n* Pilih sumber dana dan masukkan Nomor Pembayaran (0000000001) lalu klik Lanjut\r\n* Klik Lanjut\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Klik Konfirmasi\r\n* Klik Lanjut\r\n* Masukkan kata sandi ibanking Anda\r\n* Klik Lanjut\r\n\r\n', '1', '081229193164', '2021-02-08 11:53:49');
INSERT INTO `receive_chat` VALUES (120, 'V5RCKNQNX49TYE98M03A', '08883723227-1612148462', '*Internet Banking*\r\n* Login ke internet banking Bank BRI Anda\r\n* Pilih menu Pembayaran lalu klik menu BRIVA\r\n* Pilih rekening sumber dan masukkan Kode Bayar (0000000001) lalu klik Kirim\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Masukkan kata sandi ibanking lalu klik Request untuk mengirim m-PIN ke nomor HP Anda\r\n* Periksa HP Anda dan masukkan m-PIN yang diterima lalu klik Kirim\r\n\r\n*Aplikasi BRImo*\r\n* Login ke aplikasi BRImo Anda\r\n* Pilih menu BRIVA\r\n* Pilih sumber dana dan masukkan Nomor Pembayaran (0000000001) lalu klik Lanjut\r\n* Klik Lanjut\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Klik Konfirmasi\r\n* Klik Lanjut\r\n* Masukkan kata sandi ibanking Anda\r\n* Klik Lanjut\r\n\r\n', '1', '081229193164', '2021-02-08 11:54:26');
INSERT INTO `receive_chat` VALUES (121, 'FQQTKAGWW0UCO79L7XXJ', '08883723227-1612148462', '*Internet Banking*\r\n* Login ke internet banking Bank BRI Anda\r\n* Pilih menu Pembayaran lalu klik menu BRIVA\r\n* Pilih rekening sumber dan masukkan Kode Bayar (0000000001) lalu klik Kirim\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Masukkan kata sandi ibanking lalu klik Request untuk mengirim m-PIN ke nomor HP Anda\r\n* Periksa HP Anda dan masukkan m-PIN yang diterima lalu klik Kirim\r\n\r\n*Aplikasi BRImo*\r\n* Login ke aplikasi BRImo Anda\r\n* Pilih menu BRIVA\r\n* Pilih sumber dana dan masukkan Nomor Pembayaran (0000000001) lalu klik Lanjut\r\n* Klik Lanjut\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Klik Konfirmasi\r\n* Klik Lanjut\r\n* Masukkan kata sandi ibanking Anda\r\n* Klik Lanjut\r\n\r\n', '1', '081229193164', '2021-02-08 11:59:38');
INSERT INTO `receive_chat` VALUES (122, 'ATZI3UK58YSQMZBLBZYZ', '08883723227-1612148462', '*Internet Banking*\r\n* Login ke internet banking Bank BRI Anda\r\n* Pilih menu Pembayaran lalu klik menu BRIVA\r\n* Pilih rekening sumber dan masukkan Kode Bayar (0000000001) lalu klik Kirim\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Masukkan kata sandi ibanking lalu klik Request untuk mengirim m-PIN ke nomor HP Anda\r\n* Periksa HP Anda dan masukkan m-PIN yang diterima lalu klik Kirim\r\n\r\n*Aplikasi BRImo*\r\n* Login ke aplikasi BRImo Anda\r\n* Pilih menu BRIVA\r\n* Pilih sumber dana dan masukkan Nomor Pembayaran (0000000001) lalu klik Lanjut\r\n* Klik Lanjut\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Klik Konfirmasi\r\n* Klik Lanjut\r\n* Masukkan kata sandi ibanking Anda\r\n* Klik Lanjut\r\n\r\n', '1', '081229193164', '2021-02-08 12:05:35');
INSERT INTO `receive_chat` VALUES (123, 'A5HDIQQMZ361FCZG4UWW', '08883723227-1612148462', '*Internet Banking*\r\n* Login ke internet banking Bank BRI Anda\r\n* Pilih menu Pembayaran lalu klik menu BRIVA\r\n* Pilih rekening sumber dan masukkan Kode Bayar (0000000001) lalu klik Kirim\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Masukkan kata sandi ibanking lalu klik Request untuk mengirim m-PIN ke nomor HP Anda\r\n* Periksa HP Anda dan masukkan m-PIN yang diterima lalu klik Kirim\r\n\r\n*Aplikasi BRImo*\r\n* Login ke aplikasi BRImo Anda\r\n* Pilih menu BRIVA\r\n* Pilih sumber dana dan masukkan Nomor Pembayaran (0000000001) lalu klik Lanjut\r\n* Klik Lanjut\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Klik Konfirmasi\r\n* Klik Lanjut\r\n* Masukkan kata sandi ibanking Anda\r\n* Klik Lanjut\r\n\r\n', '1', '081229193164', '2021-02-08 12:06:20');
INSERT INTO `receive_chat` VALUES (124, '9DWS9GJWC8P7WYFKZXMF', '08883723227-1612148462', '*Internet Banking*\r\n* Login ke internet banking Bank BRI Anda\r\n* Pilih menu Pembayaran lalu klik menu BRIVA\r\n* Pilih rekening sumber dan masukkan Kode Bayar (0000000001) lalu klik Kirim\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Masukkan kata sandi ibanking lalu klik Request untuk mengirim m-PIN ke nomor HP Anda\r\n* Periksa HP Anda dan masukkan m-PIN yang diterima lalu klik Kirim\r\n\r\n*Aplikasi BRImo*\r\n* Login ke aplikasi BRImo Anda\r\n* Pilih menu BRIVA\r\n* Pilih sumber dana dan masukkan Nomor Pembayaran (0000000001) lalu klik Lanjut\r\n* Klik Lanjut\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Klik Konfirmasi\r\n* Klik Lanjut\r\n* Masukkan kata sandi ibanking Anda\r\n* Klik Lanjut\r\n\r\n', '1', '081229193164', '2021-02-08 12:19:02');
INSERT INTO `receive_chat` VALUES (125, 'B318CC74565DFB967CBE16F6760FE700', '08883723227-1612148462', 'Ok', '0', '081229193164', '2021-02-08 12:19:13');
INSERT INTO `receive_chat` VALUES (126, '9BV1CPULMOB1FWDAQMBB', '08883723227-1612148462', '*Internet Banking*\r\n* Login ke internet banking Bank BRI Anda\r\n* Pilih menu Pembayaran lalu klik menu BRIVA\r\n* Pilih rekening sumber dan masukkan Kode Bayar (0000000001) lalu klik Kirim\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Masukkan kata sandi ibanking lalu klik Request untuk mengirim m-PIN ke nomor HP Anda\r\n* Periksa HP Anda dan masukkan m-PIN yang diterima lalu klik Kirim\r\n\r\n*Aplikasi BRImo*\r\n* Login ke aplikasi BRImo Anda\r\n* Pilih menu BRIVA\r\n* Pilih sumber dana dan masukkan Nomor Pembayaran (0000000001) lalu klik Lanjut\r\n* Klik Lanjut\r\n* Detail transaksi akan ditampilkan, pastikan data sudah sesuai\r\n* Klik Konfirmasi\r\n* Klik Lanjut\r\n* Masukkan kata sandi ibanking Anda\r\n* Klik Lanjut\r\n\r\n', '1', '081229193164', '2021-02-08 13:08:00');
INSERT INTO `receive_chat` VALUES (127, 'UWMTTYQWGRTQUDWGIMZM', '08883723227-1612148462', '', '1', '081229193164', '2021-02-08 14:52:56');
INSERT INTO `receive_chat` VALUES (128, 'ATVBMYD3FIQSH91HMU9P', '08883723227-1612148462', 'a@\r\nBerikut adalah rincian pembayaran kakak : \r\n\r\nHarga Produk : Rp. 650,000\r\nBiaya Rekber : Rp. 25,000\r\nTotal : Rp. 675,000\r\n\r\nMetode Pembayaran : \r\n*1. Maybank*\r\n*2. Permata*\r\n*3. BNI*\r\n*4. BRI*\r\n*5. Mandiri*\r\n*6. BCA*\r\n*7. Sinarmas*\r\n*8. BRI*\r\n*9. CIMB Niaga*\r\n*10. BCA*\r\n*11. BNI*\r\n*12. Alfamart*\r\n*13. Alfamidi*\r\n*14. QRIS*\r\n\r\nSilahkan pilih metode pembayaran yang kakak mau dengan mengetik nomornya.\r\n\r\nContoh : \r\nKetik *1* untuk memilih pembayaran melalui bank *Maybank*', '1', '081229193164', '2021-02-08 15:57:00');
INSERT INTO `receive_chat` VALUES (129, 'UDOHQKGEVM9D2UIU2PQ2', '08883723227-1612148462', 'Selamat datang Kak ini adalah link untuk pembeli / Buyer : http://127.0.0.1:8000/UV8qc8#cta', '1', '081229193164', '2021-02-08 15:58:12');
INSERT INTO `receive_chat` VALUES (130, 'LUZBEQHSKYZQVNCEINR1', '08883723227-1612148462', 'a@6285608743393\r\nBerikut adalah rincian pembayaran kakak : \r\n\r\nHarga Produk : Rp. 650,000\r\nBiaya Rekber : Rp. 25,000\r\nTotal : Rp. 675,000\r\n\r\nMetode Pembayaran : \r\n*1. Maybank*\r\n*2. Permata*\r\n*3. BNI*\r\n*4. BRI*\r\n*5. Mandiri*\r\n*6. BCA*\r\n*7. Sinarmas*\r\n*8. BRI*\r\n*9. CIMB Niaga*\r\n*10. BCA*\r\n*11. BNI*\r\n*12. Alfamart*\r\n*13. Alfamidi*\r\n*14. QRIS*\r\n\r\nSilahkan pilih metode pembayaran yang kakak mau dengan mengetik nomornya.\r\n\r\nContoh : \r\nKetik *1* untuk memilih pembayaran melalui bank *Maybank*', '1', '081229193164', '2021-02-08 15:58:15');
INSERT INTO `receive_chat` VALUES (131, 'MDDOQJD7XS3M6D2LV81B', '08883723227-1612148462', 'a@6285608743393\r\nBerikut adalah rincian pembayaran kakak : \r\n\r\nHarga Produk : Rp. 650,000\r\nBiaya Rekber : Rp. 25,000\r\nTotal : Rp. 675,000\r\n\r\nMetode Pembayaran : \r\n*1. Maybank*\r\n*2. Permata*\r\n*3. BNI*\r\n*4. BRI*\r\n*5. Mandiri*\r\n*6. BCA*\r\n*7. Sinarmas*\r\n*8. BRI*\r\n*9. CIMB Niaga*\r\n*10. BCA*\r\n*11. BNI*\r\n*12. Alfamart*\r\n*13. Alfamidi*\r\n*14. QRIS*\r\n\r\nSilahkan pilih metode pembayaran yang kakak mau dengan mengetik nomornya.\r\n\r\nContoh : \r\nKetik *1* untuk memilih pembayaran melalui bank *Maybank*', '1', '081229193164', '2021-02-08 15:58:36');
INSERT INTO `receive_chat` VALUES (132, 'ENUUHBLTZM2D0EYUJER1', '08883723227-1612148462', 'a@6285608743393\r\nBerikut adalah rincian pembayaran kakak : \r\n\r\nHarga Produk : Rp. 650,000\r\nBiaya Rekber : Rp. 25,000\r\nTotal : Rp. 675,000\r\n\r\nMetode Pembayaran : \r\n*1. Maybank*\r\n*2. Permata*\r\n*3. BNI*\r\n*4. BRI*\r\n*5. Mandiri*\r\n*6. BCA*\r\n*7. Sinarmas*\r\n*8. BRI*\r\n*9. CIMB Niaga*\r\n*10. BCA*\r\n*11. BNI*\r\n*12. Alfamart*\r\n*13. Alfamidi*\r\n*14. QRIS*\r\n\r\nSilahkan pilih metode pembayaran yang kakak mau dengan mengetik nomornya.\r\n\r\nContoh : \r\nKetik *1* untuk memilih pembayaran melalui bank *Maybank*', '1', '081229193164', '2021-02-08 15:59:21');
INSERT INTO `receive_chat` VALUES (133, 'ZDE5VDABDZATIWOKFYIN', '08883723227-1612148462', 'a@6285608743393\r\nBerikut adalah rincian pembayaran kakak : \r\n\r\nHarga Produk : Rp. 650,000\r\nBiaya Rekber : Rp. 25,000\r\nTotal : Rp. 675,000\r\n\r\nMetode Pembayaran : \r\n*1. Maybank*\r\n*2. Permata*\r\n*3. BNI*\r\n*4. BRI*\r\n*5. Mandiri*\r\n*6. BCA*\r\n*7. Sinarmas*\r\n*8. BRI*\r\n*9. CIMB Niaga*\r\n*10. BCA*\r\n*11. BNI*\r\n*12. Alfamart*\r\n*13. Alfamidi*\r\n*14. QRIS*\r\n\r\nSilahkan pilih metode pembayaran yang kakak mau dengan mengetik nomornya.\r\n\r\nContoh : \r\nKetik *1* untuk memilih pembayaran melalui bank *Maybank*', '1', '081229193164', '2021-02-08 15:59:39');
INSERT INTO `receive_chat` VALUES (134, 'PFWP2M7IILC7DFVY1R4X', '08883723227-1612148462', 'a@6285608743393\r\nBerikut adalah rincian pembayaran kakak : \r\n\r\nHarga Produk : Rp. 650,000\r\nBiaya Rekber : Rp. 25,000\r\nTotal : Rp. 675,000\r\n\r\nMetode Pembayaran : \r\n*1. Maybank*\r\n*2. Permata*\r\n*3. BNI*\r\n*4. BRI*\r\n*5. Mandiri*\r\n*6. BCA*\r\n*7. Sinarmas*\r\n*8. BRI*\r\n*9. CIMB Niaga*\r\n*10. BCA*\r\n*11. BNI*\r\n*12. Alfamart*\r\n*13. Alfamidi*\r\n*14. QRIS*\r\n\r\nSilahkan pilih metode pembayaran yang kakak mau dengan mengetik nomornya.\r\n\r\nContoh : \r\nKetik *1* untuk memilih pembayaran melalui bank *Maybank*', '1', '081229193164', '2021-02-08 16:01:06');
INSERT INTO `receive_chat` VALUES (135, 'LW3XEAPJGH2TIYMMRUT7', '08883723227-1612148462', 'a@6285608743393\r\nBerikut adalah rincian pembayaran kakak : \r\n\r\nHarga Produk : Rp. 650,000\r\nBiaya Rekber : Rp. 25,000\r\nTotal : Rp. 675,000\r\n\r\nMetode Pembayaran : \r\n*1. Maybank*\r\n*2. Permata*\r\n*3. BNI*\r\n*4. BRI*\r\n*5. Mandiri*\r\n*6. BCA*\r\n*7. Sinarmas*\r\n*8. BRI*\r\n*9. CIMB Niaga*\r\n*10. BCA*\r\n*11. BNI*\r\n*12. Alfamart*\r\n*13. Alfamidi*\r\n*14. QRIS*\r\n\r\nSilahkan pilih metode pembayaran yang kakak mau dengan mengetik nomornya.\r\n\r\nContoh : \r\nKetik *1* untuk memilih pembayaran melalui bank *Maybank*', '1', '081229193164', '2021-02-08 16:01:45');
INSERT INTO `receive_chat` VALUES (136, 'XUDXHJY7BLEGPVVJE6FR', '08883723227-1612148462', 'a@6285608743393\r\nBerikut adalah rincian pembayaran kakak : \r\n\r\nHarga Produk : Rp. 650,000\r\nBiaya Rekber : Rp. 25,000\r\nTotal : Rp. 675,000\r\n\r\nMetode Pembayaran : \r\n*1. Maybank*\r\n*2. Permata*\r\n*3. BNI*\r\n*4. BRI*\r\n*5. Mandiri*\r\n*6. BCA*\r\n*7. Sinarmas*\r\n*8. BRI*\r\n*9. CIMB Niaga*\r\n*10. BCA*\r\n*11. BNI*\r\n*12. Alfamart*\r\n*13. Alfamidi*\r\n*14. QRIS*\r\n\r\nSilahkan pilih metode pembayaran yang kakak mau dengan mengetik nomornya.\r\n\r\nContoh : \r\nKetik *1* untuk memilih pembayaran melalui bank *Maybank*', '1', '081229193164', '2021-02-08 16:02:27');
INSERT INTO `receive_chat` VALUES (137, '1F9CC9ABCFC77739E11745C8A838E471', '08883723227-1612148462', 'Ok', '0', '081229193164', '2021-02-08 16:02:55');
INSERT INTO `receive_chat` VALUES (138, 'IPSIJHU5DV5WVDY9QXAB', '08883723227-1612148462', 'a@6285608743393\r\nBerikut adalah rincian pembayaran kakak : \r\n\r\nHarga Produk : Rp. 650,000\r\nBiaya Rekber : Rp. 25,000\r\nTotal : Rp. 675,000\r\n\r\nMetode Pembayaran : \r\n*1. Maybank*\r\n*2. Permata*\r\n*3. BNI*\r\n*4. BRI*\r\n*5. Mandiri*\r\n*6. BCA*\r\n*7. Sinarmas*\r\n*8. BRI*\r\n*9. CIMB Niaga*\r\n*10. BCA*\r\n*11. BNI*\r\n*12. Alfamart*\r\n*13. Alfamidi*\r\n*14. QRIS*\r\n\r\nSilahkan pilih metode pembayaran yang kakak mau dengan mengetik nomornya.\r\n\r\nContoh : \r\nKetik *1* untuk memilih pembayaran melalui bank *Maybank*', '1', '081229193164', '2021-02-08 16:10:33');
INSERT INTO `receive_chat` VALUES (139, '3EB0668C0CFDD35C5DAD', '08883723227-1612148462', '14', '0', '081229193164', '2021-02-08 16:10:49');
INSERT INTO `receive_chat` VALUES (140, 'E0B99A8F4783A2B230D4AB372EAABBB8', '08883723227-1612148462', 'Ok', '1', '081229193164', '2021-02-08 16:46:55');
INSERT INTO `receive_chat` VALUES (141, 'F29108F64982EBC2323D11F5266640B9', '08883723227-1612148462', 'H', '1', '081229193164', '2021-02-09 07:34:10');
INSERT INTO `receive_chat` VALUES (142, 'NVK7ABZY8WPZW4FUPHZJ', '08883723227-1612148462', 'a@6285608743393\r\nBerikut adalah rincian pembayaran kakak : \r\n\r\nHarga Produk : Rp. 650,000\r\nBiaya Rekber : Rp. 25,000\r\nTotal : Rp. 675,000\r\n\r\nMetode Pembayaran : \r\n*1. Maybank*\r\n*2. Permata*\r\n*3. BNI*\r\n*4. BRI*\r\n*5. Mandiri*\r\n*6. BCA*\r\n*7. Sinarmas*\r\n*8. BRI*\r\n*9. CIMB Niaga*\r\n*10. BCA*\r\n*11. BNI*\r\n*12. Alfamart*\r\n*13. Alfamidi*\r\n*14. QRIS*\r\n\r\nSilahkan pilih metode pembayaran yang kakak mau dengan mengetik nomornya.\r\n\r\nContoh : \r\nKetik *1* untuk memilih pembayaran melalui bank *Maybank*', '1', '081229193164', '2021-02-09 08:00:02');
INSERT INTO `receive_chat` VALUES (143, '3EB0C9E410922EE8DB0F', '08883723227-1612148462', 'saip', '0', '081229193164', '2021-02-09 08:00:47');
INSERT INTO `receive_chat` VALUES (144, '3EB0985E20435F5F7BA2', '08883723227-1612148462', 'i', '0', '081229193164', '2021-02-09 08:00:55');
INSERT INTO `receive_chat` VALUES (145, '3EB0E4EF9344BA725BF6', '08883723227-1612148462', 'ok', '0', '081229193164', '2021-02-09 08:00:56');
INSERT INTO `receive_chat` VALUES (146, 'CCE5FE1951CDCB5A48372E4DA6BC6724', '08883723227-1612148462', '1', '0', '081229193164', '2021-02-09 08:49:33');
INSERT INTO `receive_chat` VALUES (147, '3EB0F0C0C5A5473BC468', '08883723227-1612148462', '12', '0', '081229193164', '2021-02-09 08:51:48');
INSERT INTO `receive_chat` VALUES (148, '3EB035C21BA9F183E5BF', '08883723227-1612148462', '11', '0', '081229193164', '2021-02-09 08:53:12');
INSERT INTO `receive_chat` VALUES (149, '3EB09F6E630E8C5B86F5', '08883723227-1612148462', '15', '0', '081229193164', '2021-02-09 08:57:45');
INSERT INTO `receive_chat` VALUES (150, '3EB015A2395361BE2BBB', '08883723227-1612148462', '8', '0', '081229193164', '2021-02-09 08:58:28');
INSERT INTO `receive_chat` VALUES (151, 'UFQSNBVBVZHAAUX4TKEY', '08883723227-1612148462', 'a@6285608743393\r\nBerikut adalah rincian pembayaran kakak : \r\n\r\nHarga Produk : Rp. 650,000\r\nBiaya Rekber : Rp. 25,000\r\nTotal : Rp. 675,000\r\n\r\nMetode Pembayaran : \r\n*1. Maybank*\r\n*2. Permata*\r\n*3. BNI*\r\n*4. BRI*\r\n*5. Mandiri*\r\n*6. BCA*\r\n*7. Sinarmas*\r\n*8. BRI*\r\n*9. CIMB Niaga*\r\n*10. BCA*\r\n*11. BNI*\r\n*12. Alfamart*\r\n*13. Alfamidi*\r\n*14. QRIS*\r\n\r\nSilahkan pilih metode pembayaran yang kakak mau dengan mengetik nomornya.\r\n\r\nContoh : \r\nKetik *1* untuk memilih pembayaran melalui bank *Maybank*', '1', '081229193164', '2021-02-09 08:58:34');
INSERT INTO `receive_chat` VALUES (152, '0A92344F04600F1DB85A44EA716BB965', '085230879031', '', '0', '081229193164', '2021-01-27 18:07:11');
INSERT INTO `receive_chat` VALUES (153, '4517B71C6D5FFAC96A691C92E88851FF', '085230879031', 'Dari toko tnlv ngasinan', '0', '081229193164', '2021-01-27 18:07:12');
INSERT INTO `receive_chat` VALUES (154, 'A962982B60E8A9C980CF117EA8AA6665', '085230879031', 'Selamat malam pak', '0', '081229193164', '2021-01-27 18:07:12');
INSERT INTO `receive_chat` VALUES (155, '329E61F4B22EBE90DDEE63D692F9BC9A', '085230879031', 'Mohon di bantu', '0', '081229193164', '2021-01-27 18:07:13');
INSERT INTO `receive_chat` VALUES (156, '10B48D9E007610B75B70C5C2CA3B5BCD', '085230879031', 'Ini ada transaksi pln suspek', '0', '081229193164', '2021-01-27 18:07:13');
INSERT INTO `receive_chat` VALUES (157, 'C77F6406F41A9A74CB702D98BA1F57CE', '085230879031', 'Terima kasih', '0', '081229193164', '2021-01-27 18:07:14');
INSERT INTO `receive_chat` VALUES (158, 'CC5078D4FC2ED2F97779D8DC7A7EA023', '085230879031', 'BEGIN:VCARD\nVERSION:3.0\nN:Virtual;Faiz;;;\nFN:Faiz Virtual\nitem1.TEL;waid=6285785816889:+62 857-8581-6889\nitem1.X-ABLabel:Ponsel\nEND:VCARD', '1', '081229193164', '2021-01-27 18:07:44');
INSERT INTO `receive_chat` VALUES (159, '2CBE95725F88A8F46DB659EC039D4BE8', '085230879031', 'Ke virtual ya', '1', '081229193164', '2021-01-27 18:07:50');
INSERT INTO `receive_chat` VALUES (160, 'B5E0251D3A9FB2C8CF0C159D60313BD6', '08883723227-1611647615', 'Ok', '1', '081229193164', '2021-01-26 14:53:43');
INSERT INTO `receive_chat` VALUES (161, '5F43BC10DFDD886147731188E6BCE808', '08883723227-1611647615', 'Siap', '0', '081229193164', '2021-01-26 15:26:19');
INSERT INTO `receive_chat` VALUES (162, '3EB0CF2C90BB88B80E66', '085232843165', 'halo', '1', '081229193164', '2021-02-27 03:15:57');
INSERT INTO `receive_chat` VALUES (163, '3EB05678A1EB711B1421', '085608743393', 'halo', '1', '081229193164', '2021-02-27 03:14:56');
INSERT INTO `receive_chat` VALUES (164, '=====', '0==', '=====', '0', '081229193164', '2021-02-27 13:41:30');

SET FOREIGN_KEY_CHECKS = 1;
