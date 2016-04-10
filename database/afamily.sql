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
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'æ—¥å¿—ID',
  `account` varchar(50) NOT NULL COMMENT 'ç™»å½•è´¦å·',
  `address` varchar(20) NOT NULL COMMENT 'IP',
  `port` int(10) NOT NULL COMMENT 'ç«¯å£',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ç™»å½•æ—¶é—´',
  `logout_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'æ³¨é”€æ—¶é—´',
  `flag_login` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'æ˜¯å¦åœ¨çº¿',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert  into `log`(`id`,`account`,`address`,`port`,`login_time`,`logout_time`,`flag_login`) values (1,'adminTest','1192.168.1.1',30000,'2016-04-04 15:44:41','2016-04-04 15:46:48',0),(2,'adminTest','1192.168.1.2',30000,'2016-04-04 15:45:36','2016-04-04 15:47:17',0),(3,'admin','1192.168.1.3',30000,'2016-04-04 15:46:29','2016-04-04 15:47:05',0),(5,'admin','/192.168.56.101',36703,'2016-04-04 16:13:22','2016-04-04 16:13:36',0);

/*Table structure for table `online` */

DROP TABLE IF EXISTS `online`;

CREATE TABLE `online` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'åºå·',
  `account` varchar(10) NOT NULL COMMENT 'è´¦å·',
  `address` varchar(20) DEFAULT NULL COMMENT 'IP',
  `port` int(10) DEFAULT NULL COMMENT 'ç«¯å£',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'åœ¨çº¿æ ‡è¯†',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `online` */

insert  into `online`(`id`,`account`,`address`,`port`,`flag`) values (1,'admin',NULL,NULL,0),(2,'admin2',NULL,NULL,0);

/*Table structure for table `student_user` */

DROP TABLE IF EXISTS `student_user`;

CREATE TABLE `student_user` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ç”¨æˆ·ID',
  `student_id` varchar(10) NOT NULL COMMENT 'å­¦å·',
  `password` varchar(50) NOT NULL COMMENT 'å¯†ç ',
  `name` varchar(50) NOT NULL COMMENT 'å§“å',
  `portrait` longblob NOT NULL COMMENT 'å¤´åƒ',
  `sex` varchar(2) NOT NULL DEFAULT '-' COMMENT 'æ€§åˆ«',
  `classes` varchar(10) NOT NULL COMMENT 'ç­çº§',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `student_user` */

insert  into `student_user`(`user_id`,`student_id`,`password`,`name`,`portrait`,`sex`,`classes`) values (0,'admin','21232f297a57a5a743894a0e4a801fc3','å°æ¶›å“ˆå“ˆå“ˆ','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0<\0\0\0;\0\0\0¨›~\0\0\0bKGD\0ÿ\0ÿ\0ÿ ½§“\0\0\0	pHYs\0\0Ä\0\0Ä•+\0\0\ZOIDAThmzi°]Wuæ·ÖŞg¸ó¤÷¤÷4Y²Ë6H±el6hbÜT\0“RqR]„JB’î„N7\r„.Rm tS¡ºtB“t*Æ@Œİ´ÁLlcË–¬YzšŞxÇsÎŞ{­şqîÕ“qÎ{?nİ{†ï¬ñ[ßŞôÎ{¿ó®7İ03ÕŒDU%\"U@\0\nU\0\0ÀJe^z( H l@¤ü•™˜àA\n\"¨‚\0ˆb‚¬\"O JÙò*K«Oxyn®ı¹oş3ıÓ±N½Y;ÔU€ˆÈ(@€@µàá#U  \0J/‡[D\0Á‰,\\<}öüÒùlL3³k“kÖmŸ5‰\"6Ä¼z‡ˆÀ„Tµ¢ˆ€*S\r¨†P!Š˜_ş”ƒ¶UOvK<ª\nšlxxˆ_úJÒ—ŞehÅ™SÇŸûÑC?¾ÿ§şTweA‡ÎªFq<½åÊ-{_·u÷î«o¹qãÎÍñ*pŠyBCÔ©DÁ\nDìËpoHéñÅp Ëª¾ƒ†W¨\\nôïbIÅ±ûÿ×üƒ÷WÄqEqÇíöŠ1Æ9Ÿ$‰H\0à½7ÆxbròW>ü…ÛıMÖšò&1@E•&j¨\Zód/†ç:\\\ZX \0¡Œ\\ <‘T	\nÀÈ¿à¬±‹ÏÔÎ<28ùÜû>ú×]‡$‰­Ò4©V*ó‹Qf²,BğŞ;W0U¹jß¿÷ŸXsıDd\0Ã°@¤j¦¢Î¬jUÔTy”Ì* ÖQÔ›Ë\"€ˆ‘)M]AnP]øùÌ‹—®5Qô¡¿~ºSÈôô´s>„PIS\"JÓ”™+•TBpÎfìâb¿R©„àCĞ§}øşß¾ûWß|Mú¾OĞëÀ£h«¦BHŒéÍU€Ãôªv5.¡T\\gÀ&Uˆ(^>±á©O\'n9²Æ´Öö?|èÄÌÌ¬wE–e•J¥R­ªª\0JÓ´ÛéZc*•´İéNŒ³+Š•v;£KmY:‘}ş¹îÍö}+¬5ª“\0ˆ–™\'€XDˆº€¡¡EãK Ë4äQRÀˆ`V_†LÑ]{øï§º£zU<[›¤vaÉO¡İé&ql˜+i2ÈrÕëµ$–¼Wè`%q”åE5?µvm»ÓhVî§ßì^8ÿ›ÿTİ°-S$\"c„E è+âQZ{\Z˜\0f½„˜\0.\r¬\0­öçvıüó;\ZY¥>fq¥5ÖÄ­©¹•¼R­ÎÏÏ‡Ò4`˜óÁ £V³Ñëö¬1QÇI’®^«.¯¬ÔjõÂ¹,Ë÷O%&2eP„¹§ŸùÍ|îT—˜ºª+À<s[ÑcÊò?”qR¿T}/!&”pÕ…vùÛ©õ3ÙÂòIQmÂVš\ZÂ·9´´´\\…µÆZ ˆò\"Šcakç¬á,Ë¢(ZX\\c¦~¿·±^¿zW3Šbc\"gËı{ßçN«§ˆ½b\0´™r Ë´Ì”1yó¨}ÈĞĞÃ¨ á\'P¹ppçÂ\'Öoé9ˆÛ¤ÊQÊ6ÒàŸ<ÿ“÷n›˜¬%õz]DTu¥İ	!XfB·Ó‘ş c¢,4M¨v:ˆÿ[¦“J5bÇl+”¬sò/ß{öÈ>°Ì‚Ó\n\07²2\0”FˆGïâşü¶³Ô\"Y8øÏqEM4ºÈ}îà¶æßóÙ?~×M[¦Œán¯·²Òôûİ~ii¹ÓífY¼\"L¢ş Û0^ÿÈm›®İ6Qk´lœ03aøç{_úP»³Ò%ú…Ş1Œ…\'çıÁ>\"Ö²E“¯´tü¶GşÃš©õıó/ZQÚˆ’\nEbKÌ şîÃ?i´&oÜ»ƒÙt»½ï~ï‡ûÒ÷zÎcËr™çY\'ÕjµÛéØ(’î|ÕÆ·]?İ¬EÆDÄÔï¬xçœËÅ{U!bUULíjüá—CZ]Ö!¶V \nÃ¢—ª¤5£?ö`²ìâqbÃi½¤Ä†mDÌ\0nÚ¿·^KIœYÕ„õk\ZÓëòsç{½î\rW®O“x¢bŸ¼à$ŸÑİ¯ÙùKW_1Û06FU]QDI@ Ş+ *\"b¹x¨÷/&wı.\0/`\ZR	,ƒKzÆ¢É @ÀÆ|SVhœÖ\0°‰9mD•\Z™X%€¸%’uƒwPít{Ÿûö¡å••~¯ûÁ;^u÷w«ÊR·øğßüììr÷ıo}Õ]¯ŞÅ±„ \"ªÁûP>Ê»<Šb• E®\"JdØ°jøşÿÄÖpí\r@!\n\0\nØQÆ‚§LAã‡LÜR°cÖFÁ&¦¨1a+M2Ä[°Qç$8\0YQ|êëO<öÓŸ]»qòãï½ó¶›ö°‰¼¸bÃ¹3‹+3³³ãÓ¤è…•à\nÕ\\UÅJZ©\rú}6Ù\0ªj\rû ƒï|¶²ë«\0Ä\0nØ],Ví«\0±‹‡bìØ}DLê½‡ˆLl’\Z±Q_ˆxf†øà\néäş¾Îÿñ\'ïŞ{Í–F5!™¨tÛköî|äéÃ¥¢íDœÄ‘‰„˜ÙXk¬‰5Ş…à(”ˆˆHÏ(û‡øú».§s\0—†-mNZRÛ¿ù\0ä\n2BqµÖû¨õÄ#ÏxÀÎİ¯¸~÷kR«÷k·ï³wİ\0¾P7\0”¤ ¶\0Ş°oë½_KÍ­€D c‰T=³af\0qZ¨Û^ŠâD¼\Z2„¸W_q¥õUĞ—M—ul µrŒ5 ÆÆúÑ½Ÿ¹ï™·Ïw{Y/÷Æ|cÿÕ›¿ôñßjÕRµÌøŒŒåÚZS>CÑkñÊW?òo=ø&‚%\0†É]VÅŒµÆÆªjâXóL ª¥mY»ËòâÍ5·½ÄÒD¤PR%¢2)W_>XRb#QãÄÅp÷­×|à¶-,“ä}Ç\'ÎtV2GY;$ÌÄ¤¦ŒEm¬?p*;ñìñˆOÕ«ÓÓ­é‰ñMëİ{Şşz¶`R§ª!0Ó°JF»8DBl«Şç=‚ˆ˜‡şJ®\Z‚V%.É4CÙ{]<@E\0ª´&nİ<\\ÁQ7È»ËİÅs3ëU-´Ö0I\0Ä”ÔŸ~îØ›îù°÷™«ÕJµZ{ë«¯úÄî¬W+*^A\"êƒÀÆ˜(‘J—Â+lñA *gÓî™çkŸíû\0 ‚yÿıçÅbT›V‘uıõ\'î§1ÇµêšÙ¨6AÌ>ë«wâWô‰\r+Á\'•šMj`‘¼¿R\rK¿¼síöí¸i÷º\r­ÚJ?öÄâCşlïÖñÉ5kA ¢T˜(ˆzW¨x\0D,â•(x¯\Zhè	AT•Ò”w¾Àšh˜ˆÃ™•ª À”®aKllmÜ¤­ŞÒ…S§Ït3©UÒ$¿@!³†mœ‘ø‚	Á®(²îŠ½kvn„ÒYõE‘g?}áâÏÌıÕÿ~ä#¿3YoM•(‰]&G”[kB0€`mäœ.\r«‡;ôÏ#î‹áˆUˆÃS½µl-‰±I5‰ãîÂÙ\'.ûûÏ=şüám[·~ö¿~êøŸ«6NˆMğ€HpEæzË€S”Ö£J“Õ¹¬»Ï&×nŸ|øÉ³?~òğm·Ş@0lLY§jØ8€™E^‚’ˆ•¹¬Î-W§\04¹4°ÈğõÊ®©­˜8a‹øãİxöÚ×·•ò\"?ğìÏî¹ç7§n|wÏqÑo³1Ì€xŸu´èEµqT×¬ ¹4ğ^P_7uÅÕÍ‰éÛ^½mÏuDDÌÄ–3qY’‡©Å&¶–yô%\r\'Cñ~m”~¸L2\nëM­¼î şì³Ï>rTEw¡I<su¿ŸGi vEzKÜš}òxÿş½çû³v×]ËÓ7>¿Ü[Yl­Û2¶ns«Y!\'b\"\"bÃÄ†ˆT¤t—ˆ€Ë®¡#«\0UÈ„T‡ ideŒŞe`š ÅÆ~ñË_éu»\"’€\'mBDÍõ»œËEÔTê\0ŠA×›ê×9¿ùÕo?<·ô\'ıè¿ÿıßŸİúÊÉŞw¡‡Å¹#q¥×šÌ1\0\"†aClÙï}ğŞYYÓà\0*#‰‹†ú….ŸÂ 3ì„—e?Tğrı\nU°1!ª_Ë[¯ÛuU3ÈlÄ×îÚuÃß83³Á&©+ÛÈÚ˜D4ï\\Ìãs‹İ¿ı›¯=üıG\0œ8úÂß} ®Tª;ní|Ş[¶666\Z\"a5$HD\0”j„ddÄÑ‰!ïÉÒ9Œ[‚‡/b‚*\\c-0@B öÉ¿øò_~æâ±÷ÿ«·Üzûƒ~_‚\00Æ’1¾ß°]ø©ƒH™š¦ÖuW–Œµµñ\r\'h¢Ş^Nj-6£\Z0T_f5UacHÂKÄ,• ½eÙr6(9“\nT´¤|.YÀ1ÃÜëö*ÕÊ¿ıwTÒó~¿Ÿu{Ù ó¶Áq‰ÏŠ¬¿qÏ[6Ì<zôğmŠÍSã¯{í-\0Ø˜¤5]´Ä{D¿\0²å!8Ñà½÷£~éŠ &ëBÕ^bô£àm­ï(%®$&ï­çÊT—ò~ßç¹_™›š¨ÅÕ&Ä«Ëó<kV§?ùçúÅO~úÌÂÜ†™MwşÚ{×oÙÚ[Yvy^ÃPw,ÉÂ0½´¤×\0Böà2D_be¢’O{\Z†G¸ä,ÒQPæ \n€™‹öO\rU%fÉƒ(¶‹‡½êªí&mˆˆñ>Ïç×oÜıñ/|¡³¼\\kµ¢8)ú=_¡(ÎuBS•Èª*ğ‹CUTµì|ÃñDÁå¬ª\"ªP]}\r;rÑ¿p„ˆ8ªÔGşŸLíW^%‡§yh||2Ÿacdˆ9tN=_ß§iµQW•A·ãËºİ¬×“ÅvdŒ^æV6«§wy–õÅûÒL%\'ZÍF˜Hã\ZVe±—¿½$,&©™u­Ós?ô•Í×:İ^è^›6oÛc£˜lâ²6@ÆØüÌ3ıM×Ib¢¨t´Ï²\"ËçO7cWiƒÍĞ¥#¹Á9W¸\0Šë•ÄeÈ{İ,ëw“Ä&‘ÕËÎT€Ù ÒºôêÁKˆÏ?Z‹9ª¯%¶ñø†\r6éÎ_YÌÇL<½i*Š¦(lq]‚\'¢¨R«-Í?òÔÆÍ{Ê&æœóÎ…àO>½gik\nªĞ¡ÏËg	¨{ádcã5¾»ĞÎ-{›HŠj|ñÂ±Ú²×Êğt“6i|“Š®‚6@ƒ-H(tÎOûN}÷^Ûœ*]¦\r[oô—5ïrxÇ6æµ×J{NB0Ö\Z¥±i¸ÿÄÂQ³nO”Ö\0ô/¤ÅçwNĞØºmÆF ªĞ -3Ó»\"‰¨\0?ôàó½¾K÷ïß\\Iã^¯hÖ/	0\0À3×i\\`!  ‰@÷!Ğæ±ï¯™š[3êsq\0b(“ˆ‰!GÕtëMl¢ÎÉ\'UÄç™1&N«“•zËŸ]9~Ä™ºìºJÔÜº&mŒ™(^E¬R†µª‰ÒJ¥=–ÙÎO­µªŞSš¦ÑÅÅ¬V\r¼ºúCñş@¬°Ä¨ÖrdÙjzuŒm¸B‹®ú>AUƒÏûl\"\n9T‚bùàCƒGm”‚HÅ«Hiİ´Q™œ©DQ\ZWêH\Z0±º>ŠJPT4( Á{†®Ù´£ßë5ÇÆ÷íİxâÄ9Î\nŠ­U…%²eªM†ÖÆe¦¼0Ò¤KÜ-¬\0“\Zœú‚$H(zğ™:Ó>üÔóÏ4ê©w®ÑjÙ¤ÎŒ(­•kTŒšS&®‚\r$@E êz%âa?	.¸\\Tƒ2ˆãæôÛ6=zÎX³nª¾pêL™|¢CzšîxÍ%©ß¯aµ°€\0Ê+V¡e‘	Å‹(#„F³el<wln|z¬Ûn7š°õq›6ˆ@lBê¥èbX•>\'¶pyÙ;$8W*â‹<ëµ‰MÈºG_<nmÚ±½nŠÓyAN[`\"síİ—ÒÏ¾¼ÚU(ck¡\nqbw©¯*¤Úg6m×j»ŞÇÕf\\­ƒ˜ˆ	.tÏÄÄ cI5ø¬D¬$xñ!dY_D«‰´N\\Øşª½×îÚxú…\';]_I@Ùà¢kŞÆÓ;_\ZyUêc\rï<BS¼’!\0ÌPËq…¢Dò|VŸŞru=¸Ì°j¸R\'\Z\rØR.‚¨¨\0@\"A½S-¥Ñ Pdƒ\"ËD§MKrÇ]oL#Z™;|òô|á´Ù`Q€ãjzóo]ŞÕKK+LÔ¸4Ò.U}aM1\nR¶ÉÏ|Â!½rçöjµNJZ§Ò¥æ*RaP˜´n NU‘—q¢ªŠa_çƒwA]³XóÅÜÉ¹£GNtº¾VåØ²÷BDékÏ´f½¾4ƒ‰\0\nm5+”[³y÷cc\"6Ï†ŒUŸ]}ÍÕ~ïG÷ıûfÍøÖSõÚD³™\Z›T\0¸AÀÉ“+½\r“ö–7¿‘GAUGeN_2ù\'•ê¡gŸjT“Ó\'\\˜/ h5)‰YDHöüJº÷]—	\0–ÄR²lC\Z¦ªWÜ’ÿè±8­ÚJ\0³	°»ü–_Ş×¬Uÿï?=óüù…çÇ6¯Eo\\^j,v¦zŞ“1é;®s½e\'%Ö\0-FUYîkIÈ¨\ZÛgŸ=\"!kDIbbË…sNÔL_Ó¸õwÁ\"Â†pÉØ–Fãº.çµ5õëŞÒ;ğ@­Ik&ŠU<”8Jb7¾fš¦ß¾ïñyÔATsîæÎ\\ªG‘µ¼uÍµ¯Ü9Âêz3DUE ²,‡*T%¸j£zÃ¾í½•ÅA–EåÎå±­w~Šj:$ª«õbX=ÌhğÉ3\'È…O¯{móèYg¡b\rslâŠÏl@(z¯xÕ$I¾øwÏ\0ø×SSke•ÛÏonÌŞ¾£Şlhğˆ\"ÑÕ	JDU\ZB>(}ïÔå¹3’÷úş wEÎ9oÆ7MÜóUMê¸L1@y/¾„˜HŒÕ¼7£zË\nX_÷vÁÙò|ğ‚ccT<³¬º«öìºçm»¦×Ä[[“‘µ‘µ&‰–÷®Yû†+[ºúb˜q¢$8œ×àÅeÅ ×ôC\ZŠ\"/Ôõ‹A§×ï÷ƒ~^8çÍìŞñwÿ7Në#S‚h¨ë1@€e†µR:0gSáyÑu\'u\Zøúä­¿}ş¾ÿ²FBµ¹F¡ÄF|1³¯¸~ÿB;ñ¹Å©Øºé¤ûÊ‰-×¥qTîå \"-Åf´/2ï}Q8	Nƒ+rOùÊ ?È²¢pÎ9”“«nkİù§%A C\nfˆˆ*—Ëôb¯8T=Šò˜µu€Uq!³¤ˆŠÅö7>´n²Ñœ\\Ï6–àÄÃ’\0xDÇˆÁõVœ&q9’°qJÄÃáoH’4\'®ÈJ“gİNoeYQ¸Âù|î£É_ıóÚî_Vaå@£\rCÍcû8Óáv±‘¨²WñTD¬Ä8Éd8Ñ±Æí3Å¿Ô*NML­Ò†ˆ÷y\"\"¨ˆx\'.óE6IØ3]¶Ø®TU%ˆ+$¸àİ ßowºY^8¼. rõ›ÇnÿC[m¡œ¯‡Ò>•Òº(´Ôk„¶:´XœÍ5n\0ÃD™ô»J«Û+”IH§½ğÀ½³şÈÚéõIc\\¥\\4Qñ¹z§\"Ş\r àˆ˜˜/Kv•2H$Hğ®pKKK½şÀyuÁ;§ƒÚ¦+îşXºñ*ŒÜW²:\rC‡ÑòwÉê¶µZÌÏfBÌqÌQ¼—ĞõŞ•‚ähéùÀ‘¹[\'‹Ÿ?r_kññÙ‰J\\+§=7è¨ŠJï_ÒÊ+GcuA¼ëözİn¯?È{™÷NµMîüàÄî±2Ü¿#®¥0(ö?\0ªØÚ2vø»H‘‹µ6®ÙHdy%€A`@s_ùŞáAaßıÎ+â7¼ãàOgxlº{®Q˜¼SÕà}IÉx´FETµp…ˆôzı~å¾Ó÷¡±¹±ãêÉ7Ô×l|öÔÜ$•ëó&ˆUª¥ôH U)u¥R–²D\nÀ\r‚­pbÕPYîf¿ñ…ƒ\0~ıú	\"Ûwóm§¶\\uêé‡æÏ?=SëC‘2\0ˆ»Iá\\¿ß—às§ƒ,Ë\n¿<H×¿ö=µ™İµæÒ&ˆŒç.œŸ^¢R\'*—ƒbÄjˆXˆ¡JÃYq(ª_*ÿYÆÓ(ò¢À³\'Î}ú[Ê¶®-[®±Ön˜{ûÜñW=òxtæ±wKÃFqìœ\\á‚øbBpÁ‘ùeŸN®Ÿ½ùíãwEµd¢ À¦>ø©|Íşİï¾c-1\n¯²”µ‡¡ -=†Z\ZUo\"ÈæaP±†éÿüøÔ×;_V·¼°ef«©¤a33×ëõMÛvT\'¦Î­ß=äQwì\'±´‡{éTœ\'U.\nßÉLmÛõëéöxíöjsl¨\'å@½Şxıæ×:ø¼úÊÉ›¯»òÆ½W®«×¹	\"Tª†VÕ3:8ß_v\nÀ%&©ÚOãè·<@Uİâ\0?øÄ-[§›!Ëƒwâ½÷.„|Xj·/Î/dí‹§ü¢íœ^3nÒ¤\"ªÎåÎÉJß/·uÍ¾;¦öŞ1»m·ó€sE‰;ËKmw}êq$M]9õ\0~ç=·¼iÿ•†Ëí`%C!€Ê4®>³<X›šá>K.„}å¹ïüô<˜VÊ3Í\0G–Ù”\Z}¹nÙª××NŒ¯Û4ùêwä¨¬¹…pv!œY2çÚÑJ—DqÕÍwíÜ¶ÕFQY\0f$œ^RÿoØb™`Æf¹9ÃLŸÿêÃŸüïá~“rÑ^	Bàµ•hn%ûÿL4%ùÕ¶n\0\0\0\0IEND®B`‚','ç”·','120402'),(2,'aaa','aaa','aaa','aaa','-','aaa'),(3,'aaa','aaa','aaa','aaa','-','aaa'),(4,'qweqe','qweqwe','qweqwe','weqwe','-','');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT COMMENT 'ç”¨æˆ·ID',
  `login_id` varchar(50) NOT NULL COMMENT 'ç™»å½•ID',
  `user_name` varchar(50) NOT NULL COMMENT 'ç”¨æˆ·å',
  `password` varchar(50) NOT NULL COMMENT 'å¯†ç ',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`login_id`,`user_name`,`password`) values (1,'admin','å°æ¶›','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
