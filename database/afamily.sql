/*
SQLyog Ultimate v10.42 
MySQL - 5.5.5-10.1.9-MariaDB : Database - acm_family
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`acm_family` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `acm_family`;

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `account` varchar(50) NOT NULL COMMENT '登录账号',
  `address` varchar(20) NOT NULL COMMENT 'IP',
  `port` int(10) NOT NULL COMMENT '端口',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `logout_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '注销时间',
  `flag_login` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert  into `log`(`id`,`account`,`address`,`port`,`login_time`,`logout_time`,`flag_login`) values (1,'adminTest','1192.168.1.1',30000,'2016-04-04 15:44:41','2016-04-04 15:46:48',0),(2,'adminTest','1192.168.1.2',30000,'2016-04-04 15:45:36','2016-04-04 15:47:17',0),(3,'admin','1192.168.1.3',30000,'2016-04-04 15:46:29','2016-04-04 15:47:05',0),(5,'admin','/192.168.56.101',36703,'2016-04-04 16:13:22','2016-04-04 16:13:36',0);

/*Table structure for table `online` */

DROP TABLE IF EXISTS `online`;

CREATE TABLE `online` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `account` varchar(10) NOT NULL COMMENT '账号',
  `address` varchar(20) DEFAULT NULL COMMENT 'IP',
  `port` int(10) DEFAULT NULL COMMENT '端口',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '在线标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `online` */

insert  into `online`(`id`,`account`,`address`,`port`,`flag`) values (1,'admin',NULL,NULL,0),(2,'admin2',NULL,NULL,0);

/*Table structure for table `student_user` */

DROP TABLE IF EXISTS `student_user`;

CREATE TABLE `student_user` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `student_id` varchar(10) NOT NULL COMMENT '学号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `portrait` longblob NOT NULL COMMENT '头像',
  `sex` varchar(2) NOT NULL DEFAULT '-' COMMENT '性别',
  `classes` varchar(10) NOT NULL COMMENT '班级',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `student_user` */

