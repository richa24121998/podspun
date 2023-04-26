-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: craftcmsdb
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cc_announcements`
--

DROP TABLE IF EXISTS `cc_announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cc_idx_uhyyfpmsflhrnnlaixqjlrztdhpstoreouge` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `cc_idx_jxdazrzbelrwfhfwbbzsqyzfrrsqptxjnuvc` (`dateRead`),
  KEY `cc_fk_xhfejbpdwlmklxslretuwzdykyftgwisswbk` (`pluginId`),
  CONSTRAINT `cc_fk_xhfejbpdwlmklxslretuwzdykyftgwisswbk` FOREIGN KEY (`pluginId`) REFERENCES `cc_plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_zetntoxdsndzahhpisfsulwddzippntljqiv` FOREIGN KEY (`userId`) REFERENCES `cc_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_assetindexdata`
--

DROP TABLE IF EXISTS `cc_assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int NOT NULL,
  `uri` text COLLATE utf8mb3_unicode_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_kcfzpcrutxrwfoyljlniibifiujcnoriwged` (`sessionId`,`volumeId`),
  KEY `cc_idx_fnsicamyzzwkgkvyxgfxjopcbpjpvfbwykac` (`volumeId`),
  CONSTRAINT `cc_fk_rdrrqbkddbhiupagkaypgjnoeqjfmcjorgnr` FOREIGN KEY (`volumeId`) REFERENCES `cc_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_assets`
--

DROP TABLE IF EXISTS `cc_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_toobmdpxkangwyxbotywfhgjkfaxinmyazeo` (`filename`,`folderId`),
  KEY `cc_idx_yyznshyvpgzhhjoompmesmpjnmtwjbbqrwhk` (`folderId`),
  KEY `cc_idx_yjuypptekuguemxbazkkirnenjdtimewoakf` (`volumeId`),
  KEY `cc_fk_qnitvdbsrmlvqtahtzvrlbqrpnqlibsdwklt` (`uploaderId`),
  CONSTRAINT `cc_fk_esgskafsotrovypliczzhnhllrkbravuqayz` FOREIGN KEY (`volumeId`) REFERENCES `cc_volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_nwzlddfxxtxdmsnxssdeceekyltxcdaywonm` FOREIGN KEY (`folderId`) REFERENCES `cc_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_pofhllievokmxgjlejycyeifmieeuxscdylu` FOREIGN KEY (`id`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_qnitvdbsrmlvqtahtzvrlbqrpnqlibsdwklt` FOREIGN KEY (`uploaderId`) REFERENCES `cc_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_assettransformindex`
--

DROP TABLE IF EXISTS `cc_assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_assettransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `filename` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `volumeId` int DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_gmhamqvmxxchpgygqcywyfxplkuzyedcgdod` (`volumeId`,`assetId`,`location`),
  KEY `cc_idx_euixiomtlvamvxqwompoxqctbdlgmbrlsmxy` (`assetId`,`format`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_assettransforms`
--

DROP TABLE IF EXISTS `cc_assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_assettransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_cbamqcyrjqvcybgpqvjioxvichwrjrsgomtm` (`name`),
  KEY `cc_idx_rsayafhdglxgezgzdnkpmoktvqaxhzqiwzux` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_categories`
--

DROP TABLE IF EXISTS `cc_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_fepvsaqdkjgyuolilfreoadbdxlpqyznwxyf` (`groupId`),
  KEY `cc_fk_ekvwrpdmphpsyaatdxlrbgwpcflffqglcouc` (`parentId`),
  CONSTRAINT `cc_fk_bescprdzfnpbzvapvpguqnolpduloukoqrsg` FOREIGN KEY (`groupId`) REFERENCES `cc_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_ekvwrpdmphpsyaatdxlrbgwpcflffqglcouc` FOREIGN KEY (`parentId`) REFERENCES `cc_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc_fk_htputipgvkdhhgxfaddgbqhoqoyuadpfhitz` FOREIGN KEY (`id`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_categorygroups`
--

DROP TABLE IF EXISTS `cc_categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_posgmctjifpiivpqejatvcvvgczqvjupxknu` (`name`),
  KEY `cc_idx_imajqagabrctzmraugzrmefghaaraubzfuqk` (`handle`),
  KEY `cc_idx_owsdgmogvuqowlrwduyumrtfacgudmoampkv` (`structureId`),
  KEY `cc_idx_tvmoyhawongvnbqmexzlsswcjldpljvjaecr` (`fieldLayoutId`),
  KEY `cc_idx_fcfnbspzgcbrvroypjquprmarwdatxesxalc` (`dateDeleted`),
  CONSTRAINT `cc_fk_prhapwhvdaufesyadvcruvhpejijpusifapw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc_fk_qbcupfctxetvaicbvfewqzfvxofwtnethtby` FOREIGN KEY (`structureId`) REFERENCES `cc_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_categorygroups_sites`
--

DROP TABLE IF EXISTS `cc_categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8mb3_unicode_ci,
  `template` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_yqzefuneeymqhbycxgoqxylnkpmusswqxmoc` (`groupId`,`siteId`),
  KEY `cc_idx_dsaqugsgewrpjdtredftsdnnmqpbmhvxbegg` (`siteId`),
  CONSTRAINT `cc_fk_alrupvsjhcsdhmkpbfjgoygvbxcsjchofydb` FOREIGN KEY (`groupId`) REFERENCES `cc_categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_ffmvxnhoiehvbxeqbnxyriptxpnnaqjbhwbq` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_changedattributes`
--

DROP TABLE IF EXISTS `cc_changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `cc_idx_ydhsovclnrikrmpvsgnbscpihvddawylhcsq` (`elementId`,`siteId`,`dateUpdated`),
  KEY `cc_fk_fenmmhynheebapualzdiornswvklpztnltrt` (`siteId`),
  KEY `cc_fk_tvrceqmakesgcnywpxjkcwreojouinixrfia` (`userId`),
  CONSTRAINT `cc_fk_fenmmhynheebapualzdiornswvklpztnltrt` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_gnjrfznpmxqoxyoqyhznbiwxsigasxhjpqrm` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_tvrceqmakesgcnywpxjkcwreojouinixrfia` FOREIGN KEY (`userId`) REFERENCES `cc_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_changedfields`
--

DROP TABLE IF EXISTS `cc_changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `cc_idx_fpgvugxpaubimxdhnnetlqlvwppinjrveqpk` (`elementId`,`siteId`,`dateUpdated`),
  KEY `cc_fk_ybgoqkunpabghvboqityvgybqqghbzcqfqmg` (`siteId`),
  KEY `cc_fk_wvtinsihvhkhojsaihkwjfyfbjxfqekluxsp` (`fieldId`),
  KEY `cc_fk_qzxnlexdgrysdzkftyoccqnobstdnunjneya` (`userId`),
  CONSTRAINT `cc_fk_dtvnyventtxoilmosafzceuzpomfhctgmyyh` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_qzxnlexdgrysdzkftyoccqnobstdnunjneya` FOREIGN KEY (`userId`) REFERENCES `cc_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_wvtinsihvhkhojsaihkwjfyfbjxfqekluxsp` FOREIGN KEY (`fieldId`) REFERENCES `cc_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_ybgoqkunpabghvboqityvgybqqghbzcqfqmg` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_content`
--

DROP TABLE IF EXISTS `cc_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_showtovisitor_ygjzlqho` tinyint(1) DEFAULT NULL,
  `field_heroHeading_qeyuluhm` text COLLATE utf8mb3_unicode_ci,
  `field_pressHeading_qmynbfwp` text COLLATE utf8mb3_unicode_ci,
  `field_sectionHeading_xothcfkc` text COLLATE utf8mb3_unicode_ci,
  `field_topPodcastHeading_qjvbxbct` text COLLATE utf8mb3_unicode_ci,
  `field_pageTitle_lydycsut` text COLLATE utf8mb3_unicode_ci,
  `field_heroSectionContent_myszicxv` text COLLATE utf8mb3_unicode_ci,
  `field_benefitSectionHeading_kqtwsugz` text COLLATE utf8mb3_unicode_ci,
  `field_herocontent_cgfpxemu` text COLLATE utf8mb3_unicode_ci,
  `field_amplifyheading_mhrlzbct` text COLLATE utf8mb3_unicode_ci,
  `field_amplifycontent_xmzmczdq` text COLLATE utf8mb3_unicode_ci,
  `field_serviceheading_nrwlljho` text COLLATE utf8mb3_unicode_ci,
  `field_servicecontent_agfiykqs` text COLLATE utf8mb3_unicode_ci,
  `field_image_sxehzaun` text COLLATE utf8mb3_unicode_ci,
  `field_contactUsText_hjryrpli` text COLLATE utf8mb3_unicode_ci,
  `field_copyRightText_dowhghvv` text COLLATE utf8mb3_unicode_ci,
  `field_logoTitle_hhnimttd` text COLLATE utf8mb3_unicode_ci,
  `field_logoContent_xxkdwirs` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_jcnphbbufeythvxlejvetqibcbwtnaxojrgg` (`elementId`,`siteId`),
  KEY `cc_idx_dvcyqmeywtgqszxlsfyylrtmkyfkgxfbeyex` (`siteId`),
  KEY `cc_idx_nuehalsivjbbasnsrmaifhikayqlshxrfyek` (`title`),
  CONSTRAINT `cc_fk_dweushnplxaxrzfpahwjukmlspwuamczlpdz` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_xdylkygilhdgrvbupnptghbktflbkzmflili` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_craftidtokens`
--

DROP TABLE IF EXISTS `cc_craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_fk_peqvpwxmglygaeawrmueumikhetydsrkvljq` (`userId`),
  CONSTRAINT `cc_fk_peqvpwxmglygaeawrmueumikhetydsrkvljq` FOREIGN KEY (`userId`) REFERENCES `cc_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_deprecationerrors`
--

DROP TABLE IF EXISTS `cc_deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb3_unicode_ci,
  `traces` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_dhhozrshmavdkopeldsibfajareebbjeanjd` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_drafts`
--

DROP TABLE IF EXISTS `cc_drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cc_idx_kwungqemfhjydpakiyyaispacouvnqsioxqw` (`creatorId`,`provisional`),
  KEY `cc_idx_pvqxdacqnjjwgagcstkxzuyieupjxboavocf` (`saved`),
  KEY `cc_fk_ehnekjdaxsxviwctpaiyjillvsvjgfvmrzsq` (`sourceId`),
  CONSTRAINT `cc_fk_ehnekjdaxsxviwctpaiyjillvsvjgfvmrzsq` FOREIGN KEY (`sourceId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_nzugrpseuqczsjuvqccvkvecbkuyrfhazuvv` FOREIGN KEY (`creatorId`) REFERENCES `cc_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_elementindexsettings`
--

DROP TABLE IF EXISTS `cc_elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_elementindexsettings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_wdxhdvfwmyojamxqwyzumzehunsojovsitzl` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_elements`
--

DROP TABLE IF EXISTS `cc_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_nfxfzuxgbbwvydsfzajrlyyswezqexbqgmib` (`dateDeleted`),
  KEY `cc_idx_fcbkkxxnuhogqdbuyycvfagujpwtgledgpap` (`fieldLayoutId`),
  KEY `cc_idx_tinzlzzjxvccxgerxysmrcknaikvytjqvcke` (`type`),
  KEY `cc_idx_kkfbgxkafrqgpyjcgvhtyywtwvtdutcszryt` (`enabled`),
  KEY `cc_idx_twrfntkejbwhjvdknnmiprbdchlsuatanckw` (`archived`,`dateCreated`),
  KEY `cc_idx_zyomeadttbqnnihbduyprhywgqwygpwoqpsb` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `cc_idx_imzgaycmdiykeossimdfbzwrhnlmvjgbjlgc` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `cc_fk_tiyqbneaytlnxsjnfsfispergzgwaistbpmp` (`canonicalId`),
  KEY `cc_fk_mxrurzwaqlhytsypsasugdxccarzcnjwgycp` (`draftId`),
  KEY `cc_fk_rdmnzlomssuofitlmgkaxworrmzhqehdmoka` (`revisionId`),
  CONSTRAINT `cc_fk_kyphktynpuqwlkgvutnmnkvrxthmrnhqhchd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc_fk_mxrurzwaqlhytsypsasugdxccarzcnjwgycp` FOREIGN KEY (`draftId`) REFERENCES `cc_drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_rdmnzlomssuofitlmgkaxworrmzhqehdmoka` FOREIGN KEY (`revisionId`) REFERENCES `cc_revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_tiyqbneaytlnxsjnfsfispergzgwaistbpmp` FOREIGN KEY (`canonicalId`) REFERENCES `cc_elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_elements_sites`
--

DROP TABLE IF EXISTS `cc_elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_hjaltlhvmojsrqehfymfwnfhhfmaypzofmdh` (`elementId`,`siteId`),
  KEY `cc_idx_ocpppomicfsawnxbnubjkscrwzaqgvndhosf` (`siteId`),
  KEY `cc_idx_dexdvlsdnszuxjlyvvxftsxfwkfxbesnmuvj` (`slug`,`siteId`),
  KEY `cc_idx_yqxevoaevxxwkwtcwyddeqfqhzkymtmhlwdg` (`enabled`),
  KEY `cc_idx_fksizdbgepohypifhnagjvrlpfrvpijxhnei` (`uri`,`siteId`),
  CONSTRAINT `cc_fk_cywwwmfvdqplonvcjqvvcfqcxzyidcruwfeh` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_vffjzguchzxyiyrddefpdmkglkzvgbyrayvo` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_entries`
--

DROP TABLE IF EXISTS `cc_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_qxizlwzdnlyscniyapydhkazmqudwlytopzh` (`postDate`),
  KEY `cc_idx_bdgvekbdolycfmyookaxquplipsnxwclbhuc` (`expiryDate`),
  KEY `cc_idx_otrmmiohrlahomclgncoxirfbvtzxprxnljz` (`authorId`),
  KEY `cc_idx_nhdmhhnmnjdosoevrjmwhllbjyrinujbeksn` (`sectionId`),
  KEY `cc_idx_cpbqoabzsnngjqllxlatgqnzsgwcqssqdhif` (`typeId`),
  KEY `cc_fk_xilpbujddwutqmmobsvhdphwqxdxlylbvosx` (`parentId`),
  CONSTRAINT `cc_fk_fpwnoerscmldpijnqcligozlhunsejfhezuw` FOREIGN KEY (`authorId`) REFERENCES `cc_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc_fk_htyslekjsvfepwqvlhqtkglpjoydyggmxhds` FOREIGN KEY (`sectionId`) REFERENCES `cc_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_oicnfjkfmdaeruhjtqpmpgoxidsgmsamfwxu` FOREIGN KEY (`typeId`) REFERENCES `cc_entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_oiyqyivbliskopcexilxarmkmoxwzrzvyjjz` FOREIGN KEY (`id`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_xilpbujddwutqmmobsvhdphwqxdxlylbvosx` FOREIGN KEY (`parentId`) REFERENCES `cc_entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_entrytypes`
--

DROP TABLE IF EXISTS `cc_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb3_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_rnjbjzkhmlmwntrvyhhvfulajkfssaeitqet` (`name`,`sectionId`),
  KEY `cc_idx_mxetcsiwvvargkatetzgovddfhbphnfdgcpb` (`handle`,`sectionId`),
  KEY `cc_idx_xadvzrcyzlibrrjblrslegvzdxlqvqyzyuhf` (`sectionId`),
  KEY `cc_idx_dtixetxlvxcmabmvwhtkawtvrniatveefvnb` (`fieldLayoutId`),
  KEY `cc_idx_nbmzlssjyupzdnrtdayudaxuozpslfmgfmxb` (`dateDeleted`),
  CONSTRAINT `cc_fk_oavqvwsufmcglkwuagslhpuzmhbalwcxppjv` FOREIGN KEY (`sectionId`) REFERENCES `cc_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_tbvxarxezqnsjvmbbqyoepfeqdngwyiqtosd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_fieldgroups`
--

DROP TABLE IF EXISTS `cc_fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_ewdirgvcamwmmwgznlhxaevohezvlfkqxihi` (`name`),
  KEY `cc_idx_fpfacksmyxlhijehzlrllurzpvtqiknvqdre` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_fieldlayoutfields`
--

DROP TABLE IF EXISTS `cc_fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_hvvyqgampnscawxjuvciwnvcsftfolimvvpr` (`layoutId`,`fieldId`),
  KEY `cc_idx_gteefcawakxhfytynutkzbitbabcmplwulwq` (`sortOrder`),
  KEY `cc_idx_dqtsndwoevnximzbuncvajmexriphdmutjvw` (`tabId`),
  KEY `cc_idx_btrifzrlwmhpdytiowglraabltsywilxtwfd` (`fieldId`),
  CONSTRAINT `cc_fk_eqxudwzyvnmjqydszqoxlhtkjxjfxkcyywjf` FOREIGN KEY (`layoutId`) REFERENCES `cc_fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_qcrtzoldxumnrmezkgyqxmjatyedctxmliuj` FOREIGN KEY (`tabId`) REFERENCES `cc_fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_shueqofxiwhxhpuuelchdmkvghwpfmfrcelf` FOREIGN KEY (`fieldId`) REFERENCES `cc_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_fieldlayouts`
--

DROP TABLE IF EXISTS `cc_fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_blkgbbdyyiibabjdmlnrvubgmbwjkjxfuagt` (`dateDeleted`),
  KEY `cc_idx_xsfrshuxbzstkilxwceunptalkqtbzstiwrp` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_fieldlayouttabs`
--

DROP TABLE IF EXISTS `cc_fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `elements` text COLLATE utf8mb3_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_evodiixxhzherdzdznbmgmvodvkqkusdajuy` (`sortOrder`),
  KEY `cc_idx_rsvosfzxmsaliogukhyyyrevkrxjvquckahb` (`layoutId`),
  CONSTRAINT `cc_fk_xgnakksiyoqcpfbjytjsbvvwltremepedcuo` FOREIGN KEY (`layoutId`) REFERENCES `cc_fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_fields`
--

DROP TABLE IF EXISTS `cc_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb3_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8mb3_unicode_ci,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_qphykxjcjehkizdsyjxmjhnoyaccoztysfya` (`handle`,`context`),
  KEY `cc_idx_cldcvajadrvxfmuzeazlokkqicdajqcgeemp` (`groupId`),
  KEY `cc_idx_qkwvsloolrrtiyxojsyfotuzmyhwvfjrimoa` (`context`),
  CONSTRAINT `cc_fk_orgttfjafrcowsindeuatpuzrjbgradljump` FOREIGN KEY (`groupId`) REFERENCES `cc_fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_globalsets`
--

DROP TABLE IF EXISTS `cc_globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_wehyhdcnalspshvjkislcastppoadzpyvcvs` (`name`),
  KEY `cc_idx_xwuiuukkgvfrpkiawustzgewoccddsnxhynq` (`handle`),
  KEY `cc_idx_tttmaaplehrpbchwgkpwqwumuhjvrkmfygro` (`fieldLayoutId`),
  KEY `cc_idx_jfrupakejrpabkgvfewpncgcnzqqpfnwcnyo` (`sortOrder`),
  CONSTRAINT `cc_fk_cwqrsxbvdgbelazrgnharkwfxmeerdtelkhm` FOREIGN KEY (`id`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_ylmamqbkowkgwitagyohjgaxmybxxdqekwfw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_gqlschemas`
--

DROP TABLE IF EXISTS `cc_gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `scope` text COLLATE utf8mb3_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_gqltokens`
--

DROP TABLE IF EXISTS `cc_gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_hzagvodskvibanpahjdnssgalgnttdxcguww` (`accessToken`),
  UNIQUE KEY `cc_idx_gkcxfvjtzrucecwmqapbotreomiaqwoqvwmx` (`name`),
  KEY `cc_fk_hzvikqlrbjpsxdhtthmayssrjjippyrrypnx` (`schemaId`),
  CONSTRAINT `cc_fk_hzvikqlrbjpsxdhtthmayssrjjippyrrypnx` FOREIGN KEY (`schemaId`) REFERENCES `cc_gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_info`
--

DROP TABLE IF EXISTS `cc_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_matrixblocks`
--

DROP TABLE IF EXISTS `cc_matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_matrixblocks` (
  `id` int NOT NULL,
  `ownerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_uojfytbtpuzbgxvyaaknfeougkwnflmzedhm` (`ownerId`),
  KEY `cc_idx_hcydtiskomeufsqjmdhthznhkynzdkiccswk` (`fieldId`),
  KEY `cc_idx_khxxrmqffrekejuydenllcwxguxfoosxjfha` (`typeId`),
  KEY `cc_idx_ggpupaudrsuptrauovkaturabyfiatezerrz` (`sortOrder`),
  CONSTRAINT `cc_fk_fffeougpxtddkjijxeafjtpwcrwafhbuytup` FOREIGN KEY (`typeId`) REFERENCES `cc_matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_ilnyunizkpnckbcrihdorjtefwvnvyrhsbte` FOREIGN KEY (`ownerId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_wtvltbptbsvhylrnkjiczbuthmuevlrnjzqq` FOREIGN KEY (`id`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_ximmapiqonuhemhjgldoloxejaslgwjismrm` FOREIGN KEY (`fieldId`) REFERENCES `cc_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_matrixblocktypes`
--

DROP TABLE IF EXISTS `cc_matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_kigygaasulalhktgadbojyijcqwfqswgjbux` (`name`,`fieldId`),
  KEY `cc_idx_dmcsagbqgegbguabcwrxidpkyypviguncxvj` (`handle`,`fieldId`),
  KEY `cc_idx_schjsyxavnjbatxpoiqvztvudnexhwwxvwgd` (`fieldId`),
  KEY `cc_idx_upyvqcrrqxlegomtzepbmtdcadkurhgphnrj` (`fieldLayoutId`),
  CONSTRAINT `cc_fk_qqcntzwqohlfpezxaxjblmfwasqiuaqrfzer` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc_fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc_fk_ucghdwzecmgimgjqqfmysafxnrqcybzukxck` FOREIGN KEY (`fieldId`) REFERENCES `cc_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_matrixcontent_benefits`
--

DROP TABLE IF EXISTS `cc_matrixcontent_benefits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_matrixcontent_benefits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_contentBlock_contentText_swqtbpco` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_hxiwcppgshhmzozlkgscbwdekmoxumzlqfib` (`elementId`,`siteId`),
  KEY `cc_fk_cufuwjlhfhiuavjmevdsfbwqvpieedeojizo` (`siteId`),
  CONSTRAINT `cc_fk_cufuwjlhfhiuavjmevdsfbwqvpieedeojizo` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_zhotyfbfxyxwdrhujgqdvyffvewjhhucmgnc` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_matrixcontent_bottonmenu`
--

DROP TABLE IF EXISTS `cc_matrixcontent_bottonmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_matrixcontent_bottonmenu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_menu_linkText_dbfzefkl` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_erfywtpdvuyxggedyzgxgypdggogijvvsxrm` (`elementId`,`siteId`),
  KEY `cc_fk_rrlektrchutqvrfxyjzsxftfktszhzyhtyts` (`siteId`),
  CONSTRAINT `cc_fk_rrlektrchutqvrfxyjzsxftfktszhzyhtyts` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_vkqlwgqizzfykmokfbevdusoetudcbjdsnge` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_matrixcontent_faqdata`
--

DROP TABLE IF EXISTS `cc_matrixcontent_faqdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_matrixcontent_faqdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_faq_question_pvxsfvek` text COLLATE utf8mb3_unicode_ci,
  `field_faq_answer_ndviczkw` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_vqpfekzbfvudpyhdzllutixaquyfswrdsgfl` (`elementId`,`siteId`),
  KEY `cc_fk_pxoqnqshyjgcdoyitsnlekfkgkedsbhiptcq` (`siteId`),
  CONSTRAINT `cc_fk_lxaxmtqjlauicyxllznozlegfdpjgxbddfze` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_pxoqnqshyjgcdoyitsnlekfkgkedsbhiptcq` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_matrixcontent_forumsdata`
--

DROP TABLE IF EXISTS `cc_matrixcontent_forumsdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_matrixcontent_forumsdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_forums_question_uhxechjz` text COLLATE utf8mb3_unicode_ci,
  `field_forums_answer_zcasrplx` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_ffskvkepgkmolswafbylcdkibdedatwvomes` (`elementId`,`siteId`),
  KEY `cc_fk_nsljdujqxdsowodmijnihyteqgqdmzhysgcb` (`siteId`),
  CONSTRAINT `cc_fk_nsljdujqxdsowodmijnihyteqgqdmzhysgcb` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_syanxdinljoesokwhuxnefdgjrouvcoovyiy` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_matrixcontent_menufields`
--

DROP TABLE IF EXISTS `cc_matrixcontent_menufields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_matrixcontent_menufields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_menu_pageName_idguywkm` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_yymuqsxfgdxvofmwujwvxkilzxqelhkgxxtp` (`elementId`,`siteId`),
  KEY `cc_fk_asvzzizyighwepmhubdktdtzaedvflvuxtcz` (`siteId`),
  CONSTRAINT `cc_fk_asvzzizyighwepmhubdktdtzaedvflvuxtcz` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_wljcmxcvfscycedtacbdfkoypkfmrgxbffeh` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_matrixcontent_navigation`
--

DROP TABLE IF EXISTS `cc_matrixcontent_navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_matrixcontent_navigation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_navLink_linkText_zgwvytlo` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_qtwsffahaopvwmiusifcqltqxcdgfzncuizl` (`elementId`,`siteId`),
  KEY `cc_fk_xaglodsnhtfvdxxqiwwljyedqfmaoisqsmjz` (`siteId`),
  CONSTRAINT `cc_fk_hinkyhwlouezzmsfnqohvydnsjcenwkjmyko` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_xaglodsnhtfvdxxqiwwljyedqfmaoisqsmjz` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_matrixcontent_pageheader`
--

DROP TABLE IF EXISTS `cc_matrixcontent_pageheader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_matrixcontent_pageheader` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_jinlavfrkpnadhzkdaorkftjvdavwfddpzth` (`elementId`,`siteId`),
  KEY `cc_fk_pjeqsrhquseqoatcyobpdrfsccogsauifgri` (`siteId`),
  CONSTRAINT `cc_fk_cxmzqfmogpfmzrgmfyrmwmcuyeohfrzxqdmk` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_pjeqsrhquseqoatcyobpdrfsccogsauifgri` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_matrixcontent_presscontent`
--

DROP TABLE IF EXISTS `cc_matrixcontent_presscontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_matrixcontent_presscontent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_pressBlock_pressName_hwmvenxp` text COLLATE utf8mb3_unicode_ci,
  `field_pressBlock_pressUrl_dhvohjrb` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_ofowlpvnjooayqyxislwdxvmavgathlpibvr` (`elementId`,`siteId`),
  KEY `cc_fk_iwjypdzkjpobjgthfyrkooefdajbdaeguljm` (`siteId`),
  CONSTRAINT `cc_fk_iwjypdzkjpobjgthfyrkooefdajbdaeguljm` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_ssnumtzxbbqadqqvogsemjkjyvjmrxopqqix` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_matrixcontent_socialmenu`
--

DROP TABLE IF EXISTS `cc_matrixcontent_socialmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_matrixcontent_socialmenu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_menu_linkText_jeewpqks` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_wyifcnycybyaomxobkyecxlaqxopedtjiqch` (`elementId`,`siteId`),
  KEY `cc_idx_kkonfkmiygocciesiklgceptnzjepqbkjkss` (`siteId`),
  CONSTRAINT `cc_fk_ouhzluucvzfzvtkdbvtdpjcwstsoxxgurlyw` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_pfkcctiqrtfjwcvaiflqhvzdaownmnztmycj` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_matrixcontent_toppodcastcontent`
--

DROP TABLE IF EXISTS `cc_matrixcontent_toppodcastcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_matrixcontent_toppodcastcontent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_topPodcastBlock_topPodcastName_ykwrlzye` text COLLATE utf8mb3_unicode_ci,
  `field_topPodcastBlock_topPodcastUrl_kakgtips` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_suslqhcmtcsvuowawmekfqdjsieuilphqvbq` (`elementId`,`siteId`),
  KEY `cc_fk_hhxlncbvjvbxfjruoujbkrwwhazrfcqbcjhj` (`siteId`),
  CONSTRAINT `cc_fk_hhxlncbvjvbxfjruoujbkrwwhazrfcqbcjhj` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_rzjxsdtewtywvbksqdnujsnsmiokhuwryyxy` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_migrations`
--

DROP TABLE IF EXISTS `cc_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_jqbclrrvbighkeigpdlsehnprljquaxivxam` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_plugins`
--

DROP TABLE IF EXISTS `cc_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_xyqqclrykzxchlkxfgyijkdyhmanegqxlfwt` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_projectconfig`
--

DROP TABLE IF EXISTS `cc_projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_projectconfig` (
  `path` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_queue`
--

DROP TABLE IF EXISTS `cc_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `cc_idx_uzhqdkvmghmhikcdiznbwkzcmrbxjzjuldqc` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `cc_idx_mnuvkhlptmzimzbmrlyganihnrcnxxplqvey` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_relations`
--

DROP TABLE IF EXISTS `cc_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_zyhxnsllixajyoaflrjocahzzstmzveqsoiw` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `cc_idx_xznflxugzwxsmbvdrlefhnnoavfgvdlytlsa` (`sourceId`),
  KEY `cc_idx_falkhqfhyhfnnitkjijspqrkjioeyyjvfozg` (`targetId`),
  KEY `cc_idx_xdhjrxcuanbfftvwfljivayepntkduifvuba` (`sourceSiteId`),
  CONSTRAINT `cc_fk_tezkotumfsrhrnnetdeopioycqbumgcqjzue` FOREIGN KEY (`sourceId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_uputfishtsndylejetlxblooxmqyvnikcztc` FOREIGN KEY (`sourceSiteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cc_fk_yfnuejdgajzihgtwykcmpcoylgiiilrzswem` FOREIGN KEY (`fieldId`) REFERENCES `cc_fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_resourcepaths`
--

DROP TABLE IF EXISTS `cc_resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_resourcepaths` (
  `hash` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_revisions`
--

DROP TABLE IF EXISTS `cc_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_yivuhunjudkefoxwhxmsptfswlcbebvwppiz` (`sourceId`,`num`),
  KEY `cc_fk_yfaltpxvtbktqlagdvhnmjqrhmmnxxsjiwfa` (`creatorId`),
  CONSTRAINT `cc_fk_ovtrufziqzwhdtitshevdtezmrtsitczxixg` FOREIGN KEY (`sourceId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_yfaltpxvtbktqlagdvhnmjqrhmmnxxsjiwfa` FOREIGN KEY (`creatorId`) REFERENCES `cc_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_searchindex`
--

DROP TABLE IF EXISTS `cc_searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `cc_idx_wjiwtatgmgjerbinjgovxwvgrpxztlgtjmfg` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_sections`
--

DROP TABLE IF EXISTS `cc_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_octgdfdnkvmsyvrrrjrqnrvmzyugtugllhjs` (`handle`),
  KEY `cc_idx_itdkjepichkdinacspqozhllldgtznxgcizx` (`name`),
  KEY `cc_idx_rmupagowvmoyhjymtkybmapeiuwapoargwwx` (`structureId`),
  KEY `cc_idx_mywoerjwcwhtolbbptpfjplgdihywceeqboj` (`dateDeleted`),
  CONSTRAINT `cc_fk_ntxisbqlorjrmsybjslpoibulgbtoldnlgcb` FOREIGN KEY (`structureId`) REFERENCES `cc_structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_sections_sites`
--

DROP TABLE IF EXISTS `cc_sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8mb3_unicode_ci,
  `template` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_gawparxhsnpwdfsmacmldcreihzutivrebjw` (`sectionId`,`siteId`),
  KEY `cc_idx_bezundatzulgnnfcgpmlkglbheyihwazqfnu` (`siteId`),
  CONSTRAINT `cc_fk_phgppvamkfdfcilmzwewsxqvzwtqpvqqqyja` FOREIGN KEY (`sectionId`) REFERENCES `cc_sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_xnvjkuxhmhbspmsmtndhrufnhvlbodcaaxab` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_sequences`
--

DROP TABLE IF EXISTS `cc_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_sequences` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_sessions`
--

DROP TABLE IF EXISTS `cc_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_uirggoehbiqszaeitbkimtnaxevgxgtmwecs` (`uid`),
  KEY `cc_idx_uttsrlytplvyqthvkbsmltvtlrjdqfqrcnze` (`token`),
  KEY `cc_idx_afiftcvvkdlzzdfzfcwchfudhotggdulurxv` (`dateUpdated`),
  KEY `cc_idx_qtvaowedwmlafliiwsmmnerihhgjnuutukry` (`userId`),
  CONSTRAINT `cc_fk_prbtyjjwpnvodrtzpkjbdjlyutuziluruuyg` FOREIGN KEY (`userId`) REFERENCES `cc_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_shunnedmessages`
--

DROP TABLE IF EXISTS `cc_shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_ysmlcctarckbwskbdymxhipujtbjbfnggsht` (`userId`,`message`),
  CONSTRAINT `cc_fk_gbuqjxyrktrwzpgueuammwhoygclvzybmsnp` FOREIGN KEY (`userId`) REFERENCES `cc_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_sitegroups`
--

DROP TABLE IF EXISTS `cc_sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_pfnkmfexrpcjywjimpqbfqrerausdhgdwnfw` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_sites`
--

DROP TABLE IF EXISTS `cc_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_eboztxwdzdzasgtxmqnlshdbixzrzobwxrnb` (`dateDeleted`),
  KEY `cc_idx_adfypwiasikmsabglhwungazyjxtofhikxgg` (`handle`),
  KEY `cc_idx_lczcufvaufrcabazdxadiedfhiwczwhiathz` (`sortOrder`),
  KEY `cc_fk_pzfydwlrmhbqgcpsmoazxbkkzajguszckvty` (`groupId`),
  CONSTRAINT `cc_fk_pzfydwlrmhbqgcpsmoazxbkkzajguszckvty` FOREIGN KEY (`groupId`) REFERENCES `cc_sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_structureelements`
--

DROP TABLE IF EXISTS `cc_structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_yigvzrvjsgrdjigyiyhrseewcoowwrhzzsqz` (`structureId`,`elementId`),
  KEY `cc_idx_sxpsfjqmgquqnuixxnqalclzyphpjlmnxibn` (`root`),
  KEY `cc_idx_azxkwkvuuabbcabytzyrwevtjzgmdnrsvnjy` (`lft`),
  KEY `cc_idx_tbglorxqvnnsbzjkvdrkmpzzydcilbqiiytf` (`rgt`),
  KEY `cc_idx_rivdqhcpobrsdqiytxpeszlpnvrbhicqkncj` (`level`),
  KEY `cc_idx_zgarfvymdlvpxbahwyvikjxulbyrkfcpvsfh` (`elementId`),
  CONSTRAINT `cc_fk_rxsdibihfuzzgxzzylosvtdxtdkntacplzlf` FOREIGN KEY (`structureId`) REFERENCES `cc_structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_structures`
--

DROP TABLE IF EXISTS `cc_structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_rsoevuuuhgfpcshpwbsumaoutmwjxaroesif` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_systemmessages`
--

DROP TABLE IF EXISTS `cc_systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_dtqqypnlykljctbfjwbzkwkuivcemfwhkxxd` (`key`,`language`),
  KEY `cc_idx_ahxdlcavxawnynkglptzvoscvvgxcpktlwdl` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_taggroups`
--

DROP TABLE IF EXISTS `cc_taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_uqbffidfgygkmqgddpdkvoajkwjmvjgfilro` (`name`),
  KEY `cc_idx_mewbyudifkngdxgllwnnokfuxfkciosuoygt` (`handle`),
  KEY `cc_idx_rjtomslmzzxxrvwhsqwbecenwdgksquhuumr` (`dateDeleted`),
  KEY `cc_fk_ostzspxrjmutklhgdpixemezhtrnygqdrhbm` (`fieldLayoutId`),
  CONSTRAINT `cc_fk_ostzspxrjmutklhgdpixemezhtrnygqdrhbm` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_tags`
--

DROP TABLE IF EXISTS `cc_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_dfmqjxocscuajulfwuxuggblyjamugrbrnqd` (`groupId`),
  CONSTRAINT `cc_fk_omufjflnarfxgjfjmfekumlkrdjwpqdrblxf` FOREIGN KEY (`groupId`) REFERENCES `cc_taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_qjvfyutgfofewdmdiohiylnazzntmbxkmpxl` FOREIGN KEY (`id`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_templatecacheelements`
--

DROP TABLE IF EXISTS `cc_templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_templatecacheelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cc_idx_itaqkzayvovqxgdkjmyxchmamvebjfaisvbc` (`cacheId`),
  KEY `cc_idx_jllwgbpywidjovyppinokmzqtoxduukgtmyl` (`elementId`),
  CONSTRAINT `cc_fk_mjkifjoxvfzlkypqmkexxddjckjgionhlcqm` FOREIGN KEY (`elementId`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_yjlpugokvobxfutoctxvkmymcveozcqafujy` FOREIGN KEY (`cacheId`) REFERENCES `cc_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_templatecachequeries`
--

DROP TABLE IF EXISTS `cc_templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_templatecachequeries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cacheId` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cc_idx_fryruqogjcitvljqvwazonndcalqqfepjiih` (`cacheId`),
  KEY `cc_idx_geiwqireenkirolqntzeawokoujseeqcggjf` (`type`),
  CONSTRAINT `cc_fk_bzbpfvdixlbxtbavzgecisxwkfpgmjtaylbe` FOREIGN KEY (`cacheId`) REFERENCES `cc_templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_templatecaches`
--

DROP TABLE IF EXISTS `cc_templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_templatecaches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cc_idx_uvbnjeaoorpsdupytzgoigwvutyqcypuafpp` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `cc_idx_pxhehuuqsirpgsqkmrnbxumevzheznnhdpsw` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `cc_idx_bhmhzvnpnrqsbwllxnlwbudqwptoowizbuas` (`siteId`),
  CONSTRAINT `cc_fk_wnjqsxkwtsgkgadoplmdujhptincshdirrnw` FOREIGN KEY (`siteId`) REFERENCES `cc_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_tokens`
--

DROP TABLE IF EXISTS `cc_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb3_unicode_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_zulgpqtzlmgxzszdxkscbkbjsqtcmsosyvee` (`token`),
  KEY `cc_idx_pquwilutmousqrfppzinzyzmvodcwqxkpbci` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_usergroups`
--

DROP TABLE IF EXISTS `cc_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_jjzscapnrrlqewonqscxyasokmiqtpkjpzpk` (`handle`),
  KEY `cc_idx_hpntftalqjpervrimhjwzvrsysrrmswaefvd` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_usergroups_users`
--

DROP TABLE IF EXISTS `cc_usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_ofmclwkvoobxsjodboypflpyqhakuwrymumg` (`groupId`,`userId`),
  KEY `cc_idx_bhzsvsvaqbuaiildwqjdosktekqwrpyixqai` (`userId`),
  CONSTRAINT `cc_fk_cxiuklfuynexsdxmeqbttjabmnfkqjhtteww` FOREIGN KEY (`groupId`) REFERENCES `cc_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_etdygkuhxwwcftauyeaoyfblxdjbwacsgshd` FOREIGN KEY (`userId`) REFERENCES `cc_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_userpermissions`
--

DROP TABLE IF EXISTS `cc_userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_qklovwolwsrdnwgkbcnybjlivttzzruqyreq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_userpermissions_usergroups`
--

DROP TABLE IF EXISTS `cc_userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_hawcdrldcbextjopicwizgluxcnncjvrpwzp` (`permissionId`,`groupId`),
  KEY `cc_idx_zbgzlrkqbjlnxksizadcphkuvsdjsumdqhzr` (`groupId`),
  CONSTRAINT `cc_fk_gsuldaplsfnzttlsthfrmvjgwwkehydjehta` FOREIGN KEY (`groupId`) REFERENCES `cc_usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_ulpwckkyohyhqelxdhmwmvvbtubwoybnbmyg` FOREIGN KEY (`permissionId`) REFERENCES `cc_userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_userpermissions_users`
--

DROP TABLE IF EXISTS `cc_userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_oirwfdeokrjanjioqnfdprqqqkbcvoutgknr` (`permissionId`,`userId`),
  KEY `cc_idx_cmvfmdesvidltvenehhskyamumppusjmxfip` (`userId`),
  CONSTRAINT `cc_fk_akcqecwohzntfiwnalouobzulsklwwlltbit` FOREIGN KEY (`permissionId`) REFERENCES `cc_userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_zegmurldpshhwsdudlqhqqchcwmfjacagygm` FOREIGN KEY (`userId`) REFERENCES `cc_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_userpreferences`
--

DROP TABLE IF EXISTS `cc_userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `cc_fk_sjagdhqpirwpoympltwnwbcxvtxxhesygqnj` FOREIGN KEY (`userId`) REFERENCES `cc_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_users`
--

DROP TABLE IF EXISTS `cc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_users` (
  `id` int NOT NULL,
  `username` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `photoId` int DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_gvaunodkaeqmnmdqokhnchpltgdgteetfbnm` (`uid`),
  KEY `cc_idx_eropszbsxoczkfnqnqezaqpnpsxaatesjiue` (`verificationCode`),
  KEY `cc_idx_uxgvjaxoroywfmqhsaofnzwjtixozziuzznc` (`email`),
  KEY `cc_idx_iqihonqwkrvtiwyykxavlkvsjwyhrxbfrilw` (`username`),
  KEY `cc_fk_cfamwjdoarzwzrjcsoemkjanvbcrkqccrdso` (`photoId`),
  CONSTRAINT `cc_fk_cfamwjdoarzwzrjcsoemkjanvbcrkqccrdso` FOREIGN KEY (`photoId`) REFERENCES `cc_assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `cc_fk_vodshlwhbgoohzxyckkriukytpmsmuupwdef` FOREIGN KEY (`id`) REFERENCES `cc_elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_usertokens`
--

DROP TABLE IF EXISTS `cc_usertokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_usertokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` text COLLATE utf8mb3_unicode_ci,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_volumefolders`
--

DROP TABLE IF EXISTS `cc_volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cc_idx_lokvuoogqibctqvrsoduspjlujryxidzttvf` (`name`,`parentId`,`volumeId`),
  KEY `cc_idx_kvyxifvdzvbzhmeivjgzdafcdqptgsjldzuc` (`parentId`),
  KEY `cc_idx_xqaqceizcqyqkgtfczffroeosieaomtpsmhr` (`volumeId`),
  CONSTRAINT `cc_fk_bjpyvvjmhlnztrpbldrcjlyrrpyunshupvhp` FOREIGN KEY (`parentId`) REFERENCES `cc_volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cc_fk_fgovgqgdzwsnzfgqwkdikxblrkfakcsgbcqf` FOREIGN KEY (`volumeId`) REFERENCES `cc_volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_volumes`
--

DROP TABLE IF EXISTS `cc_volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb3_unicode_ci,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_xpbsywobwnuxrktymgharfanshauaiwygfma` (`name`),
  KEY `cc_idx_fdsvojnjgdrguhrneegirysbrfuebxydchwj` (`handle`),
  KEY `cc_idx_twtqefyihbsqacoqnaevdbzueajgcuzyowmc` (`fieldLayoutId`),
  KEY `cc_idx_cfdpraiyimufjwhutghczsehunmnqxicmugj` (`dateDeleted`),
  CONSTRAINT `cc_fk_zpebqcktbrtilxywdkekbshoknyigwqgxglw` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cc_fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cc_widgets`
--

DROP TABLE IF EXISTS `cc_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cc_widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cc_idx_nbkrdqoksrfnsivokcatntxdjeehacgpeujr` (`userId`),
  CONSTRAINT `cc_fk_uicpjgnbebsdywbufjgidzjkcsgxrhaethjg` FOREIGN KEY (`userId`) REFERENCES `cc_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccannouncements`
--

DROP TABLE IF EXISTS `ccannouncements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccannouncements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ccidx_jptwqiygtlbvxhvwgzvuraurvljzckooidxs` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `ccidx_azmwvtjuqujjcshprugifvystymrxbwuvlwo` (`dateRead`),
  KEY `ccfk_olkenaedokaxwglvadteufawflmcdinjmlur` (`pluginId`),
  CONSTRAINT `ccfk_aannojjnlborzbrirmzzcunigfyrisdtlcsg` FOREIGN KEY (`userId`) REFERENCES `ccusers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_olkenaedokaxwglvadteufawflmcdinjmlur` FOREIGN KEY (`pluginId`) REFERENCES `ccplugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccassetindexdata`
--

DROP TABLE IF EXISTS `ccassetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccassetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int NOT NULL,
  `uri` text COLLATE utf8mb3_unicode_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_oxkbhygthorwsngfzojqoqwuhkgsmsrcdnwd` (`sessionId`,`volumeId`),
  KEY `ccidx_brkusfxkrysxzcshvrmfgtbmwvfzribsgjqv` (`volumeId`),
  CONSTRAINT `ccfk_vgalkuekqakmplkyyvxtdowecmbtgrxjvphc` FOREIGN KEY (`volumeId`) REFERENCES `ccvolumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccassets`
--

DROP TABLE IF EXISTS `ccassets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccassets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_gtfjsflphlfvzgrtesponhaapvjuwfwpudrz` (`filename`,`folderId`),
  KEY `ccidx_prtfygkfpynsccnqeofuoansmdyitojkdymi` (`folderId`),
  KEY `ccidx_kqtjlrnjrswuykibviwjsvwqoikvkmzdqluj` (`volumeId`),
  KEY `ccfk_xhvijqtexztxnnymttetccunuqjofhdkomrm` (`uploaderId`),
  CONSTRAINT `ccfk_aatihvgageibvvslizdmffltthgicfsfxuur` FOREIGN KEY (`volumeId`) REFERENCES `ccvolumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_dytmrsqycllvjciuhkhzbjrkhncljgpauhal` FOREIGN KEY (`id`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_osmiqyuipnandvuwzdskywssiolcxhvixzjp` FOREIGN KEY (`folderId`) REFERENCES `ccvolumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_xhvijqtexztxnnymttetccunuqjofhdkomrm` FOREIGN KEY (`uploaderId`) REFERENCES `ccusers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccassettransformindex`
--

DROP TABLE IF EXISTS `ccassettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccassettransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `filename` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `volumeId` int DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_zlxkvkgwozbpmqrdsmymtdobpazmaqiafmzf` (`volumeId`,`assetId`,`location`),
  KEY `ccidx_rfargxghwxxlqjtpkbbeqwdvafgeonxuvtbp` (`assetId`,`format`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccassettransforms`
--

DROP TABLE IF EXISTS `ccassettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccassettransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_ccxgksrdimwpbnhbzospbfdgeeriwhypueyo` (`name`),
  KEY `ccidx_zjjqvnyvhococpuncnnkemrfowukqqvrwnmr` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cccategories`
--

DROP TABLE IF EXISTS `cccategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cccategories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_lpysbhmyxemczwhxgkppjjaditawvtkyuojw` (`groupId`),
  KEY `ccfk_isyllcdxmascknaiaflzidhheainldncbebk` (`parentId`),
  CONSTRAINT `ccfk_isyllcdxmascknaiaflzidhheainldncbebk` FOREIGN KEY (`parentId`) REFERENCES `cccategories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ccfk_rakcfxgnxseaqgzrelcsmtstylxrrgvyoqkm` FOREIGN KEY (`id`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_vmwdxgxhjpyqxuxtpqidqmjtypizxlcynvpg` FOREIGN KEY (`groupId`) REFERENCES `cccategorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cccategorygroups`
--

DROP TABLE IF EXISTS `cccategorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cccategorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_finbxogdjjtfwfmzsfbphighnpqpazfzocca` (`name`),
  KEY `ccidx_tmuppkumgycyehdsiellvtaydmfejtofvpzb` (`handle`),
  KEY `ccidx_qlxcgeduubazqarqtarmgdvpcadmeosugdbi` (`structureId`),
  KEY `ccidx_zzxkvuykxqfkowfvukotzoldhkvbxirgmyul` (`fieldLayoutId`),
  KEY `ccidx_gttprjohohwiojyiaarhwbqngfqlmcdakhjd` (`dateDeleted`),
  CONSTRAINT `ccfk_hfxqxbyvyrmcvappijosodyvygxigerivtwf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `ccfieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ccfk_rtiufqzgudmsmwwrsbjyscxyfzhehxwzeogo` FOREIGN KEY (`structureId`) REFERENCES `ccstructures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cccategorygroups_sites`
--

DROP TABLE IF EXISTS `cccategorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cccategorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8mb3_unicode_ci,
  `template` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_mnbtyjnnmofzvzskotklochsfdtvwecwxyff` (`groupId`,`siteId`),
  KEY `ccidx_cuxnxrqsoqfgduyoflqzwbyjhgisevtnnsjr` (`siteId`),
  CONSTRAINT `ccfk_pbddxvfrvxxscyhiulqwlgcitexwdiezyuwj` FOREIGN KEY (`groupId`) REFERENCES `cccategorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_uokqvkbexbplomqqhznhsxgvmkqfdavsdipu` FOREIGN KEY (`siteId`) REFERENCES `ccsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccchangedattributes`
--

DROP TABLE IF EXISTS `ccchangedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccchangedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `ccidx_khqqvcllbwqudvwqogvdeodfhquluvtjuxds` (`elementId`,`siteId`,`dateUpdated`),
  KEY `ccfk_ybfvoxnmfkwjpgsaziudbdaxhytuobhucqmx` (`siteId`),
  KEY `ccfk_tpvdyyvyyulowjtnlnphbygtaclafzoolxbr` (`userId`),
  CONSTRAINT `ccfk_tpvdyyvyyulowjtnlnphbygtaclafzoolxbr` FOREIGN KEY (`userId`) REFERENCES `ccusers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `ccfk_xqdiuisegpvsjufyhijgostppvtrxlmijywk` FOREIGN KEY (`elementId`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ccfk_ybfvoxnmfkwjpgsaziudbdaxhytuobhucqmx` FOREIGN KEY (`siteId`) REFERENCES `ccsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccchangedfields`
--

DROP TABLE IF EXISTS `ccchangedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccchangedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `ccidx_eanolhuietypcyktnyrkmfchqsaoihgikcwt` (`elementId`,`siteId`,`dateUpdated`),
  KEY `ccfk_tqpqqtfydkwsqxbicbzoigybckmjeamrwnjz` (`siteId`),
  KEY `ccfk_pllncfvzurrjgepiaaueyyuvmqfraclxksip` (`fieldId`),
  KEY `ccfk_upujyfyasllqkxsegxatltoyawfnvyywkxvb` (`userId`),
  CONSTRAINT `ccfk_izedvcfymedusarwyrkvkjenpnjgegunjfcj` FOREIGN KEY (`elementId`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ccfk_pllncfvzurrjgepiaaueyyuvmqfraclxksip` FOREIGN KEY (`fieldId`) REFERENCES `ccfields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ccfk_tqpqqtfydkwsqxbicbzoigybckmjeamrwnjz` FOREIGN KEY (`siteId`) REFERENCES `ccsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ccfk_upujyfyasllqkxsegxatltoyawfnvyywkxvb` FOREIGN KEY (`userId`) REFERENCES `ccusers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cccontent`
--

DROP TABLE IF EXISTS `cccontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cccontent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_lygqskeplomunzplcxndrbepfemaaxpmptik` (`elementId`,`siteId`),
  KEY `ccidx_isfkmykxwuzegoyadcvlzfhrlfxnnrpdfiys` (`siteId`),
  KEY `ccidx_fakwokulcdlewjrrizterdzygpiibgysjucf` (`title`),
  CONSTRAINT `ccfk_klqfvjqoeaqybrvascfpaupbvyreqwbcbess` FOREIGN KEY (`siteId`) REFERENCES `ccsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ccfk_peotrxprrxakslcnlrcjlyosmsczyuhqxiwp` FOREIGN KEY (`elementId`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cccraftidtokens`
--

DROP TABLE IF EXISTS `cccraftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cccraftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccfk_afllsltjjjjcmbyqrmsbqhhsguzswsizzuvo` (`userId`),
  CONSTRAINT `ccfk_afllsltjjjjcmbyqrmsbqhhsguzswsizzuvo` FOREIGN KEY (`userId`) REFERENCES `ccusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccdeprecationerrors`
--

DROP TABLE IF EXISTS `ccdeprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccdeprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb3_unicode_ci,
  `traces` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_zlfeswtabxmxnpquqjdmohokmqcgtkyjhogv` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccdrafts`
--

DROP TABLE IF EXISTS `ccdrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccdrafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ccidx_pwmipmayvjbohmbhyqcoykdqrhqzkxjrrzlm` (`creatorId`,`provisional`),
  KEY `ccidx_fbxpzwqoeuiklfuetczggqzunbtyixcgdizh` (`saved`),
  KEY `ccfk_wnyluivcjdcliwcieewbljedichazgwksaol` (`sourceId`),
  CONSTRAINT `ccfk_adxiimazyenhghxpsftwvuuzvainfdnyxuhi` FOREIGN KEY (`creatorId`) REFERENCES `ccusers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ccfk_wnyluivcjdcliwcieewbljedichazgwksaol` FOREIGN KEY (`sourceId`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccelementindexsettings`
--

DROP TABLE IF EXISTS `ccelementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccelementindexsettings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_tdhgsvjsfkttlefcfvdinjwvmxmkdjfrdcxk` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccelements`
--

DROP TABLE IF EXISTS `ccelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_jriarqvmktaazbngfpeipszndetklvmaecoh` (`dateDeleted`),
  KEY `ccidx_qmvgykvfjrmuefnwrmwvwgrwccihkzdflfag` (`fieldLayoutId`),
  KEY `ccidx_hjxfxgwqbkwowffogltujnxqaviwvdmyktwj` (`type`),
  KEY `ccidx_nmggbotdxbengxikstlzmdcrwspavhvelrca` (`enabled`),
  KEY `ccidx_vhbskdnrtsmntfuzvxuxfrdbchpcpmmfzjmx` (`archived`,`dateCreated`),
  KEY `ccidx_wguhgdsawaekqusirxkwewyjnthxldwkinfp` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `ccidx_vxdijptkfqyzazjffufeoxdbpfqxdpaesszb` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `ccfk_wcvdqrnicddblblvthuuwqujpedgfyldpnpx` (`canonicalId`),
  KEY `ccfk_wzkjzjjwgtmnowgattcnnjptpbxyxhwwpqqb` (`draftId`),
  KEY `ccfk_zroteyihbemhrsxobbsypdqyxqelzggwutsl` (`revisionId`),
  CONSTRAINT `ccfk_npwzhsqrjuwldomphekngvpbegncuanxxbgb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `ccfieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ccfk_wcvdqrnicddblblvthuuwqujpedgfyldpnpx` FOREIGN KEY (`canonicalId`) REFERENCES `ccelements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ccfk_wzkjzjjwgtmnowgattcnnjptpbxyxhwwpqqb` FOREIGN KEY (`draftId`) REFERENCES `ccdrafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_zroteyihbemhrsxobbsypdqyxqelzggwutsl` FOREIGN KEY (`revisionId`) REFERENCES `ccrevisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccelements_sites`
--

DROP TABLE IF EXISTS `ccelements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccelements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_pckvwujryfsdeezojjzifkopiawqricxitzt` (`elementId`,`siteId`),
  KEY `ccidx_ysinrmshpsrzqkkizuiwojunshfbzdnzbmcg` (`siteId`),
  KEY `ccidx_gihcrgvxwjnmkntlehtceppbmnsaaitqzjei` (`slug`,`siteId`),
  KEY `ccidx_nobmmfvvhwmbdsclwqfyugjsojddszhhjkgp` (`enabled`),
  KEY `ccidx_zneltbneuyldigudusvohzbsvhtnvhlootvs` (`uri`,`siteId`),
  CONSTRAINT `ccfk_gxengpwcipngbtfqnvouikawfhdzcwwbeigc` FOREIGN KEY (`siteId`) REFERENCES `ccsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ccfk_jjywmtbrdbsabpbdpgdxtqwdjtktptjotfpm` FOREIGN KEY (`elementId`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccentries`
--

DROP TABLE IF EXISTS `ccentries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccentries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_dtxxirwudquivrvqwyhzeetghiupmzfbutfo` (`postDate`),
  KEY `ccidx_hysimjiiqfygiaeuosuwlyfckamokykqlggr` (`expiryDate`),
  KEY `ccidx_zssaybyenmtmxaoipvgdizcylbjlqocnudua` (`authorId`),
  KEY `ccidx_eedbjemfiumxovkhovkiiocggusggjfdoehn` (`sectionId`),
  KEY `ccidx_juthyzlismafizzwfsvsrkgjxjlhadlbqltk` (`typeId`),
  KEY `ccfk_qxuzkhvwewofrchocxsntslsdjkurksaypes` (`parentId`),
  CONSTRAINT `ccfk_enytxhlrrzhcpusiaqradbkyfnimeonmxhzg` FOREIGN KEY (`sectionId`) REFERENCES `ccsections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_jpybfslvkvisikcgmizfaafmmqzcmtopwizm` FOREIGN KEY (`authorId`) REFERENCES `ccusers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ccfk_nuwobjcjxssynoarvhjkuctroobwkrqbrcip` FOREIGN KEY (`id`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_qxuzkhvwewofrchocxsntslsdjkurksaypes` FOREIGN KEY (`parentId`) REFERENCES `ccentries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ccfk_rhcocsonntoqaydfmfvuhsipelqtxwftfxii` FOREIGN KEY (`typeId`) REFERENCES `ccentrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccentrytypes`
--

DROP TABLE IF EXISTS `ccentrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccentrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb3_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_etdaqcveuzpgbvidnterswxfzsxajovxujds` (`name`,`sectionId`),
  KEY `ccidx_gzkvgcicqztyclucejzbxabxrusaukljnfgh` (`handle`,`sectionId`),
  KEY `ccidx_mnrjhnhfhbpmnuvxbfpmrntkoqkxhqxrkolh` (`sectionId`),
  KEY `ccidx_buunhoursuuadlwnhiwovnamwohoobptapvg` (`fieldLayoutId`),
  KEY `ccidx_glaafowkjraqddikuppblhamfexejfwuyiej` (`dateDeleted`),
  CONSTRAINT `ccfk_cdmqaxlyyyeuevplsqdlaozohetcipckjasq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `ccfieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ccfk_qizknckoljuetqrmuwmhjptnbqrvpxpdnupd` FOREIGN KEY (`sectionId`) REFERENCES `ccsections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccfieldgroups`
--

DROP TABLE IF EXISTS `ccfieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccfieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_ovhbkzylydwdrebysayrjupzytyriyeatlph` (`name`),
  KEY `ccidx_fkjcjefajnznvcmpoqjzbidwdbwunnrqhjeu` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccfieldlayoutfields`
--

DROP TABLE IF EXISTS `ccfieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccfieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_vdmprtxlcfwujdnoacyslpwvnbigippdwqxz` (`layoutId`,`fieldId`),
  KEY `ccidx_aeeizqsuektygxzepmznecudqqxkmbmkclni` (`sortOrder`),
  KEY `ccidx_bgbxwylufsxkdhvpgurnhvfawbhlqcrevxjs` (`tabId`),
  KEY `ccidx_kinpmrgpoegpqncxnpjexrnhqaevgwlmdvwh` (`fieldId`),
  CONSTRAINT `ccfk_bggnplqzoductaegrtouesprcrnvfdizkytk` FOREIGN KEY (`fieldId`) REFERENCES `ccfields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_ueymnbmzxrtuxcoucqqglrtqobewlscifkjt` FOREIGN KEY (`layoutId`) REFERENCES `ccfieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_vtgpibdxfoiheepsilnwbyspgbwkllncsjou` FOREIGN KEY (`tabId`) REFERENCES `ccfieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccfieldlayouts`
--

DROP TABLE IF EXISTS `ccfieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccfieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_jigwgzjdnmhuqsblztaezwzctmdzgibzhwwf` (`dateDeleted`),
  KEY `ccidx_hevmgbljdctnsbgqtdpykidgcbhthgzpaoyq` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccfieldlayouttabs`
--

DROP TABLE IF EXISTS `ccfieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccfieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `elements` text COLLATE utf8mb3_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_evsqlggitzgecoownjovwokiorfvbowgoyzi` (`sortOrder`),
  KEY `ccidx_umyawobnmbvndorjkowxdxgsxgcnpymjitso` (`layoutId`),
  CONSTRAINT `ccfk_vlohwmshowvkeuekvgcjewdxeydmfuwydvsw` FOREIGN KEY (`layoutId`) REFERENCES `ccfieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccfields`
--

DROP TABLE IF EXISTS `ccfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb3_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8mb3_unicode_ci,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_zdberyovvbyihxonjhbhnkhkxplkiiqmbstv` (`handle`,`context`),
  KEY `ccidx_wjlldjlpaafoebyzeklsdcepwqghlwovywfh` (`groupId`),
  KEY `ccidx_fpeqhoycpamoemzcujpbzbqvldusyttwfowq` (`context`),
  CONSTRAINT `ccfk_qqnrcnulldspryvufszvtndzbkukxxxlijgy` FOREIGN KEY (`groupId`) REFERENCES `ccfieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccglobalsets`
--

DROP TABLE IF EXISTS `ccglobalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccglobalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_rwsuqnqijixuubetughsvmpkhpxgrdklsbog` (`name`),
  KEY `ccidx_qauccckidxcpxtbpszfszocatibtinepbxsi` (`handle`),
  KEY `ccidx_zdrnnftdhvngcgqyemjebzbtojrnieqgwoba` (`fieldLayoutId`),
  KEY `ccidx_nvgekgslthxajspbkmtjqgvapdpstgldkkqc` (`sortOrder`),
  CONSTRAINT `ccfk_vsdvitprmmqexojqmilmngvolndnovddjcey` FOREIGN KEY (`fieldLayoutId`) REFERENCES `ccfieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ccfk_zijjfoqqxnpfjquzwbpwamhcninzuvsopgyk` FOREIGN KEY (`id`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccgqlschemas`
--

DROP TABLE IF EXISTS `ccgqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccgqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `scope` text COLLATE utf8mb3_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccgqltokens`
--

DROP TABLE IF EXISTS `ccgqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccgqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_dmvlscvcfjocipulqvjyjppjtezkvfoafytu` (`accessToken`),
  UNIQUE KEY `ccidx_lvdigsgifnykzhysdcunjunxrezpzlakhlsr` (`name`),
  KEY `ccfk_cihbbbhcggdjifvpvoxdoutvojfmtcxqvcpm` (`schemaId`),
  CONSTRAINT `ccfk_cihbbbhcggdjifvpvoxdoutvojfmtcxqvcpm` FOREIGN KEY (`schemaId`) REFERENCES `ccgqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccinfo`
--

DROP TABLE IF EXISTS `ccinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccmatrixblocks`
--

DROP TABLE IF EXISTS `ccmatrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccmatrixblocks` (
  `id` int NOT NULL,
  `ownerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_pclbohokpvoualdqjdpsgqhhybjonlpfnzxg` (`ownerId`),
  KEY `ccidx_imyzgqytbczkcijrnxbdmxmfxmewjmoswilb` (`fieldId`),
  KEY `ccidx_zptclapkefdamzvwfppxcamsmutqgoxhtisn` (`typeId`),
  KEY `ccidx_hzxpoipetwnvslkuvqeeikergfzzrevaokmv` (`sortOrder`),
  CONSTRAINT `ccfk_fkrityolmugbnmwsqpjngprcgbnmhhwqfvho` FOREIGN KEY (`typeId`) REFERENCES `ccmatrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_qzrrpmvbkgxtqzgoxoilxjjojrzihcwythrj` FOREIGN KEY (`fieldId`) REFERENCES `ccfields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_sldwjozaezzbetopxjjtesgergdmygfdpitu` FOREIGN KEY (`ownerId`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_sorlvfxlaihofyxumuiomhgyawnmspbdvgal` FOREIGN KEY (`id`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccmatrixblocktypes`
--

DROP TABLE IF EXISTS `ccmatrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccmatrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_zqilhrunjisszbsdyreebljsstsyveauqygz` (`name`,`fieldId`),
  KEY `ccidx_kqnmptqgwznxgwufqejrxdsvkafirzzesaqv` (`handle`,`fieldId`),
  KEY `ccidx_qgkvvhmprlbrypnrasrsszcobczazphepwmj` (`fieldId`),
  KEY `ccidx_fszfkkylqduucgyudupgijmtrvjbhpbniljd` (`fieldLayoutId`),
  CONSTRAINT `ccfk_viljiovjdibwxynasbbruainmdvfqhknitlm` FOREIGN KEY (`fieldId`) REFERENCES `ccfields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_xjnvqqcsbigwcjxalcystvxkmjwabhydfmqg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `ccfieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccmigrations`
--

DROP TABLE IF EXISTS `ccmigrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccmigrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_nxgshanygwgzgsdrfunonhirowebswgcrnrv` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccplugins`
--

DROP TABLE IF EXISTS `ccplugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccplugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_twdemrbykcngnvkwsehoakbavmsrtptvjvqh` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccprojectconfig`
--

DROP TABLE IF EXISTS `ccprojectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccprojectconfig` (
  `path` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccqueue`
--

DROP TABLE IF EXISTS `ccqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccqueue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `ccidx_rpidlrfmzhiqgylljpmlehrranhemvsbdtoh` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `ccidx_vxjowfxdimovdxftmyvlncdaxtzbabesrevf` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccrelations`
--

DROP TABLE IF EXISTS `ccrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccrelations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_zqhukjykfjejdvnqgksdvyvezqpginguazeu` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `ccidx_cxheyrumarrvnousthcsvnwslljzalsqwjjv` (`sourceId`),
  KEY `ccidx_ugpurbbdtkllphhqwlojpzckugdytaublvps` (`targetId`),
  KEY `ccidx_vxqbtutpwjgoyvczudhydxoznwaoefzylkpj` (`sourceSiteId`),
  CONSTRAINT `ccfk_elyfhywyqriipvkzxbalrrtnemtlnvdnimlq` FOREIGN KEY (`sourceSiteId`) REFERENCES `ccsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ccfk_enlwuxgepimifltalysywxchprbnsqsdyndo` FOREIGN KEY (`sourceId`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_fjptchgvwxhbwvqkeoyuhbngaetdgcdwpfkw` FOREIGN KEY (`targetId`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_zidknfssanrlytgecoktzoxcrfzoidxhfaes` FOREIGN KEY (`fieldId`) REFERENCES `ccfields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccresourcepaths`
--

DROP TABLE IF EXISTS `ccresourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccresourcepaths` (
  `hash` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccrevisions`
--

DROP TABLE IF EXISTS `ccrevisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccrevisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_wveclqnlxeypwkhswhbfufoubwcqdqxucuxy` (`sourceId`,`num`),
  KEY `ccfk_qdtdybrfdndrgilvoptnpexwgxhliagiaoul` (`creatorId`),
  CONSTRAINT `ccfk_qdtdybrfdndrgilvoptnpexwgxhliagiaoul` FOREIGN KEY (`creatorId`) REFERENCES `ccusers` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ccfk_qzbuquhjljjepldpeyinqhucmosxvzrccvie` FOREIGN KEY (`sourceId`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccsearchindex`
--

DROP TABLE IF EXISTS `ccsearchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccsearchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `ccidx_exbtduojvtdkengoujsqrtgceirhlppcfame` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccsections`
--

DROP TABLE IF EXISTS `ccsections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccsections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_fglztinecvxmpichpvtuxpwggcixqoliywhf` (`handle`),
  KEY `ccidx_vifoomeopsmnonyqwqgxkynbhuzzhgzamcwq` (`name`),
  KEY `ccidx_xisuvarxrrodvxgugzqibgkzmooyvoomfidf` (`structureId`),
  KEY `ccidx_tikjmdhkqvwgztmslxelslqkjsxvnlfsaphg` (`dateDeleted`),
  CONSTRAINT `ccfk_wcrvzcgeeqvqthajmklmvateuqaahnnxbsci` FOREIGN KEY (`structureId`) REFERENCES `ccstructures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccsections_sites`
--

DROP TABLE IF EXISTS `ccsections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccsections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8mb3_unicode_ci,
  `template` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_pgnhhnalyynogsxqvdazvydvcapyprwppjsq` (`sectionId`,`siteId`),
  KEY `ccidx_hykkxgisxstgosrveimgyvdsbzgggcmojvhs` (`siteId`),
  CONSTRAINT `ccfk_hyjmknnrhdcarlmisvwavcidwtksnmvuboiu` FOREIGN KEY (`siteId`) REFERENCES `ccsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ccfk_mmcsdkmzqtlzqwbogriygfhrvlvintdmprdo` FOREIGN KEY (`sectionId`) REFERENCES `ccsections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccsequences`
--

DROP TABLE IF EXISTS `ccsequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccsequences` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccsessions`
--

DROP TABLE IF EXISTS `ccsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_mcsmkyusvqalaadzagovfpwvtgflrillznma` (`uid`),
  KEY `ccidx_kxowbtcrznghwyoalowmkpsschadmmxyvvws` (`token`),
  KEY `ccidx_oepytdcuuvwlzwuckyxsacftmhzxspqccjgp` (`dateUpdated`),
  KEY `ccidx_quhoejouofuaxdcyjrnwhjogjnqxuhvikhky` (`userId`),
  CONSTRAINT `ccfk_vxmfjqcttwnvaczhjtaezgautafhlgpfxokr` FOREIGN KEY (`userId`) REFERENCES `ccusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccshunnedmessages`
--

DROP TABLE IF EXISTS `ccshunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccshunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_tlfeqlendecxfewlaeuxmtaeskdmufdqmfuf` (`userId`,`message`),
  CONSTRAINT `ccfk_unzntkcjjdguagsupbjpyqxlemuccogmckdl` FOREIGN KEY (`userId`) REFERENCES `ccusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccsitegroups`
--

DROP TABLE IF EXISTS `ccsitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccsitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_katcjjkleqccsnsaipsmdrqgzpwdtbtopdri` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccsites`
--

DROP TABLE IF EXISTS `ccsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccsites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_scnvbjwizwjcqggdjsocynybktjmthwlwaif` (`dateDeleted`),
  KEY `ccidx_ksxnfosyssypnbvfhjgeonyjcydtjovedzvh` (`handle`),
  KEY `ccidx_jppapfruxwbyphdpvbtxstagewlklabkhpcm` (`sortOrder`),
  KEY `ccfk_fbowrlwmtfuwezndrblqcfcymactwkikbuky` (`groupId`),
  CONSTRAINT `ccfk_fbowrlwmtfuwezndrblqcfcymactwkikbuky` FOREIGN KEY (`groupId`) REFERENCES `ccsitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccstructureelements`
--

DROP TABLE IF EXISTS `ccstructureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccstructureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_xgpsuctkruvmdkfbpbniavxtspzspkkuawfo` (`structureId`,`elementId`),
  KEY `ccidx_guiscswskbamznhxqggqiimcsxfsecafyuaa` (`root`),
  KEY `ccidx_rncxoslzyladzqbvkvnsmjqpxtobaegihghy` (`lft`),
  KEY `ccidx_mzztdoxnyfzgjtfyfeiovkiojooeqfixhwef` (`rgt`),
  KEY `ccidx_kxqrgcvitwqnlwzgprkdqphdaygxblxaeclm` (`level`),
  KEY `ccidx_sdnutigwhvwvsqyhdqcdxddtlnrlhoenckpl` (`elementId`),
  CONSTRAINT `ccfk_nxvzndzdoqyzcchftqruvkdiolkbwmduwbqg` FOREIGN KEY (`structureId`) REFERENCES `ccstructures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_xiemfqxnzfgekqstwnxgemakazwfkxzatcfz` FOREIGN KEY (`elementId`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccstructures`
--

DROP TABLE IF EXISTS `ccstructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccstructures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_sbbuugqgeuesxjxmavebfpkmhjeyyicxwwmd` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccsystemmessages`
--

DROP TABLE IF EXISTS `ccsystemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccsystemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_acmaxwznszaszdlwdyphnwaffjkemeleagdr` (`key`,`language`),
  KEY `ccidx_pazavjpwchdadazsgadqlybjnfthwzdlniqk` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cctaggroups`
--

DROP TABLE IF EXISTS `cctaggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cctaggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_hgrqvylhfxrntfbcurmvicmmsegiyfkcolkg` (`name`),
  KEY `ccidx_xzswtuvegtcuplmpviefjpbdsgzcxrqseieb` (`handle`),
  KEY `ccidx_utnncpxpqnjmtxqsebmjqeyahriwaukvvrry` (`dateDeleted`),
  KEY `ccfk_lhuesqkcgzvmbygezygvflwqqedlfivxayhl` (`fieldLayoutId`),
  CONSTRAINT `ccfk_lhuesqkcgzvmbygezygvflwqqedlfivxayhl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `ccfieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cctags`
--

DROP TABLE IF EXISTS `cctags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cctags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_euncxljmhkigoowhrvazfhrfdztoiiokpjke` (`groupId`),
  CONSTRAINT `ccfk_jnxvrmemeznlewliquskoemzazbzerymwumy` FOREIGN KEY (`groupId`) REFERENCES `cctaggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_qbctekprkxkpzrcokxsnrebcfzdqljaeskia` FOREIGN KEY (`id`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cctemplatecacheelements`
--

DROP TABLE IF EXISTS `cctemplatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cctemplatecacheelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ccidx_xsgpgegtzhwsalimukkigfypnkxieuthtdym` (`cacheId`),
  KEY `ccidx_axaqaembxgskszvdkcnqatdzgiuvjzrvtmhn` (`elementId`),
  CONSTRAINT `ccfk_kyflacdgmphekqifbqbspeutmiqmrfanxycm` FOREIGN KEY (`elementId`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_yzqqghtqnlzhotivwslplwnawyyuyjsaaxml` FOREIGN KEY (`cacheId`) REFERENCES `cctemplatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cctemplatecachequeries`
--

DROP TABLE IF EXISTS `cctemplatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cctemplatecachequeries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cacheId` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ccidx_bvritpjcuqqqiiwzfkgljinclhmjqucqfhpg` (`cacheId`),
  KEY `ccidx_qjoprlmcwqngdaqcojntedibujxaxtkefdfx` (`type`),
  CONSTRAINT `ccfk_ilcetcmkxkjvspivjitndagmfwwgnwtrsatr` FOREIGN KEY (`cacheId`) REFERENCES `cctemplatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cctemplatecaches`
--

DROP TABLE IF EXISTS `cctemplatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cctemplatecaches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ccidx_zyseupscbgxsekluoxuwmzlgmkhedfhwbciq` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `ccidx_mqyuuoftwiqzrdkifrcmekesnurejguedrbh` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `ccidx_vqsggbicxzwdpgnlcbbbjpbwpkxudubvvvdn` (`siteId`),
  CONSTRAINT `ccfk_nwnerirjugiofpgeagebwdgydkfvzmajnbyk` FOREIGN KEY (`siteId`) REFERENCES `ccsites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cctokens`
--

DROP TABLE IF EXISTS `cctokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cctokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb3_unicode_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_apbgeuvzjgwqnwnwmebzadhzcvkwjebgqlfr` (`token`),
  KEY `ccidx_yjxpdujtimkhibwcjiosfemyhntwmlxcgqln` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccusergroups`
--

DROP TABLE IF EXISTS `ccusergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccusergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_lwmcbgrphsntjqthdykqfmxunqzgnrgumqli` (`handle`),
  KEY `ccidx_sjdduysziarhpldjbwivnpbpufpwoqimryzg` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccusergroups_users`
--

DROP TABLE IF EXISTS `ccusergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccusergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_crzyjpqieyumixrmxsljlznlzienolpqnomn` (`groupId`,`userId`),
  KEY `ccidx_wiqrdupmvvsjyywyqgwtlabtrleeqbhqylep` (`userId`),
  CONSTRAINT `ccfk_uohuepyozpmgzptnjimmrvdrvaxzhxokkewb` FOREIGN KEY (`userId`) REFERENCES `ccusers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_vdsmaofyrbeoxlmlwkezxelojusveikumump` FOREIGN KEY (`groupId`) REFERENCES `ccusergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccuserpermissions`
--

DROP TABLE IF EXISTS `ccuserpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccuserpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_aebfchptqjuukehyetxlckbplubqjliraogv` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccuserpermissions_usergroups`
--

DROP TABLE IF EXISTS `ccuserpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccuserpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_jpuvlsgbppqgncaoxyywbxifjtxtkeriinve` (`permissionId`,`groupId`),
  KEY `ccidx_vfpnsfetljjfjsblenblebmeveyvquqxytha` (`groupId`),
  CONSTRAINT `ccfk_iajqmjxkoissyffhardtlqlicvkswcxljjbl` FOREIGN KEY (`groupId`) REFERENCES `ccusergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_lxxjrsxywwucekdgdcasxeumdayepmijlqdm` FOREIGN KEY (`permissionId`) REFERENCES `ccuserpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccuserpermissions_users`
--

DROP TABLE IF EXISTS `ccuserpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccuserpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_jbypfnqjfuwrwcadngxuxrqezyaspsnapqkh` (`permissionId`,`userId`),
  KEY `ccidx_wtttlgulwfbwdflkevkqdduewuqekaoqdkgh` (`userId`),
  CONSTRAINT `ccfk_kydbtorziqafvcgzziktzkfethbsgjrgpajq` FOREIGN KEY (`permissionId`) REFERENCES `ccuserpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_pjdwdtolgdboaxnzipajucfkqfvaqoezmega` FOREIGN KEY (`userId`) REFERENCES `ccusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccuserpreferences`
--

DROP TABLE IF EXISTS `ccuserpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccuserpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `ccfk_mvlrhkwtxbdvbpdklobbakgawnpzalpnpnbt` FOREIGN KEY (`userId`) REFERENCES `ccusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccusers`
--

DROP TABLE IF EXISTS `ccusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccusers` (
  `id` int NOT NULL,
  `username` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `photoId` int DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_yqufhbljrqpaipcepdzoghtviqcmdwpaxdvk` (`uid`),
  KEY `ccidx_amjndvhubzkfygpjlphbxuhgnhdtyddilaop` (`verificationCode`),
  KEY `ccidx_uabrilbfhkelyfnqebaftbgbgwcfcizgormu` (`email`),
  KEY `ccidx_leuqdoahjqaueoufitmriqicqwaqpfyclvyo` (`username`),
  KEY `ccfk_tvdrlkshsqevtsbedauwnhdyporjppldckoy` (`photoId`),
  CONSTRAINT `ccfk_tvdrlkshsqevtsbedauwnhdyporjppldckoy` FOREIGN KEY (`photoId`) REFERENCES `ccassets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ccfk_zberhpoqhtkjkkkpokrqklbyntkqsrvhhrwq` FOREIGN KEY (`id`) REFERENCES `ccelements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccvolumefolders`
--

DROP TABLE IF EXISTS `ccvolumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccvolumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ccidx_oljcjqtiicigqnekepewqctauunpsuvpcqkw` (`name`,`parentId`,`volumeId`),
  KEY `ccidx_vdzrkxaoejaewevogzfiflpwsrxmjrpozbqr` (`parentId`),
  KEY `ccidx_gtwixntrmxlxeingtkbpaeffztxzrmarciss` (`volumeId`),
  CONSTRAINT `ccfk_hyuwogmjwukmbuyrbzfpovbxzwtztkjwbkmk` FOREIGN KEY (`volumeId`) REFERENCES `ccvolumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ccfk_vxzkwvzmlexctsvgpotuqblukdjjsluutjcv` FOREIGN KEY (`parentId`) REFERENCES `ccvolumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccvolumes`
--

DROP TABLE IF EXISTS `ccvolumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccvolumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb3_unicode_ci,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_szysxiwoaftfepfpcxchwnyjcrjtscuhzahs` (`name`),
  KEY `ccidx_gwlhtqihinbsjngzyvrrdyiaozxwgpvjzshh` (`handle`),
  KEY `ccidx_wilrbchjdiysbhzpdrkehhfngnfsxpqopabv` (`fieldLayoutId`),
  KEY `ccidx_rmngfrkargxmqoobdlqmxvzouxnrauuirayf` (`dateDeleted`),
  CONSTRAINT `ccfk_hpqidmshtmqbnvxlicfmotxfvlttjympxsep` FOREIGN KEY (`fieldLayoutId`) REFERENCES `ccfieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ccwidgets`
--

DROP TABLE IF EXISTS `ccwidgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ccwidgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ccidx_zzjmitntbviprnrcjbbskniffxmjuihxzgrr` (`userId`),
  CONSTRAINT `ccfk_iegepruflqfnxucvjotkqyopodjsjncvecgw` FOREIGN KEY (`userId`) REFERENCES `ccusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'craftcmsdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24  8:34:19
-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: craftcmsdb
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `cc_announcements`
--

LOCK TABLES `cc_announcements` WRITE;
/*!40000 ALTER TABLE `cc_announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_assets`
--

LOCK TABLES `cc_assets` WRITE;
/*!40000 ALTER TABLE `cc_assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_assets` VALUES (140,2,6,1,'istockphoto-1300845620-612x612.jpg','image',612,612,18356,NULL,NULL,NULL,'2023-04-21 12:16:04','2023-04-21 07:17:34','2023-04-21 12:16:04','01f8d75a-b64d-4dd8-af4e-8025d11f7b9b'),(154,1,3,1,'istockphoto-1300845620-612x612.jpg','image',612,612,18356,NULL,0,0,'2023-04-21 12:08:04','2023-04-21 12:08:04','2023-04-21 12:08:04','cd29c049-54c8-448f-8899-b4150ccc2813'),(155,2,4,1,'istockphoto-1300845620-612x612.jpg','image',612,612,18356,NULL,NULL,NULL,'2023-04-21 12:14:27','2023-04-21 12:14:27','2023-04-21 12:14:27','1c8ca9ee-2a79-4f6d-9fbe-c63b1684d81e');
/*!40000 ALTER TABLE `cc_assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_assettransforms`
--

LOCK TABLES `cc_assettransforms` WRITE;
/*!40000 ALTER TABLE `cc_assettransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_assettransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_categories`
--

LOCK TABLES `cc_categories` WRITE;
/*!40000 ALTER TABLE `cc_categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_categorygroups`
--

LOCK TABLES `cc_categorygroups` WRITE;
/*!40000 ALTER TABLE `cc_categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_categorygroups_sites`
--

LOCK TABLES `cc_categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `cc_categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_changedattributes`
--

LOCK TABLES `cc_changedattributes` WRITE;
/*!40000 ALTER TABLE `cc_changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_changedattributes` VALUES (11,1,'authorId','2023-04-14 10:08:40',0,1),(63,1,'fieldLayoutId','2023-04-15 04:57:28',0,1),(63,1,'typeId','2023-04-15 04:57:28',0,1);
/*!40000 ALTER TABLE `cc_changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_changedfields`
--

LOCK TABLES `cc_changedfields` WRITE;
/*!40000 ALTER TABLE `cc_changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_changedfields` VALUES (4,1,1,'2023-04-14 09:41:08',0,1),(4,1,4,'2023-04-14 09:41:11',0,1),(14,1,4,'2023-04-15 04:44:30',0,1),(15,1,6,'2023-04-14 10:51:45',0,1),(15,1,11,'2023-04-14 10:51:45',0,1),(63,1,1,'2023-04-15 04:59:05',0,1),(69,1,1,'2023-04-17 13:17:01',0,1),(78,1,14,'2023-04-17 15:01:53',0,1),(78,1,17,'2023-04-15 09:33:20',0,1),(91,1,11,'2023-04-17 13:07:27',0,1),(97,1,24,'2023-04-17 15:04:11',0,1),(97,1,25,'2023-04-17 15:04:11',0,1),(104,1,34,'2023-04-20 14:05:32',0,1),(104,1,37,'2023-04-20 13:54:48',0,1),(104,1,38,'2023-04-20 14:05:32',0,1),(111,1,27,'2023-04-18 07:03:13',0,1),(115,1,35,'2023-04-20 09:59:19',0,1),(115,1,36,'2023-04-20 09:59:19',0,1),(116,1,35,'2023-04-20 09:59:19',0,1),(116,1,36,'2023-04-20 09:59:19',0,1),(117,1,35,'2023-04-20 09:59:19',0,1),(117,1,36,'2023-04-20 09:59:19',0,1),(118,1,35,'2023-04-20 09:59:19',0,1),(118,1,36,'2023-04-20 09:59:19',0,1),(119,1,35,'2023-04-20 09:59:19',0,1),(119,1,36,'2023-04-20 09:59:19',0,1),(120,1,1,'2023-04-20 10:02:59',0,1),(124,1,35,'2023-04-20 13:33:46',0,1),(124,1,36,'2023-04-20 13:33:46',0,1),(125,1,35,'2023-04-20 13:33:46',0,1),(125,1,36,'2023-04-20 13:33:46',0,1),(126,1,35,'2023-04-20 13:33:46',0,1),(126,1,36,'2023-04-20 13:33:46',0,1),(142,1,2,'2023-04-21 09:52:27',0,1),(142,1,3,'2023-04-21 09:52:27',0,1),(143,1,2,'2023-04-21 09:52:27',0,1),(143,1,3,'2023-04-21 09:52:27',0,1),(144,1,2,'2023-04-21 09:52:27',0,1),(144,1,3,'2023-04-21 09:52:27',0,1),(145,1,46,'2023-04-21 09:52:27',0,1),(146,1,46,'2023-04-21 09:52:27',0,1),(151,1,50,'2023-04-21 12:16:08',0,1),(151,1,51,'2023-04-21 12:16:08',0,1),(152,1,50,'2023-04-21 12:16:08',0,1),(152,1,51,'2023-04-21 12:16:08',0,1),(153,1,50,'2023-04-21 12:16:08',0,1),(153,1,51,'2023-04-21 12:16:08',0,1);
/*!40000 ALTER TABLE `cc_changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_content`
--

LOCK TABLES `cc_content` WRITE;
/*!40000 ALTER TABLE `cc_content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_content` VALUES (1,1,1,NULL,'2023-04-14 08:36:25','2023-04-14 08:36:25','0d888106-b091-44e6-9575-db72dd88636f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,2,1,NULL,'2023-04-14 09:36:52','2023-04-14 09:36:52','e6b7c558-49ce-4e65-824e-0b1b11e6681d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,3,1,NULL,'2023-04-14 09:40:04','2023-04-14 09:40:04','fe57d101-3575-42b3-ae7c-c6bbb4611281',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,4,1,NULL,'2023-04-14 09:40:58','2023-04-14 09:41:11','8e1031fa-1c74-4691-b67d-0b2cfc72641e',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,11,1,'Header','2023-04-14 10:06:30','2023-04-14 10:08:40','5c416f1f-62bd-4843-a3e9-20117723b24e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,12,1,'Header','2023-04-14 10:06:30','2023-04-14 10:06:30','b76b5375-4988-40d4-b428-a6b388e27f80',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,13,1,'Header','2023-04-14 10:17:08','2023-04-14 10:17:08','d2bf5ac8-ac28-406a-a24a-2e9044dd4931',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,14,1,NULL,'2023-04-14 10:18:14','2023-04-15 04:44:30','fa934799-2229-4ead-8122-eaaf6a4c1c79',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,15,1,'Help Center','2023-04-14 10:33:45','2023-04-14 10:51:45','0e7359e0-8b21-4bd9-9598-a9854eb034bd',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,16,1,'Help Center','2023-04-14 10:33:45','2023-04-14 10:33:45','1cde83a0-6618-4d01-a651-7b1f9433fe7e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,17,1,'Help Center','2023-04-14 10:35:18','2023-04-14 10:35:18','55f6bf48-6f50-47a6-ab4d-b02a9e2f0077',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,18,1,'Help Center','2023-04-14 10:45:55','2023-04-14 10:45:55','d66e827e-32c9-4646-9c26-469c4a7fd6c0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,34,1,'Help Center','2023-04-14 10:46:49','2023-04-14 10:46:49','3e3fd54f-d103-4143-8692-f848ba4c95aa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,40,1,'Help Center','2023-04-14 10:47:09','2023-04-14 10:47:09','9bf9ed3a-e45f-4865-b49a-2f3dfd39cfa4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,43,1,'Help Center','2023-04-14 10:47:49','2023-04-14 10:47:49','5503ca90-1cfb-4300-9ac3-9df18f97c915',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,52,1,'Help Center','2023-04-14 10:51:08','2023-04-14 10:51:08','8fc796a4-45d1-4a68-b51c-b92afca1b8be',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,58,1,'Help Center','2023-04-14 10:51:45','2023-04-14 10:51:45','344c5a45-a602-4ca5-8df5-3cfc20ad71b5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,62,1,NULL,'2023-04-15 04:56:46','2023-04-15 04:56:46','05c0112e-10b9-4026-b613-93fe6556b442',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,63,1,NULL,'2023-04-15 04:57:21','2023-04-15 04:59:05','5a39e89e-8fed-4a7c-bdb4-037c751f0672',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,64,1,'Yes','2023-04-15 04:57:41','2023-04-15 04:57:41','1373d415-8c34-461b-b6d6-40a08385741e',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,65,1,'Yes','2023-04-15 04:57:41','2023-04-15 04:57:41','01710dc9-c039-4419-8e81-2119d45baa9b',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,69,1,'Header Visitor','2023-04-15 08:16:42','2023-04-17 13:17:01','e1c8d63b-64a0-4c28-8aa7-d4092d3e1de6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,70,1,'Header Visitor','2023-04-15 08:16:42','2023-04-15 08:16:42','cc182a5e-8a9e-4954-967c-44d0600af63a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,71,1,'Header Visitor','2023-04-15 08:17:04','2023-04-15 08:17:04','7f3090ea-73a6-44e7-ab92-cb52b132e72a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,74,1,'Home Page','2023-04-15 08:36:25','2023-04-15 08:37:32','e5cc91ea-b7ce-4803-a3e3-6009789c8536',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,75,1,'Home Page','2023-04-15 08:36:25','2023-04-15 08:36:25','1c6bc99d-78a7-49c1-a034-9d665e296c46',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,76,1,'Home Page','2023-04-15 08:37:00','2023-04-15 08:37:00','436b84c8-1595-4e2b-95a8-09273ab6d543',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,77,1,'Home Page','2023-04-15 08:37:32','2023-04-15 08:37:32','3ab22d3a-f6bf-4e59-b46e-1b11bbecb8eb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,78,1,'Home Page','2023-04-15 09:33:17','2023-04-17 15:01:53','cd58605b-445f-460b-adb2-05885ba8b55c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,91,1,'Help Center','2023-04-17 13:07:27','2023-04-17 13:07:27','5daca7dc-0714-4156-9ddb-b3406ef97c79',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,97,1,'Get Started','2023-04-17 13:09:48','2023-04-17 15:04:11','f10ac939-0da1-4827-ae42-51dfdffbc912',NULL,NULL,NULL,NULL,NULL,'Hi','<p>Test</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,98,1,'Get Started','2023-04-17 13:09:48','2023-04-17 13:09:48','c71bfbce-253d-47c6-8858-be607e55b96b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,99,1,'Get Started','2023-04-17 13:11:56','2023-04-17 13:11:56','c0afeba1-7636-4da0-90e5-43a02cd0dc50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,100,1,'Get Started','2023-04-17 13:16:26','2023-04-17 13:16:26','1d24937e-81a1-4e22-a4d6-37129c3dab0a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,102,1,'Header Visitor','2023-04-17 13:17:01','2023-04-17 13:17:01','02b2048e-5692-4daf-bd66-f81c8b1bce87',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,104,1,'About us','2023-04-17 13:50:20','2023-04-20 14:05:32','c78f96b1-5f49-4b72-8317-75262f92e74a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,105,1,'About us','2023-04-17 13:50:20','2023-04-17 13:50:20','578daf5b-9815-44cc-80b8-e8f1cf1f891d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,106,1,'About us','2023-04-17 13:57:35','2023-04-17 13:57:35','e6ce84e9-4631-4f9a-8011-fb5908d7a7ef',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,110,1,'Get Started','2023-04-17 15:04:11','2023-04-17 15:04:11','503258bc-0674-4e66-931f-f1b85f155966',NULL,NULL,NULL,NULL,NULL,'Hi','<p>Test</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,111,1,'Get Started','2023-04-18 07:03:13','2023-04-18 07:03:13','47ccb3e5-850d-4114-a4ed-3af79d6a30c4',NULL,NULL,NULL,NULL,NULL,'Hi','<p>Test</p>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,113,1,'About us','2023-04-18 07:08:35','2023-04-18 07:08:35','66b9fea0-7e19-47e4-8fe6-474775cb4f6e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,114,1,NULL,'2023-04-20 09:50:46','2023-04-20 09:59:19','c5751035-f26a-4d98-a10e-9bed9aa0ac59',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,120,1,'Header Visitor','2023-04-20 10:02:59','2023-04-20 10:02:59','a48565e3-093d-4543-9d9c-4f4c00c8ccfe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,123,1,NULL,'2023-04-20 10:58:23','2023-04-20 13:33:46','cda5a4d7-cc75-4c33-900a-a44a56c90a17',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,127,1,'About us','2023-04-20 13:54:29','2023-04-20 13:54:29','d92e8b97-012c-4baa-be95-55ea4ec6e5c9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,129,1,'About us','2023-04-20 13:54:48','2023-04-20 13:54:48','8ec3b7d7-54df-4c78-9da8-bd67f252ec3b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,130,1,'About us','2023-04-20 14:01:11','2023-04-20 14:01:11','4d337b94-b441-4ef1-844b-119cbddd26c6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,133,1,'About us','2023-04-20 14:05:11','2023-04-20 14:05:11','d2d0b600-7829-4777-9ae9-1f853f5e5d5e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,137,1,'About us','2023-04-20 14:05:32','2023-04-20 14:05:32','91b8b94b-b8f9-4805-b6e0-7781aa311bf8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,139,1,NULL,'2023-04-21 07:16:12','2023-04-21 07:47:25','2f3a6c6f-e402-42a2-8743-88a0cdca5a43',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,140,1,'Istockphoto 1300845620 612x612','2023-04-21 07:17:34','2023-04-21 12:16:04','8988d30e-4612-4114-8ae6-beff2970d00d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,141,1,NULL,'2023-04-21 09:12:40','2023-04-21 09:52:27','6d232ba0-6f37-4676-a2a5-5ba8e35135b0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<div>\n<p class=\"my-3 text-white\">MORE QUESTIONS ?</p>\n<p class=\"text-dark-gray-1\">Email Us: hello@podspun.com</p>\n</div>','@2023 PODSPUN - ALL RIGHTS RESERVED',NULL,NULL),(60,150,1,NULL,'2023-04-21 09:53:55','2023-04-21 12:16:08','9295e652-333e-4fbb-bc67-f463adcf35fc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'@2023 PODSPUN - ALL RIGHTS RESERVED','Powered by Podspun','<p class=\"logo content\"> Amplify your Podcast </p>'),(61,154,1,'Istockphoto 1300845620 612x612','2023-04-21 12:08:04','2023-04-21 12:08:04','28301f44-d024-4a25-8159-22fe6f072eaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,155,1,'Istockphoto 1300845620 612x612','2023-04-21 12:14:27','2023-04-21 12:14:27','7c7023c7-6e68-4eb1-9b33-432fd986c5fa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cc_content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_craftidtokens`
--

LOCK TABLES `cc_craftidtokens` WRITE;
/*!40000 ALTER TABLE `cc_craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_deprecationerrors`
--

LOCK TABLES `cc_deprecationerrors` WRITE;
/*!40000 ALTER TABLE `cc_deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_drafts`
--

LOCK TABLES `cc_drafts` WRITE;
/*!40000 ALTER TABLE `cc_drafts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_drafts` VALUES (1,NULL,1,0,'First draft',NULL,0,NULL,0),(2,NULL,1,0,'First draft',NULL,0,NULL,0),(3,NULL,1,0,'First draft','',0,NULL,1),(4,NULL,1,0,'First draft',NULL,0,NULL,0),(5,NULL,1,0,'First draft','',0,NULL,1),(9,NULL,1,0,'First draft',NULL,0,NULL,0),(10,NULL,1,0,'First draft','',0,NULL,1),(12,74,1,1,'Draft 1','',1,NULL,1),(13,15,1,1,'Draft 1','',1,NULL,1),(15,97,1,1,'Draft 1','',1,NULL,1),(16,69,1,1,'Draft 1','',1,NULL,1);
/*!40000 ALTER TABLE `cc_drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_elementindexsettings`
--

LOCK TABLES `cc_elementindexsettings` WRITE;
/*!40000 ALTER TABLE `cc_elementindexsettings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_elements`
--

LOCK TABLES `cc_elements` WRITE;
/*!40000 ALTER TABLE `cc_elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-04-14 08:36:25','2023-04-14 08:36:25',NULL,NULL,'d7ed2cf2-9699-4e8b-805f-d498a999c385'),(2,NULL,1,NULL,1,'craft\\elements\\Entry',0,0,'2023-04-14 09:36:52','2023-04-14 09:36:52',NULL,'2023-04-14 09:40:49','cc4abd76-80a6-4d34-b9a4-1794e6973ee6'),(3,NULL,2,NULL,1,'craft\\elements\\Entry',0,0,'2023-04-14 09:40:04','2023-04-14 09:40:04',NULL,'2023-04-14 09:40:49','3bbe7281-99c7-474f-8bb7-b61b09b05b9f'),(4,NULL,3,NULL,3,'craft\\elements\\Entry',0,0,'2023-04-14 09:40:58','2023-04-14 09:41:11',NULL,'2023-04-15 08:16:16','847f949f-236e-48d2-9575-71e45ad05024'),(5,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 09:41:03','2023-04-14 09:41:03',NULL,'2023-04-14 09:41:05','0596a662-1a95-40b4-95f8-272adab29e47'),(6,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 09:41:05','2023-04-14 09:41:05',NULL,'2023-04-14 09:41:08','8a15e1b7-d8ce-40a4-91ed-0a3d9de9a2da'),(7,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 09:41:05','2023-04-14 09:41:05',NULL,'2023-04-14 09:41:08','c058d0d2-03e0-4493-81ec-70ec4c7bf0a6'),(8,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 09:41:08','2023-04-14 09:41:08',NULL,'2023-04-15 08:16:16','1bb97038-8030-40d6-ba6c-d0d63d633135'),(9,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 09:41:08','2023-04-14 09:41:08',NULL,'2023-04-15 08:16:16','dd896fad-d47f-4594-a499-4e34b9b432f5'),(10,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 09:41:08','2023-04-14 09:41:08',NULL,'2023-04-15 08:16:16','7caa8911-9e47-45ce-ba67-cbc2f89d2e3a'),(11,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2023-04-14 10:06:30','2023-04-14 10:06:30',NULL,'2023-04-14 10:14:39','517b02a6-d5b0-41b5-9e7e-eb4771d292f6'),(12,11,NULL,1,4,'craft\\elements\\Entry',1,0,'2023-04-14 10:06:30','2023-04-14 10:06:30',NULL,'2023-04-14 10:14:39','11fe8a01-bbd1-4c33-90e6-5ff7d8456f27'),(13,NULL,4,NULL,4,'craft\\elements\\Entry',1,0,'2023-04-14 10:17:08','2023-04-14 10:17:08',NULL,'2023-04-14 10:18:08','eaa6cb9f-0b01-4c34-909d-5fd12b62099f'),(14,NULL,5,NULL,5,'craft\\elements\\Entry',1,0,'2023-04-14 10:18:14','2023-04-14 10:18:27',NULL,'2023-04-15 08:15:43','293d5e76-ad31-4863-bd31-6f708d43c867'),(15,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-04-14 10:33:45','2023-04-14 10:51:45',NULL,NULL,'8174745a-7e4b-4ec2-a97a-5cda763cc957'),(16,15,NULL,2,6,'craft\\elements\\Entry',1,0,'2023-04-14 10:33:45','2023-04-14 10:33:45',NULL,NULL,'675b5eb5-c776-4ec6-bb75-4cf78dfc3606'),(17,15,NULL,3,6,'craft\\elements\\Entry',1,0,'2023-04-14 10:35:18','2023-04-14 10:35:18',NULL,NULL,'b569131c-847d-44eb-8332-fdb2cf8a2abc'),(18,15,NULL,4,6,'craft\\elements\\Entry',1,0,'2023-04-14 10:45:55','2023-04-14 10:45:55',NULL,NULL,'6d999a19-8136-461f-9858-50088fc78e99'),(20,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:15','2023-04-14 10:46:15',NULL,'2023-04-14 10:46:30','69180016-77fe-4da6-afb4-4b9599a17fd5'),(21,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:15','2023-04-14 10:46:15',NULL,'2023-04-14 10:46:30','a0d8d608-2942-48d5-b06c-7075bcde7356'),(22,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:30','2023-04-14 10:46:30',NULL,'2023-04-14 10:46:35','c1743c74-3d5d-4bc1-bc33-c071ccc07d0b'),(23,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:30','2023-04-14 10:46:30',NULL,'2023-04-14 10:46:35','203b6bf1-2b75-4e05-989c-fef26ee4fe07'),(24,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:35','2023-04-14 10:46:35',NULL,'2023-04-14 10:46:42','b3f4c063-ca1e-4c09-a8e2-535660ba3e12'),(25,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:35','2023-04-14 10:46:35',NULL,'2023-04-14 10:46:42','5a6721fc-e273-41b1-9b90-2a327e98bf01'),(26,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:42','2023-04-14 10:46:42',NULL,'2023-04-14 10:46:48','4e486af8-9262-465c-b7b8-be82b166e065'),(27,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:42','2023-04-14 10:46:42',NULL,'2023-04-14 10:46:48','e0e457bb-47ef-49a6-beb4-ba19a641be68'),(28,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:48','2023-04-14 10:46:48',NULL,'2023-04-14 10:46:49','6ff3fff2-ae68-4981-8ae9-4d328eaef7cb'),(29,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:48','2023-04-14 10:46:48',NULL,'2023-04-14 10:46:49','d987fcc6-12b5-44fd-a15c-92d112f82320'),(32,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:49','2023-04-14 10:51:45',NULL,NULL,'0e167a31-e5aa-4090-9cfe-6bb007a11ff8'),(33,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:49','2023-04-14 10:51:45',NULL,NULL,'ae10571b-357d-4328-821a-962d25d16c99'),(34,15,NULL,5,6,'craft\\elements\\Entry',1,0,'2023-04-14 10:46:49','2023-04-14 10:46:49',NULL,NULL,'2548c398-07c0-43e3-829f-2a8ddc8c0cb0'),(35,32,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:49','2023-04-14 10:46:49',NULL,NULL,'44a25246-d94e-42bf-9fb0-e1789b2e69fa'),(36,33,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:46:49','2023-04-14 10:46:49',NULL,NULL,'591bca0e-9fca-4a56-9a55-cb43cca24375'),(40,15,NULL,6,6,'craft\\elements\\Entry',1,0,'2023-04-14 10:47:09','2023-04-14 10:47:09',NULL,NULL,'d1979d4d-18eb-4095-b2e3-614bf81074f5'),(41,33,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:47:09','2023-04-14 10:47:09',NULL,NULL,'ae9fead9-41dd-4347-a3d5-07572653dd34'),(42,32,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:47:09','2023-04-14 10:47:09',NULL,NULL,'1f9953df-35d4-4334-a0b9-02b3c2379596'),(43,15,NULL,7,6,'craft\\elements\\Entry',1,0,'2023-04-14 10:47:49','2023-04-14 10:47:49',NULL,NULL,'84fdb988-1ca7-46d2-a6cf-3cbd97843266'),(44,33,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:47:49','2023-04-14 10:47:49',NULL,NULL,'e3bff48f-6cc2-4b5d-90d8-c63cc736b324'),(45,32,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:47:49','2023-04-14 10:47:49',NULL,NULL,'3fd966ea-b711-43e6-b564-c3bf1de45221'),(49,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:49:21','2023-04-14 10:49:21',NULL,'2023-04-14 10:49:25','a22b0158-50b0-4852-a235-3edf1d16cd2d'),(50,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:49:25','2023-04-14 10:49:25',NULL,NULL,'a5931851-02d7-48a5-ab94-a04c4eb47afa'),(51,NULL,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:49:25','2023-04-14 10:49:25',NULL,'2023-04-14 10:51:43','4400a34b-ac71-4cb8-bdf3-0f13b645bcd5'),(52,15,NULL,8,6,'craft\\elements\\Entry',1,0,'2023-04-14 10:51:08','2023-04-14 10:51:08',NULL,NULL,'f86ab71e-2ec6-435b-bac9-6ba4754ee602'),(53,33,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:51:08','2023-04-14 10:51:08',NULL,NULL,'042c2012-2a35-46b0-ad73-051afae00122'),(54,32,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:51:08','2023-04-14 10:51:08',NULL,NULL,'f65c6d38-ab50-439e-b40d-55a264c8fa7c'),(55,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:51:31','2023-04-14 10:51:31',NULL,'2023-04-14 10:51:38','0f0a2b89-b56c-4c55-96ef-d7394703b428'),(57,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:51:45','2023-04-14 10:51:45',NULL,NULL,'e8a99e06-c049-42e8-89ee-56bd43b9bb66'),(58,15,NULL,9,6,'craft\\elements\\Entry',1,0,'2023-04-14 10:51:45','2023-04-14 10:51:45',NULL,NULL,'4809a8c9-ed70-441b-b69f-b36471821965'),(59,33,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:51:45','2023-04-14 10:51:45',NULL,NULL,'b0a1c193-a66f-4729-8ae9-558a5aaf3944'),(60,32,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:51:45','2023-04-14 10:51:45',NULL,NULL,'f1509413-93ba-41e9-adac-1a6c8160b782'),(61,57,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-04-14 10:51:45','2023-04-14 10:51:45',NULL,NULL,'683f61a5-6f2b-4ca8-9de8-cf4d70bc54e8'),(62,NULL,9,NULL,10,'craft\\elements\\Entry',1,0,'2023-04-15 04:56:46','2023-04-15 04:56:46',NULL,'2023-04-15 04:58:39','32977124-0724-4172-9641-9fa346258121'),(63,NULL,10,NULL,11,'craft\\elements\\Entry',1,0,'2023-04-15 04:57:21','2023-04-15 04:59:05',NULL,'2023-04-15 08:15:45','32eba4b3-5635-4685-abfe-a21ceafaf4f5'),(64,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-04-15 04:57:41','2023-04-15 04:57:41',NULL,'2023-04-15 08:16:16','5c71a091-ac50-4b77-a400-a10e99d76504'),(65,64,NULL,10,3,'craft\\elements\\Entry',1,0,'2023-04-15 04:57:41','2023-04-15 04:57:41',NULL,'2023-04-15 08:16:16','746e7cd7-e5e6-4a60-8653-a3e0378b9f0e'),(66,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-15 04:59:03','2023-04-15 04:59:03',NULL,'2023-04-15 04:59:05','00a38a48-2732-4a99-b757-f20003cbb390'),(67,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-15 04:59:05','2023-04-15 04:59:05',NULL,'2023-04-15 08:15:45','6052d90e-5142-47a7-98c3-394c9c8b8f18'),(68,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-15 04:59:05','2023-04-15 04:59:05',NULL,'2023-04-15 08:15:45','6adf26f9-6ba0-432a-84d6-e83c1e051d3b'),(69,NULL,NULL,NULL,12,'craft\\elements\\Entry',1,0,'2023-04-15 08:16:42','2023-04-17 13:17:01',NULL,NULL,'9dc92031-e2ee-41ab-89de-ad4b2c098696'),(70,69,NULL,11,12,'craft\\elements\\Entry',1,0,'2023-04-15 08:16:42','2023-04-15 08:16:42',NULL,NULL,'6855583d-1153-493d-a724-862a79711762'),(71,69,NULL,12,12,'craft\\elements\\Entry',1,0,'2023-04-15 08:17:04','2023-04-15 08:17:04',NULL,NULL,'8132b47a-839e-4453-8779-7fb4e7e26987'),(74,NULL,NULL,NULL,15,'craft\\elements\\Entry',1,0,'2023-04-15 08:36:25','2023-04-15 08:37:32',NULL,NULL,'d04c85be-3acd-490f-a041-4b0953dc35f9'),(75,74,NULL,13,15,'craft\\elements\\Entry',1,0,'2023-04-15 08:36:25','2023-04-15 08:36:25',NULL,NULL,'14e1c119-fdd4-4d66-937f-eca17ac37396'),(76,74,NULL,14,15,'craft\\elements\\Entry',1,0,'2023-04-15 08:37:00','2023-04-15 08:37:00',NULL,NULL,'cd6b618d-1700-4f6e-84c2-6eca7229244e'),(77,74,NULL,15,15,'craft\\elements\\Entry',1,0,'2023-04-15 08:37:32','2023-04-15 08:37:32',NULL,NULL,'861cd07d-cdca-40dc-a6bb-921f79f8186d'),(78,74,12,NULL,15,'craft\\elements\\Entry',1,0,'2023-04-15 09:33:17','2023-04-17 15:01:53',NULL,NULL,'9fbbca5f-f800-46c4-9c17-50ee04f62e91'),(79,NULL,NULL,NULL,14,'craft\\elements\\MatrixBlock',1,0,'2023-04-15 09:33:17','2023-04-15 09:33:17',NULL,'2023-04-15 09:33:20','dbe0dd1e-176e-4bb7-8823-6ae3fa226d7b'),(80,NULL,NULL,NULL,14,'craft\\elements\\MatrixBlock',1,0,'2023-04-15 09:33:20','2023-04-15 09:33:20',NULL,NULL,'a1449597-8687-4a39-b19b-21e0206ff408'),(81,NULL,NULL,NULL,14,'craft\\elements\\MatrixBlock',1,0,'2023-04-15 09:33:20','2023-04-15 09:33:20',NULL,NULL,'ec46d2d7-847c-47b9-a73c-bb460ae6939a'),(82,NULL,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:06:47','2023-04-17 13:06:47',NULL,'2023-04-17 13:06:47','1e2cb8a7-6674-45f9-80a9-4cbf228b3a1d'),(83,NULL,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:06:47','2023-04-17 13:06:47',NULL,'2023-04-17 13:06:49','fb4f58c8-11c9-432b-9164-38a9855ae7e6'),(84,NULL,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:06:47','2023-04-17 13:06:47',NULL,'2023-04-17 13:06:49','d955d759-5d4f-4054-ab15-e97795944885'),(85,NULL,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:06:49','2023-04-17 13:06:49',NULL,'2023-04-17 13:06:52','50322eba-55b1-45c6-9c35-767b7ceec858'),(86,NULL,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:06:49','2023-04-17 13:06:49',NULL,'2023-04-17 13:06:52','d2b244ee-87cf-4327-b572-d5c54d29fea3'),(87,NULL,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:06:49','2023-04-17 13:06:49',NULL,'2023-04-17 13:06:52','cb4eda62-92dd-46f8-8ccd-80c522615ea7'),(88,NULL,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:06:52','2023-04-17 13:06:52',NULL,NULL,'95e0e4a8-7666-4e91-be39-a1716f30c6ef'),(89,NULL,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:06:52','2023-04-17 13:06:52',NULL,NULL,'a8d0ac65-c25b-431e-8058-0d0f7ef5a471'),(90,NULL,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:06:52','2023-04-17 13:06:52',NULL,NULL,'3af7a091-774f-4473-a99f-644fb7b013d0'),(91,15,13,NULL,6,'craft\\elements\\Entry',1,0,'2023-04-17 13:07:27','2023-04-17 13:07:27',NULL,NULL,'916144e1-6f51-4874-afbf-bfcaca59d235'),(92,33,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:07:27','2023-04-17 13:07:27',NULL,NULL,'51739a11-b228-4f07-9de4-c1ce36e648f2'),(93,32,NULL,NULL,7,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:07:27','2023-04-17 13:07:27',NULL,NULL,'66ec521d-dec4-45ad-b044-31fcd932265e'),(94,57,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:07:27','2023-04-17 13:07:27',NULL,NULL,'c8c7261c-64d9-4ff8-9db6-c9b8574d2267'),(95,NULL,NULL,NULL,9,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:07:27','2023-04-17 13:07:27',NULL,NULL,'51285bd6-70fc-4e7d-a585-d944ae4a4ab9'),(96,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:09:04','2023-04-17 13:09:04',NULL,'2023-04-17 13:16:59','f1f6025b-4abf-4288-ace1-10ffec413d1c'),(97,NULL,NULL,NULL,16,'craft\\elements\\Entry',1,0,'2023-04-17 13:09:48','2023-04-17 15:04:11',NULL,NULL,'18262eb3-9298-4b84-81c6-4d5f475743cd'),(98,97,NULL,16,16,'craft\\elements\\Entry',1,0,'2023-04-17 13:09:48','2023-04-17 13:09:48',NULL,NULL,'8a515ff2-3384-42e3-8d95-8e594a9f3138'),(99,97,NULL,17,16,'craft\\elements\\Entry',1,0,'2023-04-17 13:11:56','2023-04-17 13:11:56',NULL,NULL,'2cb8edcf-46c3-4eba-a77b-246156eadef3'),(100,97,NULL,18,16,'craft\\elements\\Entry',1,0,'2023-04-17 13:16:26','2023-04-17 13:16:26',NULL,NULL,'cd34520c-1735-4e44-97ff-e458091aedbb'),(101,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:17:01','2023-04-17 13:17:01',NULL,NULL,'2ef71401-c4da-4a93-8752-fe39249565af'),(102,69,NULL,19,12,'craft\\elements\\Entry',1,0,'2023-04-17 13:17:01','2023-04-17 13:17:01',NULL,NULL,'3df4f0bb-af5f-45a3-acfa-af9e905689e2'),(103,101,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 13:17:01','2023-04-17 13:17:01',NULL,NULL,'76fd81d7-de2b-4589-b638-361a345563b8'),(104,NULL,NULL,NULL,18,'craft\\elements\\Entry',1,0,'2023-04-17 13:50:20','2023-04-20 14:05:32',NULL,NULL,'771e7aff-2d58-47cf-a335-b219d1c3978b'),(105,104,NULL,20,18,'craft\\elements\\Entry',1,0,'2023-04-17 13:50:20','2023-04-17 13:50:20',NULL,NULL,'53a9e829-37ec-4720-bfb3-4c6da65d1078'),(106,104,NULL,21,18,'craft\\elements\\Entry',1,0,'2023-04-17 13:57:35','2023-04-17 13:57:35',NULL,NULL,'c1c7c362-6065-4f2e-bb17-78f62dc68c92'),(107,NULL,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 15:01:47','2023-04-17 15:01:47',NULL,'2023-04-17 15:01:53','30136ddf-fcaa-4c5c-a274-c3eaa4fa27bf'),(108,NULL,NULL,NULL,13,'craft\\elements\\MatrixBlock',1,0,'2023-04-17 15:01:53','2023-04-17 15:01:53',NULL,NULL,'b8b6bcd5-42d9-417a-9b70-5a56cd0c6ffc'),(110,97,NULL,22,16,'craft\\elements\\Entry',1,0,'2023-04-17 15:04:11','2023-04-17 15:04:11',NULL,NULL,'00956be8-c88d-47ca-9dda-0a1d565b6b55'),(111,97,15,NULL,16,'craft\\elements\\Entry',1,0,'2023-04-18 07:03:13','2023-04-18 07:03:13',NULL,NULL,'683abee7-5190-4710-bc7c-2a8fe8c46288'),(112,NULL,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2023-04-18 07:03:13','2023-04-18 07:03:13',NULL,NULL,'1030b153-be08-408a-8c7c-da974056df97'),(113,104,NULL,23,18,'craft\\elements\\Entry',1,0,'2023-04-18 07:08:35','2023-04-18 07:08:35',NULL,NULL,'cd195dee-8311-4324-9e7b-636e377d3c8b'),(114,NULL,NULL,NULL,20,'craft\\elements\\GlobalSet',1,0,'2023-04-20 09:50:46','2023-04-20 09:59:19',NULL,NULL,'c8b7fbbb-7aeb-41be-95cc-75a01ef63fff'),(115,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 09:58:20','2023-04-20 09:59:19',NULL,NULL,'7b983b3f-8391-4847-bbd9-5560a771785d'),(116,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 09:58:20','2023-04-20 09:59:19',NULL,NULL,'5ccdddbc-c3f6-48f4-be06-dedb61bf199e'),(117,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 09:58:20','2023-04-20 09:59:19',NULL,NULL,'07f187f2-0028-4f3c-be79-fa7fd7e1b3d6'),(118,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 09:58:20','2023-04-20 09:59:19',NULL,NULL,'15d6fa6e-a6b0-43b8-8217-3c88f69af19a'),(119,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 09:58:20','2023-04-20 09:59:19',NULL,NULL,'349442bc-b520-46cd-9ad2-3c6be4b9bddb'),(120,69,16,NULL,12,'craft\\elements\\Entry',1,0,'2023-04-20 10:02:59','2023-04-20 10:02:59',NULL,NULL,'c045c5a7-e8c3-4593-a1c7-1f5f0cb3146e'),(121,101,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 10:02:59','2023-04-20 10:02:59',NULL,NULL,'dd252454-4b3f-4f48-aecc-4f10a283ad14'),(122,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 10:02:59','2023-04-20 10:02:59',NULL,NULL,'9bfa252e-90f5-49f3-b0bc-826a54420382'),(123,NULL,NULL,NULL,21,'craft\\elements\\GlobalSet',1,0,'2023-04-20 10:58:23','2023-04-20 13:33:46',NULL,NULL,'6a76ca1b-77bb-43e6-9170-684d67678fbb'),(124,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 11:00:54','2023-04-20 13:33:46',NULL,NULL,'2264876a-fade-41b2-8d29-b86641827129'),(125,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 11:00:54','2023-04-20 13:33:46',NULL,NULL,'f23e37d2-d18f-4ed3-b6e7-73dc6d26218a'),(126,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 11:00:54','2023-04-20 13:33:46',NULL,NULL,'7fa12f01-8f66-4244-9956-b703705eb2d8'),(127,104,NULL,24,18,'craft\\elements\\Entry',1,0,'2023-04-20 13:54:29','2023-04-20 13:54:29',NULL,NULL,'c0702de8-777c-45de-93de-e906275b6439'),(129,104,NULL,25,18,'craft\\elements\\Entry',1,0,'2023-04-20 13:54:48','2023-04-20 13:54:48',NULL,NULL,'cc6e93a2-dd21-4d07-ad90-30b243634209'),(130,104,NULL,26,18,'craft\\elements\\Entry',1,0,'2023-04-20 14:01:11','2023-04-20 14:01:11',NULL,NULL,'8a850157-f033-47b2-b80d-88e1e814e855'),(132,NULL,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 14:03:21','2023-04-20 14:03:21',NULL,'2023-04-20 14:03:32','fc57d6a0-6548-4741-a4db-c25aa2c7ecb9'),(133,104,NULL,27,18,'craft\\elements\\Entry',1,0,'2023-04-20 14:05:11','2023-04-20 14:05:11',NULL,NULL,'8c8e9ccd-2901-44b0-ad22-bbce9c49b4a7'),(134,NULL,NULL,NULL,22,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 14:05:24','2023-04-20 14:05:24',NULL,'2023-04-20 14:05:29','9d67a1cd-d3f0-4637-a54d-15f486fb56fc'),(136,NULL,NULL,NULL,22,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 14:05:32','2023-04-20 14:05:32',NULL,NULL,'41708d57-3386-432a-8d2f-f3f6805b55e3'),(137,104,NULL,28,18,'craft\\elements\\Entry',1,0,'2023-04-20 14:05:32','2023-04-20 14:05:32',NULL,NULL,'d9aa8d45-13f2-4d1e-9ffe-50a140d33d3d'),(138,136,NULL,NULL,22,'craft\\elements\\MatrixBlock',1,0,'2023-04-20 14:05:32','2023-04-20 14:05:32',NULL,NULL,'8fddfca3-1d7d-4bac-adca-ab2ff1b5f586'),(139,NULL,NULL,NULL,23,'craft\\elements\\GlobalSet',1,0,'2023-04-21 07:16:12','2023-04-21 07:47:25',NULL,NULL,'126a25e1-3618-4ad7-b367-14278602d8b8'),(140,NULL,NULL,NULL,29,'craft\\elements\\Asset',1,0,'2023-04-21 07:17:34','2023-04-21 12:16:04',NULL,NULL,'7373134b-14fd-4603-8284-035ad97c818b'),(141,NULL,NULL,NULL,24,'craft\\elements\\GlobalSet',1,0,'2023-04-21 09:12:40','2023-04-21 09:52:27',NULL,NULL,'ed5d08ec-fd83-4579-bf8c-99327715de4d'),(142,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-21 09:36:48','2023-04-21 09:52:27',NULL,NULL,'ddb66924-c3d1-4ffe-a320-8752743536a1'),(143,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-21 09:36:48','2023-04-21 09:52:27',NULL,NULL,'c311ea2a-3642-464b-95a3-6d431af043c7'),(144,NULL,NULL,NULL,2,'craft\\elements\\MatrixBlock',1,0,'2023-04-21 09:36:48','2023-04-21 09:52:27',NULL,NULL,'e2a53f02-2ab6-4eb7-be41-eb1e5e77ae67'),(145,NULL,NULL,NULL,25,'craft\\elements\\MatrixBlock',1,0,'2023-04-21 09:36:48','2023-04-21 09:52:27',NULL,NULL,'141a0c4b-c178-4997-9b5f-91ffdaca4980'),(146,NULL,NULL,NULL,25,'craft\\elements\\MatrixBlock',1,0,'2023-04-21 09:39:02','2023-04-21 09:52:27',NULL,NULL,'87d5d293-3207-44e0-956e-db00a56f3ca9'),(147,NULL,NULL,NULL,26,'craft\\elements\\MatrixBlock',1,0,'2023-04-21 09:52:27','2023-04-21 09:52:27',NULL,NULL,'a8366ec6-4259-4f19-9025-95e55de27e16'),(148,NULL,NULL,NULL,26,'craft\\elements\\MatrixBlock',1,0,'2023-04-21 09:52:27','2023-04-21 09:52:27',NULL,NULL,'3f9d0ea9-eb7a-4ce5-9890-b069d4590aa6'),(149,NULL,NULL,NULL,26,'craft\\elements\\MatrixBlock',1,0,'2023-04-21 09:52:27','2023-04-21 09:52:27',NULL,NULL,'3f09c12c-9acb-449a-8109-6febeb77e7c3'),(150,NULL,NULL,NULL,27,'craft\\elements\\GlobalSet',1,0,'2023-04-21 09:53:55','2023-04-21 12:16:08',NULL,NULL,'eeebb92e-1882-4ee1-a318-1b9faa615542'),(151,NULL,NULL,NULL,26,'craft\\elements\\MatrixBlock',1,0,'2023-04-21 10:07:29','2023-04-21 12:16:08',NULL,NULL,'264ecb61-f059-423f-b753-b8c2e55e6bb2'),(152,NULL,NULL,NULL,26,'craft\\elements\\MatrixBlock',1,0,'2023-04-21 10:07:29','2023-04-21 12:16:08',NULL,NULL,'30dbd2b4-ece0-4743-8764-ab7e20fef165'),(153,NULL,NULL,NULL,26,'craft\\elements\\MatrixBlock',1,0,'2023-04-21 10:07:29','2023-04-21 12:16:08',NULL,NULL,'7c9a13ba-9f9b-407a-9a68-8e4425daac31'),(154,NULL,NULL,NULL,28,'craft\\elements\\Asset',1,0,'2023-04-21 12:08:04','2023-04-21 12:08:04',NULL,'2023-04-21 12:10:21','2d3fb1ed-f66e-458f-973c-b22d1b0d16cd'),(155,NULL,NULL,NULL,29,'craft\\elements\\Asset',1,0,'2023-04-21 12:14:27','2023-04-21 12:14:27',NULL,NULL,'d4ad7f56-6bf7-42e5-998f-b9c0d1c4afdb');
/*!40000 ALTER TABLE `cc_elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_elements_sites`
--

LOCK TABLES `cc_elements_sites` WRITE;
/*!40000 ALTER TABLE `cc_elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-04-14 08:36:25','2023-04-14 08:36:25','acbadc5e-855a-4003-9c6f-9812e1727d5c'),(2,2,1,'__temp_epoipfcjriviberdpjmzjhuncpmtcqhfwdui','menu/__temp_epoipfcjriviberdpjmzjhuncpmtcqhfwdui',1,'2023-04-14 09:36:52','2023-04-14 09:36:52','a556b094-f693-42a7-94c9-5ab218e71e13'),(3,3,1,'__temp_iyxvgjujwpzqnvymcmwnxisvzdyhwacqbhlx','menu/__temp_iyxvgjujwpzqnvymcmwnxisvzdyhwacqbhlx',1,'2023-04-14 09:40:04','2023-04-14 09:40:04','a6cc0ff3-79e5-4cc7-bee9-e707f8b69e03'),(4,4,1,'__temp_oyeomsqmmmyqojwealntrlgxiburyvpnwpnf','menu/__temp_oyeomsqmmmyqojwealntrlgxiburyvpnwpnf',1,'2023-04-14 09:40:58','2023-04-14 09:40:58','d618f35d-d986-4e35-b85c-012d4eea08cf'),(5,5,1,NULL,NULL,1,'2023-04-14 09:41:03','2023-04-14 09:41:03','6bd76d00-d293-4320-ae86-151ec4ef9ff2'),(6,6,1,NULL,NULL,1,'2023-04-14 09:41:05','2023-04-14 09:41:05','c3484a15-ba34-49d7-86a0-dfa37f8ef5c9'),(7,7,1,NULL,NULL,1,'2023-04-14 09:41:05','2023-04-14 09:41:05','eeef1f00-5795-4d8e-a244-cb555f0f5b79'),(8,8,1,NULL,NULL,1,'2023-04-14 09:41:08','2023-04-14 09:41:08','8c25b69b-49d3-4107-9400-b5e50d38e70d'),(9,9,1,NULL,NULL,1,'2023-04-14 09:41:08','2023-04-14 09:41:08','688d544e-8498-4dc5-8b23-8d6db3d6d18e'),(10,10,1,NULL,NULL,1,'2023-04-14 09:41:08','2023-04-14 09:41:08','282d12f4-105e-41b3-80d7-a9840b81e10a'),(11,11,1,'header','header',1,'2023-04-14 10:06:30','2023-04-14 10:06:30','77071898-459d-462a-abc8-d8e2bb2d6992'),(12,12,1,'header','header',1,'2023-04-14 10:06:30','2023-04-14 10:06:30','ea4dc808-70b9-4eec-9d26-f7551a3a1dd9'),(13,13,1,'__temp_lzxeycghvfnbomtgyrokeabjnbffnzktqioh','header',1,'2023-04-14 10:17:08','2023-04-14 10:17:08','60f2d160-7589-4bd2-a99e-e446bd9ad35b'),(14,14,1,'__temp_fianahkxftciwtoqvfowmiafodeeppkgeqya','header',1,'2023-04-14 10:18:14','2023-04-14 10:18:14','d5c8f476-a0d8-4b9f-904a-017a8b568264'),(15,15,1,'help-center','help-center',1,'2023-04-14 10:33:45','2023-04-14 10:33:45','79101a09-c7dd-4f77-8095-af2f30a3a411'),(16,16,1,'help-center','help-center',1,'2023-04-14 10:33:45','2023-04-14 10:33:45','e34ab9f5-7f42-486f-a057-5e4d43092972'),(17,17,1,'help-center','help-center',1,'2023-04-14 10:35:18','2023-04-14 10:35:18','60b6fba8-3662-47f2-bc2f-a09d93f8e770'),(18,18,1,'help-center','help-center',1,'2023-04-14 10:45:55','2023-04-14 10:45:55','b470f3fa-57f2-4d95-947c-453b2c55b621'),(20,20,1,NULL,NULL,1,'2023-04-14 10:46:15','2023-04-14 10:46:15','c0d8d9de-7f96-4d8c-bc8b-f9ca62e881f5'),(21,21,1,NULL,NULL,1,'2023-04-14 10:46:15','2023-04-14 10:46:15','80005630-0bb0-4d4b-976a-695a8f221529'),(22,22,1,NULL,NULL,1,'2023-04-14 10:46:30','2023-04-14 10:46:30','6ca5aff1-cca3-459f-a054-2f9528379571'),(23,23,1,NULL,NULL,1,'2023-04-14 10:46:30','2023-04-14 10:46:30','4c4c0cb7-b539-4860-8bd9-2e728a832dd0'),(24,24,1,NULL,NULL,1,'2023-04-14 10:46:35','2023-04-14 10:46:35','b9ea1004-0092-4140-9e58-b3cfe76f3231'),(25,25,1,NULL,NULL,1,'2023-04-14 10:46:35','2023-04-14 10:46:35','749fba87-3033-4743-9b93-bcd1ac8342f4'),(26,26,1,NULL,NULL,1,'2023-04-14 10:46:42','2023-04-14 10:46:42','a3e0a358-20b1-4af4-86bf-2f21dd0ba5b6'),(27,27,1,NULL,NULL,1,'2023-04-14 10:46:42','2023-04-14 10:46:42','14844b76-a257-4808-bcb1-39522cf3d43f'),(28,28,1,NULL,NULL,1,'2023-04-14 10:46:48','2023-04-14 10:46:48','cd8e92e6-d533-49b9-b2d9-3be2c45aeca8'),(29,29,1,NULL,NULL,1,'2023-04-14 10:46:48','2023-04-14 10:46:48','f037adb1-576e-4d63-918e-b921d176baff'),(32,32,1,NULL,NULL,1,'2023-04-14 10:46:49','2023-04-14 10:46:49','a60e5614-e724-4420-9f6c-0660b5e8de09'),(33,33,1,NULL,NULL,1,'2023-04-14 10:46:49','2023-04-14 10:46:49','4eb66076-5cc8-4ed3-9711-df9cf90b6cd8'),(34,34,1,'help-center','help-center',1,'2023-04-14 10:46:49','2023-04-14 10:46:49','2b6b5387-691e-4691-a927-861f62d34723'),(35,35,1,NULL,NULL,1,'2023-04-14 10:46:49','2023-04-14 10:46:49','f95f5382-4411-4499-aafd-e957f98a317e'),(36,36,1,NULL,NULL,1,'2023-04-14 10:46:49','2023-04-14 10:46:49','a49a8670-8e08-422f-b1a5-a91db3c3a05d'),(40,40,1,'help-center','help-center',1,'2023-04-14 10:47:09','2023-04-14 10:47:09','8a5eb4cb-2442-45be-9fc2-8506898f45ff'),(41,41,1,NULL,NULL,1,'2023-04-14 10:47:09','2023-04-14 10:47:09','c1698e8a-cd8a-4eb9-960a-61ba32f7dd5a'),(42,42,1,NULL,NULL,1,'2023-04-14 10:47:09','2023-04-14 10:47:09','19b1a393-8702-4d7a-a2e0-09e6e24b3d43'),(43,43,1,'help-center','help-center',1,'2023-04-14 10:47:49','2023-04-14 10:47:49','e56438fa-62f2-4f45-b234-af2abc943f37'),(44,44,1,NULL,NULL,1,'2023-04-14 10:47:49','2023-04-14 10:47:49','6bd8de83-227e-4a5b-b5fb-b53d2fe10e08'),(45,45,1,NULL,NULL,1,'2023-04-14 10:47:49','2023-04-14 10:47:49','f417ebea-16ba-473c-9ded-603072bb9ba0'),(49,49,1,NULL,NULL,1,'2023-04-14 10:49:21','2023-04-14 10:49:21','f6a336de-24e9-4e59-bcc8-a24fe97a7d76'),(50,50,1,NULL,NULL,1,'2023-04-14 10:49:25','2023-04-14 10:49:25','19d2cc26-c020-4a0b-a9cf-0a81a7b3366f'),(51,51,1,NULL,NULL,1,'2023-04-14 10:49:25','2023-04-14 10:49:25','f826d4c0-fc0e-4c89-a48e-3c3ef631c6a6'),(52,52,1,'help-center','help-center',1,'2023-04-14 10:51:08','2023-04-14 10:51:08','1f9da7df-b075-456c-8e6d-7f119d1324ab'),(53,53,1,NULL,NULL,1,'2023-04-14 10:51:08','2023-04-14 10:51:08','3afc9169-145c-4001-8f0d-884579171542'),(54,54,1,NULL,NULL,1,'2023-04-14 10:51:08','2023-04-14 10:51:08','89afdad5-cb6d-45a4-8d6d-4a53a15f36e8'),(55,55,1,NULL,NULL,1,'2023-04-14 10:51:31','2023-04-14 10:51:31','95529a12-0a70-45f7-b23d-5dbdf8647afe'),(57,57,1,NULL,NULL,1,'2023-04-14 10:51:45','2023-04-14 10:51:45','704ba6aa-180f-4d68-9cf4-3744e72a2259'),(58,58,1,'help-center','help-center',1,'2023-04-14 10:51:45','2023-04-14 10:51:45','6ea2f74f-7851-4577-ae04-0905e99725a7'),(59,59,1,NULL,NULL,1,'2023-04-14 10:51:45','2023-04-14 10:51:45','4f9d00ae-0730-4b5b-8ac5-d9033794de52'),(60,60,1,NULL,NULL,1,'2023-04-14 10:51:45','2023-04-14 10:51:45','895a2801-5efa-4d72-b4ae-ecbef5c008d7'),(61,61,1,NULL,NULL,1,'2023-04-14 10:51:45','2023-04-14 10:51:45','214ed9d3-8326-4f72-971c-b9c43d0325f5'),(62,62,1,'__temp_aayngntnbxlkykynvvxamdpinijzthuarvul','header-section/__temp_aayngntnbxlkykynvvxamdpinijzthuarvul',1,'2023-04-15 04:56:46','2023-04-15 04:56:46','b8f6446e-56a7-49a7-9d94-494bd0a9253f'),(63,63,1,'__temp_kmiynjqgfdqigjobanyyzsleonpfqqwjekqu','header-section/__temp_kmiynjqgfdqigjobanyyzsleonpfqqwjekqu',1,'2023-04-15 04:57:21','2023-04-15 04:57:21','3ad01766-7d54-4594-b6b4-3ecbc4ade378'),(64,64,1,'yes','menu/yes',1,'2023-04-15 04:57:41','2023-04-15 04:57:41','680932f8-8406-4b46-8c8e-f668f4b48940'),(65,65,1,'yes','menu/yes',1,'2023-04-15 04:57:41','2023-04-15 04:57:41','b3e3f9c0-4b18-4aee-8439-80c372eaab32'),(66,66,1,NULL,NULL,1,'2023-04-15 04:59:03','2023-04-15 04:59:03','ea2fb254-811c-4819-89be-907191266273'),(67,67,1,NULL,NULL,1,'2023-04-15 04:59:05','2023-04-15 04:59:05','2de829c1-c2e7-4605-af62-73e986cea913'),(68,68,1,NULL,NULL,1,'2023-04-15 04:59:05','2023-04-15 04:59:05','4da405b1-45d7-4420-b136-be647cb1e4f7'),(69,69,1,'header-visitor','header-visitor',1,'2023-04-15 08:16:42','2023-04-15 08:16:42','7998b6c9-6e64-4c58-802c-dd79dcdabf9d'),(70,70,1,'header-visitor','header-visitor',1,'2023-04-15 08:16:42','2023-04-15 08:16:42','12496fa1-c7ea-4d5d-86b6-e615e4565855'),(71,71,1,'header-visitor','header-visitor',1,'2023-04-15 08:17:04','2023-04-15 08:17:04','4a776115-66ad-4178-8131-0edc8b24e0ad'),(74,74,1,'home-page','home-page',1,'2023-04-15 08:36:25','2023-04-15 08:36:25','1c14e000-2c24-45f8-9d66-eb6ef64d8a78'),(75,75,1,'home-page','home-page',1,'2023-04-15 08:36:25','2023-04-15 08:36:25','d03c4aaa-b28d-4bc5-b45a-5c071c964d92'),(76,76,1,'home-page','home-page',1,'2023-04-15 08:37:00','2023-04-15 08:37:00','5163cfb8-cd55-4062-abbe-dc28d8dcea39'),(77,77,1,'home-page','home-page',1,'2023-04-15 08:37:32','2023-04-15 08:37:32','ea9e6235-a30a-4028-aed9-774198ed4d75'),(78,78,1,'home-page','home-page',1,'2023-04-15 09:33:17','2023-04-15 09:33:17','58c26f07-5fba-4be2-a0e7-c500bf0fdc2f'),(79,79,1,NULL,NULL,1,'2023-04-15 09:33:17','2023-04-15 09:33:17','d037e478-ec07-48fb-a772-5b1c3338cd8b'),(80,80,1,NULL,NULL,1,'2023-04-15 09:33:20','2023-04-15 09:33:20','92201da0-cd8b-4287-8ed6-0331f8bfdc90'),(81,81,1,NULL,NULL,1,'2023-04-15 09:33:20','2023-04-15 09:33:20','71022186-e6bd-4881-920b-5103108314af'),(82,82,1,NULL,NULL,1,'2023-04-17 13:06:47','2023-04-17 13:06:47','1296b590-1d31-41b4-a694-1731e7d2f534'),(83,83,1,NULL,NULL,1,'2023-04-17 13:06:47','2023-04-17 13:06:47','24e2592f-0e01-44af-b02f-2d33bda5e241'),(84,84,1,NULL,NULL,1,'2023-04-17 13:06:47','2023-04-17 13:06:47','bfcd212c-9e54-4ae0-bad1-4193a8bf0776'),(85,85,1,NULL,NULL,1,'2023-04-17 13:06:49','2023-04-17 13:06:49','8133c7d3-e9a1-4386-9f3b-cf32bb0f35d1'),(86,86,1,NULL,NULL,1,'2023-04-17 13:06:49','2023-04-17 13:06:49','4c4780e7-e748-4939-9e2e-3224567c539e'),(87,87,1,NULL,NULL,1,'2023-04-17 13:06:49','2023-04-17 13:06:49','271c786e-bb38-4d5b-870a-808d62e69fbe'),(88,88,1,NULL,NULL,1,'2023-04-17 13:06:52','2023-04-17 13:06:52','3efeac38-f6a1-4d1c-93fc-08816f4baa20'),(89,89,1,NULL,NULL,1,'2023-04-17 13:06:52','2023-04-17 13:06:52','7a408add-6398-4696-ade1-75f194e67b62'),(90,90,1,NULL,NULL,1,'2023-04-17 13:06:52','2023-04-17 13:06:52','e5937f0a-3831-43e4-beff-2e0b3bb21c80'),(91,91,1,'help-center','help-center',1,'2023-04-17 13:07:27','2023-04-17 13:07:27','e669b16d-9a25-4482-b243-a0b64aa01c58'),(92,92,1,NULL,NULL,1,'2023-04-17 13:07:27','2023-04-17 13:07:27','8d963f4a-5fc2-473c-989a-4ca5ae041385'),(93,93,1,NULL,NULL,1,'2023-04-17 13:07:27','2023-04-17 13:07:27','11e8b05c-5e1c-418a-b0cf-f6e47392bb88'),(94,94,1,NULL,NULL,1,'2023-04-17 13:07:27','2023-04-17 13:07:27','381d1bf1-117f-468d-a689-f4aede4f902d'),(95,95,1,NULL,NULL,1,'2023-04-17 13:07:27','2023-04-17 13:07:27','ad47972e-848a-474e-ba81-e4d7d95f1cf1'),(96,96,1,NULL,NULL,1,'2023-04-17 13:09:04','2023-04-17 13:09:04','aa6d4e8c-5c79-4d04-9486-f16321e861f5'),(97,97,1,'get-started','get-started',1,'2023-04-17 13:09:48','2023-04-17 13:09:48','485eec3c-e357-410d-a7a1-9dd69e6e952f'),(98,98,1,'get-started','get-started',1,'2023-04-17 13:09:48','2023-04-17 13:09:48','fe873869-ccc1-432d-9a0f-8fe463d9f8ab'),(99,99,1,'get-started','get-started',1,'2023-04-17 13:11:56','2023-04-17 13:11:56','f26d447b-8cce-408b-a8c7-5d2abced494c'),(100,100,1,'get-started','get-started',1,'2023-04-17 13:16:26','2023-04-17 13:16:26','5c054009-ce26-4d05-8790-1576235c6e59'),(101,101,1,NULL,NULL,1,'2023-04-17 13:17:01','2023-04-17 13:17:01','a8569c5c-ef5e-41fe-9392-0f8d6a056468'),(102,102,1,'header-visitor','header-visitor',1,'2023-04-17 13:17:01','2023-04-17 13:17:01','32e2d494-44eb-418a-9001-37a19f387301'),(103,103,1,NULL,NULL,1,'2023-04-17 13:17:01','2023-04-17 13:17:01','15c54b8f-4250-4a95-814b-a04a2b554e22'),(104,104,1,'about-us','about-us',1,'2023-04-17 13:50:20','2023-04-17 13:50:20','b2461785-75c3-4048-9b9c-95831c2c9251'),(105,105,1,'about-us','about-us',1,'2023-04-17 13:50:20','2023-04-17 13:50:20','4f58d5bb-88c8-4dea-90fb-16fc865b5e49'),(106,106,1,'about-us','about-us',1,'2023-04-17 13:57:35','2023-04-17 13:57:35','2b216e80-9b18-4013-8678-6ddda158238c'),(107,107,1,NULL,NULL,1,'2023-04-17 15:01:47','2023-04-17 15:01:47','4646ae32-4069-4f3a-b420-abd3a36a3ab7'),(108,108,1,NULL,NULL,1,'2023-04-17 15:01:53','2023-04-17 15:01:53','f3193bd5-eca6-4bd0-851c-d0231d54f2ce'),(110,110,1,'get-started','get-started',1,'2023-04-17 15:04:11','2023-04-17 15:04:11','f21b3e01-e246-47a8-9d23-77cb378263e6'),(111,111,1,'get-started','get-started',1,'2023-04-18 07:03:13','2023-04-18 07:03:13','f1b52943-1499-4c32-ad26-a431eaa1a200'),(112,112,1,NULL,NULL,1,'2023-04-18 07:03:13','2023-04-18 07:03:13','5cc6fd53-75cb-4313-996c-ecd58d2a2ba8'),(113,113,1,'about-us','about-us',1,'2023-04-18 07:08:35','2023-04-18 07:08:35','8db6a17d-c746-400c-8619-f6b2344f0eea'),(114,114,1,NULL,NULL,1,'2023-04-20 09:50:46','2023-04-20 09:50:46','b7b6226b-26ae-4b25-9ef3-c6108eb28b1b'),(115,115,1,NULL,NULL,1,'2023-04-20 09:58:20','2023-04-20 09:58:20','e1283a27-3a43-40c4-a3b6-8114fdfee68b'),(116,116,1,NULL,NULL,1,'2023-04-20 09:58:20','2023-04-20 09:58:20','338a4ea9-6305-4719-bb32-520eed3bd612'),(117,117,1,NULL,NULL,1,'2023-04-20 09:58:20','2023-04-20 09:58:20','24120c1b-fa6d-4808-950f-c07b47c7204c'),(118,118,1,NULL,NULL,1,'2023-04-20 09:58:20','2023-04-20 09:58:20','bb38f94f-7fd2-4a22-adf9-3692b7925d85'),(119,119,1,NULL,NULL,1,'2023-04-20 09:58:20','2023-04-20 09:58:20','bb15f0ed-63fb-4816-b790-d5981d80fefe'),(120,120,1,'header-visitor','header-visitor',1,'2023-04-20 10:02:59','2023-04-20 10:02:59','54c1b843-0630-4137-959d-81388635a9d1'),(121,121,1,NULL,NULL,1,'2023-04-20 10:02:59','2023-04-20 10:02:59','dc4731f5-6630-4eae-805b-cfd357a663ec'),(122,122,1,NULL,NULL,1,'2023-04-20 10:02:59','2023-04-20 10:02:59','ccd9ff3a-a721-433d-b8ff-213d2a5af84d'),(123,123,1,NULL,NULL,1,'2023-04-20 10:58:23','2023-04-20 10:58:23','b5075ccc-d19e-4373-9d58-93efbeb11922'),(124,124,1,NULL,NULL,1,'2023-04-20 11:00:54','2023-04-20 11:00:54','931caaf3-0e5a-4c25-adca-b63e0a223151'),(125,125,1,NULL,NULL,1,'2023-04-20 11:00:54','2023-04-20 11:00:54','e9f1063c-daf6-42d6-bb95-eb039d67506a'),(126,126,1,NULL,NULL,1,'2023-04-20 11:00:54','2023-04-20 11:00:54','43924b62-7d6c-4cfc-b2ff-6ac11c516470'),(127,127,1,'about-us','about-us',1,'2023-04-20 13:54:29','2023-04-20 13:54:29','692e1bfa-9e3e-463e-94fe-e9720d7b8b24'),(129,129,1,'about-us','about-us',1,'2023-04-20 13:54:48','2023-04-20 13:54:48','bb9abc5f-869c-49b2-921b-b32dbe325862'),(130,130,1,'about-us','about-us',1,'2023-04-20 14:01:11','2023-04-20 14:01:11','dd7c3d3f-95b9-4ff0-ac4c-a0a827575de6'),(132,132,1,NULL,NULL,1,'2023-04-20 14:03:21','2023-04-20 14:03:21','52073b23-1a1c-4964-82a8-4efe13c616e6'),(133,133,1,'about-us','about-us',1,'2023-04-20 14:05:11','2023-04-20 14:05:11','6d90f5b4-495c-4fe3-8283-2ed263e3448f'),(134,134,1,NULL,NULL,1,'2023-04-20 14:05:24','2023-04-20 14:05:24','d52aa118-1759-4556-9674-63ae70d88f37'),(136,136,1,NULL,NULL,1,'2023-04-20 14:05:32','2023-04-20 14:05:32','463956d7-edb3-4220-b1d9-8b453ea8af9d'),(137,137,1,'about-us','about-us',1,'2023-04-20 14:05:32','2023-04-20 14:05:32','4ee350b7-8aed-4d1b-821a-898950e5c943'),(138,138,1,NULL,NULL,1,'2023-04-20 14:05:32','2023-04-20 14:05:32','d888123d-727f-41dc-b753-381213f52677'),(139,139,1,NULL,NULL,1,'2023-04-21 07:16:12','2023-04-21 07:16:12','41af0eda-d3b3-4855-939b-f1224bae7f1f'),(140,140,1,NULL,NULL,1,'2023-04-21 07:17:34','2023-04-21 07:17:34','fd34db66-e9b7-441a-be52-2e6266b0f7c5'),(141,141,1,NULL,NULL,1,'2023-04-21 09:12:40','2023-04-21 09:12:40','c77d4df9-8d90-4551-80cd-074480ab6b03'),(142,142,1,NULL,NULL,1,'2023-04-21 09:36:48','2023-04-21 09:36:48','27843690-200a-4551-8009-08f915a186af'),(143,143,1,NULL,NULL,1,'2023-04-21 09:36:48','2023-04-21 09:36:48','a39c6562-c352-4a72-b943-535e44183955'),(144,144,1,NULL,NULL,1,'2023-04-21 09:36:48','2023-04-21 09:36:48','9b652c18-8f5e-47f1-90ed-b33637d8cc68'),(145,145,1,NULL,NULL,1,'2023-04-21 09:36:48','2023-04-21 09:36:48','9510135f-8b5d-4e27-9d7e-045daebb459e'),(146,146,1,NULL,NULL,1,'2023-04-21 09:39:02','2023-04-21 09:39:02','795ea7ee-4d38-4fca-b70f-29e294ad45c4'),(147,147,1,NULL,NULL,1,'2023-04-21 09:52:27','2023-04-21 09:52:27','9792bfd1-e6d0-4e05-b11d-bfc8c86a2e29'),(148,148,1,NULL,NULL,1,'2023-04-21 09:52:27','2023-04-21 09:52:27','3dc09251-471c-4660-856a-9ac76d919d27'),(149,149,1,NULL,NULL,1,'2023-04-21 09:52:27','2023-04-21 09:52:27','f7776f32-e99e-4e06-b392-4078d0ede046'),(150,150,1,NULL,NULL,1,'2023-04-21 09:53:55','2023-04-21 09:53:55','0ad85540-771d-449d-afa4-f63e7c7e8c3d'),(151,151,1,NULL,NULL,1,'2023-04-21 10:07:29','2023-04-21 10:07:29','9280856f-62b7-4653-a31b-f52ab289bf90'),(152,152,1,NULL,NULL,1,'2023-04-21 10:07:29','2023-04-21 10:07:29','ff7b9f12-e3ad-4ec0-947a-e7b17f3c3015'),(153,153,1,NULL,NULL,1,'2023-04-21 10:07:29','2023-04-21 10:07:29','7138e197-d356-4470-8003-52a89d21ff1d'),(154,154,1,NULL,NULL,1,'2023-04-21 12:08:04','2023-04-21 12:08:04','dbf81e59-0bca-4a08-ae86-0f11524aa309'),(155,155,1,NULL,NULL,1,'2023-04-21 12:14:27','2023-04-21 12:14:27','6b826b6b-2823-4fea-8306-01bc4aa3187a');
/*!40000 ALTER TABLE `cc_elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_entries`
--

LOCK TABLES `cc_entries` WRITE;
/*!40000 ALTER TABLE `cc_entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_entries` VALUES (2,1,NULL,1,1,NULL,NULL,1,'2023-04-14 09:36:52','2023-04-14 09:36:52','1fc375bf-23d1-4b63-af32-6a09bcfb6b6a'),(3,1,NULL,1,1,NULL,NULL,1,'2023-04-14 09:40:04','2023-04-14 09:40:04','4a119612-0184-4229-88a4-d3995138398e'),(4,1,NULL,2,1,NULL,NULL,1,'2023-04-14 09:40:58','2023-04-14 09:40:58','bad58c15-9458-4643-b322-f077b83ed209'),(11,2,NULL,3,1,'2023-04-14 10:06:00',NULL,0,'2023-04-14 10:06:30','2023-04-14 10:08:40','0a7111ff-3096-40e8-80ec-0db1ffb19204'),(12,2,NULL,3,NULL,'2023-04-14 10:06:00',NULL,NULL,'2023-04-14 10:06:30','2023-04-14 10:06:30','1993a899-146a-4161-b40b-40a4ed2c7916'),(13,2,NULL,3,1,'2023-04-14 10:17:00',NULL,1,'2023-04-14 10:17:08','2023-04-14 10:17:08','eb7b3d69-32f2-4e8c-ab51-953c786b118b'),(14,2,NULL,4,1,'2023-04-14 10:18:00',NULL,1,'2023-04-14 10:18:14','2023-04-14 10:18:14','ac55fda9-77bc-4e24-8e98-f2082a251825'),(15,3,NULL,5,NULL,'2023-04-14 10:33:00',NULL,NULL,'2023-04-14 10:33:45','2023-04-14 10:33:45','73b338c6-bbe5-4676-84fa-fd1f8b406c6a'),(16,3,NULL,5,NULL,'2023-04-14 10:33:00',NULL,NULL,'2023-04-14 10:33:45','2023-04-14 10:33:45','290b5fbe-2567-4a8e-87cb-3a0206747ae7'),(17,3,NULL,5,NULL,'2023-04-14 10:33:00',NULL,NULL,'2023-04-14 10:35:18','2023-04-14 10:35:18','4ae49bbf-55fb-4796-8de2-aea64cd87d95'),(18,3,NULL,5,NULL,'2023-04-14 10:33:00',NULL,NULL,'2023-04-14 10:45:55','2023-04-14 10:45:55','57966858-8614-475e-be7f-53dd2ac757c3'),(34,3,NULL,5,NULL,'2023-04-14 10:33:00',NULL,NULL,'2023-04-14 10:46:49','2023-04-14 10:46:49','c04fb19f-0a8c-4763-9c3e-b5f1ecae535c'),(40,3,NULL,5,NULL,'2023-04-14 10:33:00',NULL,NULL,'2023-04-14 10:47:09','2023-04-14 10:47:09','7cd6e9ee-363c-4211-9bda-341747b6f0ab'),(43,3,NULL,5,NULL,'2023-04-14 10:33:00',NULL,NULL,'2023-04-14 10:47:49','2023-04-14 10:47:49','63631bec-ae9b-423d-af43-0d137fb7fef7'),(52,3,NULL,5,NULL,'2023-04-14 10:33:00',NULL,NULL,'2023-04-14 10:51:08','2023-04-14 10:51:08','38a6847c-a416-49c7-9a54-e1ad4c8d580e'),(58,3,NULL,5,NULL,'2023-04-14 10:33:00',NULL,NULL,'2023-04-14 10:51:45','2023-04-14 10:51:45','2ca87390-9e9d-4552-adac-7bbfa911e2ee'),(62,4,NULL,6,1,'2023-04-15 04:56:00',NULL,1,'2023-04-15 04:56:46','2023-04-15 04:56:46','31aa2cd0-41bf-4910-b894-6401a232ed85'),(63,4,NULL,7,1,'2023-04-15 04:57:00',NULL,1,'2023-04-15 04:57:21','2023-04-15 04:57:28','24b68808-cc1f-4c56-acc6-c4a26c3f851c'),(64,1,NULL,2,1,'2023-04-15 04:57:00',NULL,1,'2023-04-15 04:57:41','2023-04-15 04:57:41','6f815aee-352b-4d12-8aeb-a3dec4ee2d9e'),(65,1,NULL,2,1,'2023-04-15 04:57:00',NULL,NULL,'2023-04-15 04:57:41','2023-04-15 04:57:41','93159463-11be-49c9-a002-6678efdd3fe7'),(69,5,NULL,8,NULL,'2023-04-15 08:16:00',NULL,NULL,'2023-04-15 08:16:42','2023-04-15 08:16:42','5ab4979d-ede9-40d6-be05-2688cfefa184'),(70,5,NULL,8,NULL,'2023-04-15 08:16:00',NULL,NULL,'2023-04-15 08:16:42','2023-04-15 08:16:42','5d272386-9783-4563-9329-0030fd737fc9'),(71,5,NULL,8,NULL,'2023-04-15 08:16:00',NULL,NULL,'2023-04-15 08:17:04','2023-04-15 08:17:04','8f8407ef-ee36-467e-b897-ada755cd5bc0'),(74,6,NULL,9,NULL,'2023-04-15 08:36:00',NULL,NULL,'2023-04-15 08:36:25','2023-04-15 08:36:25','c02c2109-6d3b-4ab7-8e2b-6488625535c4'),(75,6,NULL,9,NULL,'2023-04-15 08:36:00',NULL,NULL,'2023-04-15 08:36:25','2023-04-15 08:36:25','e263751d-5da8-401f-b772-48fd8a10b8d7'),(76,6,NULL,9,NULL,'2023-04-15 08:36:00',NULL,NULL,'2023-04-15 08:37:00','2023-04-15 08:37:00','fb39f460-71ba-4e42-99cc-ba6b72f2439e'),(77,6,NULL,9,NULL,'2023-04-15 08:36:00',NULL,NULL,'2023-04-15 08:37:32','2023-04-15 08:37:32','00a14e18-91e4-4c6d-b439-f56b63c367bc'),(78,6,NULL,9,NULL,'2023-04-15 08:36:00',NULL,NULL,'2023-04-15 09:33:17','2023-04-15 09:33:17','594c4508-6ac2-439d-ab3a-2ea782283c6c'),(91,3,NULL,5,NULL,'2023-04-14 10:33:00',NULL,NULL,'2023-04-17 13:07:27','2023-04-17 13:07:27','3e38ddc0-a84d-4569-9d3b-44d7f3a6d25c'),(97,7,NULL,10,NULL,'2023-04-17 13:09:00',NULL,NULL,'2023-04-17 13:09:48','2023-04-17 13:09:48','75256be2-f9df-4a32-8250-74ba280ebafc'),(98,7,NULL,10,NULL,'2023-04-17 13:09:00',NULL,NULL,'2023-04-17 13:09:48','2023-04-17 13:09:48','f3285535-3280-4e0f-8ead-17bd081cac0d'),(99,7,NULL,10,NULL,'2023-04-17 13:09:00',NULL,NULL,'2023-04-17 13:11:56','2023-04-17 13:11:56','c5c6ccaa-2fdd-4d91-bcf0-bd7697cc149c'),(100,7,NULL,10,NULL,'2023-04-17 13:09:00',NULL,NULL,'2023-04-17 13:16:26','2023-04-17 13:16:26','7ff4f119-a620-45b8-97ae-5e4ccd2fb714'),(102,5,NULL,8,NULL,'2023-04-15 08:16:00',NULL,NULL,'2023-04-17 13:17:01','2023-04-17 13:17:01','17686386-413c-420c-ab93-19175b6f0812'),(104,8,NULL,11,NULL,'2023-04-17 13:50:00',NULL,NULL,'2023-04-17 13:50:20','2023-04-17 13:50:20','70a4ba23-75f4-4ee1-8e9b-34311cb8a5da'),(105,8,NULL,11,NULL,'2023-04-17 13:50:00',NULL,NULL,'2023-04-17 13:50:20','2023-04-17 13:50:20','5446ab63-b6cd-45d4-858b-b6e72860272a'),(106,8,NULL,11,NULL,'2023-04-17 13:50:00',NULL,NULL,'2023-04-17 13:57:35','2023-04-17 13:57:35','01be4c4b-02ec-4114-8385-d9fb0aedbbc4'),(110,7,NULL,10,NULL,'2023-04-17 13:09:00',NULL,NULL,'2023-04-17 15:04:11','2023-04-17 15:04:11','ea6c6256-ea15-4b01-a8db-147f7f04fcfb'),(111,7,NULL,10,NULL,'2023-04-17 13:09:00',NULL,NULL,'2023-04-18 07:03:13','2023-04-18 07:03:13','124dfbf8-8db3-4b44-9d9e-0d04c6e10549'),(113,8,NULL,11,NULL,'2023-04-17 13:50:00',NULL,NULL,'2023-04-18 07:08:35','2023-04-18 07:08:35','6ad461b5-b436-4ebc-8fa0-caa69c450a44'),(120,5,NULL,8,NULL,'2023-04-15 08:16:00',NULL,NULL,'2023-04-20 10:02:59','2023-04-20 10:02:59','ff177ae3-c674-439c-8356-d7a942e44df4'),(127,8,NULL,11,NULL,'2023-04-17 13:50:00',NULL,NULL,'2023-04-20 13:54:29','2023-04-20 13:54:29','ae41838e-7dbe-4dcb-8dcf-cb655b2acc47'),(129,8,NULL,11,NULL,'2023-04-17 13:50:00',NULL,NULL,'2023-04-20 13:54:48','2023-04-20 13:54:48','cb15ba06-383e-4a5c-80ab-937c6b5634c1'),(130,8,NULL,11,NULL,'2023-04-17 13:50:00',NULL,NULL,'2023-04-20 14:01:11','2023-04-20 14:01:11','e2af3a43-671a-487b-9849-2338d6e2abf6'),(133,8,NULL,11,NULL,'2023-04-17 13:50:00',NULL,NULL,'2023-04-20 14:05:11','2023-04-20 14:05:11','76c1fe6e-7d73-4c09-8826-bd33513d418a'),(137,8,NULL,11,NULL,'2023-04-17 13:50:00',NULL,NULL,'2023-04-20 14:05:32','2023-04-20 14:05:32','699bf001-705c-459d-a8f0-b1c982c30673');
/*!40000 ALTER TABLE `cc_entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_entrytypes`
--

LOCK TABLES `cc_entrytypes` WRITE;
/*!40000 ALTER TABLE `cc_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_entrytypes` VALUES (1,1,1,'Default','default',1,'site',NULL,NULL,1,'2023-04-14 09:24:36','2023-04-14 09:24:36','2023-04-14 09:40:50','685016fe-f700-40ab-aeb8-468b93d02daa'),(2,1,3,'Menus','menus',1,'site',NULL,NULL,2,'2023-04-14 09:40:44','2023-04-14 09:40:44','2023-04-15 08:16:16','e50c6211-ae14-4c77-8d2d-1062f0008fe7'),(3,2,4,'Header','header',0,'site',NULL,'{section.name|raw}',1,'2023-04-14 10:06:30','2023-04-14 10:06:30','2023-04-14 10:18:08','b7bddc51-c573-414d-a91c-1ef4a5935e19'),(4,2,5,'Header Entry','headerEntry',1,'site',NULL,NULL,2,'2023-04-14 10:17:58','2023-04-14 10:17:58','2023-04-15 08:15:43','0cec7345-fafd-4c09-977b-fbd06cbec482'),(5,3,6,'Help Center','helpCenter',0,'site',NULL,'{section.name|raw}',1,'2023-04-14 10:33:45','2023-04-14 10:33:45',NULL,'52317217-7a3d-4e66-973b-991536653bde'),(6,4,10,'Default','default',1,'site',NULL,NULL,1,'2023-04-15 04:51:59','2023-04-15 04:51:59','2023-04-15 04:58:39','44c6a58d-d3af-4ffe-868a-75433b8f9b67'),(7,4,11,'HeaderVisitorEntry','headervisitorentry',1,'site',NULL,NULL,2,'2023-04-15 04:56:23','2023-04-15 04:56:23','2023-04-15 08:15:45','dc57b1e2-2f0c-48e3-8e85-8914127a9621'),(8,5,12,'Header Visitor','headerVisitor',0,'site',NULL,'{section.name|raw}',1,'2023-04-15 08:16:42','2023-04-15 08:16:42',NULL,'088625d4-8df7-4f63-b315-e07525005932'),(9,6,15,'Home Page ','homePage',0,'site',NULL,'{section.name|raw}',1,'2023-04-15 08:36:25','2023-04-15 08:36:25',NULL,'8ce99f2e-1bf8-4401-9ecd-715010b81de1'),(10,7,16,'Get Started','getStarted',0,'site',NULL,'{section.name|raw}',1,'2023-04-17 13:09:48','2023-04-17 13:16:26',NULL,'88c1dbc3-61fc-439b-b8b8-30a6de6adcdd'),(11,8,18,'About us','aboutUs',0,'site',NULL,'{section.name|raw}',1,'2023-04-17 13:50:20','2023-04-17 13:50:20',NULL,'537393bb-9422-4053-82f1-f1b108c8d031');
/*!40000 ALTER TABLE `cc_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_fieldgroups`
--

LOCK TABLES `cc_fieldgroups` WRITE;
/*!40000 ALTER TABLE `cc_fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_fieldgroups` VALUES (1,'Common','2023-04-14 08:36:25','2023-04-14 08:36:25',NULL,'5cbe1461-3ba4-4156-9696-16a2139da724'),(2,'Menu Group','2023-04-14 09:32:32','2023-04-14 10:02:31',NULL,'630ed674-868f-4765-a976-0c129be81a0c'),(3,'Header','2023-04-14 10:15:47','2023-04-14 10:15:47','2023-04-15 08:17:54','7699dd64-1778-4df6-8727-958681be3713'),(4,'Page Data','2023-04-14 10:36:12','2023-04-14 10:36:12',NULL,'c90ef686-ae90-4dc5-a711-293e08686572'),(5,'HomePage Group','2023-04-15 08:33:06','2023-04-15 08:33:06',NULL,'588aaf03-cc4d-429b-9626-def790c49561'),(6,'Get Started Group','2023-04-17 13:10:33','2023-04-17 13:10:33',NULL,'6d0d29d9-9874-493b-94e5-c1969046c99c'),(7,'About us ','2023-04-17 13:50:43','2023-04-17 13:50:43',NULL,'1939a17a-d221-4f84-a39d-b1f04a53ec54'),(8,'Logo ','2023-04-21 09:10:22','2023-04-21 09:10:22',NULL,'10ca4b3c-f4f7-4365-a187-75411684f8a3');
/*!40000 ALTER TABLE `cc_fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_fieldlayoutfields`
--

LOCK TABLES `cc_fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `cc_fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_fieldlayoutfields` VALUES (3,3,3,1,0,1,'2023-04-14 09:40:44','2023-04-14 09:40:44','e6530121-2ba2-4771-a68e-529961bf6912'),(4,3,3,4,0,2,'2023-04-14 09:40:44','2023-04-14 09:40:44','dd834474-4267-4a11-b0bc-c7af79e33781'),(8,5,6,4,0,2,'2023-04-14 10:17:58','2023-04-14 10:17:58','09cce936-e3c8-4027-8f61-af428ccccb87'),(23,7,17,7,1,0,'2023-04-14 10:49:52','2023-04-14 10:49:52','e71b280a-5c95-45d8-bba1-b9462635d203'),(24,7,17,8,1,1,'2023-04-14 10:49:52','2023-04-14 10:49:52','d4c0f782-bfc7-4fd5-aad7-7a933ed4d0c0'),(27,9,19,12,1,0,'2023-04-14 10:50:47','2023-04-14 10:50:47','52588862-dc68-4da5-abcf-d94cba88ef4d'),(28,9,19,13,1,1,'2023-04-14 10:50:47','2023-04-14 10:50:47','af42e3a9-3419-4d0b-877b-19be75170d0c'),(29,6,20,6,0,1,'2023-04-14 10:51:08','2023-04-14 10:51:08','49cbde0e-1cd5-4aab-86fa-7defdab68471'),(30,6,20,11,0,2,'2023-04-14 10:51:08','2023-04-14 10:51:08','c2b7c220-ae3c-449b-a188-06f8f4b76c95'),(32,11,23,1,0,1,'2023-04-15 04:58:50','2023-04-15 04:58:50','62cd49ca-c10a-43e8-bb41-4634a207f791'),(33,12,25,1,0,1,'2023-04-15 08:17:04','2023-04-15 08:17:04','8d2c8dc8-d5aa-4b26-8686-3c6c9f128c6c'),(36,13,27,15,1,0,'2023-04-15 08:30:31','2023-04-15 08:30:31','0bef8887-716e-4749-a98f-d253ae87b6bf'),(37,13,27,16,1,1,'2023-04-15 08:30:31','2023-04-15 08:30:31','f84a0ca4-b54b-4ac4-b020-0ec3a76e5754'),(38,14,28,18,1,0,'2023-04-15 08:32:31','2023-04-15 08:32:31','06fd4de2-2241-4808-8085-c97b978ff81f'),(39,14,28,19,1,1,'2023-04-15 08:32:31','2023-04-15 08:32:31','303f3f2b-ff92-4b60-9fca-3c283fb87a75'),(46,15,31,20,0,1,'2023-04-15 08:37:32','2023-04-15 08:37:32','054fca25-255a-46a5-9045-30a93566afa1'),(47,15,31,21,0,2,'2023-04-15 08:37:32','2023-04-15 08:37:32','28946a21-927b-4344-990e-46577c41d525'),(48,15,31,14,0,3,'2023-04-15 08:37:32','2023-04-15 08:37:32','494bf5a5-c006-4276-b7b1-e95591b62228'),(49,15,31,22,0,5,'2023-04-15 08:37:32','2023-04-15 08:37:32','4ce3700f-47a2-465e-8ea6-3848fd7e3403'),(50,15,31,23,0,7,'2023-04-15 08:37:32','2023-04-15 08:37:32','965acae4-e074-48c4-9a21-a0081ef6868d'),(51,15,31,17,0,8,'2023-04-15 08:37:32','2023-04-15 08:37:32','cdea6e6e-3b95-4d37-ba50-c096ddd08cd8'),(53,17,34,28,0,0,'2023-04-17 13:15:17','2023-04-17 13:15:17','c878d533-384a-4830-a9c5-9612af64cfbc'),(54,16,35,24,0,1,'2023-04-17 13:16:26','2023-04-17 13:16:26','88a9cdc3-b463-459c-bafc-18a5c9a2840c'),(55,16,35,25,0,2,'2023-04-17 13:16:26','2023-04-17 13:16:26','40d4adf3-00a6-43e0-b087-4eac26d2045c'),(56,16,35,26,0,3,'2023-04-17 13:16:26','2023-04-17 13:16:26','713a334c-5fe3-452c-84b4-47260973d7bd'),(57,16,35,27,0,4,'2023-04-17 13:16:26','2023-04-17 13:16:26','2a1f0d1e-7a6b-4c9a-b00e-b369d5166348'),(68,20,40,34,0,0,'2023-04-20 09:50:46','2023-04-20 09:50:46','51f52b97-ec2c-4b23-a09d-2f1d4de53e92'),(69,21,41,34,0,0,'2023-04-20 10:58:23','2023-04-20 10:58:23','fec4aea8-ab02-471c-a799-c8cacc452851'),(87,19,47,36,1,0,'2023-04-20 14:03:04','2023-04-20 14:03:04','c9fd9275-736b-4e30-abba-3a5dcd8e1ee6'),(88,19,47,35,1,1,'2023-04-20 14:03:04','2023-04-20 14:03:04','77168ebf-2128-48c5-8bf4-23eec7d8e1e5'),(89,22,48,39,0,0,'2023-04-20 14:04:25','2023-04-20 14:04:25','0948c4be-af1b-462c-8c9b-118399191b62'),(90,18,49,20,0,1,'2023-04-20 14:05:10','2023-04-20 14:05:10','1af5d6fe-4780-44cf-9f9d-11fc89396a13'),(91,18,49,29,0,2,'2023-04-20 14:05:10','2023-04-20 14:05:10','4ef27f2c-ce93-491c-aa94-fb987553d198'),(92,18,49,30,0,3,'2023-04-20 14:05:11','2023-04-20 14:05:11','e7818554-1ad7-4c57-acce-77501b43ca9b'),(93,18,49,31,0,4,'2023-04-20 14:05:11','2023-04-20 14:05:11','aa5803fa-dcda-48f4-815b-3abe852a1b51'),(94,18,49,32,0,5,'2023-04-20 14:05:11','2023-04-20 14:05:11','15e9d1cb-03ac-4898-8ba0-669bbf2814a0'),(95,18,49,33,0,6,'2023-04-20 14:05:11','2023-04-20 14:05:11','b9c3b597-5f5f-47b7-bc4e-62b55ac4ea80'),(96,18,50,37,0,0,'2023-04-20 14:05:11','2023-04-20 14:05:11','53116ba9-d8fa-4c20-931c-8c9790635149'),(97,18,50,38,0,1,'2023-04-20 14:05:11','2023-04-20 14:05:11','028ee312-9e2d-42fa-bbc0-cc44db1caf94'),(112,2,58,2,1,0,'2023-04-21 09:34:55','2023-04-21 09:34:55','0ef6a030-ac04-44fe-b574-1d0f0de526c0'),(113,2,58,3,1,1,'2023-04-21 09:34:55','2023-04-21 09:34:55','644831be-8e4d-4cec-a1df-6ff76fd02be9'),(115,25,60,46,0,0,'2023-04-21 09:39:57','2023-04-21 09:39:57','e1b2d19f-3b8a-4e29-8bd9-89b758506168'),(117,24,62,43,0,0,'2023-04-21 09:41:54','2023-04-21 09:41:54','fe384a34-3ef7-454e-9a7f-1fc9ee622e54'),(118,24,62,1,0,1,'2023-04-21 09:41:54','2023-04-21 09:41:54','771cc869-7561-4d40-a00e-6bada3a8b8fc'),(119,24,62,44,0,2,'2023-04-21 09:41:54','2023-04-21 09:41:54','1eb64aa6-4696-4027-a982-04eacce97a71'),(120,24,62,45,0,3,'2023-04-21 09:41:54','2023-04-21 09:41:54','4f9ef76e-3232-46af-b550-22c73508fd18'),(121,24,62,48,0,4,'2023-04-21 09:41:54','2023-04-21 09:41:54','7f60d0c2-f552-482b-9500-09921dda1e13'),(122,24,62,49,0,5,'2023-04-21 09:41:54','2023-04-21 09:41:54','d7849f4d-f537-4b09-9eb3-5b6fd5679e58'),(123,26,63,50,0,0,'2023-04-21 09:43:45','2023-04-21 09:43:45','5c63adc3-cbbb-4c14-a9c2-3e5cd4383b36'),(124,26,63,51,0,1,'2023-04-21 09:43:45','2023-04-21 09:43:45','c092addb-70fb-434f-9dfb-0152c6e37d6c'),(127,27,65,52,0,0,'2023-04-21 09:55:17','2023-04-21 09:55:17','3bd0399e-8785-4345-81e4-64ba3cc5337d'),(128,27,65,43,0,1,'2023-04-21 09:55:17','2023-04-21 09:55:17','00532f1f-4404-4145-bf61-08ac1ab8957d'),(129,27,65,53,0,2,'2023-04-21 09:55:17','2023-04-21 09:55:17','fff7b364-d9b8-485c-8f25-8f3ebbcbb336'),(130,27,65,48,0,3,'2023-04-21 09:55:17','2023-04-21 09:55:17','d154d4d3-6d29-4b6d-a0d9-ccb0a1ee1f0b'),(131,27,65,49,0,4,'2023-04-21 09:55:17','2023-04-21 09:55:17','13136dea-fa88-4d08-ad51-cfd46f5a7168');
/*!40000 ALTER TABLE `cc_fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_fieldlayouts`
--

LOCK TABLES `cc_fieldlayouts` WRITE;
/*!40000 ALTER TABLE `cc_fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_fieldlayouts` VALUES (1,'craft\\elements\\Entry','2023-04-14 09:24:36','2023-04-14 09:24:36','2023-04-14 09:40:49','f988c605-070c-48cf-afb1-4ac6293a5cf5'),(2,'craft\\elements\\MatrixBlock','2023-04-14 09:34:10','2023-04-14 09:34:10',NULL,'503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e'),(3,'craft\\elements\\Entry','2023-04-14 09:40:44','2023-04-14 09:40:44','2023-04-15 08:16:16','7a22e541-df61-415f-af8f-6b54fcb7cc26'),(4,'craft\\elements\\Entry','2023-04-14 10:06:30','2023-04-14 10:06:30','2023-04-14 10:18:08','40fa3ed5-3ac1-4acb-ad02-39a437470447'),(5,'craft\\elements\\Entry','2023-04-14 10:17:58','2023-04-14 10:17:58','2023-04-15 08:15:43','c160d118-3fbe-4b69-97ed-118948ce588a'),(6,'craft\\elements\\Entry','2023-04-14 10:33:45','2023-04-14 10:33:45',NULL,'f25fac1b-9ac0-4136-aa0c-e7f5703133de'),(7,'craft\\elements\\MatrixBlock','2023-04-14 10:38:20','2023-04-14 10:38:20',NULL,'a7230ac4-cbc5-4753-8b33-c83fbbc8d904'),(8,'craft\\elements\\MatrixBlock','2023-04-14 10:49:01','2023-04-14 10:49:01','2023-04-14 10:49:52','3380a95b-d22d-4764-833a-66bb5a936573'),(9,'craft\\elements\\MatrixBlock','2023-04-14 10:50:37','2023-04-14 10:50:37',NULL,'d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4'),(10,'craft\\elements\\Entry','2023-04-15 04:51:59','2023-04-15 04:51:59','2023-04-15 04:58:39','14cd7f38-fc24-4b2f-8a93-dbb792fa85de'),(11,'craft\\elements\\Entry','2023-04-15 04:56:23','2023-04-15 04:56:23','2023-04-15 08:15:45','2a77db31-f4e6-4b58-a124-9532b7721beb'),(12,'craft\\elements\\Entry','2023-04-15 08:16:42','2023-04-15 08:16:42',NULL,'2c69baf1-fa9d-4e44-adc0-074e188c6f17'),(13,'craft\\elements\\MatrixBlock','2023-04-15 08:30:31','2023-04-15 08:30:31',NULL,'1f5ef9b3-0bca-4778-b48d-36ee8e6eac91'),(14,'craft\\elements\\MatrixBlock','2023-04-15 08:32:31','2023-04-15 08:32:31',NULL,'aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18'),(15,'craft\\elements\\Entry','2023-04-15 08:36:25','2023-04-15 08:36:25',NULL,'2346b777-8a95-4583-a81b-1e6c604cb195'),(16,'craft\\elements\\Entry','2023-04-17 13:09:48','2023-04-17 13:09:48',NULL,'de4d7bff-918c-4aa4-850b-06b7ce70f260'),(17,'craft\\elements\\MatrixBlock','2023-04-17 13:15:17','2023-04-17 13:15:17',NULL,'1b8cd79a-e878-4ad6-b567-ee0b906b062d'),(18,'craft\\elements\\Entry','2023-04-17 13:50:20','2023-04-17 13:50:20',NULL,'549135a6-6402-4dcc-aa15-cde0f0a6180d'),(19,'craft\\elements\\MatrixBlock','2023-04-20 09:49:48','2023-04-20 09:49:48',NULL,'fe350778-d4b1-4e7d-9a4a-bf995a813048'),(20,'craft\\elements\\GlobalSet','2023-04-20 09:50:46','2023-04-20 09:50:46',NULL,'4a64af3b-17ad-46c5-8a31-dd2f5fff992d'),(21,'craft\\elements\\GlobalSet','2023-04-20 10:58:23','2023-04-20 10:58:23',NULL,'3046ba18-d7f5-4d01-9dba-2b2bc2896d7f'),(22,'craft\\elements\\MatrixBlock','2023-04-20 14:04:25','2023-04-20 14:04:25',NULL,'6efa6d1b-98bf-48d3-b092-77f11dabea55'),(23,'craft\\elements\\GlobalSet','2023-04-21 07:16:12','2023-04-21 07:16:12',NULL,'858df029-02b1-4a51-bad0-32f02c5673ef'),(24,'craft\\elements\\GlobalSet','2023-04-21 09:12:40','2023-04-21 09:12:40',NULL,'39caa02f-4730-41f4-9cc4-8600662d3688'),(25,'craft\\elements\\MatrixBlock','2023-04-21 09:21:17','2023-04-21 09:21:17',NULL,'e58a01b6-334b-4330-8a49-9f6dac252464'),(26,'craft\\elements\\MatrixBlock','2023-04-21 09:41:14','2023-04-21 09:41:14',NULL,'a3273be5-6131-4451-ab05-5f2b554cd5f4'),(27,'craft\\elements\\GlobalSet','2023-04-21 09:54:25','2023-04-21 09:54:25',NULL,'921f29d2-1fed-4666-9b08-bc9dc8790fcf'),(28,'craft\\elements\\Asset','2023-04-21 12:07:46','2023-04-21 12:07:46','2023-04-21 12:10:58','ec4bb886-70d0-49b3-9da3-fa579207bd2e'),(29,'craft\\elements\\Asset','2023-04-21 12:14:07','2023-04-21 12:14:07',NULL,'d71f7e69-5536-4cf4-b7e0-799977a88607');
/*!40000 ALTER TABLE `cc_fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_fieldlayouttabs`
--

LOCK TABLES `cc_fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `cc_fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_fieldlayouttabs` VALUES (1,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null}]',1,'2023-04-14 09:24:36','2023-04-14 09:24:36','0e47f5e3-4ece-421a-8f02-fbd545fda623'),(3,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"462b074e-792c-44a5-a1fc-e74271f2e90e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"99a52b1c-018d-4b28-a788-321cc6141d57\"}]',1,'2023-04-14 09:40:44','2023-04-14 09:40:44','1a11ebf1-706b-4047-8f93-33e21290b5dd'),(5,4,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null}]',1,'2023-04-14 10:06:30','2023-04-14 10:06:30','1e26f98e-6d4e-406a-87e6-1f5f6b3819c7'),(6,5,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"2fa37629-b556-4c26-be53-fa56f8b74c44\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"99a52b1c-018d-4b28-a788-321cc6141d57\"}]',1,'2023-04-14 10:17:58','2023-04-14 10:17:58','20f6bf56-2ca4-411f-b528-35a3fbca7180'),(16,8,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"67dbfaca-62d4-4282-bfd3-3f4399a481d2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"cc9eda60-00a1-4e3b-89f0-f973ffe0aad9\"}]',1,'2023-04-14 10:49:01','2023-04-14 10:49:01','991a7204-8bac-4cb7-b44a-f124c389b5ec'),(17,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"38b49d55-d32f-4e5b-b3a9-81006fcf8fb7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"7893d15f-ba77-460d-b30e-066088a1d3c4\"}]',1,'2023-04-14 10:49:52','2023-04-14 10:49:52','314de652-b964-41c0-9e72-d5bf1afdc8a9'),(19,9,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"45e5581f-6623-4adf-93a4-063baa992e3a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"a5bb180a-40bd-4ea1-9feb-3135439d6f20\"}]',1,'2023-04-14 10:50:47','2023-04-14 10:50:47','f1930cc2-5531-4025-8737-19a7ff612730'),(20,6,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"a7ead237-4889-45d8-9293-bb7424f79d5c\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"c0c5f0a4-c856-4d28-9745-ac231e4fea15\"}]',1,'2023-04-14 10:51:08','2023-04-14 10:51:08','a8df6a80-f161-4dd3-a9ad-2c5e43247951'),(21,10,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null}]',1,'2023-04-15 04:51:59','2023-04-15 04:51:59','2ee141ed-f363-497b-abcb-536a6f5fd756'),(23,11,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"462b074e-792c-44a5-a1fc-e74271f2e90e\"}]',1,'2023-04-15 04:58:50','2023-04-15 04:58:50','c0266f96-b590-4c23-b758-53538f75af88'),(25,12,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"462b074e-792c-44a5-a1fc-e74271f2e90e\"}]',1,'2023-04-15 08:17:04','2023-04-15 08:17:04','8828ad01-1ac0-4ec3-88ee-d7b0d4b13257'),(27,13,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"924ddb91-d8f3-47ec-a5f5-29dd22cd1df3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"c26050dd-88c8-4666-85dc-36dcbd7e6bc5\"}]',1,'2023-04-15 08:30:31','2023-04-15 08:30:31','d7f59b81-0a70-43f5-ba1a-0209b3b35f8f'),(28,14,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"3850bad8-119c-4964-9482-2eb4e539e2cd\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"b9894a05-3987-4a08-ab87-68ef6ec65448\"}]',1,'2023-04-15 08:32:31','2023-04-15 08:32:31','80672a07-7b8e-4e91-9121-9300f5a1c361'),(31,15,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"de531f18-7abc-4af0-97a9-77414f4c2b27\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"4981297c-b9f9-4763-86ff-8c9ac639c3ab\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"1552e96e-64cc-4875-ba97-1e93f516ae24\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"6f668a19-4d7e-4989-b7c8-4034a26c0592\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"ffa2231c-785f-439f-a8e1-d0310a48cc11\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"e7331b8c-260f-4416-9df0-81b2eff4d738\"}]',1,'2023-04-15 08:37:32','2023-04-15 08:37:32','3b75ed16-ff01-4ba9-99ae-99121c51ede2'),(34,17,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"98575239-efb4-4736-9bb1-18805e443225\"}]',1,'2023-04-17 13:15:17','2023-04-17 13:15:17','bf505b37-ec35-4933-9ed1-b9be401f01b6'),(35,16,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"9656ecdd-33ae-493a-8c2e-03adddfaafd7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"2e04a1a7-ba3b-41a3-a164-cc13a9c9c175\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"f0468692-26c7-4961-922b-22c7e88f9c51\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"b5ced616-a83d-43c7-b4b1-7a8cb9249ec2\"}]',1,'2023-04-17 13:16:26','2023-04-17 13:16:26','be1017e1-b92f-4652-a14f-5276640a816a'),(40,20,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"1579b38a-a813-4b9b-be72-7575d614fd48\"}]',1,'2023-04-20 09:50:46','2023-04-20 09:50:46','3c8042c3-84be-43cc-a729-484d29672c02'),(41,21,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"1579b38a-a813-4b9b-be72-7575d614fd48\"}]',1,'2023-04-20 10:58:23','2023-04-20 10:58:23','f115db71-b350-4c26-83cb-b9c7724b1275'),(47,19,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"569085f6-5ddd-4e9c-94e9-cd755a2b97c3\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"1ced9631-5763-45f2-add2-e638dd01e37d\"}]',1,'2023-04-20 14:03:04','2023-04-20 14:03:04','a383f7e4-ad60-4d3d-b6ea-e278c1f4ec03'),(48,22,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"193cab31-81f6-47dc-b6ed-e7ec189ef784\"}]',1,'2023-04-20 14:04:25','2023-04-20 14:04:25','e2501dc8-cc64-4091-924e-3503ffb46117'),(49,18,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"de531f18-7abc-4af0-97a9-77414f4c2b27\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"6a6005aa-c544-43a2-9077-b41192d60801\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"c7d8c9ba-dcf8-46ec-b5f7-00be219466d6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"8eb2228c-915a-4b94-9a52-2936d1b59590\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"44f40441-17c5-46fe-954d-1f9838fa27e7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"ef9b3e71-4f9c-4899-9069-c8526023fc7a\"}]',1,'2023-04-20 14:05:10','2023-04-20 14:05:10','4d4c607a-f0fe-4c21-8d96-8b0ec6d09caa'),(50,18,'Page Setting','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"5d47d6a0-3952-48d2-8586-38a2baa242e4\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"db54c432-22dc-4e88-bf44-05849d935312\"}]',2,'2023-04-20 14:05:11','2023-04-20 14:05:11','573a6127-55a7-4c87-a2c3-2110145035d7'),(53,23,'content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"c935a719-bbe5-4781-ad93-9e5d10ee1c21\"}]',1,'2023-04-21 07:47:25','2023-04-21 07:47:25','42a91280-c53f-4aa6-861b-a8f97d08ca85'),(58,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"6e54cc44-cfd2-4509-921d-0c05038bbead\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"fieldUid\":\"b2597900-e8be-4371-b0a1-35f2e6e4123e\"}]',1,'2023-04-21 09:34:55','2023-04-21 09:34:55','e645b955-60c0-4b1a-895d-c58ccd20edbb'),(60,25,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"472dd4b0-d864-4e36-b80d-7d0c1ff5e922\"}]',1,'2023-04-21 09:39:57','2023-04-21 09:39:57','59fd4f7b-a3a0-4fe5-9cee-fce59b3fd63d'),(62,24,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"c163ac99-714b-4d7a-96c2-0d2104942ec7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"462b074e-792c-44a5-a1fc-e74271f2e90e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"949dfb89-bde2-48c5-94ba-7d9861880b63\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"4a52d3aa-83d3-4ced-a26c-e93fa6b023cc\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"f6e1c666-a34d-4154-90fe-c5458e203447\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"4d8f5c5c-88ca-4097-9a12-a58b7a512cff\"}]',1,'2023-04-21 09:41:54','2023-04-21 09:41:54','20aa5a98-51c5-42bd-a0a6-b86b72409851'),(63,26,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"e083c8f1-dedd-4985-b498-b008c8a2c323\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"ac306dcf-3f06-41f0-88bd-31024cd1231e\"}]',1,'2023-04-21 09:43:45','2023-04-21 09:43:45','db4b7bf9-d8bc-4ab1-bea3-1472a9199590'),(65,27,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"a598f59b-5fa8-4ea7-a0de-5908493accaa\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"c163ac99-714b-4d7a-96c2-0d2104942ec7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"4fdbcb99-2d34-4451-a1cd-50c81ecf0823\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"f6e1c666-a34d-4154-90fe-c5458e203447\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"4d8f5c5c-88ca-4097-9a12-a58b7a512cff\"}]',1,'2023-04-21 09:55:17','2023-04-21 09:55:17','897f8a38-6e3d-47eb-8205-dcdd34d71b97'),(66,28,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null}]',1,'2023-04-21 12:07:46','2023-04-21 12:07:46','3a4b1d43-52fa-4990-8201-396dfaccc9a3'),(67,29,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null}]',1,'2023-04-21 12:14:07','2023-04-21 12:14:07','64413398-8a15-43e6-bca3-88367d7bd67a');
/*!40000 ALTER TABLE `cc_fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_fields`
--

LOCK TABLES `cc_fields` WRITE;
/*!40000 ALTER TABLE `cc_fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_fields` VALUES (1,2,'Menu Fields','menufields','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_menufields}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-04-14 09:34:10','2023-04-14 10:00:58','462b074e-792c-44a5-a1fc-e74271f2e90e'),(2,NULL,'Page Name','pageName','matrixBlockType:7fc587f7-1db8-4f91-9dc3-3288de0683db','idguywkm','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":\"Ex : About Us, FAQ, Services\",\"uiMode\":\"normal\"}','2023-04-14 09:34:10','2023-04-15 08:19:51','6e54cc44-cfd2-4509-921d-0c05038bbead'),(3,NULL,'Page Slug','pageSlug','matrixBlockType:7fc587f7-1db8-4f91-9dc3-3288de0683db','eznrgedx','',0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-04-14 09:34:10','2023-04-21 09:34:55','b2597900-e8be-4371-b0a1-35f2e6e4123e'),(4,1,'Show to Visitor','showtovisitor','global','ygjzlqho','',0,'none',NULL,'craft\\fields\\Lightswitch','{\"default\":false,\"offLabel\":\"No\",\"onLabel\":\"Yes\"}','2023-04-14 09:39:49','2023-04-14 10:15:37','99a52b1c-018d-4b28-a788-321cc6141d57'),(6,4,'FAQ Data','faqData','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_faqdata}}\",\"maxBlocks\":\"\",\"minBlocks\":\"1\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-04-14 10:38:20','2023-04-14 10:45:20','a7ead237-4889-45d8-9293-bb7424f79d5c'),(7,NULL,'question','question','matrixBlockType:f054bb40-fe3b-4887-a94e-78b0229b735b','pvxsfvek','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-14 10:38:20','2023-04-14 10:38:20','38b49d55-d32f-4e5b-b3a9-81006fcf8fb7'),(8,NULL,'answer','answer','matrixBlockType:f054bb40-fe3b-4887-a94e-78b0229b735b','ndviczkw','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2023-04-14 10:38:43','2023-04-14 10:45:04','7893d15f-ba77-460d-b30e-066088a1d3c4'),(11,4,'Forums Data','forumsData','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_forumsdata}}\",\"maxBlocks\":\"\",\"minBlocks\":\"1\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-04-14 10:50:36','2023-04-14 10:50:46','c0c5f0a4-c856-4d28-9745-ac231e4fea15'),(12,NULL,'question','question','matrixBlockType:68f4e476-d938-4fe1-b6ab-07486aaa3c15','uhxechjz','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-14 10:50:37','2023-04-14 10:50:37','45e5581f-6623-4adf-93a4-063baa992e3a'),(13,NULL,'answer','answer','matrixBlockType:68f4e476-d938-4fe1-b6ab-07486aaa3c15','zcasrplx','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-14 10:50:37','2023-04-14 10:50:37','a5bb180a-40bd-4ea1-9feb-3135439d6f20'),(14,4,'Press Content','pressContent','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_presscontent}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-04-15 08:30:31','2023-04-15 08:30:31','1552e96e-64cc-4875-ba97-1e93f516ae24'),(15,NULL,'Press Name','pressName','matrixBlockType:b2e1694b-2726-4573-b3b0-5b8b434cb708','hwmvenxp','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-15 08:30:31','2023-04-15 08:30:31','924ddb91-d8f3-47ec-a5f5-29dd22cd1df3'),(16,NULL,'Press Url','pressUrl','matrixBlockType:b2e1694b-2726-4573-b3b0-5b8b434cb708','dhvohjrb','must be a valid url ',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-15 08:30:31','2023-04-15 08:30:31','c26050dd-88c8-4666-85dc-36dcbd7e6bc5'),(17,4,'Top Podcast Content','topPodcastContent','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_toppodcastcontent}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-04-15 08:32:31','2023-04-15 08:32:31','e7331b8c-260f-4416-9df0-81b2eff4d738'),(18,NULL,'Top Podcast Name','topPodcastName','matrixBlockType:e1e15d42-3e48-4a44-ba79-47e5f5637c51','ykwrlzye','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-15 08:32:31','2023-04-15 08:32:31','3850bad8-119c-4964-9482-2eb4e539e2cd'),(19,NULL,'Top Podcast Url','topPodcastUrl','matrixBlockType:e1e15d42-3e48-4a44-ba79-47e5f5637c51','kakgtips','must be a valid url',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-15 08:32:31','2023-04-15 08:32:31','b9894a05-3987-4a08-ab87-68ef6ec65448'),(20,5,'Hero Heading','heroHeading','global','qeyuluhm','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-15 08:34:16','2023-04-15 08:34:16','de531f18-7abc-4af0-97a9-77414f4c2b27'),(21,5,'Press Heading','pressHeading','global','qmynbfwp','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-15 08:35:12','2023-04-15 08:35:12','4981297c-b9f9-4763-86ff-8c9ac639c3ab'),(22,5,'Section Heading','sectionHeading','global','xothcfkc','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-15 08:35:32','2023-04-15 08:35:32','6f668a19-4d7e-4989-b7c8-4034a26c0592'),(23,5,'Top Podcast Heading','topPodcastHeading','global','qjvbxbct','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-15 08:35:49','2023-04-15 08:35:49','ffa2231c-785f-439f-a8e1-d0310a48cc11'),(24,6,'Title','pageTitle','global','lydycsut','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-17 13:11:10','2023-04-17 13:11:10','9656ecdd-33ae-493a-8c2e-03adddfaafd7'),(25,6,'Hero Section Content','heroSectionContent','global','myszicxv','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2023-04-17 13:12:31','2023-04-17 13:12:31','2e04a1a7-ba3b-41a3-a164-cc13a9c9c175'),(26,6,'Benefit Section Heading','benefitSectionHeading','global','kqtwsugz','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-17 13:13:13','2023-04-17 13:13:13','f0468692-26c7-4961-922b-22c7e88f9c51'),(27,6,'Benefits','benefits','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_benefits}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-04-17 13:15:17','2023-04-17 13:15:17','b5ced616-a83d-43c7-b4b1-7a8cb9249ec2'),(28,NULL,'content','contentText','matrixBlockType:03cadce9-3225-49bd-bac1-eb74262dd0c0','swqtbpco','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2023-04-17 13:15:17','2023-04-17 13:15:17','98575239-efb4-4736-9bb1-18805e443225'),(29,7,'heroContent','herocontent','global','cgfpxemu','',1,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2023-04-17 13:56:52','2023-04-18 07:05:29','6a6005aa-c544-43a2-9077-b41192d60801'),(30,7,'amplifyHeading','amplifyheading','global','mhrlzbct','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-18 07:03:41','2023-04-18 07:03:41','c7d8c9ba-dcf8-46ec-b5f7-00be219466d6'),(31,7,'amplifyContent','amplifycontent','global','xmzmczdq','',1,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2023-04-18 07:06:19','2023-04-18 07:06:19','8eb2228c-915a-4b94-9a52-2936d1b59590'),(32,7,'serviceHeading','serviceheading','global','nrwlljho','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-18 07:06:52','2023-04-18 07:06:52','44f40441-17c5-46fe-954d-1f9838fa27e7'),(33,7,'serviceContent','servicecontent','global','agfiykqs','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2023-04-18 07:07:21','2023-04-18 07:07:21','ef9b3e71-4f9c-4899-9069-c8526023fc7a'),(34,1,'Navigation Fields','navigation','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_navigation}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-04-20 09:49:47','2023-04-20 14:03:04','1579b38a-a813-4b9b-be72-7575d614fd48'),(35,NULL,'Link Destination','linkDestination','matrixBlockType:d63e36be-ae39-4138-b6e5-083ba6baeaf9',NULL,'',1,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"Add Link destination\",\"showSiteMenu\":true,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-04-20 09:49:48','2023-04-20 14:02:27','1ced9631-5763-45f2-add2-e638dd01e37d'),(36,NULL,'Link Text','linkText','matrixBlockType:d63e36be-ae39-4138-b6e5-083ba6baeaf9','zgwvytlo','',1,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-20 09:49:48','2023-04-20 09:49:48','569085f6-5ddd-4e9c-94e9-cd755a2b97c3'),(37,1,'headerBind','headerbind','global',NULL,'',0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":true,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-04-20 13:53:54','2023-04-21 08:50:42','5d47d6a0-3952-48d2-8586-38a2baa242e4'),(38,7,'PageHeader','pageheader','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_pageheader}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-04-20 14:04:25','2023-04-20 14:04:25','db54c432-22dc-4e88-bf44-05849d935312'),(39,NULL,'NavLinkss','navlinkss','matrixBlockType:004edc04-88c9-401b-815d-54163a594af8',NULL,'',0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-04-20 14:04:25','2023-04-20 14:04:25','193cab31-81f6-47dc-b6ed-e7ec189ef784'),(40,1,'Image ','image','global','sxehzaun','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2023-04-21 07:13:52','2023-04-21 07:13:52','2766be0c-98b6-4217-8d8f-52acb6544b5c'),(43,8,'Logo ','logo','global',NULL,'',1,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a\",\"singleUploadLocationSubpath\":\"\\/assets\\/images\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":true,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2023-04-21 09:11:09','2023-04-21 12:15:43','c163ac99-714b-4d7a-96c2-0d2104942ec7'),(44,8,'Contact us text ','contactUsText','global','hjryrpli','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2023-04-21 09:18:18','2023-04-21 09:18:18','949dfb89-bde2-48c5-94ba-7d9861880b63'),(45,2,'Social Menu','socialMenu','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_socialmenu}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-04-21 09:21:17','2023-04-21 09:39:56','4a52d3aa-83d3-4ced-a26c-e93fa6b023cc'),(46,NULL,'Link Text','linkText','matrixBlockType:8f61eedc-70d7-4f2c-b9b1-51f3a5978007','jeewpqks','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-21 09:21:17','2023-04-21 09:21:17','472dd4b0-d864-4e36-b80d-7d0c1ff5e922'),(48,2,'Copy right text','copyRightText','global','dowhghvv','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-21 09:40:38','2023-04-21 09:40:38','f6e1c666-a34d-4154-90fe-c5458e203447'),(49,2,'Botton Menu ','bottonMenu','global',NULL,'',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_bottonmenu}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationKeyFormat\":null,\"propagationMethod\":\"all\"}','2023-04-21 09:41:14','2023-04-21 09:41:14','4d8f5c5c-88ca-4097-9a12-a58b7a512cff'),(50,NULL,'Link Text','linkText','matrixBlockType:3b2ac91e-dbf1-464f-8c8f-28d2d929040e','dbfzefkl','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-21 09:41:14','2023-04-21 09:41:14','e083c8f1-dedd-4985-b498-b008c8a2c323'),(51,NULL,'Link Destination','linkDestination','matrixBlockType:3b2ac91e-dbf1-464f-8c8f-28d2d929040e',NULL,'',0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2023-04-21 09:43:45','2023-04-21 09:43:45','ac306dcf-3f06-41f0-88bd-31024cd1231e'),(52,8,'Logo Title ','logoTitle','global','hhnimttd','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2023-04-21 09:53:49','2023-04-21 09:53:49','a598f59b-5fa8-4ea7-a0de-5908493accaa'),(53,8,'Logo Content','logoContent','global','xxkdwirs','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2023-04-21 09:54:51','2023-04-21 09:54:51','4fdbcb99-2d34-4451-a1cd-50c81ecf0823');
/*!40000 ALTER TABLE `cc_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_globalsets`
--

LOCK TABLES `cc_globalsets` WRITE;
/*!40000 ALTER TABLE `cc_globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_globalsets` VALUES (114,'Navigation','navigation',20,1,'2023-04-20 09:50:46','2023-04-20 09:50:46','c8b7fbbb-7aeb-41be-95cc-75a01ef63fff'),(123,'Header for visitor','headerForVisitor',21,2,'2023-04-20 10:58:23','2023-04-20 10:58:23','6a76ca1b-77bb-43e6-9170-684d67678fbb'),(139,'Settings','settings',23,3,'2023-04-21 07:16:12','2023-04-21 07:16:12','126a25e1-3618-4ad7-b367-14278602d8b8'),(141,'Main footer ','mainFooter',24,4,'2023-04-21 09:12:40','2023-04-21 09:12:40','ed5d08ec-fd83-4579-bf8c-99327715de4d'),(150,'Podcast Footer ','podcastFooter',27,5,'2023-04-21 09:53:55','2023-04-21 09:54:25','eeebb92e-1882-4ee1-a318-1b9faa615542');
/*!40000 ALTER TABLE `cc_globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_gqlschemas`
--

LOCK TABLES `cc_gqlschemas` WRITE;
/*!40000 ALTER TABLE `cc_gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_gqltokens`
--

LOCK TABLES `cc_gqltokens` WRITE;
/*!40000 ALTER TABLE `cc_gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_info`
--

LOCK TABLES `cc_info` WRITE;
/*!40000 ALTER TABLE `cc_info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_info` VALUES (1,'3.8.7','3.8.0.1',0,'tgcygqwzdfgr','3@rczxeepmqb','2023-04-14 08:36:25','2023-04-21 12:15:43','d1afe9a9-b512-4045-b683-9d7724a36f94');
/*!40000 ALTER TABLE `cc_info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_matrixblocks`
--

LOCK TABLES `cc_matrixblocks` WRITE;
/*!40000 ALTER TABLE `cc_matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_matrixblocks` VALUES (5,4,1,1,1,0,'2023-04-14 09:41:03','2023-04-14 09:41:03','6eb989b0-ffea-407c-a591-dc1c823d81d7'),(6,4,1,1,1,0,'2023-04-14 09:41:05','2023-04-14 09:41:05','bd76844d-11e2-48e4-9306-b5363e142213'),(7,4,1,1,2,0,'2023-04-14 09:41:05','2023-04-14 09:41:05','75d4e397-84a1-47e8-87ce-2083de66d34c'),(8,4,1,1,1,1,'2023-04-14 09:41:08','2023-04-14 09:41:08','aafe326a-fd82-4902-8720-7cddb59b5ce8'),(9,4,1,1,2,1,'2023-04-14 09:41:08','2023-04-14 09:41:08','3fa7d835-e9bc-4f25-93cc-7c28f6aaa8f6'),(10,4,1,1,3,1,'2023-04-14 09:41:08','2023-04-14 09:41:08','f9734d9d-6d32-47de-8353-bc09d0309aec'),(32,15,6,2,2,NULL,'2023-04-14 10:46:49','2023-04-14 10:47:09','cc71fed4-a084-4397-93b5-01fc1668c734'),(33,15,6,2,1,NULL,'2023-04-14 10:46:49','2023-04-14 10:47:09','ea2870a4-5f77-4494-a2c6-6da4a45cf44e'),(35,34,6,2,1,NULL,'2023-04-14 10:46:49','2023-04-14 10:46:49','8eca0a68-73e5-4a18-a9fa-36450ee001b2'),(36,34,6,2,2,NULL,'2023-04-14 10:46:49','2023-04-14 10:46:49','db24ed53-7447-416b-b10f-734dffc9a630'),(41,40,6,2,1,NULL,'2023-04-14 10:47:09','2023-04-14 10:47:09','ff760d11-9e61-4cf4-896f-7924d77b719e'),(42,40,6,2,2,NULL,'2023-04-14 10:47:09','2023-04-14 10:47:09','582cf072-7461-4f79-b245-a356c41111a2'),(44,43,6,2,1,NULL,'2023-04-14 10:47:49','2023-04-14 10:47:49','8f10f209-38b7-4248-bafd-0cd129cb0f9c'),(45,43,6,2,2,NULL,'2023-04-14 10:47:49','2023-04-14 10:47:49','9c5eb25c-a21b-49dc-baf8-576f530eaccd'),(53,52,6,2,1,NULL,'2023-04-14 10:51:08','2023-04-14 10:51:08','3dbe9713-ea3e-48ee-961f-155c506f7d90'),(54,52,6,2,2,NULL,'2023-04-14 10:51:08','2023-04-14 10:51:08','bdfcc996-2390-48de-9097-63d694ddc12a'),(57,15,11,4,1,NULL,'2023-04-14 10:51:45','2023-04-14 10:51:45','4f1b5f88-96e9-494b-a09b-a16c0a0b5fac'),(59,58,6,2,1,NULL,'2023-04-14 10:51:45','2023-04-14 10:51:45','2d9798c9-fdf3-45f8-ae51-8a4491cc388c'),(60,58,6,2,2,NULL,'2023-04-14 10:51:45','2023-04-14 10:51:45','33115157-1238-48d6-baf9-8aa571f094f4'),(61,58,11,4,1,NULL,'2023-04-14 10:51:45','2023-04-14 10:51:45','aa172c32-5987-40ad-beee-4e5c5e5d0519'),(66,63,1,1,1,0,'2023-04-15 04:59:03','2023-04-15 04:59:03','e811cfbf-0316-4094-852c-600eed72e7d1'),(67,63,1,1,1,1,'2023-04-15 04:59:05','2023-04-15 04:59:05','33c5a8af-9317-41db-b4f6-193c50a8f6ed'),(68,63,1,1,2,1,'2023-04-15 04:59:05','2023-04-15 04:59:05','b8af35e7-488d-4170-b995-6c86d40699e4'),(79,78,17,6,1,0,'2023-04-15 09:33:17','2023-04-15 09:33:17','a3183343-6742-42ff-9eb1-3a6258ba23e2'),(80,78,17,6,1,NULL,'2023-04-15 09:33:20','2023-04-15 09:33:20','5c977966-b38c-4d2f-a8af-df1ed4d77fb6'),(81,78,17,6,2,NULL,'2023-04-15 09:33:20','2023-04-15 09:33:20','85e62a94-80eb-49f3-9a16-479f02de1379'),(82,78,14,5,1,0,'2023-04-17 13:06:47','2023-04-17 13:06:47','1d4892ff-269f-4abb-bb54-b8f5b3fe3bbc'),(83,78,14,5,1,0,'2023-04-17 13:06:47','2023-04-17 13:06:47','8ac38147-0c42-4d3d-94d3-c63a5f1285b2'),(84,78,14,5,2,0,'2023-04-17 13:06:47','2023-04-17 13:06:47','553c2a98-88c5-4de8-8b84-3d3ca007bd14'),(85,78,14,5,1,0,'2023-04-17 13:06:49','2023-04-17 13:06:49','27f76fb3-b07e-4ba7-804f-8fb70f1f8159'),(86,78,14,5,2,0,'2023-04-17 13:06:49','2023-04-17 13:06:49','1a24e572-291b-4f08-a37f-51a8749a674d'),(87,78,14,5,3,0,'2023-04-17 13:06:49','2023-04-17 13:06:49','af956bba-3fd9-45c4-a9d8-f31850d31292'),(88,78,14,5,1,NULL,'2023-04-17 13:06:52','2023-04-17 13:06:52','17594997-d07d-483d-a173-caf6018bf68a'),(89,78,14,5,3,NULL,'2023-04-17 13:06:52','2023-04-17 13:06:52','64a1f584-e289-4dba-b2b8-bd4387aef8ac'),(90,78,14,5,4,NULL,'2023-04-17 13:06:52','2023-04-17 13:06:52','c1474bb1-43a7-45dd-912a-c242f5edde79'),(92,91,6,2,1,NULL,'2023-04-17 13:07:27','2023-04-17 13:07:27','db6a7cfb-debc-48ab-abdc-0ac524407ffe'),(93,91,6,2,2,NULL,'2023-04-17 13:07:27','2023-04-17 13:07:27','1e88177e-f51b-4ee0-8142-dfadfcdf5571'),(94,91,11,4,1,NULL,'2023-04-17 13:07:27','2023-04-17 13:07:27','4dacc99b-49f0-474c-81ae-ca25138e3a40'),(95,91,11,4,2,NULL,'2023-04-17 13:07:27','2023-04-17 13:07:27','1b6bcc61-605b-42df-a347-5d716affd6f5'),(101,69,1,1,1,NULL,'2023-04-17 13:17:01','2023-04-17 13:17:01','2b2f818f-5457-4139-8984-580fd087c7cc'),(103,102,1,1,1,NULL,'2023-04-17 13:17:01','2023-04-17 13:17:01','9ad7eb59-7df3-4819-940f-ae5f07748760'),(107,78,14,5,4,0,'2023-04-17 15:01:47','2023-04-17 15:01:47','01cd18ce-25f0-4e33-a3b5-437cc3afcad9'),(108,78,14,5,2,NULL,'2023-04-17 15:01:53','2023-04-17 15:01:53','49fb111d-5b92-4674-a7a2-0693ab553ea5'),(112,111,27,7,1,NULL,'2023-04-18 07:03:13','2023-04-18 07:03:13','ff8790fc-390b-4168-bde9-729c46c1ca04'),(115,114,34,8,1,NULL,'2023-04-20 09:58:20','2023-04-20 09:58:20','526d3b1b-04ba-4fab-a939-7cefeb0f3c02'),(116,114,34,8,2,NULL,'2023-04-20 09:58:20','2023-04-20 09:58:20','a344ae39-c2b1-43b8-9d99-d8528a7e2790'),(117,114,34,8,3,NULL,'2023-04-20 09:58:20','2023-04-20 09:58:20','494b7a11-9198-41c0-b3f1-821a5327acac'),(118,114,34,8,4,NULL,'2023-04-20 09:58:20','2023-04-20 09:58:20','3df2cfd6-9952-4767-a1c7-152afc123c17'),(119,114,34,8,5,NULL,'2023-04-20 09:58:20','2023-04-20 09:58:20','35ca9ae1-e0ac-40bb-97b6-7e8863526169'),(121,120,1,1,1,NULL,'2023-04-20 10:02:59','2023-04-20 10:02:59','d763e2ed-875c-4da0-beba-d9a465c9a92c'),(122,120,1,1,2,NULL,'2023-04-20 10:02:59','2023-04-20 10:02:59','00d2db6d-bde2-41db-a719-ea35332f83e4'),(124,123,34,8,1,NULL,'2023-04-20 11:00:54','2023-04-20 11:00:54','0e8d6677-0eaf-4a97-81bc-43341d635f0a'),(125,123,34,8,2,NULL,'2023-04-20 11:00:54','2023-04-20 11:00:54','5c57e8c9-662e-4dcd-9046-dad7391b8529'),(126,123,34,8,3,NULL,'2023-04-20 11:00:54','2023-04-20 11:00:54','13d626a1-da84-4743-981d-29e5c0cc7a0e'),(136,104,38,9,1,NULL,'2023-04-20 14:05:32','2023-04-20 14:05:32','d20e276f-2f0d-4970-803e-33f80e6e6ee7'),(138,137,38,9,1,NULL,'2023-04-20 14:05:32','2023-04-20 14:05:32','c4a962fa-3602-4c0b-bf90-694a3edd358d'),(142,141,1,1,1,NULL,'2023-04-21 09:36:48','2023-04-21 09:36:48','f9c38ecc-e944-4930-925b-2571cd5bb7df'),(143,141,1,1,2,NULL,'2023-04-21 09:36:48','2023-04-21 09:36:48','914bc7e6-462e-4e2b-b15a-fc64a4800365'),(144,141,1,1,3,NULL,'2023-04-21 09:36:48','2023-04-21 09:36:48','6961365c-dd51-4324-b7a4-725e97d49d3d'),(145,141,45,10,1,NULL,'2023-04-21 09:36:48','2023-04-21 09:36:48','be16d7ad-474a-4b2e-82d7-86243e2e02cd'),(146,141,45,10,2,NULL,'2023-04-21 09:39:02','2023-04-21 09:39:02','58a9d487-ce4f-40d3-895a-7f74c48a98b8'),(147,141,49,11,1,NULL,'2023-04-21 09:52:27','2023-04-21 09:52:27','2473cc99-72e4-48b8-a610-b6783fee4558'),(148,141,49,11,2,NULL,'2023-04-21 09:52:27','2023-04-21 09:52:27','1fd1fef3-ecc3-4e1f-bc45-ff46c95794bc'),(149,141,49,11,3,NULL,'2023-04-21 09:52:27','2023-04-21 09:52:27','6344c071-89d2-4864-8e9e-e93d3ce9dfa7'),(151,150,49,11,1,NULL,'2023-04-21 10:07:29','2023-04-21 10:07:29','d7f8eda0-d07e-4e34-a7a5-f040d716d88d'),(152,150,49,11,2,NULL,'2023-04-21 10:07:29','2023-04-21 10:07:29','a139c2e7-9ba6-4ea6-91ba-35ffb3f26bf3'),(153,150,49,11,3,NULL,'2023-04-21 10:07:29','2023-04-21 10:07:29','52de1160-02eb-4b12-9c0d-9950259e9a97');
/*!40000 ALTER TABLE `cc_matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_matrixblocktypes`
--

LOCK TABLES `cc_matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `cc_matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_matrixblocktypes` VALUES (1,1,2,'Menu','menu',1,'2023-04-14 09:34:10','2023-04-14 09:34:10','7fc587f7-1db8-4f91-9dc3-3288de0683db'),(2,6,7,'Faqs','faq',1,'2023-04-14 10:38:20','2023-04-14 10:38:20','f054bb40-fe3b-4887-a94e-78b0229b735b'),(4,11,9,'Forums','forums',1,'2023-04-14 10:50:37','2023-04-14 10:50:37','68f4e476-d938-4fe1-b6ab-07486aaa3c15'),(5,14,13,'Press Block','pressBlock',1,'2023-04-15 08:30:31','2023-04-15 08:30:31','b2e1694b-2726-4573-b3b0-5b8b434cb708'),(6,17,14,'Top Podcast Block','topPodcastBlock',1,'2023-04-15 08:32:31','2023-04-15 08:32:31','e1e15d42-3e48-4a44-ba79-47e5f5637c51'),(7,27,17,'Content block','contentBlock',1,'2023-04-17 13:15:17','2023-04-17 13:15:17','03cadce9-3225-49bd-bac1-eb74262dd0c0'),(8,34,19,'Nav Link','navLink',1,'2023-04-20 09:49:48','2023-04-20 09:49:48','d63e36be-ae39-4138-b6e5-083ba6baeaf9'),(9,38,22,'NavigationHeader','navigationheader',1,'2023-04-20 14:04:25','2023-04-20 14:04:25','004edc04-88c9-401b-815d-54163a594af8'),(10,45,25,'menu','menu',1,'2023-04-21 09:21:17','2023-04-21 09:21:17','8f61eedc-70d7-4f2c-b9b1-51f3a5978007'),(11,49,26,'menu','menu',1,'2023-04-21 09:41:14','2023-04-21 09:41:14','3b2ac91e-dbf1-464f-8c8f-28d2d929040e');
/*!40000 ALTER TABLE `cc_matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_matrixcontent_benefits`
--

LOCK TABLES `cc_matrixcontent_benefits` WRITE;
/*!40000 ALTER TABLE `cc_matrixcontent_benefits` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_matrixcontent_benefits` VALUES (1,112,1,'2023-04-18 07:03:13','2023-04-18 07:03:13','6524f101-f904-4e50-958f-b16fed883e6d',NULL);
/*!40000 ALTER TABLE `cc_matrixcontent_benefits` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_matrixcontent_bottonmenu`
--

LOCK TABLES `cc_matrixcontent_bottonmenu` WRITE;
/*!40000 ALTER TABLE `cc_matrixcontent_bottonmenu` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_matrixcontent_bottonmenu` VALUES (1,147,1,'2023-04-21 09:52:27','2023-04-21 09:52:27','33bdc976-e4d6-4d07-a18f-321ae4aa9aec','TERMS & CONDITIONS'),(2,148,1,'2023-04-21 09:52:27','2023-04-21 09:52:27','b925342e-5ed3-4c26-a67d-31859ab03c28','PRIVACY POLICY'),(3,149,1,'2023-04-21 09:52:27','2023-04-21 09:52:27','416a5ce0-8a6b-4d55-b2ea-143c63e62b2e','COOKIE POLICY'),(4,151,1,'2023-04-21 10:07:29','2023-04-21 12:16:08','2ab7a4ea-1679-4999-817b-308a937583de','TERMS & CONDITION'),(5,152,1,'2023-04-21 10:07:29','2023-04-21 12:16:08','fb2fa48d-19b3-4be4-ba77-655bea5280f5','PRIVACY POLICY'),(6,153,1,'2023-04-21 10:07:29','2023-04-21 12:16:08','7b1f36ac-a1ec-4fe1-b452-874b7bc92a9b','COOKIE POLICY');
/*!40000 ALTER TABLE `cc_matrixcontent_bottonmenu` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_matrixcontent_faqdata`
--

LOCK TABLES `cc_matrixcontent_faqdata` WRITE;
/*!40000 ALTER TABLE `cc_matrixcontent_faqdata` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_matrixcontent_faqdata` VALUES (1,20,1,'2023-04-14 10:46:15','2023-04-14 10:46:15','d4ec4bd0-68b3-4f39-aec2-c73021eef50f',NULL,NULL),(2,21,1,'2023-04-14 10:46:15','2023-04-14 10:46:15','f746b27d-e2c6-47d5-8601-101be91dc94d',NULL,NULL),(3,22,1,'2023-04-14 10:46:30','2023-04-14 10:46:30','716b9be8-8862-4372-95ed-d4e97ab9cedb','How do I delete my account??',NULL),(4,23,1,'2023-04-14 10:46:30','2023-04-14 10:46:30','452eb4b5-021f-480e-9b66-371aee724dd7',NULL,NULL),(5,24,1,'2023-04-14 10:46:35','2023-04-14 10:46:35','1f5cb6ee-d966-45c1-851f-2fcdcab037d3','How do I delete my account??','<p>You can delete your account by emailing to <strong>privacy@podspun.com</strong>.</p>'),(6,25,1,'2023-04-14 10:46:35','2023-04-14 10:46:35','36bce834-f308-4596-a0d8-3774f488da04',NULL,NULL),(7,26,1,'2023-04-14 10:46:42','2023-04-14 10:46:42','7864c2a6-0eda-49fd-9b8d-9ea82f9dc9f5','How do I delete my account??','<p>You can delete your account by emailing to <strong>privacy@podspun.com</strong>.</p>'),(8,27,1,'2023-04-14 10:46:42','2023-04-14 10:46:42','ea7da936-5b4d-4991-84b9-e600a9ea4d10','What IQ number do I have to be to edit locked metadata?',NULL),(9,28,1,'2023-04-14 10:46:48','2023-04-14 10:46:48','8da6c8f0-4da9-484f-aa4c-50a504f06595','How do I delete my account??','<p>You can delete your account by emailing to <strong>privacy@podspun.com</strong>.</p>'),(10,29,1,'2023-04-14 10:46:48','2023-04-14 10:46:48','e0cfc2a7-f33b-4f21-9f49-0c1f3f715873','What IQ number do I have to be to edit locked metadata?','<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit nesciunt beatae debitis delectus pariatur nostrum maiores magni quibusdam officia tempore quis ea molestiae ducimus error</p>'),(13,32,1,'2023-04-14 10:46:49','2023-04-14 10:51:45','b6c05c6e-5ce5-4c8c-8a70-418b97e30d57','How do I delete my account??','<p>You can delete your account by emailing to <strong>privacy@podspun.com</strong>.</p>'),(14,33,1,'2023-04-14 10:46:49','2023-04-14 10:51:45','c2e02985-acb6-4699-9179-c52efed0fefb','What IQ number do I have to be to edit locked metadata?','<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit nesciunt beatae debitis delectus pariatur nostrum maiores magni quibusdam officia tempore quis ea molestiae ducimus error</p>'),(15,35,1,'2023-04-14 10:46:49','2023-04-14 10:46:49','a2115ab0-bfb6-4467-b070-3cdc5f1e2394','How do I delete my account??','<p>You can delete your account by emailing to <strong>privacy@podspun.com</strong>.</p>'),(16,36,1,'2023-04-14 10:46:49','2023-04-14 10:46:49','db00bd87-0b0f-43bc-8932-8a882702c62f','What IQ number do I have to be to edit locked metadata?','<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit nesciunt beatae debitis delectus pariatur nostrum maiores magni quibusdam officia tempore quis ea molestiae ducimus error</p>'),(19,41,1,'2023-04-14 10:47:09','2023-04-14 10:47:09','78a2e699-0f9b-4a14-8c7e-8ef2a832d2dd','What IQ number do I have to be to edit locked metadata?','<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit nesciunt beatae debitis delectus pariatur nostrum maiores magni quibusdam officia tempore quis ea molestiae ducimus error</p>'),(20,42,1,'2023-04-14 10:47:09','2023-04-14 10:47:09','63964ae4-60fd-4b9f-853d-e4a86ff4d2b5','How do I delete my account??','<p>You can delete your account by emailing to <strong>privacy@podspun.com</strong>.</p>'),(21,44,1,'2023-04-14 10:47:49','2023-04-14 10:47:49','47a22464-adc1-45d7-b7f7-bbd6115f0676','What IQ number do I have to be to edit locked metadata?','<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit nesciunt beatae debitis delectus pariatur nostrum maiores magni quibusdam officia tempore quis ea molestiae ducimus error</p>'),(22,45,1,'2023-04-14 10:47:49','2023-04-14 10:47:49','262ec716-8ce8-4f0e-bbc6-5e2231a9b8c5','How do I delete my account??','<p>You can delete your account by emailing to <strong>privacy@podspun.com</strong>.</p>'),(25,49,1,'2023-04-14 10:49:21','2023-04-14 10:49:21','6bf3cfd5-012f-417d-a475-d7f1ae4d5d1f',NULL,NULL),(26,50,1,'2023-04-14 10:49:25','2023-04-14 10:49:25','ce097984-bece-41f0-a6b2-51e257d6f4e7',NULL,NULL),(27,51,1,'2023-04-14 10:49:25','2023-04-14 10:49:25','4fcfd04e-b0d9-4d6c-bd00-dca3d6a72e5d',NULL,NULL),(28,53,1,'2023-04-14 10:51:08','2023-04-14 10:51:08','caa6e632-933d-465e-9cb2-9113d182dbf2','What IQ number do I have to be to edit locked metadata?','<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit nesciunt beatae debitis delectus pariatur nostrum maiores magni quibusdam officia tempore quis ea molestiae ducimus error</p>'),(29,54,1,'2023-04-14 10:51:08','2023-04-14 10:51:08','4c4f8105-a9d0-40fc-b093-a8e349fce10e','How do I delete my account??','<p>You can delete your account by emailing to <strong>privacy@podspun.com</strong>.</p>'),(30,59,1,'2023-04-14 10:51:45','2023-04-14 10:51:45','e56e99ca-1b9c-4baa-979e-e188622137ad','What IQ number do I have to be to edit locked metadata?','<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit nesciunt beatae debitis delectus pariatur nostrum maiores magni quibusdam officia tempore quis ea molestiae ducimus error</p>'),(31,60,1,'2023-04-14 10:51:45','2023-04-14 10:51:45','dc46cbac-cecc-4a3c-957a-2033e863e359','How do I delete my account??','<p>You can delete your account by emailing to <strong>privacy@podspun.com</strong>.</p>'),(32,92,1,'2023-04-17 13:07:27','2023-04-17 13:07:27','794c7568-ae50-4a34-beb1-68d3f85fc647','What IQ number do I have to be to edit locked metadata?','<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit nesciunt beatae debitis delectus pariatur nostrum maiores magni quibusdam officia tempore quis ea molestiae ducimus error</p>'),(33,93,1,'2023-04-17 13:07:27','2023-04-17 13:07:27','c98e1403-3488-423d-9a19-438a687adccf','How do I delete my account??','<p>You can delete your account by emailing to <strong>privacy@podspun.com</strong>.</p>');
/*!40000 ALTER TABLE `cc_matrixcontent_faqdata` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_matrixcontent_forumsdata`
--

LOCK TABLES `cc_matrixcontent_forumsdata` WRITE;
/*!40000 ALTER TABLE `cc_matrixcontent_forumsdata` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_matrixcontent_forumsdata` VALUES (1,55,1,'2023-04-14 10:51:31','2023-04-14 10:51:31','f9f4204e-f632-49d6-b597-0cf2ffa392d7','How do I report abuse in the forums?',NULL),(3,57,1,'2023-04-14 10:51:45','2023-04-14 10:51:45','237a43ef-96d1-47cf-a997-1948c23b75a7','How do I report abuse in the forums?','Lorem ipsum dolor sit amet consectetur adipisicing elit.'),(4,61,1,'2023-04-14 10:51:45','2023-04-14 10:51:45','3a3b5220-02e5-43f2-b620-20882e5ea0ec','How do I report abuse in the forums?','Lorem ipsum dolor sit amet consectetur adipisicing elit.'),(5,94,1,'2023-04-17 13:07:27','2023-04-17 13:07:27','d9b59f44-f44b-404b-bc0e-e9be72781440','How do I report abuse in the forums?','Lorem ipsum dolor sit amet consectetur adipisicing elit.'),(6,95,1,'2023-04-17 13:07:27','2023-04-17 13:07:27','73e0c633-420e-48c7-94fc-bdcdb195528a',NULL,NULL);
/*!40000 ALTER TABLE `cc_matrixcontent_forumsdata` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_matrixcontent_menufields`
--

LOCK TABLES `cc_matrixcontent_menufields` WRITE;
/*!40000 ALTER TABLE `cc_matrixcontent_menufields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_matrixcontent_menufields` VALUES (1,5,1,'2023-04-14 09:41:03','2023-04-14 09:41:03','b4deda8a-554d-4471-9cc1-0aa807d97e72',NULL),(2,6,1,'2023-04-14 09:41:05','2023-04-14 09:41:05','d1c71a62-9dd6-4d8d-8e11-2bae75698e6f',NULL),(3,7,1,'2023-04-14 09:41:05','2023-04-14 09:41:05','059ba172-26ce-4d47-b18f-0bb2b9cc4739',NULL),(4,8,1,'2023-04-14 09:41:08','2023-04-14 09:41:08','7c7b6754-68e3-4f3c-923f-cdc4f33e2354',NULL),(5,9,1,'2023-04-14 09:41:08','2023-04-14 09:41:08','6f5a8598-dc90-4f44-a97b-0afa721b38e8',NULL),(6,10,1,'2023-04-14 09:41:08','2023-04-14 09:41:08','739e313c-44c2-4ee8-922c-6eaadde16fc9',NULL),(7,66,1,'2023-04-15 04:59:03','2023-04-15 04:59:03','5b4c98f3-b502-407c-8fb6-e3c1289fb83d',NULL),(8,67,1,'2023-04-15 04:59:05','2023-04-15 04:59:05','2bde688c-8a2a-448c-ad31-1058cc634137',NULL),(9,68,1,'2023-04-15 04:59:05','2023-04-15 04:59:05','0725be66-80d9-4717-9432-7550b9450970',NULL),(11,96,1,'2023-04-17 13:09:04','2023-04-17 13:09:04','e19a3b26-b0da-4c8e-bfaf-b22ba61effa6',NULL),(12,101,1,'2023-04-17 13:17:01','2023-04-17 13:17:01','3fced92e-909c-4b6d-ad47-ee6cf8601ae0','Get Started'),(13,103,1,'2023-04-17 13:17:01','2023-04-17 13:17:01','ceb9b725-3497-45e4-aa62-35629b9f0959','Get Started'),(14,121,1,'2023-04-20 10:02:59','2023-04-20 10:02:59','6d82b0c9-cae9-4d28-933e-a8d0313dc3d6','Get Started'),(15,122,1,'2023-04-20 10:02:59','2023-04-20 10:02:59','32f72184-d1a6-42ee-a2f7-f2a318de3e11',NULL),(16,142,1,'2023-04-21 09:36:48','2023-04-21 09:52:27','a1e856b8-f04f-476e-8730-7711ca744bbb','FAQ'),(17,143,1,'2023-04-21 09:36:48','2023-04-21 09:52:27','b51548b0-c889-432c-8ef0-5cc6578d88d9','Services'),(18,144,1,'2023-04-21 09:36:48','2023-04-21 09:52:27','1a1204b6-fc36-40a4-ac5f-94cce13aae0f','Contact');
/*!40000 ALTER TABLE `cc_matrixcontent_menufields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_matrixcontent_navigation`
--

LOCK TABLES `cc_matrixcontent_navigation` WRITE;
/*!40000 ALTER TABLE `cc_matrixcontent_navigation` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_matrixcontent_navigation` VALUES (1,115,1,'2023-04-20 09:58:20','2023-04-20 09:59:19','c5c16695-b021-4765-aa74-d83cbcb5bc29','Sign Up / Login'),(2,116,1,'2023-04-20 09:58:20','2023-04-20 09:59:19','f4ae52c9-2b3b-4f95-8371-47df057ef5bd','About Us'),(3,117,1,'2023-04-20 09:58:20','2023-04-20 09:59:19','de7dc146-bcf8-488e-b7f7-e4f9209ba014','FAQ\'s'),(4,118,1,'2023-04-20 09:58:20','2023-04-20 09:59:19','5678cbb3-99f0-48bc-b44a-1cc7063b7369','Services'),(5,119,1,'2023-04-20 09:58:20','2023-04-20 09:59:19','5b1cf68d-5a7b-417a-9f08-0e89f7e9d948','Contact'),(6,124,1,'2023-04-20 11:00:54','2023-04-20 13:33:46','f8f172d0-3001-46f8-99c8-da9455db224a','My Podcast'),(7,125,1,'2023-04-20 11:00:54','2023-04-20 13:33:46','812bbb74-562f-4212-87b8-08e178104588','My Profile'),(8,126,1,'2023-04-20 11:00:54','2023-04-20 13:33:46','2d08bc63-2fba-4b65-a3b5-40eb8c06876a','Logout'),(9,132,1,'2023-04-20 14:03:21','2023-04-20 14:03:21','e3769221-1222-4e38-89b6-2bfb9a2b4ea6',NULL);
/*!40000 ALTER TABLE `cc_matrixcontent_navigation` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_matrixcontent_pageheader`
--

LOCK TABLES `cc_matrixcontent_pageheader` WRITE;
/*!40000 ALTER TABLE `cc_matrixcontent_pageheader` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_matrixcontent_pageheader` VALUES (1,134,1,'2023-04-20 14:05:24','2023-04-20 14:05:24','b6a52675-291a-4918-80c9-01d7d57074d5'),(3,136,1,'2023-04-20 14:05:32','2023-04-20 14:05:32','138430c4-ca5e-4c0f-912b-1691d63851c1'),(4,138,1,'2023-04-20 14:05:32','2023-04-20 14:05:32','24d5abda-4e77-4c34-9f50-74a6aed7208b');
/*!40000 ALTER TABLE `cc_matrixcontent_pageheader` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_matrixcontent_presscontent`
--

LOCK TABLES `cc_matrixcontent_presscontent` WRITE;
/*!40000 ALTER TABLE `cc_matrixcontent_presscontent` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_matrixcontent_presscontent` VALUES (1,82,1,'2023-04-17 13:06:47','2023-04-17 13:06:47','be8a46c9-c31d-4336-bf15-7e2068367bb7',NULL,NULL),(2,83,1,'2023-04-17 13:06:47','2023-04-17 13:06:47','8c2f26a2-b86f-4199-8797-7dbf3d095257',NULL,NULL),(3,84,1,'2023-04-17 13:06:47','2023-04-17 13:06:47','c22b5413-dd8d-40f2-8c92-12184f7eecf9',NULL,NULL),(4,85,1,'2023-04-17 13:06:49','2023-04-17 13:06:49','e23b28fe-ce93-4ec0-98db-04462cd1a459',NULL,NULL),(5,86,1,'2023-04-17 13:06:49','2023-04-17 13:06:49','fc15b9f9-d293-4c5d-88dc-51c523b7e78b',NULL,NULL),(6,87,1,'2023-04-17 13:06:49','2023-04-17 13:06:49','b6c1ac08-6d02-4e0f-8465-855e213f6731',NULL,NULL),(7,88,1,'2023-04-17 13:06:52','2023-04-17 13:06:52','dc816a3e-0e51-479f-b08d-7bcf8fb704c5',NULL,NULL),(8,89,1,'2023-04-17 13:06:52','2023-04-17 13:06:52','fc6bba46-76dd-457c-9541-65827eee76a3',NULL,NULL),(9,90,1,'2023-04-17 13:06:52','2023-04-17 13:06:52','22cab1ce-7e55-4fa1-8832-ff81c7217f12',NULL,NULL),(10,107,1,'2023-04-17 15:01:47','2023-04-17 15:01:47','1f72e137-9690-40e7-8104-fdae2af2cde3',NULL,NULL),(11,108,1,'2023-04-17 15:01:53','2023-04-17 15:01:53','9e336dd5-1608-44a7-8a8c-dada1d9789e5',NULL,NULL);
/*!40000 ALTER TABLE `cc_matrixcontent_presscontent` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_matrixcontent_socialmenu`
--

LOCK TABLES `cc_matrixcontent_socialmenu` WRITE;
/*!40000 ALTER TABLE `cc_matrixcontent_socialmenu` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_matrixcontent_socialmenu` VALUES (1,145,1,'2023-04-21 09:36:48','2023-04-21 09:52:27','6cfded6c-cff7-4348-83e6-33b1afbf54bd','Instagram'),(2,146,1,'2023-04-21 09:39:02','2023-04-21 09:52:27','977f3e7d-126d-4856-9ca6-514a54c19967','Twitter');
/*!40000 ALTER TABLE `cc_matrixcontent_socialmenu` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_matrixcontent_toppodcastcontent`
--

LOCK TABLES `cc_matrixcontent_toppodcastcontent` WRITE;
/*!40000 ALTER TABLE `cc_matrixcontent_toppodcastcontent` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_matrixcontent_toppodcastcontent` VALUES (1,79,1,'2023-04-15 09:33:17','2023-04-15 09:33:17','89b7b2e9-9764-48cb-a059-56acaf751c16',NULL,NULL),(2,80,1,'2023-04-15 09:33:20','2023-04-15 09:33:20','1fbe9da5-50cf-4229-a9fc-d958fc39b1d9',NULL,NULL),(3,81,1,'2023-04-15 09:33:20','2023-04-15 09:33:20','fe490545-8b3a-49d7-9a50-840d161ed335',NULL,NULL);
/*!40000 ALTER TABLE `cc_matrixcontent_toppodcastcontent` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_migrations`
--

LOCK TABLES `cc_migrations` WRITE;
/*!40000 ALTER TABLE `cc_migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_migrations` VALUES (1,'craft','Install','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','29e255c9-317d-44e8-8e64-c0767ae424ca'),(2,'craft','m150403_183908_migrations_table_changes','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','6b1f022e-d3ed-4df2-864f-2c2d07616c0a'),(3,'craft','m150403_184247_plugins_table_changes','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','7e44609d-e21d-4705-927c-c403de0f9b7a'),(4,'craft','m150403_184533_field_version','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','f0b2b432-173e-488e-b601-f41a74331ec6'),(5,'craft','m150403_184729_type_columns','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','269bff1f-fb85-4ebb-9e9c-1638e03f92e3'),(6,'craft','m150403_185142_volumes','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','384615be-707b-419a-8cf7-362e6d7cf511'),(7,'craft','m150428_231346_userpreferences','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','198dd358-3a95-4336-ae61-ca4e33c382f1'),(8,'craft','m150519_150900_fieldversion_conversion','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','c2d1c6d5-8ede-4baa-a050-e46bcc84df2b'),(9,'craft','m150617_213829_update_email_settings','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','cf4060b2-3fa2-484a-ab20-42218fb4ef6e'),(10,'craft','m150721_124739_templatecachequeries','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','c85f09b4-d5db-4eb3-a4b0-5b8455763209'),(11,'craft','m150724_140822_adjust_quality_settings','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','a71912f0-9533-4d8d-a150-e8340dadb617'),(12,'craft','m150815_133521_last_login_attempt_ip','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','884c632c-2d5c-45ff-b266-40c1cf022fdf'),(13,'craft','m151002_095935_volume_cache_settings','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','b693b683-0d0d-47d9-b4c8-778f422a24f9'),(14,'craft','m151005_142750_volume_s3_storage_settings','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','dffc59fe-53a0-4fc3-8882-69e64ae8b628'),(15,'craft','m151016_133600_delete_asset_thumbnails','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','5fd9cfed-eb7e-4fbf-a8ef-e0b30b84e954'),(16,'craft','m151209_000000_move_logo','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','67cd062a-771b-4d23-8f9f-d50405e0f499'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','9bb209c2-eb74-4176-b19b-eb5c4b365606'),(18,'craft','m151215_000000_rename_asset_permissions','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','111b79cb-6c16-4fdf-9123-c6672ec34665'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','3637982e-48a4-4a51-a33a-543cf031181f'),(20,'craft','m160708_185142_volume_hasUrls_setting','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','1e9d8180-b5ea-4138-b2d3-b4e400b7ca17'),(21,'craft','m160714_000000_increase_max_asset_filesize','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','fa96a7fc-492a-4e9d-9b5b-99e91763aeed'),(22,'craft','m160727_194637_column_cleanup','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','1bd97f74-3ab6-4803-a4e6-440508491764'),(23,'craft','m160804_110002_userphotos_to_assets','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','33f44e06-b048-4b9b-bb9d-11f5a8135865'),(24,'craft','m160807_144858_sites','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','5fe27a29-52bb-44b0-a3f0-adb1f748ae5a'),(25,'craft','m160829_000000_pending_user_content_cleanup','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','db51dc54-a95e-416d-9b38-668b261ab3f5'),(26,'craft','m160830_000000_asset_index_uri_increase','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','d9e8f546-2ba1-476f-aae0-052e756d7f44'),(27,'craft','m160912_230520_require_entry_type_id','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','4de83cba-bdeb-4142-990f-f9605c9f75ec'),(28,'craft','m160913_134730_require_matrix_block_type_id','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','1dc752bc-f80d-4a11-ae07-52d86d33083f'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','e2209945-0250-4e3b-88b4-bea4c378b423'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','f87c7cfc-cf71-4b4c-ac2b-f0c3928d748f'),(31,'craft','m160925_113941_route_uri_parts','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','0a8003fd-7711-4257-bf0f-03fa1b6fceeb'),(32,'craft','m161006_205918_schemaVersion_not_null','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','74729de9-98c4-4ead-82a7-c5ad392d36a0'),(33,'craft','m161007_130653_update_email_settings','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','8e711cfd-f745-4de2-be9c-7308f3d493bd'),(34,'craft','m161013_175052_newParentId','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','fb43188b-b3f6-4b3e-8970-0ffd633bab2c'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','8696eb7d-24c1-4095-abbf-acab9f34c65f'),(36,'craft','m161021_182140_rename_get_help_widget','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','dc51f719-0921-4066-be46-1791ffe0f8dd'),(37,'craft','m161025_000000_fix_char_columns','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','0bf7e528-5eb1-4eb9-b6f0-8a7ad22c3d9a'),(38,'craft','m161029_124145_email_message_languages','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','93ddbc5d-4e1a-4074-bc56-b50b215225b8'),(39,'craft','m161108_000000_new_version_format','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','9c4b723f-9b66-48a0-987a-eba87416ede8'),(40,'craft','m161109_000000_index_shuffle','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','4e374b62-d7a1-4de5-84de-a5fb20d38b8f'),(41,'craft','m161122_185500_no_craft_app','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','b3c8f3cd-5087-467b-87c5-d02bdef800a5'),(42,'craft','m161125_150752_clear_urlmanager_cache','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','80fbf3c3-f6f9-4db6-9130-dece1b93dec6'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','71621865-7927-4002-ae82-7167cec2731e'),(44,'craft','m170114_161144_udates_permission','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','cbb9d95c-67c5-452e-b970-7734f228b9e0'),(45,'craft','m170120_000000_schema_cleanup','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','f5a3c457-7ca6-43af-91cf-a0484003464f'),(46,'craft','m170126_000000_assets_focal_point','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','7a64a9dc-b2d4-445b-864c-dcc991eb7523'),(47,'craft','m170206_142126_system_name','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','cfc212a9-9165-4fe3-b31a-57a206eba06a'),(48,'craft','m170217_044740_category_branch_limits','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','8114ad9a-3662-4755-9cff-96214fb757d2'),(49,'craft','m170217_120224_asset_indexing_columns','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','3f0d85a9-e1d4-4a41-a843-7a2c9d869349'),(50,'craft','m170223_224012_plain_text_settings','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','3b228744-4ecc-4805-8c86-ffa83ae69a84'),(51,'craft','m170227_120814_focal_point_percentage','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','296ddd22-159b-41de-a5d6-0b1adb835571'),(52,'craft','m170228_171113_system_messages','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','3c24b0ab-58e6-4578-aaae-282f2dcf99a6'),(53,'craft','m170303_140500_asset_field_source_settings','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','fa17fb88-2e42-4e3f-865e-76c7a35df411'),(54,'craft','m170306_150500_asset_temporary_uploads','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','7485d8df-e419-49aa-94cb-008abbd0c58f'),(55,'craft','m170523_190652_element_field_layout_ids','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','1801eff3-2e0a-4d8b-bee3-2a73eb025e0e'),(56,'craft','m170621_195237_format_plugin_handles','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','834178ee-dd48-4c77-bb6e-d6b1bf85808a'),(57,'craft','m170630_161027_deprecation_line_nullable','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','1f77dced-4b6f-4724-88d6-5d670be217f2'),(58,'craft','m170630_161028_deprecation_changes','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','515574cf-8b32-46bd-a314-f4958289703a'),(59,'craft','m170703_181539_plugins_table_tweaks','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','c4a9c3e4-414a-4c68-8379-17650db038d0'),(60,'craft','m170704_134916_sites_tables','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','3cc47d0f-2bf4-4265-bc47-bd151e71822a'),(61,'craft','m170706_183216_rename_sequences','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','9bec0d1d-f295-49e1-9522-04488c757ecb'),(62,'craft','m170707_094758_delete_compiled_traits','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','8db33dab-5f71-464a-a9db-f00bc0c8baed'),(63,'craft','m170731_190138_drop_asset_packagist','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','4be774e5-4333-4e84-8843-459a904336c5'),(64,'craft','m170810_201318_create_queue_table','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','91ff7d1c-85a1-429c-91b3-ff449bf16f34'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','820239d6-09a5-48c6-910e-595a53c6620d'),(66,'craft','m170914_204621_asset_cache_shuffle','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','0fbfe227-f030-418f-8772-ad8fddf7b7d7'),(67,'craft','m171011_214115_site_groups','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','e0ecee2b-356c-4a5d-a759-efa050e4faac'),(68,'craft','m171012_151440_primary_site','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','3e743bcc-f5e0-490e-a54e-c9fa81e981fb'),(69,'craft','m171013_142500_transform_interlace','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','5027a608-8a6b-46ce-9e13-c49ce977080a'),(70,'craft','m171016_092553_drop_position_select','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','b6cee21e-1189-4680-9235-dcf44583038f'),(71,'craft','m171016_221244_less_strict_translation_method','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','48abe410-58f8-4497-8690-ec6ae7e00d0c'),(72,'craft','m171107_000000_assign_group_permissions','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','799a650b-fef7-4a45-98ab-8fd637ebc18e'),(73,'craft','m171117_000001_templatecache_index_tune','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','44764af3-55e9-42b9-bb7f-10dc05379b06'),(74,'craft','m171126_105927_disabled_plugins','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','29713c88-1a8b-479b-af77-1cf06565803c'),(75,'craft','m171130_214407_craftidtokens_table','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','cb207db0-8401-48ed-ab8a-46912c3e6360'),(76,'craft','m171202_004225_update_email_settings','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','e189dfac-ee4b-44a9-9289-2fc5fdf9d924'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','35fea54d-0ae5-4978-b518-5a0645d8d007'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','ac0cf148-62fd-4d4c-986f-650460d9d69b'),(79,'craft','m171218_143135_longtext_query_column','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','b0f376af-60d1-4add-92b6-9026ef43c081'),(80,'craft','m171231_055546_environment_variables_to_aliases','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','a221e570-5064-4d1c-a6f4-5bfa8000026d'),(81,'craft','m180113_153740_drop_users_archived_column','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','da33a6d1-9865-42c5-ad1e-36c42e0dd4fe'),(82,'craft','m180122_213433_propagate_entries_setting','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','85424fd2-196f-4923-8b7f-83380d32aa53'),(83,'craft','m180124_230459_fix_propagate_entries_values','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','400a7255-bbba-4a48-9487-502ee6cb005c'),(84,'craft','m180128_235202_set_tag_slugs','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','d7a93710-412c-4db2-b195-0218473254c1'),(85,'craft','m180202_185551_fix_focal_points','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','f100a7d0-6f2d-4e31-9c4b-5a2bd3ad1fa1'),(86,'craft','m180217_172123_tiny_ints','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','f14595c1-511c-4029-9d63-13055f4cef39'),(87,'craft','m180321_233505_small_ints','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','ffd66449-3aa8-4e20-9caa-d23e8369199f'),(88,'craft','m180404_182320_edition_changes','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','a6891d95-b1d2-4082-a46d-28ad145d6768'),(89,'craft','m180411_102218_fix_db_routes','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','8521101d-8f73-4b12-b532-29985b420bf0'),(90,'craft','m180416_205628_resourcepaths_table','2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-14 08:36:26','3238aa7f-931b-4dc8-a71c-213925f6c950'),(91,'craft','m180418_205713_widget_cleanup','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','9da6e2fb-7801-46f1-ae1f-41f50c471e2a'),(92,'craft','m180425_203349_searchable_fields','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','1dd5a117-283f-4b49-ba6e-5fbd63836492'),(93,'craft','m180516_153000_uids_in_field_settings','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','1f493104-91d1-4b12-b84b-6c1e392e497e'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','050efb9b-ee6d-4cfa-8f2d-67f679f53dfd'),(95,'craft','m180518_173000_permissions_to_uid','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','10712143-ee65-4044-ada8-ac961ed439b5'),(96,'craft','m180520_173000_matrix_context_to_uids','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','29060336-64ae-4f12-8370-4f4370f34124'),(97,'craft','m180521_172900_project_config_table','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','c0c629b8-c705-400f-abea-3a5ca60d2e7d'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','3359ad28-a4f9-4976-89ad-373d6296cb64'),(99,'craft','m180731_162030_soft_delete_sites','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','8b6f4941-32c0-4838-9533-4b0849ac4a05'),(100,'craft','m180810_214427_soft_delete_field_layouts','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','a162b475-b21f-40c0-b14b-90aafc489ee0'),(101,'craft','m180810_214439_soft_delete_elements','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','5b58b417-8240-465c-a4dc-8959d5389fe7'),(102,'craft','m180824_193422_case_sensitivity_fixes','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','8c7800d7-0af8-4c08-844f-52e01471df92'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','b88886af-e640-4188-8a8f-7fbe8e89a1bc'),(104,'craft','m180904_112109_permission_changes','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','77c2f40a-fa18-4867-940a-a02b04936904'),(105,'craft','m180910_142030_soft_delete_sitegroups','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','4d71af4b-d49b-4f18-8f3d-63d15da00754'),(106,'craft','m181011_160000_soft_delete_asset_support','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','a5a47241-e1f0-4fe5-b626-96c910288533'),(107,'craft','m181016_183648_set_default_user_settings','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','62ae168d-667d-480e-b893-8701f2cd6b9f'),(108,'craft','m181017_225222_system_config_settings','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','2f7a9203-fea4-4657-8ceb-4d0edbff5291'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','edb83b22-20d5-4c2d-83db-50d3062d1a25'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','152631c8-636b-43b1-a548-28e4314bfc5f'),(111,'craft','m181112_203955_sequences_table','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','e4a02162-29f7-42c9-8f15-480278c4a617'),(112,'craft','m181121_001712_cleanup_field_configs','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','5a1025f5-83ee-4415-8a20-8ec4cb97d812'),(113,'craft','m181128_193942_fix_project_config','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','10b0a39d-b25d-4888-98c3-836a9bdcafc1'),(114,'craft','m181130_143040_fix_schema_version','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','a49c3c81-84ed-43ad-a654-758a9799ecdb'),(115,'craft','m181211_143040_fix_entry_type_uids','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','03c75cf4-9c5d-468e-a78e-b943c08e3d8b'),(116,'craft','m181217_153000_fix_structure_uids','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','791be916-5025-4a35-ae64-38c422fb11c2'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','e60d10b2-1eb7-40d5-91d0-d064081ce7a3'),(118,'craft','m190108_110000_cleanup_project_config','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','246794d8-05e2-42a4-94fa-0be3026914de'),(119,'craft','m190108_113000_asset_field_setting_change','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','f38489e2-ba50-48a9-853d-e5361880de39'),(120,'craft','m190109_172845_fix_colspan','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','bd16ae1b-7b99-4a10-b8ff-3cce128dceac'),(121,'craft','m190110_150000_prune_nonexisting_sites','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','4375a96a-4ed6-411c-9a50-c5595f68fcd2'),(122,'craft','m190110_214819_soft_delete_volumes','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','a6576950-ed3e-46bc-b828-087a8cf1b709'),(123,'craft','m190112_124737_fix_user_settings','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','e636a65d-ab5a-4601-add4-6501207cc3c9'),(124,'craft','m190112_131225_fix_field_layouts','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','f31b34fa-e140-4b0c-9492-ab519736064a'),(125,'craft','m190112_201010_more_soft_deletes','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','6a809b17-790f-4182-93c3-4f9b0772f332'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','9ad3245d-6a01-4558-9eed-1180b274c768'),(127,'craft','m190121_120000_rich_text_config_setting','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','956431d0-675c-4360-855c-2a487e0669c8'),(128,'craft','m190125_191628_fix_email_transport_password','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','9cd51cf5-17f1-49b2-95f6-271a4e632895'),(129,'craft','m190128_181422_cleanup_volume_folders','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','0b25e003-7578-4f44-8209-23e80155fa32'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','ace6cae7-29b6-455f-931a-5f72f2ef6727'),(131,'craft','m190218_143000_element_index_settings_uid','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','dc17f88f-4e25-4d24-a0bf-dc522bb7dcdc'),(132,'craft','m190312_152740_element_revisions','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','65f3024b-b3a0-42b5-8cee-0bf2b248101a'),(133,'craft','m190327_235137_propagation_method','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','9d05782f-4a19-4e3d-8c7a-70718aae7102'),(134,'craft','m190401_223843_drop_old_indexes','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','b4d24a13-2c77-46b4-b687-0f97636483b6'),(135,'craft','m190416_014525_drop_unique_global_indexes','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','bcccd916-edfe-4535-ac05-2844c0d5d808'),(136,'craft','m190417_085010_add_image_editor_permissions','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','bc4a735d-745a-43de-a5d0-b20b4786f0aa'),(137,'craft','m190502_122019_store_default_user_group_uid','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','c6a3943b-45c8-4863-ae8c-29e717851ac9'),(138,'craft','m190504_150349_preview_targets','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','3b4c0f67-e6d6-4287-8bfa-19f3cc9feeef'),(139,'craft','m190516_184711_job_progress_label','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','c198eb7f-cd83-4e0d-99f2-c361c5e1dba6'),(140,'craft','m190523_190303_optional_revision_creators','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','35719d72-8dde-4667-b814-6d74be7dd46f'),(141,'craft','m190529_204501_fix_duplicate_uids','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','fb0a7e22-81b0-4939-a10b-39c4d75155c7'),(142,'craft','m190605_223807_unsaved_drafts','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','4f856626-57a4-4857-9359-ab9b782f01be'),(143,'craft','m190607_230042_entry_revision_error_tables','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','740c0dca-fc29-4f74-ae8a-4e4bd1abcd3c'),(144,'craft','m190608_033429_drop_elements_uid_idx','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','202a9eb8-bc38-4639-913d-ded66e5b053d'),(145,'craft','m190617_164400_add_gqlschemas_table','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','b64a1c69-0585-43dc-a65f-c6713761de6e'),(146,'craft','m190624_234204_matrix_propagation_method','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','628d598f-7a31-40d2-bc0e-404b85377007'),(147,'craft','m190711_153020_drop_snapshots','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','1180a2e6-58cb-4776-bfc8-51c5e7d1fc89'),(148,'craft','m190712_195914_no_draft_revisions','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','ea4d5afd-e4f2-4e9c-aedd-8529767d6806'),(149,'craft','m190723_140314_fix_preview_targets_column','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','24ee3541-df98-44b6-9552-5b2770d289df'),(150,'craft','m190820_003519_flush_compiled_templates','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','5befb1cc-b62e-4baf-aa93-f457af7c97e0'),(151,'craft','m190823_020339_optional_draft_creators','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','29ac32f2-c78d-40d4-af31-992e11bb33e2'),(152,'craft','m190913_152146_update_preview_targets','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','cc362fae-2ee7-4510-8aaa-bfbff36a2d0b'),(153,'craft','m191107_122000_add_gql_project_config_support','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','1ea92a8e-24c8-40a7-96cb-09ef66228d14'),(154,'craft','m191204_085100_pack_savable_component_settings','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','e6a125a9-d149-442d-9292-18f8c9b85743'),(155,'craft','m191206_001148_change_tracking','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','e6e651b1-ea38-43ef-b0b2-8458e1415df8'),(156,'craft','m191216_191635_asset_upload_tracking','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','e318cf7b-6b82-4b27-890c-3021f86378b3'),(157,'craft','m191222_002848_peer_asset_permissions','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','34fdcad4-4c42-4bc6-96be-fa33859ccb40'),(158,'craft','m200127_172522_queue_channels','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','23397f5e-d02b-4a5f-903b-a8a909e90c09'),(159,'craft','m200211_175048_truncate_element_query_cache','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','f72b976d-6430-4290-9ce0-ed32456201ac'),(160,'craft','m200213_172522_new_elements_index','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','7441c3f3-908c-4151-9629-2b1544120a2f'),(161,'craft','m200228_195211_long_deprecation_messages','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','b381938e-7096-4fb2-9a1b-e4ea726e7637'),(162,'craft','m200306_054652_disabled_sites','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','29422aad-bd42-4ee6-9663-681f50288098'),(163,'craft','m200522_191453_clear_template_caches','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','59c321eb-faa8-4be2-87bd-e16739fdeb6c'),(164,'craft','m200606_231117_migration_tracks','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','5c49448f-1bc2-4573-ad3a-1ba51e9f679f'),(165,'craft','m200619_215137_title_translation_method','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','27e0e720-f0e0-495e-b8b0-a827c7a215dd'),(166,'craft','m200620_005028_user_group_descriptions','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','337d0e0c-271d-40e0-b311-0df3904f4622'),(167,'craft','m200620_230205_field_layout_changes','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','0b8d0be1-7e4e-47c4-b53b-dd77282b0be9'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','60569f0b-bf88-4974-ac65-75567e54e788'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','bf6189c2-d7fd-407b-a45c-d78130715f81'),(170,'craft','m200630_183000_drop_configmap','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','1b039df4-ae6c-4501-8a73-b811ecca1108'),(171,'craft','m200715_113400_transform_index_error_flag','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','8a1895e2-e967-4451-83fe-290d8d59cd87'),(172,'craft','m200716_110900_replace_file_asset_permissions','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','52a284c4-22a7-4453-b617-43f788fbc3bd'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','e4640594-932c-436d-9414-070a8baa1c32'),(174,'craft','m200720_175543_drop_unique_constraints','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','5f3f54ec-222a-486f-bfed-fc5a420fca05'),(175,'craft','m200825_051217_project_config_version','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','bdab02f5-c1e8-4bc9-a1f7-5c8963719d47'),(176,'craft','m201116_190500_asset_title_translation_method','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','ff7efb37-e8e8-4ec6-b819-c0745e0b285e'),(177,'craft','m201124_003555_plugin_trials','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','89368066-2ce1-498a-b093-ded5a895737c'),(178,'craft','m210209_135503_soft_delete_field_groups','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','144cdae3-7edc-49f4-8ef6-f9fd589d53d9'),(179,'craft','m210212_223539_delete_invalid_drafts','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','a986867f-8759-499c-90af-5e21252fd760'),(180,'craft','m210214_202731_track_saved_drafts','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','5c1980f8-88ad-4119-b0c1-72aa1e068828'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','e16bddc3-bf88-4485-a7a6-d289caad003b'),(182,'craft','m210302_212318_canonical_elements','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','3763d407-0a1c-408d-ba57-2570b2ed6097'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','f523b6ef-13e7-4681-b81f-6ba18f7ea2c5'),(184,'craft','m210329_214847_field_column_suffixes','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','c3708267-138f-4f12-93a3-ba573030ece1'),(185,'craft','m210331_220322_null_author','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','e755bcae-ca10-4006-a64b-ee4f2bc0c6c8'),(186,'craft','m210405_231315_provisional_drafts','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','e183ab27-a13d-4ccb-a6cd-bc479e63cead'),(187,'craft','m210602_111300_project_config_names_in_config','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','a83e73dd-3bf7-456c-af37-4e45ee58ea08'),(188,'craft','m210611_233510_default_placement_settings','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','b58b3585-434e-4aff-885d-99eede72e90c'),(189,'craft','m210613_145522_sortable_global_sets','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','a8447c23-ecd1-44bd-92ec-e97fae0dfb24'),(190,'craft','m210613_184103_announcements','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','d563de82-fbf1-46e5-9477-d3fbd0cc1002'),(191,'craft','m210829_000000_element_index_tweak','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','d2c440b1-e586-4236-ba0b-a3eb2de161c8'),(192,'craft','m220209_095604_add_indexes','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','537b1578-3008-4178-a831-af1173c79977'),(193,'craft','m220214_000000_truncate_sessions','2023-04-14 08:36:27','2023-04-14 08:36:27','2023-04-14 08:36:27','d876d67c-29f1-485f-afbf-589b175a733e'),(194,'craft','m230221_185926_drop_element_fks','2023-04-14 09:23:02','2023-04-14 09:23:02','2023-04-14 09:23:02','9d8e0144-2e00-4ee7-a08b-14ce8a7824e0'),(195,'craft','m230226_013114_drop_plugin_license_columns','2023-04-14 09:23:02','2023-04-14 09:23:02','2023-04-14 09:23:02','97731abc-4da5-4b38-8aab-af61ce37c3d9'),(196,'plugin:redactor','m180430_204710_remove_old_plugins','2023-04-14 10:40:59','2023-04-14 10:40:59','2023-04-14 10:40:59','b72b31b0-9bb4-4a75-8421-2350ae8c414f'),(197,'plugin:redactor','Install','2023-04-14 10:40:59','2023-04-14 10:40:59','2023-04-14 10:40:59','39231c5c-139f-4fbc-ae03-684c0abf1f5b'),(198,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2023-04-14 10:40:59','2023-04-14 10:40:59','2023-04-14 10:40:59','0b34a84e-be0c-4781-8c7d-34a091ec1b2a'),(199,'plugin:rest','Install','2023-04-14 10:52:57','2023-04-14 10:52:57','2023-04-14 10:52:57','573c262e-59c2-43b1-9f0c-6e6310302f6b');
/*!40000 ALTER TABLE `cc_migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_plugins`
--

LOCK TABLES `cc_plugins` WRITE;
/*!40000 ALTER TABLE `cc_plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_plugins` VALUES (2,'redactor','2.10.12','2.3.0','2023-04-14 10:40:59','2023-04-14 10:40:59','2023-04-14 10:40:59','25dc9dab-c3b7-45e4-83c2-6f2f56f36836'),(3,'froala-editor','4.0.18','1.0.0','2023-04-14 10:52:38','2023-04-14 10:52:38','2023-04-14 10:52:38','b1a44041-5bfa-4616-a732-e691d037ee4a'),(4,'rest','1.2.4','1.0.0','2023-04-14 10:52:57','2023-04-14 10:52:57','2023-04-14 10:52:57','a39ecf00-53be-4939-b73d-2c9a7f8a81ed');
/*!40000 ALTER TABLE `cc_plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_projectconfig`
--

LOCK TABLES `cc_projectconfig` WRITE;
/*!40000 ALTER TABLE `cc_projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_projectconfig` VALUES ('dateModified','1682079343'),('email.fromEmail','\"cjoshi@awwgment.com\"'),('email.fromName','\"Craft CMS \"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.autocapitalize','true'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.autocomplete','false'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.autocorrect','true'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.class','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.disabled','false'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.id','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.instructions','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.label','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.max','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.min','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.name','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.orientation','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.placeholder','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.readonly','false'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.requirable','false'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.size','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.step','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.tip','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.title','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.warning','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.0.width','100'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.1.fieldUid','\"462b074e-792c-44a5-a1fc-e74271f2e90e\"'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.1.instructions','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.1.label','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.1.required','false'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.1.tip','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.1.warning','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.elements.1.width','100'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.name','\"Content\"'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.fieldLayouts.2c69baf1-fa9d-4e44-adc0-074e188c6f17.tabs.0.sortOrder','1'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.handle','\"headerVisitor\"'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.hasTitleField','false'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.name','\"Header Visitor\"'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.section','\"0d1f3f4f-1fe3-4a25-a98f-3af013fd805b\"'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.sortOrder','1'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.titleFormat','\"{section.name|raw}\"'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.titleTranslationKeyFormat','null'),('entryTypes.088625d4-8df7-4f63-b315-e07525005932.titleTranslationMethod','\"site\"'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.autocapitalize','true'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.autocomplete','false'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.autocorrect','true'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.class','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.disabled','false'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.id','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.instructions','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.label','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.max','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.min','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.name','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.orientation','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.placeholder','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.readonly','false'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.requirable','false'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.size','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.step','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.tip','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.title','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.warning','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.0.width','100'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.1.fieldUid','\"a7ead237-4889-45d8-9293-bb7424f79d5c\"'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.1.instructions','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.1.label','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.1.required','false'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.1.tip','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.1.warning','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.1.width','100'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.2.fieldUid','\"c0c5f0a4-c856-4d28-9745-ac231e4fea15\"'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.2.instructions','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.2.label','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.2.required','false'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.2.tip','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.2.warning','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.elements.2.width','100'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.name','\"Content\"'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.fieldLayouts.f25fac1b-9ac0-4136-aa0c-e7f5703133de.tabs.0.sortOrder','1'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.handle','\"helpCenter\"'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.hasTitleField','false'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.name','\"Help Center\"'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.section','\"0ef99b39-db58-40c2-9a86-4cd1363e373c\"'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.sortOrder','1'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.titleFormat','\"{section.name|raw}\"'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.titleTranslationKeyFormat','null'),('entryTypes.52317217-7a3d-4e66-973b-991536653bde.titleTranslationMethod','\"site\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.autocapitalize','true'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.autocomplete','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.autocorrect','true'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.class','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.disabled','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.id','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.instructions','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.label','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.max','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.min','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.name','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.orientation','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.placeholder','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.readonly','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.requirable','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.size','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.step','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.tip','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.title','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.warning','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.0.width','100'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.1.fieldUid','\"de531f18-7abc-4af0-97a9-77414f4c2b27\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.1.instructions','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.1.label','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.1.required','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.1.tip','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.1.warning','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.1.width','100'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.2.fieldUid','\"6a6005aa-c544-43a2-9077-b41192d60801\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.2.instructions','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.2.label','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.2.required','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.2.tip','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.2.warning','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.2.width','100'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.3.fieldUid','\"c7d8c9ba-dcf8-46ec-b5f7-00be219466d6\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.3.instructions','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.3.label','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.3.required','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.3.tip','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.3.warning','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.3.width','100'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.4.fieldUid','\"8eb2228c-915a-4b94-9a52-2936d1b59590\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.4.instructions','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.4.label','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.4.required','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.4.tip','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.4.warning','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.4.width','100'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.5.fieldUid','\"44f40441-17c5-46fe-954d-1f9838fa27e7\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.5.instructions','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.5.label','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.5.required','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.5.tip','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.5.warning','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.5.width','100'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.6.fieldUid','\"ef9b3e71-4f9c-4899-9069-c8526023fc7a\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.6.instructions','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.6.label','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.6.required','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.6.tip','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.6.warning','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.elements.6.width','100'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.name','\"Content\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.0.sortOrder','1'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.0.fieldUid','\"5d47d6a0-3952-48d2-8586-38a2baa242e4\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.0.instructions','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.0.label','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.0.required','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.0.tip','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.0.warning','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.0.width','100'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.1.fieldUid','\"db54c432-22dc-4e88-bf44-05849d935312\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.1.instructions','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.1.label','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.1.required','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.1.tip','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.1.warning','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.elements.1.width','100'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.name','\"Page Setting\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.fieldLayouts.549135a6-6402-4dcc-aa15-cde0f0a6180d.tabs.1.sortOrder','2'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.handle','\"aboutUs\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.hasTitleField','false'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.name','\"About us\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.section','\"084359bc-6b02-490e-8ed7-79e64ad19a0c\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.sortOrder','1'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.titleFormat','\"{section.name|raw}\"'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.titleTranslationKeyFormat','null'),('entryTypes.537393bb-9422-4053-82f1-f1b108c8d031.titleTranslationMethod','\"site\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.autocapitalize','true'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.autocomplete','false'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.autocorrect','true'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.class','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.disabled','false'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.id','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.instructions','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.label','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.max','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.min','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.name','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.orientation','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.placeholder','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.readonly','false'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.requirable','false'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.size','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.step','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.tip','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.title','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.warning','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.0.width','100'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.1.fieldUid','\"9656ecdd-33ae-493a-8c2e-03adddfaafd7\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.1.instructions','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.1.label','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.1.required','false'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.1.tip','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.1.warning','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.1.width','100'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.2.fieldUid','\"2e04a1a7-ba3b-41a3-a164-cc13a9c9c175\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.2.instructions','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.2.label','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.2.required','false'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.2.tip','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.2.warning','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.2.width','100'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.3.fieldUid','\"f0468692-26c7-4961-922b-22c7e88f9c51\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.3.instructions','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.3.label','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.3.required','false'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.3.tip','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.3.warning','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.3.width','100'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.4.fieldUid','\"b5ced616-a83d-43c7-b4b1-7a8cb9249ec2\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.4.instructions','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.4.label','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.4.required','false'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.4.tip','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.4.warning','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.elements.4.width','100'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.name','\"Content\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.fieldLayouts.de4d7bff-918c-4aa4-850b-06b7ce70f260.tabs.0.sortOrder','1'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.handle','\"getStarted\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.hasTitleField','false'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.name','\"Get Started\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.section','\"7021e591-2737-465e-b280-a093d9c31de9\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.sortOrder','1'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.titleFormat','\"{section.name|raw}\"'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.titleTranslationKeyFormat','null'),('entryTypes.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd.titleTranslationMethod','\"site\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.autocapitalize','true'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.autocomplete','false'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.autocorrect','true'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.class','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.disabled','false'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.id','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.instructions','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.label','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.max','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.min','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.name','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.orientation','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.placeholder','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.readonly','false'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.requirable','false'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.size','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.step','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.tip','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.title','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.warning','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.0.width','100'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.1.fieldUid','\"de531f18-7abc-4af0-97a9-77414f4c2b27\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.1.instructions','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.1.label','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.1.required','false'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.1.tip','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.1.warning','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.1.width','100'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.2.fieldUid','\"4981297c-b9f9-4763-86ff-8c9ac639c3ab\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.2.instructions','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.2.label','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.2.required','false'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.2.tip','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.2.warning','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.2.width','100'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.3.fieldUid','\"1552e96e-64cc-4875-ba97-1e93f516ae24\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.3.instructions','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.3.label','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.3.required','false'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.3.tip','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.3.warning','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.3.width','100'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.5.fieldUid','\"6f668a19-4d7e-4989-b7c8-4034a26c0592\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.5.instructions','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.5.label','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.5.required','false'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.5.tip','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.5.warning','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.5.width','100'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\HorizontalRule\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.7.fieldUid','\"ffa2231c-785f-439f-a8e1-d0310a48cc11\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.7.instructions','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.7.label','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.7.required','false'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.7.tip','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.7.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.7.warning','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.7.width','100'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.8.fieldUid','\"e7331b8c-260f-4416-9df0-81b2eff4d738\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.8.instructions','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.8.label','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.8.required','false'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.8.tip','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.8.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.8.warning','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.elements.8.width','100'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.name','\"Content\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.fieldLayouts.2346b777-8a95-4583-a81b-1e6c604cb195.tabs.0.sortOrder','1'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.handle','\"homePage\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.hasTitleField','false'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.name','\"Home Page \"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.section','\"5f6731fa-4e3e-4d30-bca5-80b5d8961805\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.sortOrder','1'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.titleFormat','\"{section.name|raw}\"'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.titleTranslationKeyFormat','null'),('entryTypes.8ce99f2e-1bf8-4401-9ecd-715010b81de1.titleTranslationMethod','\"site\"'),('fieldGroups.10ca4b3c-f4f7-4365-a187-75411684f8a3.name','\"Logo \"'),('fieldGroups.1939a17a-d221-4f84-a39d-b1f04a53ec54.name','\"About us \"'),('fieldGroups.588aaf03-cc4d-429b-9626-def790c49561.name','\"HomePage Group\"'),('fieldGroups.5cbe1461-3ba4-4156-9696-16a2139da724.name','\"Common\"'),('fieldGroups.630ed674-868f-4765-a976-0c129be81a0c.name','\"Menu Group\"'),('fieldGroups.6d0d29d9-9874-493b-94e5-c1969046c99c.name','\"Get Started Group\"'),('fieldGroups.c90ef686-ae90-4dc5-a711-293e08686572.name','\"Page Data\"'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.columnSuffix','null'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.contentColumnType','\"string\"'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.fieldGroup','\"c90ef686-ae90-4dc5-a711-293e08686572\"'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.handle','\"pressContent\"'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.instructions','\"\"'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.name','\"Press Content\"'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.searchable','false'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.settings.contentTable','\"{{%matrixcontent_presscontent}}\"'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.settings.maxBlocks','\"\"'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.settings.minBlocks','\"\"'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.settings.propagationKeyFormat','null'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.settings.propagationMethod','\"all\"'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.translationKeyFormat','null'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.translationMethod','\"site\"'),('fields.1552e96e-64cc-4875-ba97-1e93f516ae24.type','\"craft\\\\fields\\\\Matrix\"'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.columnSuffix','null'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.contentColumnType','\"string\"'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.fieldGroup','\"5cbe1461-3ba4-4156-9696-16a2139da724\"'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.handle','\"navigation\"'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.instructions','\"\"'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.name','\"Navigation Fields\"'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.searchable','false'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.settings.contentTable','\"{{%matrixcontent_navigation}}\"'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.settings.maxBlocks','\"\"'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.settings.minBlocks','\"\"'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.settings.propagationKeyFormat','null'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.settings.propagationMethod','\"all\"'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.translationKeyFormat','null'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.translationMethod','\"site\"'),('fields.1579b38a-a813-4b9b-be72-7575d614fd48.type','\"craft\\\\fields\\\\Matrix\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.columnSuffix','\"sxehzaun\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.contentColumnType','\"text\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.fieldGroup','\"5cbe1461-3ba4-4156-9696-16a2139da724\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.handle','\"image\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.instructions','\"\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.name','\"Image \"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.searchable','false'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.availableTransforms','\"*\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.availableVolumes','\"*\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.columnType','\"text\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.configSelectionMode','\"choose\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.defaultTransform','\"\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.manualConfig','\"\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.purifierConfig','\"\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.purifyHtml','\"1\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.redactorConfig','\"\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.removeEmptyTags','\"1\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.removeInlineStyles','\"1\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.removeNbsp','\"1\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.showUnpermittedFiles','false'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.showUnpermittedVolumes','false'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.settings.uiMode','\"enlarged\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.translationKeyFormat','null'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.translationMethod','\"none\"'),('fields.2766be0c-98b6-4217-8d8f-52acb6544b5c.type','\"craft\\\\redactor\\\\Field\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.columnSuffix','\"myszicxv\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.contentColumnType','\"text\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.fieldGroup','\"6d0d29d9-9874-493b-94e5-c1969046c99c\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.handle','\"heroSectionContent\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.instructions','\"\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.name','\"Hero Section Content\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.searchable','false'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.availableTransforms','\"*\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.availableVolumes','\"*\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.columnType','\"text\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.configSelectionMode','\"choose\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.defaultTransform','\"\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.manualConfig','\"\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.purifierConfig','\"\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.purifyHtml','\"1\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.redactorConfig','\"\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.removeEmptyTags','\"1\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.removeInlineStyles','\"1\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.removeNbsp','\"1\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.showUnpermittedFiles','false'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.showUnpermittedVolumes','false'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.settings.uiMode','\"enlarged\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.translationKeyFormat','null'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.translationMethod','\"none\"'),('fields.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175.type','\"craft\\\\redactor\\\\Field\"'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.columnSuffix','\"nrwlljho\"'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.contentColumnType','\"text\"'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.fieldGroup','\"1939a17a-d221-4f84-a39d-b1f04a53ec54\"'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.handle','\"serviceheading\"'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.instructions','\"\"'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.name','\"serviceHeading\"'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.searchable','true'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.settings.byteLimit','null'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.settings.charLimit','null'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.settings.code','\"\"'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.settings.columnType','null'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.settings.initialRows','\"4\"'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.settings.multiline','\"\"'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.settings.placeholder','null'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.settings.uiMode','\"normal\"'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.translationKeyFormat','null'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.translationMethod','\"none\"'),('fields.44f40441-17c5-46fe-954d-1f9838fa27e7.type','\"craft\\\\fields\\\\PlainText\"'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.columnSuffix','null'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.contentColumnType','\"string\"'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.fieldGroup','\"630ed674-868f-4765-a976-0c129be81a0c\"'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.handle','\"menufields\"'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.instructions','\"\"'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.name','\"Menu Fields\"'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.searchable','false'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.settings.contentTable','\"{{%matrixcontent_menufields}}\"'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.settings.maxBlocks','\"\"'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.settings.minBlocks','\"\"'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.settings.propagationKeyFormat','null'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.settings.propagationMethod','\"all\"'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.translationKeyFormat','null'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.translationMethod','\"site\"'),('fields.462b074e-792c-44a5-a1fc-e74271f2e90e.type','\"craft\\\\fields\\\\Matrix\"'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.columnSuffix','\"qmynbfwp\"'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.contentColumnType','\"text\"'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.fieldGroup','\"588aaf03-cc4d-429b-9626-def790c49561\"'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.handle','\"pressHeading\"'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.instructions','\"\"'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.name','\"Press Heading\"'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.searchable','false'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.settings.byteLimit','null'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.settings.charLimit','null'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.settings.code','\"\"'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.settings.columnType','null'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.settings.initialRows','\"4\"'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.settings.multiline','\"\"'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.settings.placeholder','null'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.settings.uiMode','\"normal\"'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.translationKeyFormat','null'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.translationMethod','\"none\"'),('fields.4981297c-b9f9-4763-86ff-8c9ac639c3ab.type','\"craft\\\\fields\\\\PlainText\"'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.columnSuffix','null'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.contentColumnType','\"string\"'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.fieldGroup','\"630ed674-868f-4765-a976-0c129be81a0c\"'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.handle','\"socialMenu\"'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.instructions','\"\"'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.name','\"Social Menu\"'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.searchable','false'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.settings.contentTable','\"{{%matrixcontent_socialmenu}}\"'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.settings.maxBlocks','\"\"'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.settings.minBlocks','\"\"'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.settings.propagationKeyFormat','null'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.settings.propagationMethod','\"all\"'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.translationKeyFormat','null'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.translationMethod','\"site\"'),('fields.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc.type','\"craft\\\\fields\\\\Matrix\"'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.columnSuffix','null'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.contentColumnType','\"string\"'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.fieldGroup','\"630ed674-868f-4765-a976-0c129be81a0c\"'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.handle','\"bottonMenu\"'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.instructions','\"\"'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.name','\"Botton Menu \"'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.searchable','false'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.settings.contentTable','\"{{%matrixcontent_bottonmenu}}\"'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.settings.maxBlocks','\"\"'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.settings.minBlocks','\"\"'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.settings.propagationKeyFormat','null'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.settings.propagationMethod','\"all\"'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.translationKeyFormat','null'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.translationMethod','\"site\"'),('fields.4d8f5c5c-88ca-4097-9a12-a58b7a512cff.type','\"craft\\\\fields\\\\Matrix\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.columnSuffix','\"xxkdwirs\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.contentColumnType','\"text\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.fieldGroup','\"10ca4b3c-f4f7-4365-a187-75411684f8a3\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.handle','\"logoContent\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.instructions','\"\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.name','\"Logo Content\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.searchable','false'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.availableTransforms','\"*\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.availableVolumes','\"*\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.columnType','\"text\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.configSelectionMode','\"choose\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.defaultTransform','\"\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.manualConfig','\"\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.purifierConfig','\"\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.purifyHtml','\"1\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.redactorConfig','\"\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.removeEmptyTags','\"1\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.removeInlineStyles','\"1\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.removeNbsp','\"1\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.showUnpermittedFiles','false'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.showUnpermittedVolumes','false'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.settings.uiMode','\"enlarged\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.translationKeyFormat','null'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.translationMethod','\"none\"'),('fields.4fdbcb99-2d34-4451-a1cd-50c81ecf0823.type','\"craft\\\\redactor\\\\Field\"'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.columnSuffix','null'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.contentColumnType','\"string\"'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.fieldGroup','\"5cbe1461-3ba4-4156-9696-16a2139da724\"'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.handle','\"headerbind\"'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.instructions','\"\"'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.name','\"headerBind\"'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.searchable','false'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.settings.allowSelfRelations','false'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.settings.limit','\"\"'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.settings.localizeRelations','false'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.settings.selectionLabel','\"\"'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.settings.showSiteMenu','true'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.settings.source','null'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.settings.sources','\"*\"'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.settings.targetSiteId','null'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.settings.validateRelatedElements','false'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.settings.viewMode','null'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.translationKeyFormat','null'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.translationMethod','\"site\"'),('fields.5d47d6a0-3952-48d2-8586-38a2baa242e4.type','\"craft\\\\fields\\\\Entries\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.columnSuffix','\"cgfpxemu\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.contentColumnType','\"text\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.fieldGroup','\"1939a17a-d221-4f84-a39d-b1f04a53ec54\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.handle','\"herocontent\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.instructions','\"\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.name','\"heroContent\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.searchable','true'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.availableTransforms','\"*\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.availableVolumes','\"*\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.columnType','\"text\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.configSelectionMode','\"choose\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.defaultTransform','\"\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.manualConfig','\"\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.purifierConfig','\"\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.purifyHtml','\"1\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.redactorConfig','\"\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.removeEmptyTags','\"1\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.removeInlineStyles','\"1\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.removeNbsp','\"1\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.showUnpermittedFiles','false'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.showUnpermittedVolumes','false'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.settings.uiMode','\"enlarged\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.translationKeyFormat','null'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.translationMethod','\"none\"'),('fields.6a6005aa-c544-43a2-9077-b41192d60801.type','\"craft\\\\redactor\\\\Field\"'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.columnSuffix','\"xothcfkc\"'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.contentColumnType','\"text\"'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.fieldGroup','\"588aaf03-cc4d-429b-9626-def790c49561\"'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.handle','\"sectionHeading\"'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.instructions','\"\"'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.name','\"Section Heading\"'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.searchable','false'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.settings.byteLimit','null'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.settings.charLimit','null'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.settings.code','\"\"'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.settings.columnType','null'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.settings.initialRows','\"4\"'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.settings.multiline','\"\"'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.settings.placeholder','null'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.settings.uiMode','\"normal\"'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.translationKeyFormat','null'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.translationMethod','\"none\"'),('fields.6f668a19-4d7e-4989-b7c8-4034a26c0592.type','\"craft\\\\fields\\\\PlainText\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.columnSuffix','\"xmzmczdq\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.contentColumnType','\"text\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.fieldGroup','\"1939a17a-d221-4f84-a39d-b1f04a53ec54\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.handle','\"amplifycontent\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.instructions','\"\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.name','\"amplifyContent\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.searchable','true'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.availableTransforms','\"*\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.availableVolumes','\"*\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.columnType','\"text\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.configSelectionMode','\"choose\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.defaultTransform','\"\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.manualConfig','\"\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.purifierConfig','\"\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.purifyHtml','\"1\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.redactorConfig','\"\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.removeEmptyTags','\"1\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.removeInlineStyles','\"1\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.removeNbsp','\"1\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.showUnpermittedFiles','false'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.showUnpermittedVolumes','false'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.settings.uiMode','\"enlarged\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.translationKeyFormat','null'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.translationMethod','\"none\"'),('fields.8eb2228c-915a-4b94-9a52-2936d1b59590.type','\"craft\\\\redactor\\\\Field\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.columnSuffix','\"hjryrpli\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.contentColumnType','\"text\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.fieldGroup','\"10ca4b3c-f4f7-4365-a187-75411684f8a3\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.handle','\"contactUsText\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.instructions','\"\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.name','\"Contact us text \"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.searchable','false'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.availableTransforms','\"*\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.availableVolumes','\"*\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.columnType','\"text\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.configSelectionMode','\"choose\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.defaultTransform','\"\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.manualConfig','\"\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.purifierConfig','\"\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.purifyHtml','\"1\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.redactorConfig','\"\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.removeEmptyTags','\"1\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.removeInlineStyles','\"1\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.removeNbsp','\"1\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.showUnpermittedFiles','false'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.showUnpermittedVolumes','false'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.settings.uiMode','\"enlarged\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.translationKeyFormat','null'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.translationMethod','\"none\"'),('fields.949dfb89-bde2-48c5-94ba-7d9861880b63.type','\"craft\\\\redactor\\\\Field\"'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.columnSuffix','\"lydycsut\"'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.contentColumnType','\"text\"'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.fieldGroup','\"6d0d29d9-9874-493b-94e5-c1969046c99c\"'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.handle','\"pageTitle\"'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.instructions','\"\"'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.name','\"Title\"'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.searchable','false'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.settings.byteLimit','null'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.settings.charLimit','null'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.settings.code','\"\"'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.settings.columnType','null'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.settings.initialRows','\"4\"'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.settings.multiline','\"\"'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.settings.placeholder','null'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.settings.uiMode','\"normal\"'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.translationKeyFormat','null'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.translationMethod','\"none\"'),('fields.9656ecdd-33ae-493a-8c2e-03adddfaafd7.type','\"craft\\\\fields\\\\PlainText\"'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.columnSuffix','\"ygjzlqho\"'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.contentColumnType','\"boolean\"'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.fieldGroup','\"5cbe1461-3ba4-4156-9696-16a2139da724\"'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.handle','\"showtovisitor\"'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.instructions','\"\"'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.name','\"Show to Visitor\"'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.searchable','false'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.settings.default','false'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.settings.offLabel','\"No\"'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.settings.onLabel','\"Yes\"'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.translationKeyFormat','null'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.translationMethod','\"none\"'),('fields.99a52b1c-018d-4b28-a788-321cc6141d57.type','\"craft\\\\fields\\\\Lightswitch\"'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.columnSuffix','\"hhnimttd\"'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.contentColumnType','\"text\"'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.fieldGroup','\"10ca4b3c-f4f7-4365-a187-75411684f8a3\"'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.handle','\"logoTitle\"'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.instructions','\"\"'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.name','\"Logo Title \"'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.searchable','false'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.settings.byteLimit','null'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.settings.charLimit','null'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.settings.code','\"\"'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.settings.columnType','null'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.settings.initialRows','\"4\"'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.settings.multiline','\"\"'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.settings.placeholder','null'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.settings.uiMode','\"normal\"'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.translationKeyFormat','null'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.translationMethod','\"none\"'),('fields.a598f59b-5fa8-4ea7-a0de-5908493accaa.type','\"craft\\\\fields\\\\PlainText\"'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.columnSuffix','null'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.contentColumnType','\"string\"'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.fieldGroup','\"c90ef686-ae90-4dc5-a711-293e08686572\"'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.handle','\"faqData\"'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.instructions','\"\"'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.name','\"FAQ Data\"'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.searchable','false'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.settings.contentTable','\"{{%matrixcontent_faqdata}}\"'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.settings.maxBlocks','\"\"'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.settings.minBlocks','\"1\"'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.settings.propagationKeyFormat','null'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.settings.propagationMethod','\"all\"'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.translationKeyFormat','null'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.translationMethod','\"site\"'),('fields.a7ead237-4889-45d8-9293-bb7424f79d5c.type','\"craft\\\\fields\\\\Matrix\"'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.columnSuffix','null'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.contentColumnType','\"string\"'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.fieldGroup','\"6d0d29d9-9874-493b-94e5-c1969046c99c\"'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.handle','\"benefits\"'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.instructions','\"\"'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.name','\"Benefits\"'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.searchable','false'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.settings.contentTable','\"{{%matrixcontent_benefits}}\"'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.settings.maxBlocks','\"\"'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.settings.minBlocks','\"\"'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.settings.propagationKeyFormat','null'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.settings.propagationMethod','\"all\"'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.translationKeyFormat','null'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.translationMethod','\"site\"'),('fields.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2.type','\"craft\\\\fields\\\\Matrix\"'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.columnSuffix','null'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.contentColumnType','\"string\"'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.fieldGroup','\"c90ef686-ae90-4dc5-a711-293e08686572\"'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.handle','\"forumsData\"'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.instructions','\"\"'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.name','\"Forums Data\"'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.searchable','false'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.settings.contentTable','\"{{%matrixcontent_forumsdata}}\"'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.settings.maxBlocks','\"\"'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.settings.minBlocks','\"1\"'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.settings.propagationKeyFormat','null'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.settings.propagationMethod','\"all\"'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.translationKeyFormat','null'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.translationMethod','\"site\"'),('fields.c0c5f0a4-c856-4d28-9745-ac231e4fea15.type','\"craft\\\\fields\\\\Matrix\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.columnSuffix','null'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.contentColumnType','\"string\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.fieldGroup','\"10ca4b3c-f4f7-4365-a187-75411684f8a3\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.handle','\"logo\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.instructions','\"\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.name','\"Logo \"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.searchable','true'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.allowedKinds','null'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.allowSelfRelations','false'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.allowUploads','true'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.defaultUploadLocationSource','\"volume:bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.defaultUploadLocationSubpath','\"\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.limit','\"\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.localizeRelations','false'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.previewMode','\"full\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.restrictFiles','\"\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.selectionLabel','\"\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.showSiteMenu','true'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.showUnpermittedFiles','false'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.showUnpermittedVolumes','false'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.singleUploadLocationSource','\"volume:bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.singleUploadLocationSubpath','\"/assets/images\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.source','null'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.sources','\"*\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.targetSiteId','null'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.useSingleFolder','true'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.validateRelatedElements','false'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.settings.viewMode','\"large\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.translationKeyFormat','null'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.translationMethod','\"site\"'),('fields.c163ac99-714b-4d7a-96c2-0d2104942ec7.type','\"craft\\\\fields\\\\Assets\"'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.columnSuffix','\"mhrlzbct\"'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.contentColumnType','\"text\"'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.fieldGroup','\"1939a17a-d221-4f84-a39d-b1f04a53ec54\"'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.handle','\"amplifyheading\"'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.instructions','\"\"'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.name','\"amplifyHeading\"'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.searchable','true'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.settings.byteLimit','null'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.settings.charLimit','null'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.settings.code','\"\"'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.settings.columnType','null'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.settings.initialRows','\"4\"'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.settings.multiline','\"\"'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.settings.placeholder','null'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.settings.uiMode','\"normal\"'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.translationKeyFormat','null'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.translationMethod','\"none\"'),('fields.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6.type','\"craft\\\\fields\\\\PlainText\"'),('fields.db54c432-22dc-4e88-bf44-05849d935312.columnSuffix','null'),('fields.db54c432-22dc-4e88-bf44-05849d935312.contentColumnType','\"string\"'),('fields.db54c432-22dc-4e88-bf44-05849d935312.fieldGroup','\"1939a17a-d221-4f84-a39d-b1f04a53ec54\"'),('fields.db54c432-22dc-4e88-bf44-05849d935312.handle','\"pageheader\"'),('fields.db54c432-22dc-4e88-bf44-05849d935312.instructions','\"\"'),('fields.db54c432-22dc-4e88-bf44-05849d935312.name','\"PageHeader\"'),('fields.db54c432-22dc-4e88-bf44-05849d935312.searchable','false'),('fields.db54c432-22dc-4e88-bf44-05849d935312.settings.contentTable','\"{{%matrixcontent_pageheader}}\"'),('fields.db54c432-22dc-4e88-bf44-05849d935312.settings.maxBlocks','\"\"'),('fields.db54c432-22dc-4e88-bf44-05849d935312.settings.minBlocks','\"\"'),('fields.db54c432-22dc-4e88-bf44-05849d935312.settings.propagationKeyFormat','null'),('fields.db54c432-22dc-4e88-bf44-05849d935312.settings.propagationMethod','\"all\"'),('fields.db54c432-22dc-4e88-bf44-05849d935312.translationKeyFormat','null'),('fields.db54c432-22dc-4e88-bf44-05849d935312.translationMethod','\"site\"'),('fields.db54c432-22dc-4e88-bf44-05849d935312.type','\"craft\\\\fields\\\\Matrix\"'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.columnSuffix','\"qeyuluhm\"'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.contentColumnType','\"text\"'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.fieldGroup','\"588aaf03-cc4d-429b-9626-def790c49561\"'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.handle','\"heroHeading\"'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.instructions','\"\"'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.name','\"Hero Heading\"'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.searchable','false'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.settings.byteLimit','null'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.settings.charLimit','null'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.settings.code','\"\"'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.settings.columnType','null'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.settings.initialRows','\"4\"'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.settings.multiline','\"\"'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.settings.placeholder','null'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.settings.uiMode','\"normal\"'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.translationKeyFormat','null'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.translationMethod','\"none\"'),('fields.de531f18-7abc-4af0-97a9-77414f4c2b27.type','\"craft\\\\fields\\\\PlainText\"'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.columnSuffix','null'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.contentColumnType','\"string\"'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.fieldGroup','\"c90ef686-ae90-4dc5-a711-293e08686572\"'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.handle','\"topPodcastContent\"'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.instructions','\"\"'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.name','\"Top Podcast Content\"'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.searchable','false'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.settings.contentTable','\"{{%matrixcontent_toppodcastcontent}}\"'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.settings.maxBlocks','\"\"'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.settings.minBlocks','\"\"'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.settings.propagationKeyFormat','null'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.settings.propagationMethod','\"all\"'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.translationKeyFormat','null'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.translationMethod','\"site\"'),('fields.e7331b8c-260f-4416-9df0-81b2eff4d738.type','\"craft\\\\fields\\\\Matrix\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.columnSuffix','\"agfiykqs\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.contentColumnType','\"text\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.fieldGroup','\"1939a17a-d221-4f84-a39d-b1f04a53ec54\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.handle','\"servicecontent\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.instructions','\"\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.name','\"serviceContent\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.searchable','false'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.availableTransforms','\"*\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.availableVolumes','\"*\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.columnType','\"text\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.configSelectionMode','\"choose\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.defaultTransform','\"\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.manualConfig','\"\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.purifierConfig','\"\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.purifyHtml','\"1\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.redactorConfig','\"\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.removeEmptyTags','\"1\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.removeInlineStyles','\"1\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.removeNbsp','\"1\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.showUnpermittedFiles','false'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.showUnpermittedVolumes','false'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.settings.uiMode','\"enlarged\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.translationKeyFormat','null'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.translationMethod','\"none\"'),('fields.ef9b3e71-4f9c-4899-9069-c8526023fc7a.type','\"craft\\\\redactor\\\\Field\"'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.columnSuffix','\"kqtwsugz\"'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.contentColumnType','\"text\"'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.fieldGroup','\"6d0d29d9-9874-493b-94e5-c1969046c99c\"'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.handle','\"benefitSectionHeading\"'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.instructions','\"\"'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.name','\"Benefit Section Heading\"'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.searchable','false'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.settings.byteLimit','null'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.settings.charLimit','null'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.settings.code','\"\"'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.settings.columnType','null'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.settings.initialRows','\"4\"'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.settings.multiline','\"\"'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.settings.placeholder','null'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.settings.uiMode','\"normal\"'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.translationKeyFormat','null'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.translationMethod','\"none\"'),('fields.f0468692-26c7-4961-922b-22c7e88f9c51.type','\"craft\\\\fields\\\\PlainText\"'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.columnSuffix','\"dowhghvv\"'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.contentColumnType','\"text\"'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.fieldGroup','\"630ed674-868f-4765-a976-0c129be81a0c\"'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.handle','\"copyRightText\"'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.instructions','\"\"'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.name','\"Copy right text\"'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.searchable','false'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.settings.byteLimit','null'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.settings.charLimit','null'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.settings.code','\"\"'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.settings.columnType','null'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.settings.initialRows','\"4\"'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.settings.multiline','\"\"'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.settings.placeholder','null'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.settings.uiMode','\"normal\"'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.translationKeyFormat','null'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.translationMethod','\"none\"'),('fields.f6e1c666-a34d-4154-90fe-c5458e203447.type','\"craft\\\\fields\\\\PlainText\"'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.columnSuffix','\"qjvbxbct\"'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.contentColumnType','\"text\"'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.fieldGroup','\"588aaf03-cc4d-429b-9626-def790c49561\"'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.handle','\"topPodcastHeading\"'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.instructions','\"\"'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.name','\"Top Podcast Heading\"'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.searchable','false'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.settings.byteLimit','null'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.settings.charLimit','null'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.settings.code','\"\"'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.settings.columnType','null'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.settings.initialRows','\"4\"'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.settings.multiline','\"\"'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.settings.placeholder','null'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.settings.uiMode','\"normal\"'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.translationKeyFormat','null'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.translationMethod','\"none\"'),('fields.ffa2231c-785f-439f-a8e1-d0310a48cc11.type','\"craft\\\\fields\\\\PlainText\"'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.fieldLayouts.858df029-02b1-4a51-bad0-32f02c5673ef.tabs.0.elements.0.fieldUid','\"c935a719-bbe5-4781-ad93-9e5d10ee1c21\"'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.fieldLayouts.858df029-02b1-4a51-bad0-32f02c5673ef.tabs.0.elements.0.instructions','null'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.fieldLayouts.858df029-02b1-4a51-bad0-32f02c5673ef.tabs.0.elements.0.label','null'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.fieldLayouts.858df029-02b1-4a51-bad0-32f02c5673ef.tabs.0.elements.0.required','false'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.fieldLayouts.858df029-02b1-4a51-bad0-32f02c5673ef.tabs.0.elements.0.tip','null'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.fieldLayouts.858df029-02b1-4a51-bad0-32f02c5673ef.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.fieldLayouts.858df029-02b1-4a51-bad0-32f02c5673ef.tabs.0.elements.0.warning','null'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.fieldLayouts.858df029-02b1-4a51-bad0-32f02c5673ef.tabs.0.elements.0.width','100'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.fieldLayouts.858df029-02b1-4a51-bad0-32f02c5673ef.tabs.0.name','\"content\"'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.fieldLayouts.858df029-02b1-4a51-bad0-32f02c5673ef.tabs.0.sortOrder','1'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.handle','\"settings\"'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.name','\"Settings\"'),('globalSets.126a25e1-3618-4ad7-b367-14278602d8b8.sortOrder','3'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.fieldLayouts.3046ba18-d7f5-4d01-9dba-2b2bc2896d7f.tabs.0.elements.0.fieldUid','\"1579b38a-a813-4b9b-be72-7575d614fd48\"'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.fieldLayouts.3046ba18-d7f5-4d01-9dba-2b2bc2896d7f.tabs.0.elements.0.instructions','null'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.fieldLayouts.3046ba18-d7f5-4d01-9dba-2b2bc2896d7f.tabs.0.elements.0.label','null'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.fieldLayouts.3046ba18-d7f5-4d01-9dba-2b2bc2896d7f.tabs.0.elements.0.required','false'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.fieldLayouts.3046ba18-d7f5-4d01-9dba-2b2bc2896d7f.tabs.0.elements.0.tip','null'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.fieldLayouts.3046ba18-d7f5-4d01-9dba-2b2bc2896d7f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.fieldLayouts.3046ba18-d7f5-4d01-9dba-2b2bc2896d7f.tabs.0.elements.0.warning','null'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.fieldLayouts.3046ba18-d7f5-4d01-9dba-2b2bc2896d7f.tabs.0.elements.0.width','100'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.fieldLayouts.3046ba18-d7f5-4d01-9dba-2b2bc2896d7f.tabs.0.name','\"Content\"'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.fieldLayouts.3046ba18-d7f5-4d01-9dba-2b2bc2896d7f.tabs.0.sortOrder','1'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.handle','\"headerForVisitor\"'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.name','\"Header for visitor\"'),('globalSets.6a76ca1b-77bb-43e6-9170-684d67678fbb.sortOrder','2'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.fieldLayouts.4a64af3b-17ad-46c5-8a31-dd2f5fff992d.tabs.0.elements.0.fieldUid','\"1579b38a-a813-4b9b-be72-7575d614fd48\"'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.fieldLayouts.4a64af3b-17ad-46c5-8a31-dd2f5fff992d.tabs.0.elements.0.instructions','null'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.fieldLayouts.4a64af3b-17ad-46c5-8a31-dd2f5fff992d.tabs.0.elements.0.label','null'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.fieldLayouts.4a64af3b-17ad-46c5-8a31-dd2f5fff992d.tabs.0.elements.0.required','false'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.fieldLayouts.4a64af3b-17ad-46c5-8a31-dd2f5fff992d.tabs.0.elements.0.tip','null'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.fieldLayouts.4a64af3b-17ad-46c5-8a31-dd2f5fff992d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.fieldLayouts.4a64af3b-17ad-46c5-8a31-dd2f5fff992d.tabs.0.elements.0.warning','null'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.fieldLayouts.4a64af3b-17ad-46c5-8a31-dd2f5fff992d.tabs.0.elements.0.width','100'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.fieldLayouts.4a64af3b-17ad-46c5-8a31-dd2f5fff992d.tabs.0.name','\"Content\"'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.fieldLayouts.4a64af3b-17ad-46c5-8a31-dd2f5fff992d.tabs.0.sortOrder','1'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.handle','\"navigation\"'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.name','\"Navigation\"'),('globalSets.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff.sortOrder','1'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.0.fieldUid','\"c163ac99-714b-4d7a-96c2-0d2104942ec7\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.0.instructions','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.0.label','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.0.required','false'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.0.tip','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.0.warning','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.0.width','100'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.1.fieldUid','\"462b074e-792c-44a5-a1fc-e74271f2e90e\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.1.instructions','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.1.label','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.1.required','false'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.1.tip','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.1.warning','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.1.width','100'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.2.fieldUid','\"949dfb89-bde2-48c5-94ba-7d9861880b63\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.2.instructions','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.2.label','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.2.required','false'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.2.tip','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.2.warning','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.2.width','100'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.3.fieldUid','\"4a52d3aa-83d3-4ced-a26c-e93fa6b023cc\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.3.instructions','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.3.label','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.3.required','false'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.3.tip','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.3.warning','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.3.width','100'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.4.fieldUid','\"f6e1c666-a34d-4154-90fe-c5458e203447\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.4.instructions','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.4.label','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.4.required','false'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.4.tip','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.4.warning','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.4.width','100'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.5.fieldUid','\"4d8f5c5c-88ca-4097-9a12-a58b7a512cff\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.5.instructions','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.5.label','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.5.required','false'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.5.tip','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.5.warning','null'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.elements.5.width','100'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.name','\"Content\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.fieldLayouts.39caa02f-4730-41f4-9cc4-8600662d3688.tabs.0.sortOrder','1'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.handle','\"mainFooter\"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.name','\"Main footer \"'),('globalSets.ed5d08ec-fd83-4579-bf8c-99327715de4d.sortOrder','4'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.0.fieldUid','\"a598f59b-5fa8-4ea7-a0de-5908493accaa\"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.0.instructions','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.0.label','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.0.required','false'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.0.tip','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.0.warning','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.0.width','100'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.1.fieldUid','\"c163ac99-714b-4d7a-96c2-0d2104942ec7\"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.1.instructions','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.1.label','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.1.required','false'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.1.tip','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.1.warning','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.1.width','100'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.2.fieldUid','\"4fdbcb99-2d34-4451-a1cd-50c81ecf0823\"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.2.instructions','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.2.label','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.2.required','false'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.2.tip','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.2.warning','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.2.width','100'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.3.fieldUid','\"f6e1c666-a34d-4154-90fe-c5458e203447\"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.3.instructions','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.3.label','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.3.required','false'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.3.tip','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.3.warning','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.3.width','100'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.4.fieldUid','\"4d8f5c5c-88ca-4097-9a12-a58b7a512cff\"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.4.instructions','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.4.label','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.4.required','false'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.4.tip','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.4.warning','null'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.elements.4.width','100'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.name','\"Content\"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.fieldLayouts.921f29d2-1fed-4666-9b08-bc9dc8790fcf.tabs.0.sortOrder','1'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.handle','\"podcastFooter\"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.name','\"Podcast Footer \"'),('globalSets.eeebb92e-1882-4ee1-a318-1b9faa615542.sortOrder','5'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.field','\"db54c432-22dc-4e88-bf44-05849d935312\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fieldLayouts.6efa6d1b-98bf-48d3-b092-77f11dabea55.tabs.0.elements.0.fieldUid','\"193cab31-81f6-47dc-b6ed-e7ec189ef784\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fieldLayouts.6efa6d1b-98bf-48d3-b092-77f11dabea55.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fieldLayouts.6efa6d1b-98bf-48d3-b092-77f11dabea55.tabs.0.elements.0.label','null'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fieldLayouts.6efa6d1b-98bf-48d3-b092-77f11dabea55.tabs.0.elements.0.required','false'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fieldLayouts.6efa6d1b-98bf-48d3-b092-77f11dabea55.tabs.0.elements.0.tip','null'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fieldLayouts.6efa6d1b-98bf-48d3-b092-77f11dabea55.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fieldLayouts.6efa6d1b-98bf-48d3-b092-77f11dabea55.tabs.0.elements.0.warning','null'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fieldLayouts.6efa6d1b-98bf-48d3-b092-77f11dabea55.tabs.0.elements.0.width','100'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fieldLayouts.6efa6d1b-98bf-48d3-b092-77f11dabea55.tabs.0.name','\"Content\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fieldLayouts.6efa6d1b-98bf-48d3-b092-77f11dabea55.tabs.0.sortOrder','1'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.columnSuffix','null'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.contentColumnType','\"string\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.fieldGroup','null'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.handle','\"navlinkss\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.instructions','\"\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.name','\"NavLinkss\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.searchable','false'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.settings.allowSelfRelations','false'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.settings.limit','\"\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.settings.localizeRelations','false'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.settings.selectionLabel','\"\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.settings.showSiteMenu','false'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.settings.source','null'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.settings.sources','\"*\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.settings.targetSiteId','null'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.settings.validateRelatedElements','false'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.settings.viewMode','null'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.translationKeyFormat','null'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.translationMethod','\"site\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.fields.193cab31-81f6-47dc-b6ed-e7ec189ef784.type','\"craft\\\\fields\\\\Entries\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.handle','\"navigationheader\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.name','\"NavigationHeader\"'),('matrixBlockTypes.004edc04-88c9-401b-815d-54163a594af8.sortOrder','1'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.field','\"b5ced616-a83d-43c7-b4b1-7a8cb9249ec2\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fieldLayouts.1b8cd79a-e878-4ad6-b567-ee0b906b062d.tabs.0.elements.0.fieldUid','\"98575239-efb4-4736-9bb1-18805e443225\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fieldLayouts.1b8cd79a-e878-4ad6-b567-ee0b906b062d.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fieldLayouts.1b8cd79a-e878-4ad6-b567-ee0b906b062d.tabs.0.elements.0.label','null'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fieldLayouts.1b8cd79a-e878-4ad6-b567-ee0b906b062d.tabs.0.elements.0.required','false'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fieldLayouts.1b8cd79a-e878-4ad6-b567-ee0b906b062d.tabs.0.elements.0.tip','null'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fieldLayouts.1b8cd79a-e878-4ad6-b567-ee0b906b062d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fieldLayouts.1b8cd79a-e878-4ad6-b567-ee0b906b062d.tabs.0.elements.0.warning','null'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fieldLayouts.1b8cd79a-e878-4ad6-b567-ee0b906b062d.tabs.0.elements.0.width','100'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fieldLayouts.1b8cd79a-e878-4ad6-b567-ee0b906b062d.tabs.0.name','\"Content\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fieldLayouts.1b8cd79a-e878-4ad6-b567-ee0b906b062d.tabs.0.sortOrder','1'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.columnSuffix','\"swqtbpco\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.contentColumnType','\"text\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.fieldGroup','null'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.handle','\"contentText\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.instructions','\"\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.name','\"content\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.searchable','false'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.availableTransforms','\"*\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.availableVolumes','\"*\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.columnType','\"text\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.defaultTransform','\"\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.manualConfig','\"\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.purifierConfig','\"\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.purifyHtml','\"1\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.redactorConfig','\"\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.removeNbsp','\"1\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.showHtmlButtonForNonAdmins','\"\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.showUnpermittedFiles','false'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.translationKeyFormat','null'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.translationMethod','\"none\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.fields.98575239-efb4-4736-9bb1-18805e443225.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.handle','\"contentBlock\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.name','\"Content block\"'),('matrixBlockTypes.03cadce9-3225-49bd-bac1-eb74262dd0c0.sortOrder','1'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.field','\"4d8f5c5c-88ca-4097-9a12-a58b7a512cff\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.0.fieldUid','\"e083c8f1-dedd-4985-b498-b008c8a2c323\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.0.label','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.0.required','false'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.0.tip','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.0.warning','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.0.width','100'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.1.fieldUid','\"ac306dcf-3f06-41f0-88bd-31024cd1231e\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.1.label','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.1.required','false'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.1.tip','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.1.warning','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.elements.1.width','100'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.name','\"Content\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fieldLayouts.a3273be5-6131-4451-ab05-5f2b554cd5f4.tabs.0.sortOrder','1'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.columnSuffix','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.contentColumnType','\"string\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.fieldGroup','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.handle','\"linkDestination\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.instructions','\"\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.name','\"Link Destination\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.searchable','false'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.settings.allowSelfRelations','false'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.settings.limit','\"\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.settings.localizeRelations','false'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.settings.selectionLabel','\"\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.settings.showSiteMenu','false'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.settings.source','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.settings.sources','\"*\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.settings.targetSiteId','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.settings.validateRelatedElements','false'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.settings.viewMode','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.translationKeyFormat','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.translationMethod','\"site\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.ac306dcf-3f06-41f0-88bd-31024cd1231e.type','\"craft\\\\fields\\\\Entries\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.columnSuffix','\"dbfzefkl\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.contentColumnType','\"text\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.fieldGroup','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.handle','\"linkText\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.instructions','\"\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.name','\"Link Text\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.searchable','false'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.settings.byteLimit','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.settings.charLimit','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.settings.code','\"\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.settings.columnType','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.settings.initialRows','\"4\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.settings.multiline','\"\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.settings.placeholder','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.settings.uiMode','\"normal\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.translationKeyFormat','null'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.translationMethod','\"none\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.fields.e083c8f1-dedd-4985-b498-b008c8a2c323.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.handle','\"menu\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.name','\"menu\"'),('matrixBlockTypes.3b2ac91e-dbf1-464f-8c8f-28d2d929040e.sortOrder','1'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.field','\"c0c5f0a4-c856-4d28-9745-ac231e4fea15\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.0.fieldUid','\"45e5581f-6623-4adf-93a4-063baa992e3a\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.0.label','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.0.required','true'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.0.tip','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.0.warning','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.0.width','100'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.1.fieldUid','\"a5bb180a-40bd-4ea1-9feb-3135439d6f20\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.1.label','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.1.required','true'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.1.tip','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.1.warning','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.elements.1.width','100'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.name','\"Content\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fieldLayouts.d19ae1b1-d42e-4fb3-a977-6c62c8f63bd4.tabs.0.sortOrder','1'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.columnSuffix','\"uhxechjz\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.contentColumnType','\"text\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.fieldGroup','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.handle','\"question\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.instructions','\"\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.name','\"question\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.searchable','false'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.settings.byteLimit','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.settings.charLimit','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.settings.code','\"\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.settings.columnType','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.settings.initialRows','\"4\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.settings.multiline','\"\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.settings.placeholder','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.settings.uiMode','\"normal\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.translationKeyFormat','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.translationMethod','\"none\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.45e5581f-6623-4adf-93a4-063baa992e3a.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.columnSuffix','\"zcasrplx\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.contentColumnType','\"text\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.fieldGroup','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.handle','\"answer\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.instructions','\"\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.name','\"answer\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.searchable','false'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.settings.byteLimit','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.settings.charLimit','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.settings.code','\"\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.settings.columnType','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.settings.initialRows','\"4\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.settings.multiline','\"\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.settings.placeholder','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.settings.uiMode','\"normal\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.translationKeyFormat','null'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.translationMethod','\"none\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.fields.a5bb180a-40bd-4ea1-9feb-3135439d6f20.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.handle','\"forums\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.name','\"Forums\"'),('matrixBlockTypes.68f4e476-d938-4fe1-b6ab-07486aaa3c15.sortOrder','1'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.field','\"462b074e-792c-44a5-a1fc-e74271f2e90e\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.0.fieldUid','\"6e54cc44-cfd2-4509-921d-0c05038bbead\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.0.label','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.0.required','true'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.0.tip','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.0.warning','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.0.width','100'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.1.fieldUid','\"b2597900-e8be-4371-b0a1-35f2e6e4123e\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.1.label','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.1.required','true'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.1.tip','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.1.warning','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.elements.1.width','100'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.name','\"Content\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fieldLayouts.503d37ef-e54c-46a8-a4e2-bbe3e22b4b0e.tabs.0.sortOrder','1'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.columnSuffix','\"idguywkm\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.contentColumnType','\"text\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.fieldGroup','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.handle','\"pageName\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.instructions','\"\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.name','\"Page Name\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.searchable','false'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.settings.byteLimit','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.settings.charLimit','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.settings.code','\"\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.settings.columnType','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.settings.initialRows','\"4\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.settings.multiline','\"\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.settings.placeholder','\"Ex : About Us, FAQ, Services\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.settings.uiMode','\"normal\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.translationKeyFormat','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.translationMethod','\"none\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.6e54cc44-cfd2-4509-921d-0c05038bbead.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.columnSuffix','\"eznrgedx\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.contentColumnType','\"string\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.fieldGroup','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.handle','\"pageSlug\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.instructions','\"\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.name','\"Page Slug\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.searchable','false'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.settings.allowSelfRelations','false'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.settings.limit','\"\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.settings.localizeRelations','false'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.settings.selectionLabel','\"\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.settings.showSiteMenu','true'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.settings.source','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.settings.sources','\"*\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.settings.targetSiteId','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.settings.validateRelatedElements','false'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.settings.viewMode','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.translationKeyFormat','null'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.translationMethod','\"site\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.fields.b2597900-e8be-4371-b0a1-35f2e6e4123e.type','\"craft\\\\fields\\\\Entries\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.handle','\"menu\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.name','\"Menu\"'),('matrixBlockTypes.7fc587f7-1db8-4f91-9dc3-3288de0683db.sortOrder','1'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.field','\"4a52d3aa-83d3-4ced-a26c-e93fa6b023cc\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fieldLayouts.e58a01b6-334b-4330-8a49-9f6dac252464.tabs.0.elements.0.fieldUid','\"472dd4b0-d864-4e36-b80d-7d0c1ff5e922\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fieldLayouts.e58a01b6-334b-4330-8a49-9f6dac252464.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fieldLayouts.e58a01b6-334b-4330-8a49-9f6dac252464.tabs.0.elements.0.label','null'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fieldLayouts.e58a01b6-334b-4330-8a49-9f6dac252464.tabs.0.elements.0.required','false'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fieldLayouts.e58a01b6-334b-4330-8a49-9f6dac252464.tabs.0.elements.0.tip','null'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fieldLayouts.e58a01b6-334b-4330-8a49-9f6dac252464.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fieldLayouts.e58a01b6-334b-4330-8a49-9f6dac252464.tabs.0.elements.0.warning','null'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fieldLayouts.e58a01b6-334b-4330-8a49-9f6dac252464.tabs.0.elements.0.width','100'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fieldLayouts.e58a01b6-334b-4330-8a49-9f6dac252464.tabs.0.name','\"Content\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fieldLayouts.e58a01b6-334b-4330-8a49-9f6dac252464.tabs.0.sortOrder','1'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.columnSuffix','\"jeewpqks\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.contentColumnType','\"text\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.fieldGroup','null'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.handle','\"linkText\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.instructions','\"\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.name','\"Link Text\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.searchable','false'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.settings.byteLimit','null'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.settings.charLimit','null'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.settings.code','\"\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.settings.columnType','null'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.settings.initialRows','\"4\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.settings.multiline','\"\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.settings.placeholder','null'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.settings.uiMode','\"normal\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.translationKeyFormat','null'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.translationMethod','\"none\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.fields.472dd4b0-d864-4e36-b80d-7d0c1ff5e922.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.handle','\"menu\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.name','\"menu\"'),('matrixBlockTypes.8f61eedc-70d7-4f2c-b9b1-51f3a5978007.sortOrder','1'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.field','\"1552e96e-64cc-4875-ba97-1e93f516ae24\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.0.fieldUid','\"924ddb91-d8f3-47ec-a5f5-29dd22cd1df3\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.0.label','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.0.required','true'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.0.tip','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.0.warning','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.0.width','100'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.1.fieldUid','\"c26050dd-88c8-4666-85dc-36dcbd7e6bc5\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.1.label','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.1.required','true'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.1.tip','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.1.warning','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.elements.1.width','100'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.name','\"Content\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fieldLayouts.1f5ef9b3-0bca-4778-b48d-36ee8e6eac91.tabs.0.sortOrder','1'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.columnSuffix','\"hwmvenxp\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.contentColumnType','\"text\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.fieldGroup','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.handle','\"pressName\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.instructions','\"\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.name','\"Press Name\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.searchable','false'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.settings.byteLimit','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.settings.charLimit','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.settings.code','\"\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.settings.columnType','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.settings.initialRows','\"4\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.settings.multiline','\"\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.settings.placeholder','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.settings.uiMode','\"normal\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.translationKeyFormat','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.translationMethod','\"none\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.columnSuffix','\"dhvohjrb\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.contentColumnType','\"text\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.fieldGroup','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.handle','\"pressUrl\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.instructions','\"must be a valid url \"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.name','\"Press Url\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.searchable','false'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.settings.byteLimit','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.settings.charLimit','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.settings.code','\"\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.settings.columnType','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.settings.initialRows','\"4\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.settings.multiline','\"\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.settings.placeholder','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.settings.uiMode','\"normal\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.translationKeyFormat','null'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.translationMethod','\"none\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.fields.c26050dd-88c8-4666-85dc-36dcbd7e6bc5.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.handle','\"pressBlock\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.name','\"Press Block\"'),('matrixBlockTypes.b2e1694b-2726-4573-b3b0-5b8b434cb708.sortOrder','1'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.field','\"1579b38a-a813-4b9b-be72-7575d614fd48\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.0.fieldUid','\"569085f6-5ddd-4e9c-94e9-cd755a2b97c3\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.0.label','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.0.required','true'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.0.tip','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.0.warning','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.0.width','100'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.1.fieldUid','\"1ced9631-5763-45f2-add2-e638dd01e37d\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.1.label','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.1.required','true'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.1.tip','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.1.warning','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.elements.1.width','100'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.name','\"Content\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fieldLayouts.fe350778-d4b1-4e7d-9a4a-bf995a813048.tabs.0.sortOrder','1'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.columnSuffix','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.contentColumnType','\"string\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.fieldGroup','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.handle','\"linkDestination\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.instructions','\"\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.name','\"Link Destination\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.searchable','true'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.settings.allowSelfRelations','false'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.settings.limit','\"1\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.settings.localizeRelations','false'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.settings.selectionLabel','\"Add Link destination\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.settings.showSiteMenu','true'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.settings.source','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.settings.sources','\"*\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.settings.targetSiteId','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.settings.validateRelatedElements','false'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.settings.viewMode','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.translationKeyFormat','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.translationMethod','\"site\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.1ced9631-5763-45f2-add2-e638dd01e37d.type','\"craft\\\\fields\\\\Entries\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.columnSuffix','\"zgwvytlo\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.contentColumnType','\"text\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.fieldGroup','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.handle','\"linkText\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.instructions','\"\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.name','\"Link Text\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.searchable','true'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.settings.byteLimit','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.settings.charLimit','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.settings.code','\"\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.settings.columnType','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.settings.initialRows','\"4\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.settings.multiline','\"\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.settings.placeholder','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.settings.uiMode','\"normal\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.translationKeyFormat','null'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.translationMethod','\"none\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.fields.569085f6-5ddd-4e9c-94e9-cd755a2b97c3.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.handle','\"navLink\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.name','\"Nav Link\"'),('matrixBlockTypes.d63e36be-ae39-4138-b6e5-083ba6baeaf9.sortOrder','1'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.field','\"e7331b8c-260f-4416-9df0-81b2eff4d738\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.0.fieldUid','\"3850bad8-119c-4964-9482-2eb4e539e2cd\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.0.label','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.0.required','true'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.0.tip','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.0.warning','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.0.width','100'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.1.fieldUid','\"b9894a05-3987-4a08-ab87-68ef6ec65448\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.1.label','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.1.required','true'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.1.tip','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.1.warning','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.elements.1.width','100'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.name','\"Content\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fieldLayouts.aee65ed2-a7ba-45f9-b4d2-58dc9bad5f18.tabs.0.sortOrder','1'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.columnSuffix','\"ykwrlzye\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.contentColumnType','\"text\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.fieldGroup','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.handle','\"topPodcastName\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.instructions','\"\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.name','\"Top Podcast Name\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.searchable','false'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.settings.byteLimit','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.settings.charLimit','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.settings.code','\"\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.settings.columnType','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.settings.initialRows','\"4\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.settings.multiline','\"\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.settings.placeholder','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.settings.uiMode','\"normal\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.translationKeyFormat','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.translationMethod','\"none\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.3850bad8-119c-4964-9482-2eb4e539e2cd.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.columnSuffix','\"kakgtips\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.contentColumnType','\"text\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.fieldGroup','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.handle','\"topPodcastUrl\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.instructions','\"must be a valid url\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.name','\"Top Podcast Url\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.searchable','false'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.settings.byteLimit','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.settings.charLimit','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.settings.code','\"\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.settings.columnType','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.settings.initialRows','\"4\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.settings.multiline','\"\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.settings.placeholder','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.settings.uiMode','\"normal\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.translationKeyFormat','null'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.translationMethod','\"none\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.fields.b9894a05-3987-4a08-ab87-68ef6ec65448.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.handle','\"topPodcastBlock\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.name','\"Top Podcast Block\"'),('matrixBlockTypes.e1e15d42-3e48-4a44-ba79-47e5f5637c51.sortOrder','1'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.field','\"a7ead237-4889-45d8-9293-bb7424f79d5c\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.0.fieldUid','\"38b49d55-d32f-4e5b-b3a9-81006fcf8fb7\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.0.label','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.0.required','true'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.0.tip','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.0.warning','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.0.width','100'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.1.fieldUid','\"7893d15f-ba77-460d-b30e-066088a1d3c4\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.1.label','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.1.required','true'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.1.tip','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.1.warning','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.elements.1.width','100'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.name','\"Content\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fieldLayouts.a7230ac4-cbc5-4753-8b33-c83fbbc8d904.tabs.0.sortOrder','1'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.columnSuffix','\"pvxsfvek\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.contentColumnType','\"text\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.fieldGroup','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.handle','\"question\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.instructions','\"\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.name','\"question\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.searchable','false'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.settings.byteLimit','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.settings.charLimit','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.settings.code','\"\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.settings.columnType','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.settings.initialRows','\"4\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.settings.multiline','\"\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.settings.placeholder','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.settings.uiMode','\"normal\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.translationKeyFormat','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.translationMethod','\"none\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.columnSuffix','\"ndviczkw\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.contentColumnType','\"text\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.fieldGroup','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.handle','\"answer\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.instructions','\"\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.name','\"answer\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.searchable','false'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.availableTransforms','\"*\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.availableVolumes','\"*\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.columnType','\"text\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.defaultTransform','\"\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.manualConfig','\"\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.purifierConfig','\"\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.purifyHtml','\"1\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.redactorConfig','\"\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.removeNbsp','\"1\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.showHtmlButtonForNonAdmins','\"\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.showUnpermittedFiles','false'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.translationKeyFormat','null'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.translationMethod','\"none\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.fields.7893d15f-ba77-460d-b30e-066088a1d3c4.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.handle','\"faq\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.name','\"Faqs\"'),('matrixBlockTypes.f054bb40-fe3b-4887-a94e-78b0229b735b.sortOrder','1'),('meta.__names__.004edc04-88c9-401b-815d-54163a594af8','\"NavigationHeader\"'),('meta.__names__.03cadce9-3225-49bd-bac1-eb74262dd0c0','\"Content block\"'),('meta.__names__.084359bc-6b02-490e-8ed7-79e64ad19a0c','\"About us\"'),('meta.__names__.088625d4-8df7-4f63-b315-e07525005932','\"Header Visitor\"'),('meta.__names__.0d1f3f4f-1fe3-4a25-a98f-3af013fd805b','\"Header Visitor\"'),('meta.__names__.0ef99b39-db58-40c2-9a86-4cd1363e373c','\"Help Center\"'),('meta.__names__.10ca4b3c-f4f7-4365-a187-75411684f8a3','\"Logo \"'),('meta.__names__.126a25e1-3618-4ad7-b367-14278602d8b8','\"Settings\"'),('meta.__names__.1552e96e-64cc-4875-ba97-1e93f516ae24','\"Press Content\"'),('meta.__names__.1579b38a-a813-4b9b-be72-7575d614fd48','\"Navigation Fields\"'),('meta.__names__.1939a17a-d221-4f84-a39d-b1f04a53ec54','\"About us \"'),('meta.__names__.193cab31-81f6-47dc-b6ed-e7ec189ef784','\"NavLinkss\"'),('meta.__names__.1ced9631-5763-45f2-add2-e638dd01e37d','\"Link Destination\"'),('meta.__names__.2766be0c-98b6-4217-8d8f-52acb6544b5c','\"Image \"'),('meta.__names__.2e04a1a7-ba3b-41a3-a164-cc13a9c9c175','\"Hero Section Content\"'),('meta.__names__.3850bad8-119c-4964-9482-2eb4e539e2cd','\"Top Podcast Name\"'),('meta.__names__.38b49d55-d32f-4e5b-b3a9-81006fcf8fb7','\"question\"'),('meta.__names__.3b2ac91e-dbf1-464f-8c8f-28d2d929040e','\"menu\"'),('meta.__names__.44f40441-17c5-46fe-954d-1f9838fa27e7','\"serviceHeading\"'),('meta.__names__.45e5581f-6623-4adf-93a4-063baa992e3a','\"question\"'),('meta.__names__.46140bea-67d5-4152-9548-c499f0efef77','\"Link destination\"'),('meta.__names__.462b074e-792c-44a5-a1fc-e74271f2e90e','\"Menu Fields\"'),('meta.__names__.472dd4b0-d864-4e36-b80d-7d0c1ff5e922','\"Link Text\"'),('meta.__names__.4981297c-b9f9-4763-86ff-8c9ac639c3ab','\"Press Heading\"'),('meta.__names__.4a52d3aa-83d3-4ced-a26c-e93fa6b023cc','\"Social Menu\"'),('meta.__names__.4d8f5c5c-88ca-4097-9a12-a58b7a512cff','\"Botton Menu \"'),('meta.__names__.4fdbcb99-2d34-4451-a1cd-50c81ecf0823','\"Logo Content\"'),('meta.__names__.52317217-7a3d-4e66-973b-991536653bde','\"Help Center\"'),('meta.__names__.537393bb-9422-4053-82f1-f1b108c8d031','\"About us\"'),('meta.__names__.569085f6-5ddd-4e9c-94e9-cd755a2b97c3','\"Link Text\"'),('meta.__names__.588aaf03-cc4d-429b-9626-def790c49561','\"HomePage Group\"'),('meta.__names__.5cbe1461-3ba4-4156-9696-16a2139da724','\"Common\"'),('meta.__names__.5d47d6a0-3952-48d2-8586-38a2baa242e4','\"headerBind\"'),('meta.__names__.5f6731fa-4e3e-4d30-bca5-80b5d8961805','\"Home Page \"'),('meta.__names__.630ed674-868f-4765-a976-0c129be81a0c','\"Menu Group\"'),('meta.__names__.67dbfaca-62d4-4282-bfd3-3f4399a481d2','\"question\"'),('meta.__names__.68f4e476-d938-4fe1-b6ab-07486aaa3c15','\"Forums\"'),('meta.__names__.6a6005aa-c544-43a2-9077-b41192d60801','\"heroContent\"'),('meta.__names__.6a76ca1b-77bb-43e6-9170-684d67678fbb','\"Header for visitor\"'),('meta.__names__.6d0d29d9-9874-493b-94e5-c1969046c99c','\"Get Started Group\"'),('meta.__names__.6e54cc44-cfd2-4509-921d-0c05038bbead','\"Page Name\"'),('meta.__names__.6f668a19-4d7e-4989-b7c8-4034a26c0592','\"Section Heading\"'),('meta.__names__.7021e591-2737-465e-b280-a093d9c31de9','\"Get Started\"'),('meta.__names__.7893d15f-ba77-460d-b30e-066088a1d3c4','\"answer\"'),('meta.__names__.7fc587f7-1db8-4f91-9dc3-3288de0683db','\"Menu\"'),('meta.__names__.88c1dbc3-61fc-439b-b8b8-30a6de6adcdd','\"Get Started\"'),('meta.__names__.8ce99f2e-1bf8-4401-9ecd-715010b81de1','\"Home Page \"'),('meta.__names__.8eb2228c-915a-4b94-9a52-2936d1b59590','\"amplifyContent\"'),('meta.__names__.8f61eedc-70d7-4f2c-b9b1-51f3a5978007','\"menu\"'),('meta.__names__.924ddb91-d8f3-47ec-a5f5-29dd22cd1df3','\"Press Name\"'),('meta.__names__.949dfb89-bde2-48c5-94ba-7d9861880b63','\"Contact us text \"'),('meta.__names__.9656ecdd-33ae-493a-8c2e-03adddfaafd7','\"Title\"'),('meta.__names__.98575239-efb4-4736-9bb1-18805e443225','\"content\"'),('meta.__names__.99a52b1c-018d-4b28-a788-321cc6141d57','\"Show to Visitor\"'),('meta.__names__.a598f59b-5fa8-4ea7-a0de-5908493accaa','\"Logo Title \"'),('meta.__names__.a5bb180a-40bd-4ea1-9feb-3135439d6f20','\"answer\"'),('meta.__names__.a7ead237-4889-45d8-9293-bb7424f79d5c','\"FAQ Data\"'),('meta.__names__.ac306dcf-3f06-41f0-88bd-31024cd1231e','\"Link Destination\"'),('meta.__names__.b2597900-e8be-4371-b0a1-35f2e6e4123e','\"Page Slug\"'),('meta.__names__.b2c747cf-55c0-4657-84d5-51335302a6e7','\"Craft CMS \"'),('meta.__names__.b2e1694b-2726-4573-b3b0-5b8b434cb708','\"Press Block\"'),('meta.__names__.b5ced616-a83d-43c7-b4b1-7a8cb9249ec2','\"Benefits\"'),('meta.__names__.b9894a05-3987-4a08-ab87-68ef6ec65448','\"Top Podcast Url\"'),('meta.__names__.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a','\"images\"'),('meta.__names__.bd395079-c204-4443-b6f0-4a70339ae1db','\"Craft CMS \"'),('meta.__names__.c0c5f0a4-c856-4d28-9745-ac231e4fea15','\"Forums Data\"'),('meta.__names__.c163ac99-714b-4d7a-96c2-0d2104942ec7','\"Logo \"'),('meta.__names__.c26050dd-88c8-4666-85dc-36dcbd7e6bc5','\"Press Url\"'),('meta.__names__.c7d8c9ba-dcf8-46ec-b5f7-00be219466d6','\"amplifyHeading\"'),('meta.__names__.c8b7fbbb-7aeb-41be-95cc-75a01ef63fff','\"Navigation\"'),('meta.__names__.c90ef686-ae90-4dc5-a711-293e08686572','\"Page Data\"'),('meta.__names__.cc9eda60-00a1-4e3b-89f0-f973ffe0aad9','\"answer\"'),('meta.__names__.d63e36be-ae39-4138-b6e5-083ba6baeaf9','\"Nav Link\"'),('meta.__names__.db54c432-22dc-4e88-bf44-05849d935312','\"PageHeader\"'),('meta.__names__.de531f18-7abc-4af0-97a9-77414f4c2b27','\"Hero Heading\"'),('meta.__names__.e083c8f1-dedd-4985-b498-b008c8a2c323','\"Link Text\"'),('meta.__names__.e1e15d42-3e48-4a44-ba79-47e5f5637c51','\"Top Podcast Block\"'),('meta.__names__.e7331b8c-260f-4416-9df0-81b2eff4d738','\"Top Podcast Content\"'),('meta.__names__.ed5d08ec-fd83-4579-bf8c-99327715de4d','\"Main footer \"'),('meta.__names__.eeebb92e-1882-4ee1-a318-1b9faa615542','\"Podcast Footer \"'),('meta.__names__.ef9b3e71-4f9c-4899-9069-c8526023fc7a','\"serviceContent\"'),('meta.__names__.f0468692-26c7-4961-922b-22c7e88f9c51','\"Benefit Section Heading\"'),('meta.__names__.f054bb40-fe3b-4887-a94e-78b0229b735b','\"Faqs\"'),('meta.__names__.f6e1c666-a34d-4154-90fe-c5458e203447','\"Copy right text\"'),('meta.__names__.ffa2231c-785f-439f-a8e1-d0310a48cc11','\"Top Podcast Heading\"'),('plugins.froala-editor.edition','\"standard\"'),('plugins.froala-editor.enabled','true'),('plugins.froala-editor.schemaVersion','\"1.0.0\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.rest.edition','\"standard\"'),('plugins.rest.enabled','true'),('plugins.rest.schemaVersion','\"1.0.0\"'),('sections.084359bc-6b02-490e-8ed7-79e64ad19a0c.defaultPlacement','\"end\"'),('sections.084359bc-6b02-490e-8ed7-79e64ad19a0c.enableVersioning','true'),('sections.084359bc-6b02-490e-8ed7-79e64ad19a0c.handle','\"aboutUs\"'),('sections.084359bc-6b02-490e-8ed7-79e64ad19a0c.name','\"About us\"'),('sections.084359bc-6b02-490e-8ed7-79e64ad19a0c.propagationMethod','\"all\"'),('sections.084359bc-6b02-490e-8ed7-79e64ad19a0c.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.enabledByDefault','true'),('sections.084359bc-6b02-490e-8ed7-79e64ad19a0c.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.hasUrls','true'),('sections.084359bc-6b02-490e-8ed7-79e64ad19a0c.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.template','\"about-us/_entry\"'),('sections.084359bc-6b02-490e-8ed7-79e64ad19a0c.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.uriFormat','\"about-us\"'),('sections.084359bc-6b02-490e-8ed7-79e64ad19a0c.type','\"single\"'),('sections.0d1f3f4f-1fe3-4a25-a98f-3af013fd805b.defaultPlacement','\"end\"'),('sections.0d1f3f4f-1fe3-4a25-a98f-3af013fd805b.enableVersioning','true'),('sections.0d1f3f4f-1fe3-4a25-a98f-3af013fd805b.handle','\"headerVisitor\"'),('sections.0d1f3f4f-1fe3-4a25-a98f-3af013fd805b.name','\"Header Visitor\"'),('sections.0d1f3f4f-1fe3-4a25-a98f-3af013fd805b.propagationMethod','\"all\"'),('sections.0d1f3f4f-1fe3-4a25-a98f-3af013fd805b.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.enabledByDefault','true'),('sections.0d1f3f4f-1fe3-4a25-a98f-3af013fd805b.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.hasUrls','true'),('sections.0d1f3f4f-1fe3-4a25-a98f-3af013fd805b.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.template','\"header-visitor/_entry\"'),('sections.0d1f3f4f-1fe3-4a25-a98f-3af013fd805b.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.uriFormat','\"header-visitor\"'),('sections.0d1f3f4f-1fe3-4a25-a98f-3af013fd805b.type','\"single\"'),('sections.0ef99b39-db58-40c2-9a86-4cd1363e373c.defaultPlacement','\"end\"'),('sections.0ef99b39-db58-40c2-9a86-4cd1363e373c.enableVersioning','true'),('sections.0ef99b39-db58-40c2-9a86-4cd1363e373c.handle','\"helpCenter\"'),('sections.0ef99b39-db58-40c2-9a86-4cd1363e373c.name','\"Help Center\"'),('sections.0ef99b39-db58-40c2-9a86-4cd1363e373c.propagationMethod','\"all\"'),('sections.0ef99b39-db58-40c2-9a86-4cd1363e373c.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.enabledByDefault','true'),('sections.0ef99b39-db58-40c2-9a86-4cd1363e373c.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.hasUrls','true'),('sections.0ef99b39-db58-40c2-9a86-4cd1363e373c.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.template','\"help-center/_entry\"'),('sections.0ef99b39-db58-40c2-9a86-4cd1363e373c.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.uriFormat','\"help-center\"'),('sections.0ef99b39-db58-40c2-9a86-4cd1363e373c.type','\"single\"'),('sections.5f6731fa-4e3e-4d30-bca5-80b5d8961805.defaultPlacement','\"end\"'),('sections.5f6731fa-4e3e-4d30-bca5-80b5d8961805.enableVersioning','true'),('sections.5f6731fa-4e3e-4d30-bca5-80b5d8961805.handle','\"homePage\"'),('sections.5f6731fa-4e3e-4d30-bca5-80b5d8961805.name','\"Home Page \"'),('sections.5f6731fa-4e3e-4d30-bca5-80b5d8961805.propagationMethod','\"all\"'),('sections.5f6731fa-4e3e-4d30-bca5-80b5d8961805.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.enabledByDefault','true'),('sections.5f6731fa-4e3e-4d30-bca5-80b5d8961805.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.hasUrls','true'),('sections.5f6731fa-4e3e-4d30-bca5-80b5d8961805.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.template','\"home-page/_entry\"'),('sections.5f6731fa-4e3e-4d30-bca5-80b5d8961805.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.uriFormat','\"home-page\"'),('sections.5f6731fa-4e3e-4d30-bca5-80b5d8961805.type','\"single\"'),('sections.7021e591-2737-465e-b280-a093d9c31de9.defaultPlacement','\"end\"'),('sections.7021e591-2737-465e-b280-a093d9c31de9.enableVersioning','true'),('sections.7021e591-2737-465e-b280-a093d9c31de9.handle','\"getStarted\"'),('sections.7021e591-2737-465e-b280-a093d9c31de9.name','\"Get Started\"'),('sections.7021e591-2737-465e-b280-a093d9c31de9.propagationMethod','\"all\"'),('sections.7021e591-2737-465e-b280-a093d9c31de9.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.enabledByDefault','true'),('sections.7021e591-2737-465e-b280-a093d9c31de9.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.hasUrls','true'),('sections.7021e591-2737-465e-b280-a093d9c31de9.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.template','\"get-started/_entry\"'),('sections.7021e591-2737-465e-b280-a093d9c31de9.siteSettings.b2c747cf-55c0-4657-84d5-51335302a6e7.uriFormat','\"get-started\"'),('sections.7021e591-2737-465e-b280-a093d9c31de9.type','\"single\"'),('siteGroups.bd395079-c204-4443-b6f0-4a70339ae1db.name','\"Craft CMS \"'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.enabled','true'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.handle','\"default\"'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.hasUrls','true'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.language','\"en-US\"'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.name','\"Craft CMS \"'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.primary','true'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.siteGroup','\"bd395079-c204-4443-b6f0-4a70339ae1db\"'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Craft CMS \"'),('system.schemaVersion','\"3.8.0.1\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.autocapitalize','true'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.autocomplete','false'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.autocorrect','true'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.class','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.disabled','false'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.id','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.instructions','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.label','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.max','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.min','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.name','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.orientation','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.placeholder','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.readonly','false'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.requirable','false'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.size','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.step','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.tip','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.title','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.warning','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.elements.0.width','100'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.name','\"Content\"'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.fieldLayouts.d71f7e69-5536-4cf4-b7e0-799977a88607.tabs.0.sortOrder','1'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.handle','\"images\"'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.hasUrls','true'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.name','\"images\"'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.settings.path','\"@webroot/assets/images\"'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.sortOrder','2'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.titleTranslationKeyFormat','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.titleTranslationMethod','null'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.type','\"craft\\\\volumes\\\\Local\"'),('volumes.bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a.url','\"@web/assets/images\"');
/*!40000 ALTER TABLE `cc_projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_queue`
--

LOCK TABLES `cc_queue` WRITE;
/*!40000 ALTER TABLE `cc_queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_relations`
--

LOCK TABLES `cc_relations` WRITE;
/*!40000 ALTER TABLE `cc_relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_relations` VALUES (1,35,115,NULL,74,1,'2023-04-20 09:58:20','2023-04-20 09:58:20','b8792184-491a-4a0e-95a3-648d2c76a51c'),(2,35,116,NULL,104,1,'2023-04-20 09:58:20','2023-04-20 09:58:20','2e7b3380-43b8-4c42-9c75-8b58c4f69aaf'),(3,35,117,NULL,15,1,'2023-04-20 09:58:20','2023-04-20 09:58:20','e745ecfa-fa63-48a1-9467-8d233c0456b8'),(4,35,118,NULL,74,1,'2023-04-20 09:58:20','2023-04-20 09:58:20','b286c718-6624-48b2-afa9-4c764dc0e3e3'),(5,35,119,NULL,97,1,'2023-04-20 09:58:20','2023-04-20 09:58:20','571523dd-5e63-4fd9-b51b-9220e0b3b98a'),(6,35,124,NULL,74,1,'2023-04-20 11:00:54','2023-04-20 11:00:54','1508ffa6-77a5-4e12-b882-4c41611bf399'),(7,35,125,NULL,74,1,'2023-04-20 11:00:54','2023-04-20 11:00:54','5c5c3ece-dbdb-4f9c-b40c-58064cd6ce45'),(8,35,126,NULL,15,1,'2023-04-20 11:00:54','2023-04-20 11:00:54','9c5dd52f-3c82-4d8f-ab17-aa69023b2e74'),(10,37,104,NULL,69,1,'2023-04-20 13:54:48','2023-04-20 13:54:48','7e606a56-1225-4f6f-bbe3-520d976873e8'),(11,37,129,NULL,69,1,'2023-04-20 13:54:48','2023-04-20 13:54:48','da0a1a5d-1824-4a72-be12-99be0ffd1944'),(12,37,130,NULL,69,1,'2023-04-20 14:01:11','2023-04-20 14:01:11','9c9f0fb2-2495-48f3-8818-f171f0de034b'),(14,37,133,NULL,69,1,'2023-04-20 14:05:11','2023-04-20 14:05:11','332a8cf9-2f8c-4d99-aa8d-81bb221bd133'),(16,39,136,NULL,69,1,'2023-04-20 14:05:32','2023-04-20 14:05:32','efa2e4e3-528c-4ca4-875f-5487ca183b78'),(17,37,137,NULL,69,1,'2023-04-20 14:05:32','2023-04-20 14:05:32','9f84f4f5-e23b-4b27-9da6-c2cdea7a43a4'),(18,39,138,NULL,69,1,'2023-04-20 14:05:32','2023-04-20 14:05:32','bfd234a5-2376-4fc7-a788-9263bcb104b4'),(19,3,142,NULL,69,1,'2023-04-21 09:36:48','2023-04-21 09:36:48','abf765cb-40b5-4a81-a743-235366f7f84a'),(20,3,143,NULL,15,1,'2023-04-21 09:36:48','2023-04-21 09:36:48','4e07e279-a586-44e5-a06d-d78bbfef7950'),(21,3,144,NULL,15,1,'2023-04-21 09:36:48','2023-04-21 09:36:48','819b992f-1535-44f9-adf1-56f2c23d389e'),(22,51,147,NULL,74,1,'2023-04-21 09:52:27','2023-04-21 09:52:27','f3e260b6-4db4-47d2-a719-c75852fc753d'),(23,51,148,NULL,74,1,'2023-04-21 09:52:27','2023-04-21 09:52:27','3183c950-30bc-495d-890f-82b2ff0fe816'),(24,51,149,NULL,74,1,'2023-04-21 09:52:27','2023-04-21 09:52:27','033be35e-7d44-4252-b2f1-832d876b4891'),(25,51,151,NULL,74,1,'2023-04-21 10:07:29','2023-04-21 10:07:29','5e9e10e5-89cb-4f2d-9179-e33bd69ece6f'),(26,51,152,NULL,74,1,'2023-04-21 10:07:29','2023-04-21 10:07:29','410de5a5-dfdd-454e-8648-eb218e5996b5'),(27,51,153,NULL,74,1,'2023-04-21 10:07:29','2023-04-21 10:07:29','291be76d-0615-44bf-9b8d-bf3e0bee2e4a'),(28,43,150,NULL,140,1,'2023-04-21 12:16:04','2023-04-21 12:16:04','f633ba6b-d6cd-4168-9b21-d4d39e5ef4c2');
/*!40000 ALTER TABLE `cc_relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_revisions`
--

LOCK TABLES `cc_revisions` WRITE;
/*!40000 ALTER TABLE `cc_revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_revisions` VALUES (1,11,1,1,NULL),(2,15,1,1,NULL),(3,15,1,2,NULL),(4,15,1,3,NULL),(5,15,1,4,'Applied “Draft 1”'),(6,15,1,5,'Applied “Draft 1”'),(7,15,1,6,''),(8,15,1,7,NULL),(9,15,1,8,'Applied “Draft 1”'),(10,64,1,1,NULL),(11,69,1,1,NULL),(12,69,1,2,NULL),(13,74,1,1,NULL),(14,74,1,2,NULL),(15,74,1,3,NULL),(16,97,1,1,NULL),(17,97,1,2,NULL),(18,97,1,3,NULL),(19,69,1,3,'Applied “Draft 1”'),(20,104,1,1,NULL),(21,104,1,2,NULL),(22,97,1,4,'Applied “Draft 1”'),(23,104,1,3,NULL),(24,104,1,4,NULL),(25,104,1,5,'Applied “Draft 1”'),(26,104,1,6,NULL),(27,104,1,7,NULL),(28,104,1,8,'Applied “Draft 1”');
/*!40000 ALTER TABLE `cc_revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_searchindex`
--

LOCK TABLES `cc_searchindex` WRITE;
/*!40000 ALTER TABLE `cc_searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_searchindex` VALUES (1,'username',0,1,' admin '),(1,'firstname',0,1,''),(1,'lastname',0,1,''),(1,'fullname',0,1,''),(1,'email',0,1,' cjoshi awwgment com '),(1,'slug',0,1,''),(2,'slug',0,1,' temp epoipfcjriviberdpjmzjhuncpmtcqhfwdui '),(2,'title',0,1,''),(3,'slug',0,1,' temp iyxvgjujwpzqnvymcmwnxisvzdyhwacqbhlx '),(3,'title',0,1,''),(4,'title',0,1,''),(4,'slug',0,1,' temp oyeomsqmmmyqojwealntrlgxiburyvpnwpnf '),(8,'slug',0,1,''),(9,'slug',0,1,''),(10,'slug',0,1,''),(11,'title',0,1,' header '),(11,'slug',0,1,' header '),(13,'slug',0,1,' temp lzxeycghvfnbomtgyrokeabjnbffnzktqioh '),(13,'title',0,1,' header '),(14,'slug',0,1,' temp fianahkxftciwtoqvfowmiafodeeppkgeqya '),(14,'title',0,1,''),(15,'slug',0,1,' help center '),(15,'title',0,1,' help center '),(32,'slug',0,1,''),(33,'slug',0,1,''),(57,'slug',0,1,''),(62,'slug',0,1,' temp aayngntnbxlkykynvvxamdpinijzthuarvul '),(50,'slug',0,1,''),(51,'slug',0,1,''),(62,'title',0,1,''),(63,'title',0,1,''),(63,'slug',0,1,' temp kmiynjqgfdqigjobanyyzsleonpfqqwjekqu '),(64,'slug',0,1,' yes '),(64,'title',0,1,' yes '),(67,'slug',0,1,''),(68,'slug',0,1,''),(101,'slug',0,1,''),(104,'slug',0,1,' about us '),(69,'slug',0,1,' header visitor '),(69,'title',0,1,' header visitor '),(74,'title',0,1,' home page '),(74,'slug',0,1,' home page '),(78,'slug',0,1,' home page '),(80,'slug',0,1,''),(81,'slug',0,1,''),(78,'title',0,1,' home page '),(88,'slug',0,1,''),(89,'slug',0,1,''),(90,'slug',0,1,''),(91,'title',0,1,' help center '),(91,'slug',0,1,' help center '),(92,'slug',0,1,''),(93,'slug',0,1,''),(94,'slug',0,1,''),(95,'slug',0,1,''),(96,'slug',0,1,''),(104,'title',0,1,' about us '),(97,'slug',0,1,' get started '),(108,'slug',0,1,''),(97,'title',0,1,' get started '),(111,'title',0,1,' get started '),(111,'slug',0,1,' get started '),(112,'slug',0,1,''),(114,'slug',0,1,''),(115,'slug',0,1,''),(115,'field',36,1,' sign up login '),(116,'slug',0,1,''),(116,'field',36,1,' about us '),(117,'slug',0,1,''),(117,'field',36,1,' faqs '),(118,'slug',0,1,''),(118,'field',36,1,' services '),(119,'slug',0,1,''),(119,'field',36,1,' contact '),(115,'field',35,1,' home page '),(116,'field',35,1,' about us '),(117,'field',35,1,' help center '),(118,'field',35,1,' home page '),(119,'field',35,1,' get started '),(120,'title',0,1,' header visitor '),(120,'slug',0,1,' header visitor '),(121,'slug',0,1,''),(122,'slug',0,1,''),(123,'slug',0,1,''),(124,'slug',0,1,''),(124,'field',36,1,' my podcast '),(125,'slug',0,1,''),(125,'field',36,1,' my profile '),(126,'slug',0,1,''),(126,'field',36,1,' logout '),(124,'field',35,1,' home page '),(125,'field',35,1,' home page '),(126,'field',35,1,' help center '),(140,'kind',0,1,' image '),(140,'slug',0,1,''),(104,'field',29,1,''),(104,'field',30,1,''),(104,'field',31,1,''),(104,'field',32,1,''),(136,'slug',0,1,''),(139,'slug',0,1,''),(140,'extension',0,1,' jpg '),(140,'filename',0,1,' istockphoto 1300845620 612x612 jpg '),(141,'slug',0,1,''),(142,'slug',0,1,''),(143,'slug',0,1,''),(144,'slug',0,1,''),(145,'slug',0,1,''),(146,'slug',0,1,''),(147,'slug',0,1,''),(148,'slug',0,1,''),(149,'slug',0,1,''),(150,'slug',0,1,''),(151,'slug',0,1,''),(152,'slug',0,1,''),(153,'slug',0,1,''),(154,'filename',0,1,' istockphoto 1300845620 612x612 jpg '),(154,'extension',0,1,' jpg '),(154,'kind',0,1,' image '),(154,'slug',0,1,''),(154,'title',0,1,' istockphoto 1300845620 612x612 '),(155,'filename',0,1,' istockphoto 1300845620 612x612 jpg '),(155,'extension',0,1,' jpg '),(155,'kind',0,1,' image '),(155,'slug',0,1,''),(155,'title',0,1,' istockphoto 1300845620 612x612 '),(140,'title',0,1,' istockphoto 1300845620 612x612 '),(150,'field',43,1,' istockphoto 1300845620 612x612 ');
/*!40000 ALTER TABLE `cc_searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_sections`
--

LOCK TABLES `cc_sections` WRITE;
/*!40000 ALTER TABLE `cc_sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_sections` VALUES (1,NULL,'Menu','menu','channel',1,'all','end',NULL,'2023-04-14 09:24:36','2023-04-14 09:24:36','2023-04-15 08:16:16','8a80c1a9-761b-43c0-bb84-441e4b2f5bbb'),(2,1,'Header','header','structure',1,'all','end',NULL,'2023-04-14 10:06:30','2023-04-15 04:44:28','2023-04-15 08:15:43','fa095a5d-35e2-4149-80c7-c6b5d91c1976'),(3,NULL,'Help Center','helpCenter','single',1,'all','end',NULL,'2023-04-14 10:33:45','2023-04-14 10:33:45',NULL,'0ef99b39-db58-40c2-9a86-4cd1363e373c'),(4,NULL,'Header Section','headerSection','channel',1,'all','end',NULL,'2023-04-15 04:51:59','2023-04-15 04:51:59','2023-04-15 08:15:45','f0a396e2-ac54-4593-b6ff-27611a6ae57f'),(5,NULL,'Header Visitor','headerVisitor','single',1,'all','end',NULL,'2023-04-15 08:16:42','2023-04-15 08:16:42',NULL,'0d1f3f4f-1fe3-4a25-a98f-3af013fd805b'),(6,NULL,'Home Page ','homePage','single',1,'all','end',NULL,'2023-04-15 08:36:25','2023-04-15 08:36:25',NULL,'5f6731fa-4e3e-4d30-bca5-80b5d8961805'),(7,NULL,'Get Started','getStarted','single',1,'all','end',NULL,'2023-04-17 13:09:48','2023-04-17 13:09:48',NULL,'7021e591-2737-465e-b280-a093d9c31de9'),(8,NULL,'About us','aboutUs','single',1,'all','end',NULL,'2023-04-17 13:50:20','2023-04-17 13:50:20',NULL,'084359bc-6b02-490e-8ed7-79e64ad19a0c');
/*!40000 ALTER TABLE `cc_sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_sections_sites`
--

LOCK TABLES `cc_sections_sites` WRITE;
/*!40000 ALTER TABLE `cc_sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_sections_sites` VALUES (1,1,1,1,'menu/{slug}','menu/_entry',0,'2023-04-14 09:24:36','2023-04-14 09:24:36','a7a03160-67b3-48d3-be19-3e95f2a9857b'),(2,2,1,1,'header','header/_entry',1,'2023-04-14 10:06:30','2023-04-14 10:06:30','4fe9851d-b6fe-4ca4-a511-8e9963553625'),(3,3,1,1,'help-center','help-center/_entry',1,'2023-04-14 10:33:45','2023-04-14 10:33:45','118d2dad-d8a4-4633-bfcf-79b40d88e94f'),(4,4,1,1,'header-section/{slug}','header-section/_entry',1,'2023-04-15 04:51:59','2023-04-15 04:51:59','b25fc135-ed3f-44c1-98a5-c4694f4930f9'),(5,5,1,1,'header-visitor','header-visitor/_entry',1,'2023-04-15 08:16:42','2023-04-15 08:16:42','e324a389-8a04-4ec7-9bcc-e4b226a8bddd'),(6,6,1,1,'home-page','home-page/_entry',1,'2023-04-15 08:36:25','2023-04-15 08:36:25','ebf876bf-e062-4317-ab9c-1373895d719a'),(7,7,1,1,'get-started','get-started/_entry',1,'2023-04-17 13:09:48','2023-04-17 13:09:48','f4472890-e3b9-44e9-8425-800477453947'),(8,8,1,1,'about-us','about-us/_entry',1,'2023-04-17 13:50:20','2023-04-17 13:50:20','3ebec75e-17a5-4231-ae10-ae494acacb59');
/*!40000 ALTER TABLE `cc_sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_sequences`
--

LOCK TABLES `cc_sequences` WRITE;
/*!40000 ALTER TABLE `cc_sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_shunnedmessages`
--

LOCK TABLES `cc_shunnedmessages` WRITE;
/*!40000 ALTER TABLE `cc_shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_sitegroups`
--

LOCK TABLES `cc_sitegroups` WRITE;
/*!40000 ALTER TABLE `cc_sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_sitegroups` VALUES (1,'Craft CMS ','2023-04-14 08:36:25','2023-04-14 08:36:25',NULL,'bd395079-c204-4443-b6f0-4a70339ae1db');
/*!40000 ALTER TABLE `cc_sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_sites`
--

LOCK TABLES `cc_sites` WRITE;
/*!40000 ALTER TABLE `cc_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_sites` VALUES (1,1,1,1,'Craft CMS ','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-04-14 08:36:25','2023-04-14 08:36:25',NULL,'b2c747cf-55c0-4657-84d5-51335302a6e7');
/*!40000 ALTER TABLE `cc_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_structureelements`
--

LOCK TABLES `cc_structureelements` WRITE;
/*!40000 ALTER TABLE `cc_structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_structureelements` VALUES (1,1,NULL,1,1,2,0,'2023-04-15 04:44:28','2023-04-15 08:15:43','ce84ec77-f81c-432d-a717-c876d8a79980');
/*!40000 ALTER TABLE `cc_structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_structures`
--

LOCK TABLES `cc_structures` WRITE;
/*!40000 ALTER TABLE `cc_structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_structures` VALUES (1,3,'2023-04-15 04:44:28','2023-04-15 04:44:28','2023-04-15 08:15:43','d61c0160-6414-497e-818a-e9f52da13706');
/*!40000 ALTER TABLE `cc_structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_systemmessages`
--

LOCK TABLES `cc_systemmessages` WRITE;
/*!40000 ALTER TABLE `cc_systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_taggroups`
--

LOCK TABLES `cc_taggroups` WRITE;
/*!40000 ALTER TABLE `cc_taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_tags`
--

LOCK TABLES `cc_tags` WRITE;
/*!40000 ALTER TABLE `cc_tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_tokens`
--

LOCK TABLES `cc_tokens` WRITE;
/*!40000 ALTER TABLE `cc_tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_tokens` VALUES (2,'JTitRsUFXeciJ_2Rqn6HAkSK0FPD9ozQ','[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"sourceId\":97,\"siteId\":1,\"draftId\":null,\"revisionId\":null,\"userId\":1}]',NULL,NULL,'2023-04-21 10:00:59','2023-04-20 10:00:59','2023-04-20 10:00:59','8ebee438-4356-482d-894a-a83e81287708');
/*!40000 ALTER TABLE `cc_tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_usergroups`
--

LOCK TABLES `cc_usergroups` WRITE;
/*!40000 ALTER TABLE `cc_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_usergroups_users`
--

LOCK TABLES `cc_usergroups_users` WRITE;
/*!40000 ALTER TABLE `cc_usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_userpermissions`
--

LOCK TABLES `cc_userpermissions` WRITE;
/*!40000 ALTER TABLE `cc_userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_userpermissions_usergroups`
--

LOCK TABLES `cc_userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `cc_userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_userpermissions_users`
--

LOCK TABLES `cc_userpermissions_users` WRITE;
/*!40000 ALTER TABLE `cc_userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_userpreferences`
--

LOCK TABLES `cc_userpreferences` WRITE;
/*!40000 ALTER TABLE `cc_userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `cc_userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_users`
--

LOCK TABLES `cc_users` WRITE;
/*!40000 ALTER TABLE `cc_users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_users` VALUES (1,'admin',NULL,NULL,NULL,'cjoshi@awwgment.com','$2y$13$hovJi7vDorCWZFz3KDI/1eLfA.rXaHUMJCH9n1nK8K50err/QhtBO',1,0,0,0,'2023-04-24 08:33:48',NULL,NULL,NULL,'2023-04-17 13:44:10',NULL,1,NULL,NULL,NULL,0,'2023-04-14 08:36:26','2023-04-14 08:36:26','2023-04-24 08:33:48','6454d771-a0c4-47f1-acaf-56fec0c39d37');
/*!40000 ALTER TABLE `cc_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_usertokens`
--

LOCK TABLES `cc_usertokens` WRITE;
/*!40000 ALTER TABLE `cc_usertokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cc_usertokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_volumefolders`
--

LOCK TABLES `cc_volumefolders` WRITE;
/*!40000 ALTER TABLE `cc_volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_volumefolders` VALUES (1,NULL,NULL,'Temporary source',NULL,'2023-04-21 07:16:38','2023-04-21 07:16:38','652aa964-bbe2-4d73-bc1b-337d5f9e008a'),(2,1,NULL,'user_1','user_1/','2023-04-21 07:16:38','2023-04-21 07:16:38','ecdecc76-61be-4458-a999-b6ff4e1fda10'),(3,NULL,1,'Images','','2023-04-21 12:07:46','2023-04-21 12:07:46','f23ae62d-2446-4696-8fcf-77b20737ec60'),(4,NULL,2,'images','','2023-04-21 12:14:07','2023-04-21 12:14:07','6f90dd9f-128c-4e87-a631-b8ecc3f14063'),(5,4,2,'assets','assets/','2023-04-21 12:16:04','2023-04-21 12:16:04','0a9e3564-8e05-4b31-ab7f-ee4e1868c17b'),(6,5,2,'images','assets/images/','2023-04-21 12:16:04','2023-04-21 12:16:04','bbd7e4fa-c176-4dd8-9a5c-33d193f5fe99');
/*!40000 ALTER TABLE `cc_volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_volumes`
--

LOCK TABLES `cc_volumes` WRITE;
/*!40000 ALTER TABLE `cc_volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_volumes` VALUES (1,28,'Images','images','craft\\volumes\\Local',1,'@webroot/assets/','site',NULL,'{\"path\":\"@webroot\\/assets\\/\"}',1,'2023-04-21 12:07:46','2023-04-21 12:07:46','2023-04-21 12:10:58','ed33abd1-a2dc-492c-975f-e59c37ec008f'),(2,29,'images','images','craft\\volumes\\Local',1,'@web/assets/images','site',NULL,'{\"path\":\"@webroot\\/assets\\/images\"}',2,'2023-04-21 12:14:07','2023-04-21 12:14:07',NULL,'bc8841c4-d02f-4006-a2da-ca2e3d1e5c2a');
/*!40000 ALTER TABLE `cc_volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cc_widgets`
--

LOCK TABLES `cc_widgets` WRITE;
/*!40000 ALTER TABLE `cc_widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cc_widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-04-14 08:36:29','2023-04-14 08:36:29','5b247c4c-ba99-4afc-9255-de32d9a6cf4d'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-04-14 08:36:29','2023-04-14 08:36:29','ece0f2c4-70b3-4307-842d-e5152d45a015'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-04-14 08:36:29','2023-04-14 08:36:29','e8230de4-04fe-479e-9d26-63ae6ccd514a'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-04-14 08:36:29','2023-04-14 08:36:29','169c9bd9-4091-4e40-98b2-b32d29a06292');
/*!40000 ALTER TABLE `cc_widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccannouncements`
--

LOCK TABLES `ccannouncements` WRITE;
/*!40000 ALTER TABLE `ccannouncements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccannouncements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccassetindexdata`
--

LOCK TABLES `ccassetindexdata` WRITE;
/*!40000 ALTER TABLE `ccassetindexdata` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccassetindexdata` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccassets`
--

LOCK TABLES `ccassets` WRITE;
/*!40000 ALTER TABLE `ccassets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccassets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccassettransformindex`
--

LOCK TABLES `ccassettransformindex` WRITE;
/*!40000 ALTER TABLE `ccassettransformindex` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccassettransformindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccassettransforms`
--

LOCK TABLES `ccassettransforms` WRITE;
/*!40000 ALTER TABLE `ccassettransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccassettransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cccategories`
--

LOCK TABLES `cccategories` WRITE;
/*!40000 ALTER TABLE `cccategories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cccategories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cccategorygroups`
--

LOCK TABLES `cccategorygroups` WRITE;
/*!40000 ALTER TABLE `cccategorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cccategorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cccategorygroups_sites`
--

LOCK TABLES `cccategorygroups_sites` WRITE;
/*!40000 ALTER TABLE `cccategorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cccategorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccchangedattributes`
--

LOCK TABLES `ccchangedattributes` WRITE;
/*!40000 ALTER TABLE `ccchangedattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccchangedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccchangedfields`
--

LOCK TABLES `ccchangedfields` WRITE;
/*!40000 ALTER TABLE `ccchangedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccchangedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cccontent`
--

LOCK TABLES `cccontent` WRITE;
/*!40000 ALTER TABLE `cccontent` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `cccontent` VALUES (1,1,1,NULL,'2023-04-14 08:34:09','2023-04-14 08:34:09','c76d6f1d-2332-487e-bc8f-9ba0f8fe3c91');
/*!40000 ALTER TABLE `cccontent` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cccraftidtokens`
--

LOCK TABLES `cccraftidtokens` WRITE;
/*!40000 ALTER TABLE `cccraftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cccraftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccdeprecationerrors`
--

LOCK TABLES `ccdeprecationerrors` WRITE;
/*!40000 ALTER TABLE `ccdeprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccdeprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccdrafts`
--

LOCK TABLES `ccdrafts` WRITE;
/*!40000 ALTER TABLE `ccdrafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccdrafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccelementindexsettings`
--

LOCK TABLES `ccelementindexsettings` WRITE;
/*!40000 ALTER TABLE `ccelementindexsettings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccelementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccelements`
--

LOCK TABLES `ccelements` WRITE;
/*!40000 ALTER TABLE `ccelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ccelements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-04-14 08:34:09','2023-04-14 08:34:09',NULL,NULL,'ca7e02e9-d81c-477b-a040-321e009e517c');
/*!40000 ALTER TABLE `ccelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccelements_sites`
--

LOCK TABLES `ccelements_sites` WRITE;
/*!40000 ALTER TABLE `ccelements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ccelements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-04-14 08:34:09','2023-04-14 08:34:09','66cf18d2-3a2e-4caf-a41f-8c4201b3ce6b');
/*!40000 ALTER TABLE `ccelements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccentries`
--

LOCK TABLES `ccentries` WRITE;
/*!40000 ALTER TABLE `ccentries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccentries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccentrytypes`
--

LOCK TABLES `ccentrytypes` WRITE;
/*!40000 ALTER TABLE `ccentrytypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccentrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccfieldgroups`
--

LOCK TABLES `ccfieldgroups` WRITE;
/*!40000 ALTER TABLE `ccfieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ccfieldgroups` VALUES (1,'Common','2023-04-14 08:34:09','2023-04-14 08:34:09',NULL,'5cbe1461-3ba4-4156-9696-16a2139da724');
/*!40000 ALTER TABLE `ccfieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccfieldlayoutfields`
--

LOCK TABLES `ccfieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `ccfieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccfieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccfieldlayouts`
--

LOCK TABLES `ccfieldlayouts` WRITE;
/*!40000 ALTER TABLE `ccfieldlayouts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccfieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccfieldlayouttabs`
--

LOCK TABLES `ccfieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `ccfieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccfieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccfields`
--

LOCK TABLES `ccfields` WRITE;
/*!40000 ALTER TABLE `ccfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccglobalsets`
--

LOCK TABLES `ccglobalsets` WRITE;
/*!40000 ALTER TABLE `ccglobalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccglobalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccgqlschemas`
--

LOCK TABLES `ccgqlschemas` WRITE;
/*!40000 ALTER TABLE `ccgqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccgqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccgqltokens`
--

LOCK TABLES `ccgqltokens` WRITE;
/*!40000 ALTER TABLE `ccgqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccgqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccinfo`
--

LOCK TABLES `ccinfo` WRITE;
/*!40000 ALTER TABLE `ccinfo` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ccinfo` VALUES (1,'3.7.59','3.7.33',0,'ognanscdjwlr','3@gaagthuwby','2023-04-14 08:34:09','2023-04-14 08:34:11','2d933e9e-6fbc-4b19-8e83-be1fb23d2319');
/*!40000 ALTER TABLE `ccinfo` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccmatrixblocks`
--

LOCK TABLES `ccmatrixblocks` WRITE;
/*!40000 ALTER TABLE `ccmatrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccmatrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccmatrixblocktypes`
--

LOCK TABLES `ccmatrixblocktypes` WRITE;
/*!40000 ALTER TABLE `ccmatrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccmatrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccmigrations`
--

LOCK TABLES `ccmigrations` WRITE;
/*!40000 ALTER TABLE `ccmigrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ccmigrations` VALUES (1,'craft','Install','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','fd76dbd1-7d00-4b0a-b17f-7dafac281a17'),(2,'craft','m150403_183908_migrations_table_changes','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','b8303112-ffab-4cea-a2a4-c4cf88f744a6'),(3,'craft','m150403_184247_plugins_table_changes','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','5c14b990-e71a-43ee-8145-132ccd2bc378'),(4,'craft','m150403_184533_field_version','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','16ddb125-a0d0-498c-9b53-4e9ca664ff44'),(5,'craft','m150403_184729_type_columns','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','2baacbef-7eba-4b8a-b5a9-02cf3e340621'),(6,'craft','m150403_185142_volumes','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','f8b2b72f-5fbf-4edd-a348-b745f45b0ebf'),(7,'craft','m150428_231346_userpreferences','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','edcb9332-4c30-4d25-bbd1-15d5eb56e560'),(8,'craft','m150519_150900_fieldversion_conversion','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','6ee296e8-efa1-4fb2-ad40-b610fa78948c'),(9,'craft','m150617_213829_update_email_settings','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','1850e558-83f4-409e-9241-7311559c4af3'),(10,'craft','m150721_124739_templatecachequeries','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','d548448f-a61b-44a9-8e6c-6dcdb2664f6b'),(11,'craft','m150724_140822_adjust_quality_settings','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','b0e930fb-34fc-48cc-9865-0f41274fd260'),(12,'craft','m150815_133521_last_login_attempt_ip','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','2ff44b17-9949-4066-b944-9a12896d16a4'),(13,'craft','m151002_095935_volume_cache_settings','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','4f2f4162-9c65-4486-b9aa-c9e21b7a4969'),(14,'craft','m151005_142750_volume_s3_storage_settings','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','e86b3b15-2be6-4ea2-a023-25f36d7dc8d2'),(15,'craft','m151016_133600_delete_asset_thumbnails','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','d3081a44-628f-402b-b48e-80fc1c2b19ad'),(16,'craft','m151209_000000_move_logo','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','e6bfc6f0-7567-4914-9d99-4de3ae809b61'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','ebc1ffae-e1f6-4147-900f-955b02e0738a'),(18,'craft','m151215_000000_rename_asset_permissions','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','02b8589a-9f93-40d0-ba87-853dbca2292a'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','28cc6816-0e89-46fc-93ce-5d03df29dc1e'),(20,'craft','m160708_185142_volume_hasUrls_setting','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','102e9d97-1ffb-4d09-8a30-955e8d2d3aa2'),(21,'craft','m160714_000000_increase_max_asset_filesize','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','3699b402-138f-4e1c-8033-72fcd07146b6'),(22,'craft','m160727_194637_column_cleanup','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','f2af14ef-41bf-46b5-ad22-56756a796c91'),(23,'craft','m160804_110002_userphotos_to_assets','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','d0cf1bdd-a064-4633-b3a2-d66d79a01c53'),(24,'craft','m160807_144858_sites','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','69b378c3-c6c8-402b-aa14-edd4a361adae'),(25,'craft','m160829_000000_pending_user_content_cleanup','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','da58ed7e-cce4-4ab9-9da0-9c657d8f821c'),(26,'craft','m160830_000000_asset_index_uri_increase','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','00b3cf08-9884-4c0a-b6ea-3d9061d9847e'),(27,'craft','m160912_230520_require_entry_type_id','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','93679716-8546-46a9-b326-9c7bd1ac9618'),(28,'craft','m160913_134730_require_matrix_block_type_id','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','d1a84f15-d75f-4568-a873-6fa6485f9931'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','629065ca-f9f2-46ae-bf64-32ee3908542b'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','0d2b8fe3-cf21-421d-b7c7-19188bafbaf5'),(31,'craft','m160925_113941_route_uri_parts','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','39e92035-ff3d-475e-b10e-a609b43a2f6c'),(32,'craft','m161006_205918_schemaVersion_not_null','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','cbbbc4a5-ebb7-4d0e-8c13-64afecd74d25'),(33,'craft','m161007_130653_update_email_settings','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','5fff2665-a089-4b98-ba3c-fa120ca6bf0c'),(34,'craft','m161013_175052_newParentId','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','19d51b1f-8ca3-44af-a839-063fceac0c4a'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','ef2e1575-4be4-4c83-af4a-90efc6769f68'),(36,'craft','m161021_182140_rename_get_help_widget','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','5a5a80ba-7094-421c-80ed-4069e7ffb23d'),(37,'craft','m161025_000000_fix_char_columns','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','7cd052c9-5cac-40a9-9ada-302541739e92'),(38,'craft','m161029_124145_email_message_languages','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','61e0f803-4989-405b-8246-04634bec763e'),(39,'craft','m161108_000000_new_version_format','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','b843caf3-0e9d-4b65-96c7-29407f3460e4'),(40,'craft','m161109_000000_index_shuffle','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','51fc3f53-4a3d-4b5c-952e-2f88cc2ee5e8'),(41,'craft','m161122_185500_no_craft_app','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','a89c1e7a-9620-4fb7-ba4a-d3c13c8e7c11'),(42,'craft','m161125_150752_clear_urlmanager_cache','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','cdee98b3-c7c6-41f9-9b0e-084af603028b'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','f7c64135-cdd3-487e-b047-5add9e978002'),(44,'craft','m170114_161144_udates_permission','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','d20db21e-8c6b-43d7-bd1e-aee04ae5c39d'),(45,'craft','m170120_000000_schema_cleanup','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','f63a736c-7c8b-4cd6-8abf-4b11dbf6cd29'),(46,'craft','m170126_000000_assets_focal_point','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','599d4e89-a6bf-404c-b1e1-c8f7b1619d45'),(47,'craft','m170206_142126_system_name','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','78a85e05-2aa1-4a0a-bd77-7fd00d1265b8'),(48,'craft','m170217_044740_category_branch_limits','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','18aa416e-f394-414a-a10b-cc6641c258c4'),(49,'craft','m170217_120224_asset_indexing_columns','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','69d6643c-a7d5-467f-b35e-03c06796cd2b'),(50,'craft','m170223_224012_plain_text_settings','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','d1d6d9a8-c946-4398-93aa-0c133ea38fc1'),(51,'craft','m170227_120814_focal_point_percentage','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','be4940f2-3e2e-4210-8e83-1b19437c741d'),(52,'craft','m170228_171113_system_messages','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','60f0dcf8-3433-4831-a173-97f3d19b5d91'),(53,'craft','m170303_140500_asset_field_source_settings','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','c7523ae7-4cad-4b0a-ac7f-037c7e9cd7ba'),(54,'craft','m170306_150500_asset_temporary_uploads','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','f3f1e3e6-365e-4be8-9acc-2c632b71fa0a'),(55,'craft','m170523_190652_element_field_layout_ids','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','30678bd9-0bf1-4919-85f4-8f1ab6143882'),(56,'craft','m170621_195237_format_plugin_handles','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','f88c7106-bc64-470a-a331-395bb5baee81'),(57,'craft','m170630_161027_deprecation_line_nullable','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','1db5cd2a-fa67-4ff1-bb16-6026c27cedeb'),(58,'craft','m170630_161028_deprecation_changes','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','6004b655-1faa-4e7e-81de-027ea3ec7fa2'),(59,'craft','m170703_181539_plugins_table_tweaks','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','d84808a1-ea1c-4a52-b035-0d273299e69b'),(60,'craft','m170704_134916_sites_tables','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','d234699c-a549-454d-8ca7-dbaf51220aa9'),(61,'craft','m170706_183216_rename_sequences','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','cb6be6e4-a64b-44c3-8cea-59bc808caae7'),(62,'craft','m170707_094758_delete_compiled_traits','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','9cd4194e-dc08-4d14-88d7-310077290e0e'),(63,'craft','m170731_190138_drop_asset_packagist','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','90983d9a-2044-4d8c-93d7-6e26e22042c7'),(64,'craft','m170810_201318_create_queue_table','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','bb2512c0-ad99-431f-bd58-c61be2383039'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','00548321-b951-4aa1-93e1-49d9678beb5e'),(66,'craft','m170914_204621_asset_cache_shuffle','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','4c067359-d8f4-4a0d-b61c-06d18937fd5e'),(67,'craft','m171011_214115_site_groups','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','60c3a9b5-7154-49bc-a91f-aab81c5a013f'),(68,'craft','m171012_151440_primary_site','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','d8fb1521-e1eb-45ed-949d-8fffa4e6a4b1'),(69,'craft','m171013_142500_transform_interlace','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','af85ae03-bad0-4648-8faf-ad5df5275f25'),(70,'craft','m171016_092553_drop_position_select','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','34448d74-1c28-4d02-b979-9e8ead9dd0a7'),(71,'craft','m171016_221244_less_strict_translation_method','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','c9be58fa-d10e-4a62-af0f-2f42bea2f612'),(72,'craft','m171107_000000_assign_group_permissions','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','47be5fd6-b4e3-477a-8422-b695eca10772'),(73,'craft','m171117_000001_templatecache_index_tune','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','d474e960-dc6d-43d9-a20f-143c82680fe0'),(74,'craft','m171126_105927_disabled_plugins','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','92d4bc2d-0a9c-46a9-847a-60b5ff3761ca'),(75,'craft','m171130_214407_craftidtokens_table','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','e6f43772-c2fc-49bb-bf2d-08d1d39c29e9'),(76,'craft','m171202_004225_update_email_settings','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','ed277330-cd97-4e84-a438-c6a02b44a975'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','68ed35ce-2e50-4436-8ee1-45999ed415e6'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','fff1c73a-a0ad-468c-96ce-36eea2429829'),(79,'craft','m171218_143135_longtext_query_column','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','dee4f25e-79a5-477e-a81e-a0b49d9eff27'),(80,'craft','m171231_055546_environment_variables_to_aliases','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','8d1825ba-f49a-40b4-ac29-a04478572df9'),(81,'craft','m180113_153740_drop_users_archived_column','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','278409f7-db72-44e7-a5d4-12d4b0ec81a8'),(82,'craft','m180122_213433_propagate_entries_setting','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','b5e608a6-410c-4e7e-9eb8-f6886cebba57'),(83,'craft','m180124_230459_fix_propagate_entries_values','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','556adf54-0887-448d-ba5b-9d0cc6190122'),(84,'craft','m180128_235202_set_tag_slugs','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','49024ad5-a918-40b4-ade1-9791342bcb63'),(85,'craft','m180202_185551_fix_focal_points','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','172fae74-3079-4867-b46c-c3013e670558'),(86,'craft','m180217_172123_tiny_ints','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','86c9c68b-f3c5-4980-ba24-7a06943ff69f'),(87,'craft','m180321_233505_small_ints','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','3ef21878-74f4-429b-83a1-9181ee7524bb'),(88,'craft','m180404_182320_edition_changes','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','47561b82-a2d2-499f-8ec6-eab6ac9fc495'),(89,'craft','m180411_102218_fix_db_routes','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','677b9791-7960-41bd-b9b6-2defc094f34c'),(90,'craft','m180416_205628_resourcepaths_table','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','8d035246-6c0b-4b7d-888e-63cd34d9321c'),(91,'craft','m180418_205713_widget_cleanup','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','c1b50b3d-030a-4335-9b97-fb76c0292ce4'),(92,'craft','m180425_203349_searchable_fields','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','6f39202d-ef15-4705-ab24-534a43438be2'),(93,'craft','m180516_153000_uids_in_field_settings','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','d2a90060-264a-4528-9ea6-c141ea3df1ee'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','41345ec5-bd5b-43ee-8e3c-404d72c78535'),(95,'craft','m180518_173000_permissions_to_uid','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','2ab9d4a2-c4e0-4f01-8193-bd3e042c158c'),(96,'craft','m180520_173000_matrix_context_to_uids','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','f04e8e92-708b-42c2-b249-23ab0c48a6de'),(97,'craft','m180521_172900_project_config_table','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','3ce0219e-49c5-4aea-8442-d682c05fdc3f'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','3832f636-0391-4970-a4fd-1aa0d4ed7392'),(99,'craft','m180731_162030_soft_delete_sites','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','522b073f-1b58-4055-b6e2-9112d49d12be'),(100,'craft','m180810_214427_soft_delete_field_layouts','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','09470260-9a08-47d6-b672-5333fee1d97f'),(101,'craft','m180810_214439_soft_delete_elements','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','db58f16a-648a-4db4-ac8b-53fcb640adca'),(102,'craft','m180824_193422_case_sensitivity_fixes','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','de2df03a-0581-4374-92b6-f9c0d3378473'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','e3948cbe-b4dc-4ac7-9348-4b4e3cb830b0'),(104,'craft','m180904_112109_permission_changes','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','bcea0d6b-1dd2-4564-8fce-177eb380a631'),(105,'craft','m180910_142030_soft_delete_sitegroups','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','96675398-ad89-4ca7-a453-91e8b06d8a16'),(106,'craft','m181011_160000_soft_delete_asset_support','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','82597f94-34ff-4d5a-ac4a-ff7c68aaf8d2'),(107,'craft','m181016_183648_set_default_user_settings','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','e86ee948-6f83-43db-bf3e-e0c15ecf1c42'),(108,'craft','m181017_225222_system_config_settings','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','1c5bdd69-ebfe-428c-9195-6983824c443b'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','ffdf6bd4-24d4-489e-9f36-c1447c6807f8'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','b4da527f-ca2f-4ec6-8dac-448e08463d19'),(111,'craft','m181112_203955_sequences_table','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','2c0b3db9-9d0e-4bd1-8a4e-494b1a1baad9'),(112,'craft','m181121_001712_cleanup_field_configs','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','397bd23c-78d8-4ad0-a9d0-8c0c70837f7c'),(113,'craft','m181128_193942_fix_project_config','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','e62cb16d-4162-4038-9388-e6e738e20584'),(114,'craft','m181130_143040_fix_schema_version','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','7f5c4bd6-ae07-42b9-94c0-f79f0ce58cc1'),(115,'craft','m181211_143040_fix_entry_type_uids','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','3cba2a08-53f9-432f-bb66-572e63bd7d0b'),(116,'craft','m181217_153000_fix_structure_uids','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','68c980e5-4f0e-4e15-a6ba-c489ccd92529'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','d3df0644-048e-41f4-a15c-63c4d29c15d6'),(118,'craft','m190108_110000_cleanup_project_config','2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','0307aa52-f00c-4e71-a68d-4de19ff4463c'),(119,'craft','m190108_113000_asset_field_setting_change','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','b7582ab7-a95c-429a-8517-5a783a04e80e'),(120,'craft','m190109_172845_fix_colspan','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','0f250486-010f-45ac-9204-56d4ea4f3508'),(121,'craft','m190110_150000_prune_nonexisting_sites','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','f6d97ca5-befa-4a6d-b764-1bba68fc9fea'),(122,'craft','m190110_214819_soft_delete_volumes','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','9cef9a3a-1139-44e3-a401-d6fa154cd813'),(123,'craft','m190112_124737_fix_user_settings','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','78ac75f2-81d5-4036-80c6-9b118cc03522'),(124,'craft','m190112_131225_fix_field_layouts','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','38bbe172-119c-47a6-8ddf-5a6e1c8eb430'),(125,'craft','m190112_201010_more_soft_deletes','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','7ab70e95-71fd-4bd4-af5c-617801e6606c'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','59abc9e1-8b8b-4f67-8d2f-b3402bab895a'),(127,'craft','m190121_120000_rich_text_config_setting','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','9a3c0aec-4f44-48c0-81ec-7de0229f140b'),(128,'craft','m190125_191628_fix_email_transport_password','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','232c3fef-76e7-4a03-98cb-aaa3c3fb24dc'),(129,'craft','m190128_181422_cleanup_volume_folders','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','e3498757-2682-4b4d-8330-8b5821ff1915'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','978e00d0-3835-4394-a73c-147c91a7f86e'),(131,'craft','m190218_143000_element_index_settings_uid','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','6a1d7165-07f6-4bcf-b900-4eafdf36d627'),(132,'craft','m190312_152740_element_revisions','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','3d2a867e-f15a-4bd6-ade9-bb68244521ab'),(133,'craft','m190327_235137_propagation_method','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','c5f4db3c-58fc-4ee6-965d-e34a7280da18'),(134,'craft','m190401_223843_drop_old_indexes','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','f442ad69-2d9c-48b3-bbb2-1c4d7e8521f2'),(135,'craft','m190416_014525_drop_unique_global_indexes','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','4ea84aa2-a6a3-442e-9429-754165019dd5'),(136,'craft','m190417_085010_add_image_editor_permissions','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','5620f250-981f-4ecf-8a8c-dc810405f2d1'),(137,'craft','m190502_122019_store_default_user_group_uid','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','e5b68823-5d84-4ac4-bcee-7eada3841aa8'),(138,'craft','m190504_150349_preview_targets','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','2b8f00da-d743-4206-a9a8-837d653132df'),(139,'craft','m190516_184711_job_progress_label','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','e7271805-4002-4740-a6fb-e18949104181'),(140,'craft','m190523_190303_optional_revision_creators','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','222c5765-8f1b-4e88-a6cc-7c15ad64585e'),(141,'craft','m190529_204501_fix_duplicate_uids','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','c050384c-a5d1-4d08-bd86-88ee46183eef'),(142,'craft','m190605_223807_unsaved_drafts','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','a60a494b-2252-4eef-a788-333c8a7fdadd'),(143,'craft','m190607_230042_entry_revision_error_tables','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','3fc3f7c7-5220-4eb1-94b1-055adbf4877d'),(144,'craft','m190608_033429_drop_elements_uid_idx','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','d1ba1d8e-799b-424d-8298-8999a03764eb'),(145,'craft','m190617_164400_add_gqlschemas_table','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','0b85229d-2886-4a53-a4bf-d43c12c3cf9b'),(146,'craft','m190624_234204_matrix_propagation_method','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','efa66dd8-84d9-484b-819a-b8b38127e9c6'),(147,'craft','m190711_153020_drop_snapshots','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','88b1afc4-f9da-4be3-9686-9c2dc591b256'),(148,'craft','m190712_195914_no_draft_revisions','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','f4dc2275-ef28-4c53-b55a-b6dfd78e1476'),(149,'craft','m190723_140314_fix_preview_targets_column','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','d1ed5f8e-7873-4562-afe2-e51627f4a178'),(150,'craft','m190820_003519_flush_compiled_templates','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','8773f611-45e2-42e3-904a-36dd55a48d8f'),(151,'craft','m190823_020339_optional_draft_creators','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','1e72c0c7-9ea0-4d19-a225-ea240d13c80f'),(152,'craft','m190913_152146_update_preview_targets','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','a6a2be51-6ab9-4107-96b0-55b7e830ac96'),(153,'craft','m191107_122000_add_gql_project_config_support','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','17866192-3aae-4d75-ae07-8aecccb7bf55'),(154,'craft','m191204_085100_pack_savable_component_settings','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','ce028e39-c966-4650-b116-7995742eaff9'),(155,'craft','m191206_001148_change_tracking','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','d5f7a687-6fd1-4fc5-9b41-93d8d7360e9e'),(156,'craft','m191216_191635_asset_upload_tracking','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','7f877238-52bb-43f4-a2df-697f8101353b'),(157,'craft','m191222_002848_peer_asset_permissions','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','545ab89b-557b-4406-b606-851ebc64cdee'),(158,'craft','m200127_172522_queue_channels','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','fef2702b-90de-467d-b2f1-551d41a5fbd9'),(159,'craft','m200211_175048_truncate_element_query_cache','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','2d4e6ee3-cc60-4e25-9f40-d0f127348ff8'),(160,'craft','m200213_172522_new_elements_index','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','9ac80998-e2b8-4016-8772-d06137607441'),(161,'craft','m200228_195211_long_deprecation_messages','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','6218fb46-afd1-4fea-a70d-5e0cb69e6936'),(162,'craft','m200306_054652_disabled_sites','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','8df5ea4e-53c4-4dd8-a243-f5f94d9439f8'),(163,'craft','m200522_191453_clear_template_caches','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','4cf2da25-4266-4efe-b549-62c4999dd868'),(164,'craft','m200606_231117_migration_tracks','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','4702adb6-0eff-4e6a-9775-cb4a6842cba6'),(165,'craft','m200619_215137_title_translation_method','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','3263e8f6-e4e9-46a0-9fdd-30c35cb070a8'),(166,'craft','m200620_005028_user_group_descriptions','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','51a7dc98-f9d9-4ce7-ab92-be6a50a9c387'),(167,'craft','m200620_230205_field_layout_changes','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','ca833008-f8b7-4d7f-961a-936731cebcfc'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','1236c63d-a593-4e2b-8dbf-002a5f513e4d'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','01b7e4d4-258c-4738-a6a4-ea6de01f3693'),(170,'craft','m200630_183000_drop_configmap','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','5828e2ee-ce87-4465-affe-7836ef1f3401'),(171,'craft','m200715_113400_transform_index_error_flag','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','b031604f-3f50-479d-803f-74a6197a3f19'),(172,'craft','m200716_110900_replace_file_asset_permissions','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','01cc7e0f-7e29-4c96-86ed-438285f2542e'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','6da071a2-0b98-4c61-ac16-9169d5478d37'),(174,'craft','m200720_175543_drop_unique_constraints','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','6ea95861-1009-4013-bfb3-0a07327f5e75'),(175,'craft','m200825_051217_project_config_version','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','641e1863-3e86-4047-9f07-910518e029ca'),(176,'craft','m201116_190500_asset_title_translation_method','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','0a7c82f1-01e4-4927-bcfe-c12c636f8529'),(177,'craft','m201124_003555_plugin_trials','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','03abebf5-ecaf-4230-998a-6fa57c0d1449'),(178,'craft','m210209_135503_soft_delete_field_groups','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','eb24f448-cc5b-4175-94af-3ad1ff945bd2'),(179,'craft','m210212_223539_delete_invalid_drafts','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','bb84f517-bea7-42cd-98b6-a3ac270b1c8f'),(180,'craft','m210214_202731_track_saved_drafts','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','b54ba76f-c971-4b33-b02c-aabf46962c83'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','27808c54-3ee5-4ada-bc94-aca157646a84'),(182,'craft','m210302_212318_canonical_elements','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','fd75af66-22d2-4673-9ca3-270c14a5849e'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','7af75c00-51cc-41e6-8729-a95fd84c7502'),(184,'craft','m210329_214847_field_column_suffixes','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','5be24c0f-f910-43da-89d1-d65aaecde8b9'),(185,'craft','m210331_220322_null_author','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','374cb1fc-b1e3-49d5-a90c-a54980a019ab'),(186,'craft','m210405_231315_provisional_drafts','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','9b38751d-5ab3-4791-8fac-a477493f75ac'),(187,'craft','m210602_111300_project_config_names_in_config','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','a53facf0-8b02-44ca-83f0-307bbc989ba8'),(188,'craft','m210611_233510_default_placement_settings','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','c0974e81-1ff4-4eb3-8592-348cdc43263c'),(189,'craft','m210613_145522_sortable_global_sets','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','9807cd7f-ee8c-4f9b-88f5-e3dde52fede5'),(190,'craft','m210613_184103_announcements','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','8c229411-1439-4e21-bfa3-d3c33bb2ed9f'),(191,'craft','m210829_000000_element_index_tweak','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','7834516b-342b-4f1d-b50e-46e16d3f230a'),(192,'craft','m220209_095604_add_indexes','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','c366f44d-c848-44d2-9611-c060aa4ef469'),(193,'craft','m220214_000000_truncate_sessions','2023-04-14 08:34:11','2023-04-14 08:34:11','2023-04-14 08:34:11','bc294624-0a50-48c5-bc96-8f7d6fd2c405');
/*!40000 ALTER TABLE `ccmigrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccplugins`
--

LOCK TABLES `ccplugins` WRITE;
/*!40000 ALTER TABLE `ccplugins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccplugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccprojectconfig`
--

LOCK TABLES `ccprojectconfig` WRITE;
/*!40000 ALTER TABLE `ccprojectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ccprojectconfig` VALUES ('dateModified','1681461251'),('email.fromEmail','\"cjoshi@awwgment.com\"'),('email.fromName','\"Craft CMS \"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('fieldGroups.5cbe1461-3ba4-4156-9696-16a2139da724.name','\"Common\"'),('meta.__names__.5cbe1461-3ba4-4156-9696-16a2139da724','\"Common\"'),('meta.__names__.b2c747cf-55c0-4657-84d5-51335302a6e7','\"Craft CMS \"'),('meta.__names__.bd395079-c204-4443-b6f0-4a70339ae1db','\"Craft CMS \"'),('siteGroups.bd395079-c204-4443-b6f0-4a70339ae1db.name','\"Craft CMS \"'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.handle','\"default\"'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.hasUrls','true'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.language','\"en-US\"'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.name','\"Craft CMS \"'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.primary','true'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.siteGroup','\"bd395079-c204-4443-b6f0-4a70339ae1db\"'),('sites.b2c747cf-55c0-4657-84d5-51335302a6e7.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Craft CMS \"'),('system.schemaVersion','\"3.7.33\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `ccprojectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccqueue`
--

LOCK TABLES `ccqueue` WRITE;
/*!40000 ALTER TABLE `ccqueue` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ccqueue` VALUES (1,'queue',_binary 'O:34:\"craft\\queue\\jobs\\UpdateSearchIndex\":7:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:11:\"elementType\";s:19:\"craft\\elements\\User\";s:9:\"elementId\";i:1;s:6:\"siteId\";i:1;s:12:\"fieldHandles\";a:0:{}}','Updating search indexes',1681461250,300,0,2048,NULL,NULL,0,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `ccqueue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccrelations`
--

LOCK TABLES `ccrelations` WRITE;
/*!40000 ALTER TABLE `ccrelations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccrelations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccresourcepaths`
--

LOCK TABLES `ccresourcepaths` WRITE;
/*!40000 ALTER TABLE `ccresourcepaths` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccresourcepaths` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccrevisions`
--

LOCK TABLES `ccrevisions` WRITE;
/*!40000 ALTER TABLE `ccrevisions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccrevisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccsearchindex`
--

LOCK TABLES `ccsearchindex` WRITE;
/*!40000 ALTER TABLE `ccsearchindex` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccsearchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccsections`
--

LOCK TABLES `ccsections` WRITE;
/*!40000 ALTER TABLE `ccsections` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccsections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccsections_sites`
--

LOCK TABLES `ccsections_sites` WRITE;
/*!40000 ALTER TABLE `ccsections_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccsections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccsequences`
--

LOCK TABLES `ccsequences` WRITE;
/*!40000 ALTER TABLE `ccsequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccsequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccsessions`
--

LOCK TABLES `ccsessions` WRITE;
/*!40000 ALTER TABLE `ccsessions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ccsessions` VALUES (1,1,'RZBbJupfWipXOpjRiwN9dUD0yFj1bBqMHtNBXkPXkBwwfqKq7IxCx5pjSaV_4jHxJLbTIk7rq4arTFt7Dw9A1XschIatNa4-OR7Y','2023-04-14 08:34:10','2023-04-14 08:34:10','39dac294-9143-4e20-be8b-b12cac990020');
/*!40000 ALTER TABLE `ccsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccshunnedmessages`
--

LOCK TABLES `ccshunnedmessages` WRITE;
/*!40000 ALTER TABLE `ccshunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccshunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccsitegroups`
--

LOCK TABLES `ccsitegroups` WRITE;
/*!40000 ALTER TABLE `ccsitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ccsitegroups` VALUES (1,'Craft CMS ','2023-04-14 08:34:09','2023-04-14 08:34:09',NULL,'bd395079-c204-4443-b6f0-4a70339ae1db');
/*!40000 ALTER TABLE `ccsitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccsites`
--

LOCK TABLES `ccsites` WRITE;
/*!40000 ALTER TABLE `ccsites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ccsites` VALUES (1,1,1,1,'Craft CMS ','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-04-14 08:34:09','2023-04-14 08:34:09',NULL,'b2c747cf-55c0-4657-84d5-51335302a6e7');
/*!40000 ALTER TABLE `ccsites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccstructureelements`
--

LOCK TABLES `ccstructureelements` WRITE;
/*!40000 ALTER TABLE `ccstructureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccstructureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccstructures`
--

LOCK TABLES `ccstructures` WRITE;
/*!40000 ALTER TABLE `ccstructures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccstructures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccsystemmessages`
--

LOCK TABLES `ccsystemmessages` WRITE;
/*!40000 ALTER TABLE `ccsystemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccsystemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cctaggroups`
--

LOCK TABLES `cctaggroups` WRITE;
/*!40000 ALTER TABLE `cctaggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cctaggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cctags`
--

LOCK TABLES `cctags` WRITE;
/*!40000 ALTER TABLE `cctags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cctags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cctemplatecacheelements`
--

LOCK TABLES `cctemplatecacheelements` WRITE;
/*!40000 ALTER TABLE `cctemplatecacheelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cctemplatecacheelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cctemplatecachequeries`
--

LOCK TABLES `cctemplatecachequeries` WRITE;
/*!40000 ALTER TABLE `cctemplatecachequeries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cctemplatecachequeries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cctemplatecaches`
--

LOCK TABLES `cctemplatecaches` WRITE;
/*!40000 ALTER TABLE `cctemplatecaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cctemplatecaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `cctokens`
--

LOCK TABLES `cctokens` WRITE;
/*!40000 ALTER TABLE `cctokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `cctokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccusergroups`
--

LOCK TABLES `ccusergroups` WRITE;
/*!40000 ALTER TABLE `ccusergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccusergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccusergroups_users`
--

LOCK TABLES `ccusergroups_users` WRITE;
/*!40000 ALTER TABLE `ccusergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccusergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccuserpermissions`
--

LOCK TABLES `ccuserpermissions` WRITE;
/*!40000 ALTER TABLE `ccuserpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccuserpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccuserpermissions_usergroups`
--

LOCK TABLES `ccuserpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `ccuserpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccuserpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccuserpermissions_users`
--

LOCK TABLES `ccuserpermissions_users` WRITE;
/*!40000 ALTER TABLE `ccuserpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccuserpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccuserpreferences`
--

LOCK TABLES `ccuserpreferences` WRITE;
/*!40000 ALTER TABLE `ccuserpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ccuserpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `ccuserpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccusers`
--

LOCK TABLES `ccusers` WRITE;
/*!40000 ALTER TABLE `ccusers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `ccusers` VALUES (1,'admin',NULL,NULL,NULL,'cjoshi@awwgment.com','$2y$13$0/4xyOl7drqW30NAB9mlAeezHFDKw3/7vAYH43AzmfeSi46SyjJ5S',1,0,0,0,'2023-04-14 08:34:10',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,'2023-04-14 08:34:10','2023-04-14 08:34:10','2023-04-14 08:34:10','910383a2-88c5-45f8-81aa-7cc17f67137c');
/*!40000 ALTER TABLE `ccusers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccvolumefolders`
--

LOCK TABLES `ccvolumefolders` WRITE;
/*!40000 ALTER TABLE `ccvolumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccvolumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccvolumes`
--

LOCK TABLES `ccvolumes` WRITE;
/*!40000 ALTER TABLE `ccvolumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccvolumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `ccwidgets`
--

LOCK TABLES `ccwidgets` WRITE;
/*!40000 ALTER TABLE `ccwidgets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `ccwidgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'craftcmsdb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24  8:34:20