insert  into `student_user`(`user_id`,`student_id`,`password`,`name`,`portrait`,`sex`,`classes`) values (0,'admin','21232f297a57a5a743894a0e4a801fc3','小涛哈哈哈','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0<\0\0\0;\0\0\0��~�\0\0\0bKGD\0�\0�\0�����\0\0\0	pHYs\0\0�\0\0��+\0\0\ZOIDATh�mzi�]Wu���g������4Y��6H�el6hb�T\0�RqR]�JB��N7\r��.Rm tS���tB�t*�@�ݴ�Llc˖�Yz��x�s��{��q�Փq�{?n�{���[����{��7�03ՌDU%\"U@\0�\nU\0\0��Je^z(�H�l@�������A\n\"��\0�b��\"O�J��*K�Oxyn���o�3�ӱN�Y;�U���(@�@���#U� \0J/�[D\0��,\\<}����lL3�k�k�m�5�\"6ļz����T����*S\r��P!��_����UOvK<�\n�lxx�_�Jҗ�ehřSǟ��C?����TweA�΁�Fq<���-{_�u��o�q�Ν��*p�yBCԩD�\n�D��po�H���p�˪���W�\\n��bI�ű������W�qEq����1�9�$�H\0�7�xbr�W>����M֚�&1@E�&j��\Z�d�/��:\\\ZX�\0��\\�<�T	\n�ȿ଱����<28���>��]�$����4�V*��Qf�,B��;W0U�jߍ���Xs��Dd\0ð@�j�����jU�Ty��* �Qԛ�\"���)M]�AnP]��̋��5Q���~�S����s>�PIS\"JӔ�+�TBp�f���b�R���CЧ}��߾�W�|M��OЎ���h��BH���U����v5.�T\\g�&U�(^>��O\'n9�ƴ��?|���̬wE�e�J�R���\0JӴ��Zc*����N���+��v;��KmY:�}�����}+�5��\0���\'�XD�����E�K��4�QR��`V_�L�]{�狀�zU<[��vaɏ�O���&ql�+i2�r��$���W�`�%q��E5�?�vm�ӞhV����^8���Tݰ-S$\"c�E �+�QZ{\Z�\0f���\0.\r�\0���v���;\ZY�>fq�5�ĭ����R���χ�4`��� ��V�����1Q�I��^�.���j�¹,��O%&2eP������|�T����+�<s[�cʁ�?�qR�T}/!&�pՅv�۩�3���IQm�V�\Z·9���\\���Z ��\"�cak��,ˢ(ZX\\c�~���^�zW3�bc\"g��{��N����b\0��r�˴̔1y�}���è��\'P�pp��\'�o�9��ۤ�Q�6���<���n���%�z]DTu��	!XfB���� c�,4M�v:���[��J5�b�l+���s�/�{�ȁ>�̏��\n\07�2\0�F�G�������\"Y8��qEM4��}������?~�M[���n�������~ii���fY�\"L�� �0^��m���6Qk�l�03a��{_�P���%���1��\'���>\"ֲE���t��G�Ú����/ZQڈ�\nEbK� ���?i�&oܻ��t���~����z�c�r��Y\'�j����(��|�Ʒ]?ݬE�D���x���{U!bUUL�j��CZ]�!�V \nâ���5�?�`����qb�i��ĆmD�\0nڿ�^KI�YՄ�k\Z���s�{��\rW�O�x�b���$��ݯ��KW�_1�06FU]QDI@� �+�*\"b�x���/&w�.\0/`\ZR	,�Kz��� @�Ǝ|SVh��\0��9mD�\Z�X%��%�u�wP�t{����啕~���;^u�w��R�������r��o}�]��ű��\"���P>ʻ<�b� E�\"Jdذj�����p�\r@!\n\0\n�Qƍ��LA�L�R�c�F�&��1a+M2�[�Q�$8\0YQ|��O<�ӟ]�q���������bù3�+3���������\n�\\U�JZ�\r�}6��\0�j\r� ��|���\0�\0n�],V�\0���b��}DL꽇��Ll�\Z�Q_�xf���\n��������\'��{͖F5!��t�k��|��Ý���D�đ�����Xk��5ޅ�(���H�(�����.�s\0��-mNZRۿ��\0�\n2Bq�����ā#�x��ݯ�~�kR��k��w�\0�P7\0�� �\0ްo�_Kͭ�D c�T=�af\0qZ��^��D�\Z2��W_q��UЗM�ul��r�5����ѽ������w{Y/��|c�՛����j�R�������ZS�>C�k��W?�o=�&��%\0��]VŌ��ƪj�X�L���mY�����5����D�PR%�2)W_>XRb#Q���p���|�-,��}�\'�tV2GY;$�Ĥ��Em�?p*;���Oի�ӭ��M��{��z�`R��!0ӰJ�F�8�DBl����=�����J�\Z�V�%.�4C�{]<@E\0��&n�<\\�Q7Ȼ���s3�U-���0I\0Ĕԟ~�؛��������J�Z{뫯���W+*^A\"��Ƙ(�J��+l��A *g���k����\0 �y����bT�V�u��\'1ǵ�٨6A�>�w�W�\r+�\'��Mj`���R\rK��s���i��\r��J?���C��l����5kA �T�(�zW�x\0D,�(x�\Zh�	AT�Ҕw���h��Ù�� ���aKllmܤ��҅S��t3�U�$�@!��m����	��(���kvn��Y�E�g?}�������~�#�3YoM��(�]&G�[kB0�`m�.\r���;��#���U���S��l-��I5�����\'�.���=���m[�~��~����6N�M��HpE�zˀS�֣J�չ���&�n�|�ɳ?~��m��@0lLY�j�8��E^�������-W�\04�4���������8a����x��׷��\"?�����7�n|w�q�o�1��x�u��E�qT׬��4�^P_7u��͉��^�mώuDD�Ė�3qY����&��y�%\r\'C�~m�~�L2\n�M�������>rTEw��I<su��Gi vEzKܚ}�x������v�]��7�>��[Yl��2�ns�Y!\'b\"\"b�Ć�T�t���ˮ�#�\0Uȁ�T��ide��e`� ��~��_�u�\"��\'mBD�����E�T�\0�Aכ��9���o?<��\'����ߟ�����w��Ź#q�ך�1\0\"�aCl��}��YY��\0*#�����.� 3섗e?T�r�\nU�1!�_�[��uU3�l����u��83��&�+��ژD4�\\��s�ݿ���=��G\0�8���} �T�;n�|�[�666\Z\"a5$HD\0�j�dd�щ!���9�[��/b�*\\c-0@B��ɿ��_~�������z��~_�\00ƒ1���]���H����uW�����\r\'h��^Nj-6�\Z0T_f5UacH�K�,� �e�r6(9�\nT��|.Y�1����*�ʿ�wT��~��u{� ��q�ϊ��q�[6�<z���m��S�{�-\0ؘ�5]��{D�\0��!8����~���&�BՎ^b����m��(%�$&���T��~��_������&ī��<kV�?����O~���܆�Mw��{�o��[Yvy^�Pw,��0����\0B��2D_be��O{\Z�G��,�QP� \n����O\rU%f��(������&m���>���o���/|���\\k��8)�=_�(�uBS�Ȫ*���CUT��|��D�听�\"�P]}\r;rѿp��8��G��L�W^%���yh||2�acd��9tN=_��i�QW�A��˺ݬד�vd�^�V6��wy�����L%\'Z�F�H�\ZVe����$,&��u��s?����:�^�^�6o�c��l�6@����3�M�Ib��t�ϲ\"��O7cWi���Х#��9W�\0���e�{�,�w��&����T�٠Һ���K��?Z�9��%����\r6��_Y��L<�i*��(lq]�\'��R�-�?����{�&��΅�O>�gik\n�С��g	�{�dc�5����-{�H�j|���ڲ���t�6i|����6@�-H(t�O�N}�^ۜ*]��\r[o��5�rx�6��J{NB0�\Z��i�����Q�nO��\0�/����wN�غm�F���Р-3ӻ\"��\0?���K���\\I�^�h�/	0\0�3�i\\`!  �@��!��ﯙ��[3�sq\0b(���!G�t�Ml���\'U��1&N���z˟]9~ę���J�ܺ&m��(^E�R������J�=���O����S����ŬV\r���C��@��Ĩ�rd�jz�u��m�B���>AU���l\"\n9T�b��C�Gm��HūHiݴQ���DQ\ZW�H\Z0��>��JPT4( �{��ٴ���5�����x��9�\n��U�%�e�M����e���0ҤK�-�\0�\Z���$H(z�:�>����4�w��j٤Ό(��kT���S&��\r$@E��z%�a?	.�\\T�2�����6=z�X�n��p�L�|�Cz��x�%���a���\0�+V�e�	�ŋ(#�F�el<wln|z��n7���q�6�@lB��bX�>\'�py�;$8W*�<뵉MȺG_<nmڱ�n��yAN[`\"s�ݗ�Ͼ��U(ck�\nqbw��*��g6m�j����f\\����	.t��� cI5��D�$x�!dY_D���N�\\�������x��\';]_I@��k���;_\Z�yU�c\r�<BS��!\0�P�q��D�|V��ru=�̰�j��R\'\Z\r�R.���\0�@\"A�S-�� �Pd�\"�D�MKr�]oL#Z�;|��|��`Q��jz�o]��KK+L�Ը4�.�U}aM1\nR��Ϟ|�!�r��j�N�JZ����*RaP��n NU��q���a_�wA]���X���ɹ�GNt��V�ز�BD�kϴf��4��\0\nm5�+�[�y�cc\"6φ�U�]}��~�G���f��֍S��D��\Z�T\0�A�ɓ+�\r���7��GAUGeN_2�\'��g�jT��\'�\\�/�h5)�YDH��J��]�	\0��R�lC\Z��Wܒ��8��J\0�	����_�׬U��?=������6��Eo\\^j,v�z��1�;�s�e\'%��\0-FUY�kIȨ\Z�g�=\"!kDIbb˅sN�L_Ӹ�w�\"p�ؖF�.��5����;�@��Ik&�U<�8Jb7�f��߾��y�ATs���\\�G���u͵��9��z3DUE��,�*T%�j�zþ��A�E���屍�w~�j:$���bX=�h��3\'ȅO�{m��Yg�b\rsl��l@(z�x՞$I��w�\0��SSke���on�޾��lh��\"��	JDU\ZB>(}���3����� wE��9o�7M��UM�L1@y/���H�ռ�7�z�\nX_��v���|��ccT<��������m����[[�����&����Y��+[���b�q�$8����eŠ��C\Z�\"/���A�����~^8�����w�7N�#S�h��1@�e��R:0gS�y�u\'u\Z��䭿}����FB��F��F|1���~�B;�ũغ��ʉ-ץqT�� \"-�f�/2�}Q8	N�+rO�ʠ?Ȳ�p�9���nk���%A C\nf��*���b�8T=���u�Uq!������7>�n�ќ\\�6���Ò\0xD����V�&q9��qJ���oH�4\'��J�g�No�eYQ���|��_����_Va�@�\rC�c�8��v����W�TD��8�d8ѱ��3���*NML��҆��y\"\"��x\'.�E6I�3]�خTU%�+$��ݠ�ow�Y^8�.�r���n�C[m�����>�Һ(��k���:�X��5n\0�D���J��+�IH�����������Ic\\�\\4Q�z�\"�\r������/Kv�2H$H�pKKK���yu�;��ڦ+��X��*��W�:\rC���w�궵Z��fB�q�Q���������h�����[\'��?r_k��ىJ\\+�=7訊J�_��+GcuA���z�n�?�{��N�M�������2ܿ#��0(��?\0���2v��H���6��Hdy%�A`@�s_���Aa���+�7���Og�xl�{�Q����S��}I�x�FET�p���z�~�����������7��l|���$���&�U���H U)u�R��D\n�\r��pb�PY�f��\0~��	\"�w�m��\\u����?=S�C�2\0��I�\\�ߗ�s��,�\n�<H׿�=��ݵ��&���.���^�R\'*��b�j�X��J�Yq(�_*�Y��(����\'�}�[���-[���n��{���W=�xt�wK�Fq�\\��bBp���e�N������wE��d� ���>��|����c-�1\n������ -=�Z\ZUo\"��aP��������;_V���ef���a�33���M�vT\'�έ�=�Qw�\'���{�T��\'U.\n��Lm�����x��jsl�\'�@��x����:����ɛ���ƽW��׹	\"T��V�3:8�_v\n�%&��O�跞<@U��\0?��-[��!˃w��.�|Xj�/�/d틧���^3nҤ\"�����J�/�u;;���1�m���sE�;�Kmw}�q$M]9�\0~�=��i�����`%C!��4��>�<X���>K.��}����<�V�3�\0G�ٔ\Z}�n٪��N����4��w䨬���pv!�Y2���J�Dq��w�ܶ�FQY\0f$�^R�o�b�`�f�9�L���ß����~�r�^	Bൕhn%��L4%�նn\0\0\0\0IEND�B`�','男','120402'),(2,'aaa','aaa','aaa','aaa','-','aaa'),(3,'aaa','aaa','aaa','aaa','-','aaa'),(4,'qweqe','qweqwe','qweqwe','weqwe','-','');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_id` varchar(50) NOT NULL COMMENT '登录ID',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`login_id`,`user_name`,`password`) values (1,'admin','小涛','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
