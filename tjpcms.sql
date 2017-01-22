/*
Navicat MySQL Data Transfer

Source Server         : cxyz_tjp
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : db_alitjp

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2017-01-11 18:05:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tjpcms_cfg`
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_cfg`;
CREATE TABLE `tjpcms_cfg` (
  `id` int(11) NOT NULL auto_increment,
  `py` varchar(20) NOT NULL,
  `mc` varchar(50) NOT NULL,
  `zdb` varchar(50) default NULL,
  `val` varchar(200) default NULL,
  `kbj` varchar(1) NOT NULL default '0',
  `bz` varchar(100) default NULL,
  `rq` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `gx` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tjpcms_cfg
-- ----------------------------
INSERT INTO `tjpcms_cfg` VALUES ('18', 'LMNRJTH', '栏目内容静态化', '19', '动态化', '0', null, '2016-08-25 16:19:55', '2016-08-25 16:19:55');
INSERT INTO `tjpcms_cfg` VALUES ('16', 'SYJTH', '首页静态化', '19', '动态化', '0', null, '2016-08-10 10:25:20', '2016-08-10 10:25:20');
INSERT INTO `tjpcms_cfg` VALUES ('17', 'LMJTH', '栏目静态化', '19', '动态化', '0', null, '2016-08-18 09:57:44', '2017-01-11 18:04:49');
INSERT INTO `tjpcms_cfg` VALUES ('14', 'WZSFJTH', '网站静态化', '19', '动态化', '0', null, '2016-07-19 11:28:53', '2016-07-19 11:30:14');
INSERT INTO `tjpcms_cfg` VALUES ('23', 'SYXZCS', '首页下载次数', '', '0', '0', null, '2016-11-09 14:48:10', '2016-11-09 14:48:10');
INSERT INTO `tjpcms_cfg` VALUES ('24', 'BB', '版本', '', '3.0.161109', '0', null, '2016-11-09 15:02:43', '2016-11-09 15:02:43');

-- ----------------------------
-- Table structure for `tjpcms_dashi`
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_dashi`;
CREATE TABLE `tjpcms_dashi` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `cid` int(11) NOT NULL COMMENT '栏目id',
  `title` varchar(100) NOT NULL,
  `nr` mediumtext NOT NULL,
  `cs` int(11) NOT NULL default '0',
  `rq` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `gx` varchar(20) NOT NULL,
  `delf` int(11) NOT NULL default '0' COMMENT '删除标记（0-未删除，1-已删除）',
  `px` int(11) unsigned NOT NULL default '1',
  `url` varchar(50) default NULL,
  `url_s` varchar(50) default NULL,
  `url_d` varchar(50) default NULL,
  `nian` varchar(4) NOT NULL COMMENT '具体哪一年',
  `lcb` varchar(20) NOT NULL COMMENT '年内具体时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=306 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tjpcms_dashi
-- ----------------------------
INSERT INTO `tjpcms_dashi` VALUES ('199', '167', '测试1', '<p>22</p>', '0', '2017-01-06 16:25:42', '2017-01-09 16:54:14', '1', '1', '/alitjp/dashi_detail.dhtml?id=199', null, 'dashi_detail', '2017', '1月1日');
INSERT INTO `tjpcms_dashi` VALUES ('299', '167', '测试2016', '<p>33</p>', '0', '2017-01-06 16:26:50', '2017-01-09 16:54:07', '1', '2', '/alitjp/dashi_detail.dhtml?id=299', null, 'dashi_detail', '2016', '1月1日');
INSERT INTO `tjpcms_dashi` VALUES ('300', '167', '111', '<p>222</p>', '0', '2017-01-06 17:19:49', '2017-01-09 16:53:53', '1', '45', '/alitjp/dashi_detail.dhtml?id=300', null, 'dashi_detail', '2015', '222333');
INSERT INTO `tjpcms_dashi` VALUES ('161', '167', '完成第一个基于jeecms的网站二次开发', '<p style=\"line-height: 2.5em; text-indent: 2em;\"><span style=\"font-size: 20px; font-family: 仿宋, FangSong;\">其实在这个时间点之前一直处于遍地是php的cms但那时还玩不转php，java类cms完全是非主流但自己又只习惯java来开发尴尬境地。这个点之前自己还下过dedecms的视频学习，什么老李dede888仿站，看了半天似懂非懂的，后来想还是找找java的cms吧，网上一圈搜索也就这个jeecms勉强能用吧，算是网上有点诚意的产品，不过商用收费的啦，而且用过之后发现这玩意效率奇低，就一最简单的新闻类cms，启动一下等好几分钟，追了一下代码，我滴妈，套了不知道多少层，还是用的freemarker模板，什么shiro权限控制，我用jeecms实际开发了这个网站后，对它已经全无好感了，二开特别费劲，一个登陆后自动跳转的功能就搞了我半天，一个列表页字段查询的功能追了好久代码才发现系统其实自带这功能，但是文档里不说。只不过聊胜于无，有总比没有好，就这么也用了一段时间，在熟悉的过程中也逐渐总结出来cms最常用的功能是什么，有哪些可以改进的，可以说是tjpcms的一个启蒙。</span></p>', '0', '2017-01-06 15:25:26', '2017-01-10 10:38:50', '0', '44', '/alitjp/dashi_detail.dhtml?id=161', '/alitjp/static/neirong/dashi_detail/161.html', 'dashi_detail', '2015', '5月7号');
INSERT INTO `tjpcms_dashi` VALUES ('301', '167', '购买tjpcms.com域名', '<p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 20px;\">那么在各种cms的制作过程中，我逐渐萌发了自己做一个cms的想法，尤其是这一年的6月底7月份，利用业余时间完成了对一个ecshop项目的二次开发，那时的节奏就是工作日下班后开始弄ecshop，正常到10点左右，不停的各种尝试，然后到了周末反而放假了，周末事情比平时还多。其实ecshop也和cms差不多，各种增删改查，所以这个弄完之后，更加觉得这所谓cms、ERP、shop、crm不都差不多嘛，刨去各自业务的部分，很大一块都是crud，所以对于tjpcms这个概念也是跃跃欲试。<span style=\"font-family: 仿宋, FangSong; text-indent: 2em;\">到了年底，觉得先把域名买下来吧，因为看tjpcms是可以买的，6位的com域名也能接受，就买了,其实我更中意jpcms的，可惜没了，只好退而求其次了。</span></span></p>', '0', '2017-01-10 10:55:17', '2017-01-10 15:06:50', '0', '45', '/alitjp/dashi_detail.dhtml?id=301', '/alitjp/static/neirong/dashi_detail/301.html', 'dashi_detail', '2015', '12月20日');
INSERT INTO `tjpcms_dashi` VALUES ('302', '167', 'tjpcms雏形诞生', '<p style=\"text-indent: 2em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">虽然注册了域名，但是也就一直搁置在那了，毕竟从想法到付诸实践还是需要一定的契机。后来借着开发一个cms网站的时机，我就边开发tjpcms边开发这个网站，将以往后台逐个开发的部分都转用tjpcms来配置，所以那时每当有个新的配置需求，就立马开始开发，反正就是要各种需求都能配置出来，因为是实际要用的网站，所以实战性还是比较强的。断断续续开发了一两个月的时间，大致有了一个雏形，也积累了很多需要改进的地方，来不及完善的就先都记下来了，后面有时间了再继续完善。</span></p><p style=\"text-indent: 2em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">这个雏形呢也是耗费了我不少精力，因为希望能做出一个精品。其中静态化的功能，我还是比较满意的，参考了网上的资料，使用jsp作为模板就可以一键全站或局部静态化了，这样也不需要开发者额外学习其他模板技术，算是比较实用的功能。缺点就是虽然支持一个普通的cms网站是足够了，要完善的地方还不少，也需要更多的应用来收集需求继续改善。</span></p>', '0', '2017-01-10 14:17:19', '2017-01-10 15:06:55', '0', '46', '/alitjp/dashi_detail.dhtml?id=302', '/alitjp/static/neirong/dashi_detail/302.html', 'dashi_detail', '2016', '7月左右');
INSERT INTO `tjpcms_dashi` VALUES ('303', '167', '为tjpcms购买了云服务器', '<p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">我选择了阿里云的ecs，其实也没太多的选择，毕竟阿里云的名气比较大，我的域名也是在阿里买的，双11又有活动，就一下决心买了吧。3年1500多，1核1M内存1M带宽，最低的配置，就没有更低的了，本来还有点担心这样的配置会不会官网都跑步起来，后来发现还好，不过这是后话了。<br/></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">要说这价格也不算太高了，但是和php的比起来还是贵多了，毕竟这买的是一个云服务器，php的一般只需要买个服务器空间就行了，直接ftp管理，我买的这个等于是个虚拟机，好处就是可以远程桌面连接，自行安装需要的运行环境。php的那种服务器空间是环境已经预装好的，等于是分配了硬盘的一块空间给你，印象中普通的一个月也就20块钱左右吧，要是像我这样直接买3年的估计更便宜。</span></p>', '0', '2017-01-10 14:36:04', '2017-01-10 14:48:04', '0', '48', '/alitjp/dashi_detail.dhtml?id=303', '/alitjp/static/neirong/dashi_detail/303.html', 'dashi_detail', '2016', '双11');
INSERT INTO `tjpcms_dashi` VALUES ('304', '167', 'tjp先行上线', '<p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">先做了一个基础的官网，当然也是基于tjpcms的。其实主要是想测试一下买的这个服务器到底行不行，这是当时阿里云能买到的最便宜的，我心里也很没底，根据我以前的经验，曾经买过一个一年1500左右的阿里云ecs，当时就跑了jeecms的一个网站，不开静态化卡爆了，普通一个网页10秒起。<br/></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">我这个ecs一年也就500多，还是有点虚啊，想着不行就全站静态化呗，结果一试，有点出乎意料，开全站动态化毫无压力，速度飞起，而且用的畅言也没影响速度嘛，还不错。但是我感觉阿里云的一个通病好像是，这ecs用了一段时间后自己就不行了，大概3个星期到一个月吧，自行就挂掉了，得强制重启ecs，有点坑，不知道是不是因为我买的是比较便宜的？</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">这次的上线呢我定性为先行上线，因为主体功能还有不少没有完成，尤其是因为用了畅言了，这个账号系统就有点头疼了，有了畅言评论是方便了八辈子去了，但这玩意是个免费的，时不时还搞点调整什么的，单点登录的功能也不知道现在能不能用了。没有账号系统，有不少相关的功能暂时就没法开发。因此下一步打算先把除了账号系统外的其他东西先上线了。</span></p>', '0', '2017-01-10 14:54:26', '2017-01-10 15:01:21', '0', '49', '/alitjp/dashi_detail.dhtml?id=304', '/alitjp/static/neirong/dashi_detail/304.html', 'dashi_detail', '2016', '11月24日');
INSERT INTO `tjpcms_dashi` VALUES ('305', '167', 'tjpcms正式上线', '<p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">时间一过两个月啊，最近有点心事重重、颓废，一直不长肉的节奏啊，16年刷刷的就过去了，md感觉不顺，不过想想也算了，什么都顺那还是生活吗。经过一番梳理后，tjpcms正式上线，算不上精心，也算得上用心了。对付普通的cms类网站，那效果绝对刷刷的，国产Java类cms良心之作啊，最懂。。。<br/></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 22px; font-family: 仿宋, FangSong;\">后面也有不少事情，估计顺利的话17年上半年能再出个版本，必须要继续给个力啊！17年，加紧努力。</span></p>', '0', '2017-01-11 17:17:40', '2017-01-11 17:29:36', '0', '50', '/alitjp/dashi_detail.dhtml?id=305', '/alitjp/static/neirong/dashi_detail/305.html', 'dashi_detail', '2017', '1月11日');

-- ----------------------------
-- Table structure for `tjpcms_dhwb`
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_dhwb`;
CREATE TABLE `tjpcms_dhwb` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `cid` int(11) NOT NULL COMMENT '栏目id',
  `title` varchar(100) NOT NULL,
  `rq` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `gx` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tjpcms_dhwb
-- ----------------------------
INSERT INTO `tjpcms_dhwb` VALUES ('128', '161', '苏ICP备16055273号', '2016-11-04 15:37:05', '2016-11-18 09:21:38');

-- ----------------------------
-- Table structure for `tjpcms_fwb`
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_fwb`;
CREATE TABLE `tjpcms_fwb` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `cid` int(11) NOT NULL COMMENT '栏目id',
  `title` varchar(100) NOT NULL,
  `nr` mediumtext NOT NULL,
  `zy` varchar(300) default NULL COMMENT '摘要',
  `cs` int(11) NOT NULL default '0',
  `bz` varchar(100) default NULL,
  `rq` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `gx` varchar(30) NOT NULL,
  `url` varchar(100) default NULL,
  `url_s` varchar(100) default NULL,
  `url_d` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tjpcms_fwb
-- ----------------------------
INSERT INTO `tjpcms_fwb` VALUES ('121', '149', '作者简介', '<p style=\"text-indent: 2em; line-height: 2em; margin-bottom: 15px;\"><span style=\"font-size: 18px; font-family: 幼圆, YouYuan;\">男，三十小几，<span style=\"font-family: 幼圆, YouYuan; font-size: 18px; text-indent: 32px;\">扬州人氏</span>，大学前一路坦荡、是好学生好榜样，大学时磕磕碰碰、虚度了不少光阴，工作后往复辗转、事业总不得起色，<span style=\"font-family: 幼圆, YouYuan; font-size: 18px; text-indent: 32px;\">苦笑</span>人生运势高开低走，幸得和睦家庭最视珍贵，有爱心中梦想依旧。</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-size: 18px; font-family: 幼圆, YouYuan;\">近些年与cms打了不少交道，逐渐有了自己写个cms的想法并付诸了实践，希望能够给寻找Java类cms的开发者们一个更好的选择，实践咱的广告语：tjpcms - 最懂你的cms。支持我的话，首页上给我</span><a href=\"http://www.tjpcms.com\" target=\"_self\" title=\"去赞一个\" style=\"text-decoration: underline; font-size: 18px; font-family: 幼圆, YouYuan;\"><span style=\"text-decoration: underline; font-size: 18px; font-family: 幼圆, YouYuan;\">赞一个呗！</span></a></p><p style=\"text-indent: 2em; text-align: right;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\">2016-11-16 blue</span><span style=\"font-size: 18px; font-family: 黑体, SimHei;\"><br/></span></p>', '', '131', null, '2016-11-14 17:17:43', '2016-11-22 10:31:19', '/alitjp/jianjie.dhtml?id=121', '/alitjp/static/neirong/jianjie/121.html', 'jianjie');
INSERT INTO `tjpcms_fwb` VALUES ('122', '147', '视频教程', '<p style=\"text-align: center;\"><span style=\"font-family: 仿宋, FangSong; font-size: 24px;\"><br/></span></p><p style=\"text-align: center; line-height: 3em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 24px;\">首页点赞10W+，分享2W+开启</span></p><p style=\"text-align: center; line-height: 3em;\"><a href=\"http://www.tjpcms.com\" target=\"_blank\" title=\"去首页点赞、分享\" style=\"text-decoration: underline; font-size: 18px; font-family: 仿宋, FangSong;\"><span style=\"font-size: 18px; font-family: 仿宋, FangSong;\">去首页点赞、分享~</span></a></p><p><br/></p>', '', '198', null, '2016-11-16 09:00:19', '2016-11-17 17:26:11', '/alitjp/spjc.dhtml?id=122', '/alitjp/static/neirong/spjc/122.html', 'spjc');
INSERT INTO `tjpcms_fwb` VALUES ('123', '157', '留言', '<p style=\"text-indent: 2em;\"><span style=\"font-size: 18px; font-family: 幼圆, YouYuan;\">欢迎鼓励、吐槽作者！有任何问题也可以QQ或者加群联系作者。</span></p><p style=\"text-indent: 2em;\"><span style=\"font-size: 18px; font-family: 幼圆, YouYuan;\"><br/></span></p>', '', '0', null, '2016-11-22 14:50:38', '2016-11-22 18:10:13', '/alitjp/liuyan.dhtml?id=123', '/alitjp/static/neirong/liuyan/123.html', 'liuyan');
INSERT INTO `tjpcms_fwb` VALUES ('124', '162', '申请友链', '<p style=\"text-indent: 2em;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\">目前打算先宣传宣传自己，增加百度收录和排名之类。</span></p><p style=\"text-indent: 2em;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\"><br/></span></p>', '', '0', null, '2016-11-22 15:18:31', '2016-11-23 17:23:51', '/alitjp/sqyl.dhtml?id=124', '/alitjp/static/neirong/sqyl/124.html', 'sqyl');
INSERT INTO `tjpcms_fwb` VALUES ('125', '143', '案例', '<p style=\"text-indent: 2em; line-height: 2em; margin-bottom: 10px;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\">有点尴尬，目前只有作者自己的案例，算上本官网，一共3个案例，因为那两个和工作相关就不列出来。第一个案例就是tjpcms从无到有孕育产生的一个过程，当时后台要做一个友情链接的功能，因为有之前代码的底子，前后台都是copy一下改个参数说什么的，其实也很快就搞定了，但是处女座的作者总觉得这样不够简洁啊，来一个相似的功能copy一坨代码，直觉告诉我，这样不是太好，只能算是应付。于是作者先是将常用的几个后台代码封装成函数调用，这样是简洁了一些。后来我想，好像还可以更简洁啊，要不试试，说干就干，经过一番尝试，发现可以，结果符合我的预期，友情链接的最终效果如下：</span><br/></p><p style=\"line-height: 2em; text-align: center; text-indent: 0em;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\"><img src=\"/alitjp//ueditor/jsp/upload/image/20161122/1479801540305037551.png\" title=\"1479801540305037551.png\" alt=\"1479801540305037551.png\" width=\"888\" height=\"287\" border=\"0\" vspace=\"0\" style=\"width: 888px; height: 287px;\"/></span></p><p style=\"line-height: 2em; text-align: center; text-indent: 0em;\"><img src=\"/alitjp//ueditor/jsp/upload/image/20161122/1479801894828045212.png\" title=\"1479801894828045212.png\" alt=\"blob.png\"/></p><p style=\"text-indent: 2em; line-height: 2em; margin-bottom: 15px;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\">是的，后台只要配置一下，crud的页面、功能、校验、上传等就都好了，这样就实现了当时的想法，并且在后续的使用中逐渐增加了许多接地气的功能，可以说是做一个网站完善一个版本，所以3.0绝对不是忽悠呢，亲！</span></p><p style=\"text-indent: 2em; line-height: 2em;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 18px;\">希望能有来自网友们的案例提交给我，也算是对作者的一个支持和鼓励吧，可以在这里留言或者QQ联系等。等积累了部分案例，我会把案例这块改造一下来展示。</span></p>', '', '7', null, '2016-11-22 15:45:31', '2016-11-23 11:12:29', '/alitjp/anli.dhtml?id=125', '/alitjp/static/neirong/anli/125.html', 'anli');
INSERT INTO `tjpcms_fwb` VALUES ('126', '159', '问答', '<p style=\"text-indent: 2em;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 20px;\">类似论坛的互动提问暂时先不开放，目前目标潜下心来把tjpcms做好。</span></p><p style=\"text-indent: 2em;\"><span style=\"font-family: 幼圆, YouYuan; font-size: 20px;\"><br/></span></p>', '', '0', null, '2016-11-22 16:26:08', '2016-11-22 16:29:51', '/alitjp/wenda.dhtml?id=126', '/alitjp/static/neirong/wenda/126.html', 'wenda');
INSERT INTO `tjpcms_fwb` VALUES ('128', '165', '开发笔记', '<p style=\"text-indent: 2em;\"><span style=\"font-family: 黑体, SimHei; font-size: 20px;\">暂未上线</span><br/></p>', '', '0', null, '2016-11-23 17:08:18', '2016-11-23 17:08:18', '/alitjp/kfbj.dhtml?id=128', '/alitjp/static/neirong/kfbj/128.html', 'kfbj');
INSERT INTO `tjpcms_fwb` VALUES ('130', '163', '最近访客', '<p style=\"text-indent: 2em;\"><span style=\"font-size: 20px; font-family: 黑体, SimHei;\">暂未上线</span></p>', '', '0', null, '2016-11-23 17:14:31', '2016-11-23 17:23:31', '/alitjp/zjfk.dhtml?id=130', '/alitjp/static/neirong/zjfk/130.html', 'zjfk');
INSERT INTO `tjpcms_fwb` VALUES ('131', '166', 'Bug反馈', '<p style=\"text-indent: 2em;\"><span style=\"font-size: 20px; font-family: 黑体, SimHei;\">暂未上线</span></p>', '', '0', null, '2016-11-23 17:14:51', '2016-11-23 17:15:00', '/alitjp/bgfk.dhtml?id=131', '/alitjp/static/neirong/bgfk/131.html', 'bgfk');

-- ----------------------------
-- Table structure for `tjpcms_lanmu`
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_lanmu`;
CREATE TABLE `tjpcms_lanmu` (
  `id` int(11) NOT NULL auto_increment,
  `pId` int(11) default NULL,
  `name` varchar(40) NOT NULL,
  `nav` varchar(10) NOT NULL default '1' COMMENT '是否显示在导航栏（0-不显示，1-显示）',
  `lx` varchar(60) NOT NULL default '0' COMMENT '栏目类型，见字典表zdb',
  `url` varchar(50) default NULL COMMENT '2级页面url',
  `url_d` varchar(50) default NULL,
  `url_s` varchar(50) default NULL,
  `url3` varchar(50) default NULL COMMENT '3级页面url',
  `donly2` varchar(5) NOT NULL default '否' COMMENT '2级页面是否只动态显示，设置后栏目无法静态化',
  `donly3` varchar(5) NOT NULL default '否' COMMENT '3级页面是否只动态显示，设置后栏目内容无法静态化',
  `nrtbl` varchar(30) default NULL COMMENT '栏目内容存储在哪个表里',
  `px` int(11) NOT NULL default '1' COMMENT '排序',
  `rq` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `gx` varchar(30) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=173 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tjpcms_lanmu
-- ----------------------------
INSERT INTO `tjpcms_lanmu` VALUES ('1', null, '根节点', '显示', '父栏目zi', '', null, null, '', '否', '否', null, '0', '2016-06-16 14:25:49', '2016-06-16 14:25:49');
INSERT INTO `tjpcms_lanmu` VALUES ('139', '1', '关于tjpcms', '显示', '只显示', '/alitjp/guanyu.dhtml', 'guanyu', '/alitjp/static/lanmu/guanyu.html', '', '否', '否', '', '1', '2016-10-31 12:22:18', '2016-11-24 10:18:10');
INSERT INTO `tjpcms_lanmu` VALUES ('140', '1', '演示', '显示', '只显示', '/alitjp/yanshi.dhtml', 'yanshi', '/alitjp/static/lanmu/yanshi.html', '', '否', '否', '', '2', '2016-10-31 14:58:53', '2016-11-18 09:26:18');
INSERT INTO `tjpcms_lanmu` VALUES ('146', '141', '图文教程', '显示', '父栏目nr', '', '', '', '', '否', '否', '', '8', '2016-11-01 10:31:55', '2016-12-15 16:44:16');
INSERT INTO `tjpcms_lanmu` VALUES ('141', '1', '教程', '显示', '父栏目nr', '', '', '', '', '否', '否', '', '3', '2016-10-31 15:02:20', '2016-11-04 16:09:25');
INSERT INTO `tjpcms_lanmu` VALUES ('142', '1', '互动', '显示', '父栏目zi', '', '', '', '', '否', '否', '', '6', '2016-10-31 15:03:23', '2016-11-23 17:11:41');
INSERT INTO `tjpcms_lanmu` VALUES ('162', '142', '申请友链', '显示', '富文本', '/alitjp/sqyl.dhtml', 'sqyl', '/alitjp/static/lanmu/sqyl.html', 'sqyl', '否', '否', 'tjpcms_fwb', '23', '2016-11-14 17:10:20', '2016-11-22 15:02:10');
INSERT INTO `tjpcms_lanmu` VALUES ('143', '1', '案例', '显示', '富文本', '/alitjp/anli.dhtml', 'anli', '/alitjp/static/lanmu/anli.html', 'anli', '否', '否', 'tjpcms_fwb', '5', '2016-11-01 10:22:01', '2016-11-22 15:24:14');
INSERT INTO `tjpcms_lanmu` VALUES ('144', '1', '关于作者', '显示', '父栏目zi', '', '', '', '', '否', '否', '', '6', '2016-11-01 10:24:03', '2016-11-01 10:24:03');
INSERT INTO `tjpcms_lanmu` VALUES ('145', '1', '捐赠', '显示', '捐赠', '/alitjp/jz.dhtml', 'jz', '/alitjp/static/lanmu/jz.html', '', '否', '否', 't_jz', '7', '2016-11-01 10:24:54', '2016-12-15 09:53:11');
INSERT INTO `tjpcms_lanmu` VALUES ('163', '142', '最近访客', '显示', '富文本', '/alitjp/zjfk.dhtml', 'zjfk', '/alitjp/static/lanmu/zjfk.html', 'zjfk', '否', '否', 'tjpcms_fwb', '24', '2016-11-23 16:35:26', '2016-11-24 11:13:33');
INSERT INTO `tjpcms_lanmu` VALUES ('147', '141', '视频教程', '显示', '富文本', '/alitjp/spjc.dhtml', 'spjc', '/alitjp/static/lanmu/spjc.html', 'spjc', '否', '否', 'tjpcms_fwb', '9', '2016-11-01 10:32:15', '2016-11-18 09:19:40');
INSERT INTO `tjpcms_lanmu` VALUES ('151', '144', '技术分享', '显示', '通用文章', '/alitjp/jsfx.dhtml', 'jsfx', '/alitjp/static/lanmu/jsfx.html', 'jsfx_detail', '否', '否', 'tjpcms_tywz', '13', '2016-11-01 13:12:16', '2016-11-18 11:37:09');
INSERT INTO `tjpcms_lanmu` VALUES ('149', '144', '简介', '显示', '富文本', '/alitjp/jianjie.dhtml', 'jianjie', '/alitjp/static/lanmu/jianjie.html', 'jianjie', '否', '否', 'tjpcms_fwb', '11', '2016-11-01 10:40:16', '2016-11-18 09:19:28');
INSERT INTO `tjpcms_lanmu` VALUES ('150', '144', '小作品', '显示', '通用文章', '/alitjp/xzp.dhtml', 'xzp', '/alitjp/static/lanmu/xzp.html', 'xzp_detail', '否', '否', 'tjpcms_tywz', '12', '2016-11-01 10:49:15', '2016-11-17 16:47:13');
INSERT INTO `tjpcms_lanmu` VALUES ('152', '144', '杂谈', '显示', '通用文章', '/alitjp/zatan.dhtml', 'zatan', '/alitjp/static/lanmu/zatan.html', 'zatan_detail', '否', '否', 'tjpcms_tywz', '14', '2016-11-01 15:09:06', '2016-11-01 15:09:06');
INSERT INTO `tjpcms_lanmu` VALUES ('153', '146', '环境搭建', '显示', '通用文章', '/alitjp/huanjing.dhtml', 'huanjing', '/alitjp/static/lanmu/huanjing.html', 'huanjing_detail', '否', '否', 'tjpcms_tywz', '15', '2016-11-01 15:14:27', '2016-11-22 17:28:22');
INSERT INTO `tjpcms_lanmu` VALUES ('154', '146', '简单应用', '显示', '通用文章', '/alitjp/jiandan.dhtml', 'jiandan', '/alitjp/static/lanmu/jiandan.html', 'jiandan_detail', '否', '否', 'tjpcms_tywz', '16', '2016-11-01 15:16:14', '2016-11-22 17:28:17');
INSERT INTO `tjpcms_lanmu` VALUES ('155', '146', '进阶应用', '显示', '通用文章', '/alitjp/jinjie.dhtml', 'jinjie', '/alitjp/static/lanmu/jinjie.html', 'jinjie_detail', '否', '否', 'tjpcms_tywz', '17', '2016-11-01 15:16:21', '2016-11-22 17:28:20');
INSERT INTO `tjpcms_lanmu` VALUES ('156', '1', '动态', '显示', '父栏目zi', '', '', '', '', '否', '否', '', '4', '2016-11-04 09:20:54', '2016-11-23 17:02:36');
INSERT INTO `tjpcms_lanmu` VALUES ('157', '142', '留言', '显示', '富文本', '/alitjp/liuyan.dhtml', 'liuyan', '/alitjp/static/lanmu/liuyan.html', 'liuyan', '否', '否', 'tjpcms_fwb', '19', '2016-11-04 09:55:18', '2016-11-22 14:56:20');
INSERT INTO `tjpcms_lanmu` VALUES ('159', '142', '问答', '显示', '富文本', '/alitjp/wenda.dhtml', 'wenda', '/alitjp/static/lanmu/wenda.html', 'wenda', '否', '否', 'tjpcms_fwb', '18', '2016-11-04 11:57:38', '2016-11-22 16:16:22');
INSERT INTO `tjpcms_lanmu` VALUES ('160', '1', '网站变量', '不显示', '父栏目nr', '', '', '', '', '否', '否', '', '21', '2016-11-04 15:30:56', '2016-11-04 15:35:36');
INSERT INTO `tjpcms_lanmu` VALUES ('161', '160', '备案号', '不显示', '单行文本', '', '', '', '', '否', '否', '', '22', '2016-11-04 15:34:05', '2016-11-04 15:34:05');
INSERT INTO `tjpcms_lanmu` VALUES ('164', '156', '版本更新', '显示', '通用文章', '/alitjp/bbgx.dhtml', 'bbgx', '/alitjp/static/lanmu/bbgx.html', 'bbgx_detail', '否', '否', 'tjpcms_tywz', '25', '2016-11-23 16:36:44', '2016-11-24 11:28:33');
INSERT INTO `tjpcms_lanmu` VALUES ('165', '156', '开发笔记', '显示', '富文本', '/alitjp/kfbj.dhtml', 'kfbj', '/alitjp/static/lanmu/kfbj.html', 'kfbj', '否', '否', 'tjpcms_fwb', '26', '2016-11-23 16:54:55', '2016-11-23 16:54:55');
INSERT INTO `tjpcms_lanmu` VALUES ('166', '142', 'Bug反馈', '显示', '富文本', '/alitjp/bgfk.dhtml', 'bgfk', '/alitjp/static/lanmu/bgfk.html', 'bgfk', '否', '否', 'tjpcms_fwb', '20', '2016-11-23 16:58:22', '2016-11-23 16:58:54');
INSERT INTO `tjpcms_lanmu` VALUES ('167', '156', '大事记', '显示', '大事记', '/alitjp/dashi.dhtml', 'dashi', '/alitjp/static/lanmu/dashi.html', 'dashi_detail', '否', '否', 'tjpcms_dashi', '27', '2016-11-23 16:59:40', '2017-01-09 16:43:34');
INSERT INTO `tjpcms_lanmu` VALUES ('170', '1', '互动信息', '不显示', '父栏目nr', '', '', '', '', '否', '否', '', '30', '2016-12-15 09:47:43', '2016-12-15 09:47:43');
INSERT INTO `tjpcms_lanmu` VALUES ('171', '170', '捐赠反馈', '不显示', '网站互动信息', '', '', '', '', '否', '否', 't_hd', '31', '2016-12-15 09:48:58', '2016-12-15 09:48:58');
INSERT INTO `tjpcms_lanmu` VALUES ('172', '170', '首页点赞', '不显示', '网站互动信息', '', '', '', '', '否', '否', 't_hd', '32', '2016-12-15 09:49:59', '2016-12-15 09:49:59');

-- ----------------------------
-- Table structure for `tjpcms_tywz`
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_tywz`;
CREATE TABLE `tjpcms_tywz` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `cid` int(11) NOT NULL COMMENT '栏目id',
  `title` varchar(100) NOT NULL,
  `nr` mediumtext NOT NULL,
  `zy` varchar(300) default NULL COMMENT '摘要',
  `tu` varchar(50) default NULL COMMENT '缩略图',
  `gjc` varchar(50) default NULL,
  `zz` varchar(20) default NULL COMMENT '作者',
  `cs` int(11) NOT NULL default '0',
  `rq` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `gx` varchar(20) NOT NULL,
  `delf` int(11) NOT NULL default '0' COMMENT '删除标记（0-未删除，1-已删除）',
  `px` int(11) unsigned NOT NULL default '1',
  `bz` varchar(100) default NULL,
  `url` varchar(50) default NULL,
  `url_s` varchar(50) default NULL,
  `url_d` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tjpcms_tywz
-- ----------------------------
INSERT INTO `tjpcms_tywz` VALUES ('133', '150', '理工强手', '<p style=\"text-indent: 2em; line-height: 1.5em; margin-bottom: 15px;\"><span style=\"font-size: 16px; font-family: 幼圆, YouYuan;\">理工强手是个什么玩意呢？</span><span style=\"font-family: 黑体, SimHei; font-size: 16px;\"><br/></span></p><p style=\"text-indent: 2em; margin-bottom: 15px; line-height: 1.75em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">是这样的，小的时候呢，大概是小学初中的时候，特别喜欢和同学玩一种棋，叫做强手棋，还带产业间谍的那种。还记得那时候去同学家玩，一玩就能玩一下午。长大了就没玩过了，后来读研时有个同学过生日，我特地从网上买了一个强手棋带去他家助兴，结果大家果然玩嗨了，买地拿地契、收过路费找钱之类的不亦乐乎，回学校之后大家还想玩，却苦于竟然找不到合适的地方，在室外某个很昏暗的灯下徘徊。。</span></p><p style=\"text-indent: 2em; margin-bottom: 15px; line-height: 1.75em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">好，那么需求就产生了，我想把这棋弄成电子的不就方便了吗，买地找钱啥的直接由程序完成，大家也不用非要聚在一起了，有网有电脑就行了。说干就干，历时3个月完成，因为我是理工学校毕业的，综合起来取了个霸气的名字：理工强手。一开始网络方面弄了个HLA（高层体系结构）来通信，把我坑得一塌糊涂，最后赶紧放弃这玩意换了socket。<span style=\"font-size: 16px; font-family: 黑体, SimHei; text-indent: 32px;\">前期开发进度特别慢，</span>光是一个分配不同棋子的功能就弄了我好久，后面不知道为啥突然就提速了，还记得那天终于写好了开了8个程序自己测试，感觉没问题，赶紧洗澡了，为了写这个洗澡都耽误了。。</span></p><p style=\"text-indent: 2em; margin-bottom: 15px; line-height: 1.75em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">后来，这个游戏我们也玩了不少次，带来了不少欢乐。不过有个比较致命的BUG：就是在公网上面，会出现一个指令包拆分成多个发到服务器的情况，带来的问题就是玩着玩着突然大家的进度就不同步了，也就玩不起来了，<span style=\"font-size: 16px; font-family: 黑体, SimHei; text-indent: 32px;\">局域网因为网络情况比较好倒没有出现过这种情况。所以比较尴尬，本来想是广域网游戏的，结果变成了局域网。本来想着修复一下，又没那精力了，也就算了，局域网玩玩吧。</span></span></p><p style=\"text-indent: 2em; margin-bottom: 5px; line-height: 1.75em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">说了这么多，到底是个什么玩意，直接上图上链接吧：</span></p><p style=\"margin-bottom: 5px; text-align: center; line-height: 1.75em; text-indent: 0em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\"><img src=\"/alitjp//ueditor/jsp/upload/image/20161117/1479365284211032670.png\" title=\"1479365284211032670.png\" alt=\"搜狗截图20161117144640.png\"/>&nbsp;<img src=\"/alitjp//ueditor/jsp/upload/image/20161121/1479716427888047648.jpg\" title=\"1479716427888047648.jpg\" alt=\"搜狗截图20161121161526_副本.jpg\"/></span></p><p style=\"text-indent: 2em; margin-bottom: 5px; line-height: 1.75em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">本地下载：</span><img src=\"/alitjp/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\" style=\"vertical-align: middle; margin-right: 2px;\"/><a href=\"/alitjp/ueditor/jsp/upload/file/20161116/1479280954415041726.zip\" target=\"_self\" title=\"理工强手1223.zip\" textvalue=\"理工强手1223.zip\" style=\"text-decoration: underline; font-family: 黑体, SimHei; font-size: 16px;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">理工强手1223.zip</span></a></p><p style=\"text-indent: 2em; margin-bottom: 5px; line-height: 1.75em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">百度云盘：<span style=\"text-decoration: none; font-family: 黑体, SimHei; font-size: 16px;\"><a href=\"http://pan.baidu.com/s/1o8eyE4i\" target=\"_blank\" title=\"理工强手 - 百度云盘\" textvalue=\"http://pan.baidu.com/s/1o8eyE4i\" style=\"font-family: 黑体, SimHei; text-indent: 32px; white-space: normal;\">http://pan.baidu.com/s/1o8eyE4i</a></span></span></p><p style=\"text-indent: 2em; margin-bottom: 5px; line-height: 1.75em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">CSDN：<span style=\"font-family: 黑体, SimHei; font-size: 16px; text-decoration: none;\"><a href=\"http://download.csdn.net/detail/hll127/4132226\" target=\"_blank\" title=\"理工强手 - CSDN\" textvalue=\"http://download.csdn.net/detail/hll127/4132226\">http://download.csdn.net/detail/hll127/4132226</a></span></span></p><p style=\"text-indent: 2em; line-height: 1.5em; margin-bottom: 5px;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\"><br/></span></p>', null, '', '理工强手 强手棋  monopoly   ', null, '51', '2016-11-16 14:47:45', '2016-11-23 09:42:06', '0', '29', null, '/alitjp/xzp_detail.dhtml?id=133', '/alitjp/static/neirong/xzp_detail/133.html', 'xzp_detail');
INSERT INTO `tjpcms_tywz` VALUES ('141', '150', '111', '<p>222</p>', null, '', '', null, '0', '2016-11-16 17:19:07', '2016-11-16 17:19:07', '1', '30', null, '/alitjp/xzp_detail.dhtml?id=141', null, 'xzp_detail');
INSERT INTO `tjpcms_tywz` VALUES ('142', '150', '333', '<p>4444</p>', null, '', '', null, '0', '2016-11-16 17:19:11', '2016-11-16 17:19:11', '1', '31', null, '/alitjp/xzp_detail.dhtml?id=142', null, 'xzp_detail');
INSERT INTO `tjpcms_tywz` VALUES ('143', '150', '11', '<p>22</p>', null, '', '', null, '0', '2016-11-17 17:10:48', '2016-11-17 17:10:48', '1', '32', null, '/alitjp/xzp_detail.dhtml?id=143', null, 'xzp_detail');
INSERT INTO `tjpcms_tywz` VALUES ('144', '151', '使用JRebel来增强Tomcat的热部署功能', '<p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 10px;\"><span style=\"font-size: 16px;\">之前没用JRebel的时候，MyEclipse里修改了一个函数后，在debug模式下保存，Build Automatically开启，修改可以立即生效，但如果新增函数或者函数改名就得重启服务了，还有就是MyBatis里修改和新增sql也都是需要重启服务的，这样确实有点不太方便，尤其是重启服务时间很长的时候。还好tjpcms启动一下基本2,3秒钟吧，加了JRebel后4,5秒钟。服务启动速度上确实没话说，但开发时如果因为开个函数名字或者MyBatis里加个参数什么的都要重启确实很不方便。</span></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 10px;\"><span style=\"font-size: 16px;\">后来上网搜资料时发现了JRebel这个神器，不知道到底是怎么实现的，反正就是觉得很神奇，强大。用了这个插件后，java文件里改函数名、新增函数可以直接生效了，xml文件里修改sql语句也可以直接生效了，确实方便多了。不过呢，这是个收费的插件，所以建议大家购(po)买(jie)一下，具体百度。我目前用的版本是6.2.1,启动时提示最近30天阻止789次重启，最近305天阻止24041次重启，确实节省了不少时间，时间就是生命时间就是财富。</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 16px;\">有兴趣的可以试试，<span style=\"font-size: 16px; text-indent: 32px;\">我这里只是提供有这么一款工具，</span>具体使用教程自己搜索，网上很多的。</span></p>', null, '', ' tomcat热部署 JRebel', null, '17', '2016-11-18 16:54:18', '2016-11-23 09:41:19', '0', '33', null, '/alitjp/jsfx_detail.dhtml?id=144', '/alitjp/static/neirong/jsfx_detail/144.html', 'jsfx_detail');
INSERT INTO `tjpcms_tywz` VALUES ('145', '152', 'tjpcms的起步历程', '<p style=\"margin-top:5px;margin-right:0;margin-bottom:10px;margin-left: 0;text-indent:32px;line-height:32px\"><span style=\"font-size: 16px; font-family: 黑体;\">cms系统作者用过动易、dedecms和jeecms，还用过一个商城类的ECShop，在实际的使用过程中感觉这些信息系统的通病就是功能菜单巨多、表单参数巨多，也不知道参数之间有什么关联，一些选项到底有什么用，也没什么具体的参数说明，让人看着摸不着头脑，用起来也总觉得好像漏了什么，系统总吃不透。本来web系统就是开放性非常高的，一般也没有规定必须先操作什么，再操作什么，再来这么多菜单，这么多参数还有每家都不一样的模板标签，我想一般人都懵逼了吧。另外这些cms虽然功能巨多，但实际上我一般实际用得着的真的不多，功能多了BUG也多，只不过这些系统都是商用收费的，没那么多功能也不好意思收钱吧。</span></p><p style=\"margin-top:5px;margin-right:0;margin-bottom:10px;margin-left: 0;text-indent:32px;line-height:32px\"><span style=\"font-family: 黑体; font-size: 16px;\">那么鉴于这些cms都不太好用又收费的情况呢，作者逐渐萌发了搞一个自己的cms的想法，于15年年底的时候买了tjpcms.com的域名。tjpcms项目是从作者百度了一个springMVC的demo起步的，什么类似于《手把手教你搭建springMVC开发环境》、《</span><a href=\"http://blog.csdn.net/geloin/article/details/7536968\" style=\"font-size: 16px; text-decoration: underline;\"><span style=\"font-size: 16px; font-family: 黑体; color: black;\">SpringMVC整合Mybatis实例</span></a><span style=\"font-family: 黑体; font-size: 16px;\">》那种，在这个例子的基础上改改，然后得弄一个好看点的后台，在ligerui、dwz和一些成品的后台之间摇摆了一段时间，最后还是决定外观上参考ligerui，css和js自己写。后台栏目树用了zTree，artTemplate用来简写页面，分页和弹出层是layui（其实<span style=\"font-family: 黑体; text-indent: 32px;\">artTemplate也是源由laytpl发掘的</span>），后台登录界面援引了一个uimaker上的一个经典蓝色后台模板的登录页，确实高大上。后台TAB项的邮件菜单使用了smartMenu，我自己又对TAB项的做了一个交换的功能。无刷新上传附件用的是form.js。后台左上角滚动的那个效果用的是superslide。很多配色、UI及响应式写法是参考了拼图pintuer。还有一个网上找的汉字转拼音的js。基本上用到的各类资源就这些吧，一并致谢了！</span></p><p style=\"margin: 5px 0px 10px; text-indent: 32px; line-height: 32px;\"><span style=\"font-family: 黑体; font-size: 16px;\"><img src=\"http://localhost:8080/alitjp//ueditor/jsp/upload/image/20161122/1479784345750062852.png\" title=\"1479784345750062852.png\" alt=\"blob.png\" style=\"font-family: 黑体; text-indent: 32px; white-space: normal;\"/><img src=\"/alitjp//ueditor/jsp/upload/image/20161122/1479784392494000490.png\" title=\"1479784392494000490.png\" alt=\"blob.png\"/></span></p><p style=\"margin: 5px 0px 10px; text-indent: 32px; line-height: 32px;\"><span style=\"font-family: 黑体; font-size: 16px;\">最近趁着双十一买了阿里云的ecs服务器，贵啊，难怪php这么火，服务器便宜也是个重要原因吧。但是php的调试总是让我觉得很别扭，输出打印这么基本的功能竟然还有做插件的，打个断点有时莫名其妙就是进不去，非要随便改下视图文件才能进，有时干脆就进不了了，折腾一会又能进了，实在是原因不明。。难道是我用的zendstudio不给力？当然php不用编译修改就生效也确实是个大优势，apache好像也比Tomcat稳定点，所以感觉搞网站java确实落后点。但我就是喜欢用java，我想是用习惯了，不想换了，只要能帮我解决问题就行了吧。</span></p>', null, '', '', null, '1', '2016-11-22 10:32:57', '2016-11-22 12:40:28', '0', '34', null, '/alitjp/zatan_detail.dhtml?id=145', '/alitjp/static/neirong/zatan_detail/145.html', 'zatan_detail');
INSERT INTO `tjpcms_tywz` VALUES ('146', '153', '配置JDK、MyEclipse、Tomcat、Mysql', '<p style=\"text-indent: 2em; line-height: 2.5em;\"><strong><span style=\"font-family: 黑体, SimHei; font-size: 24px;\">JDK</span></strong><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">：这个就不说了，不能再基础了，网上一搜一大把的，安装好配置下环境变量就行了，什么java -version，javac的输出试试。我目前用的版本是1.6的，好像有点老奥，主要一直没换过，时间长了就变老了，不过我用得挺好的，暂时也没打算换。版本如下：<br/></span></p><p style=\"text-indent: 2em; text-align: center; line-height: 2.5em;\"><img src=\"/alitjp//ueditor/jsp/upload/image/20161122/1479806182231091763.png\" title=\"1479806182231091763.png\" alt=\"blob.png\"/></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 20px;\"><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">放个本地下载地址</span><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">吧，不过估计下的有点慢，不行就自己百度个吧。</span><img src=\"/alitjp/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\" style=\"vertical-align: middle; margin-right: 2px;\"/><span style=\"color: rgb(0, 102, 204); font-size: 16px; font-family: 黑体, SimHei; text-decoration: underline;\"><a href=\"/alitjp//ueditor/jsp/upload/file/20161122/1479807445057001074.zip\" title=\"jdk-6u24-windows-x64.zip\" style=\"color: rgb(0, 102, 204); font-size: 16px; font-family: 黑体, SimHei; text-decoration: underline;\">jdk-6u24-windows-x64.zip</a></span></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 20px;\"><strong><span style=\"font-family: 黑体, SimHei; font-size: 24px;\">MyEclipse</span></strong><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">：之前用一个8.5的版本用了好久，后来好像是因为老是出现保存后没有自动发布的问题，就在那刷刷刷啊，刷不出来。手动点一下发布就刷出来了，这问题太影响效率了，很多时候不知道是自己问题没改好还是代码没发布出去，出现地还比较频繁，那段时间弄得我很是头疼这个问题。后来终于狠下心来，算了，升级。先试了2014，好不容易装好了，发现好像有点问题，上网一搜发现人家说2014有不少致命BUG，像是个过渡测试版，不建议用，没办法又换了2015，按照教程一步一步操作啊，终于装好了，需要crack一下，大家懂的。我现在的版本是2015 Stable 2.0，建议大家还是升级吧，这个版本我感觉蛮稳定的，我刚说的那个问题我就再也没遇到了，都是秒发布，改完保存，切换到浏览器一刷新就出来了，很爽。装2015的时候，还记得有个博客作者强调，说，按照我说的步骤一步一步操作肯定可以弄好，要是你没弄好，把步骤再仔细看一下。我一开始也是没搞定，看了他这话，只好又仔细看了几遍，果然发现我最后有个步骤弄错了，诚不我欺也。。</span></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 20px;\"><strong><span style=\"font-family: 黑体, SimHei; font-size: 24px;\">Tomcat</span></strong><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">：这个我用的是7.0.64，应该还算比较新的。最早的时候是用的7.0.39，虽然小版本号基本差不多，但其实我自己在用的过程中发现这两个版本还是有区别的，比如上传，还有一些说不上的地方，就是本来7.0.39是好好的，换成7.0.64后竟然就失效了，而且后台不报错，前台提示一个连接被重置的一个错误</span><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">net::ERR_CONNECTION_RESET，好像是这个，反正是<span style=\"font-family: 黑体, SimHei; text-indent: 32px;\">net::ERR开头的。弄得我一头雾水啊，不得已有些应用里又换回7.0.39了。只不过现在新的应用都用7.0.64了，上传那个错误也用了方法规避了，以后在技术分享里会写出来。然后在MyEclipse里配JDK和Tomcat，这个自行百度，也是一抓一大把，以前我不熟悉的时候这块配置也是感觉迷迷糊糊的，用多了发现了其实配置这些就是在MyEclipse里启动了你安装的那个Tomcat，自动运行了你安装的Tomcat的那些exe、bat之类，还有JDK也是用了你给的那个路径下的。总之最后开发调试时用的是你自己的JDK和Tomcat就行了，不要用MyEclipse自带的。</span></span></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 20px;\"><strong><span style=\"font-family: 黑体, SimHei; font-size: 24px;\">MySql</span></strong><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">：这个我用的好像也比较老了，用的是AppServ装的，版本是2510的64位版本。这个合成包好像是泰国的一个作者弄的，只不过这类合成安装包很多就是了，因为用php的人也是非常多的。这个包可以给你同时安装php、apache和MySql，也可以只装一个MySql了。安装教程，唉，百度百度，很多问题其实百度搜一下就知道了。装好了，再装个Navicat吧，建表、修改数据、赋权限什么的操作起来就方便多了，好像是分收费版和免费版，收费版的功能多一些，不过可以那什么，对吧。我用的版本是10.1.7，这个安装新一点的会更好。最后给个<span style=\"font-family: 黑体, SimHei; text-indent: 32px;\">AppServ的下载链接吧，也可以百度搜版本号</span></span><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">去找。</span><img src=\"/alitjp/ueditor/dialogs/attachment/fileTypeImages/icon_rar.gif\" style=\"vertical-align: middle; margin-right: 2px;\"/><span style=\"color: rgb(0, 102, 204); font-size: 16px; font-family: 黑体, SimHei; text-decoration: underline;\"><a href=\"/alitjp//ueditor/jsp/upload/file/20161123/1479863167953048543.rar\" title=\"appserv-win64-2.5.10_64位win7支持.rar\" style=\"color: rgb(0, 102, 204); font-size: 16px; font-family: 黑体, SimHei; text-decoration: underline;\">appserv-win64-2.5.10_64位win7支持.rar</a></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">最后，这里其实只是大体笼统的说了一下环境的配置，在实际操作的过程中难免会遇到些问题，比如某些选项如何选啊、某些参数如何填啊这种，自行百度即可，最怕是你自己还没去研究研究先去问别人怎么办，其实你遇到的问题基本别人也都遇到过，会在网上提问，或者有人总结出来发到网上，你需要的就是耐心细致地去查阅、理解。所以这里只是给了一个结果，即最终都安装配置好了是什么效果，具体实施过程还需要自己去体会，只不过后续我会再发布一些具体操作的文章。</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 16px; font-family: 黑体, SimHei;\"></span></p>', '', '', '', null, '3', '2016-11-22 16:51:09', '2017-01-11 11:00:24', '0', '35', '', '/alitjp/huanjing_detail.dhtml?id=146', '/alitjp/static/neirong/huanjing_detail/146.html', 'huanjing_detail');
INSERT INTO `tjpcms_tywz` VALUES ('152', '154', '最普通的单表（友情链接页面）', '<p style=\"text-indent: 2em; text-align: left; margin-bottom: 25px;\"><span style=\"font-family: 黑体, SimHei;\"><strong><span style=\"font-size: 24px;\">请注意此教程只适用于3.0.161109</span></strong></span></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 10px;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\"><span style=\"font-family: 仿宋, FangSong; text-indent: 32px;\">左侧菜单目前呢功能什么的还不算很完善，只能手动在代码加菜单，这个后面会重新设计和改进。</span>后台的左侧菜单在index_ad.jsp页面里，查找zNodes，lxpy即为NedAdmController中对应的RequestMapping，比如说你想新增一个菜单叫“测试菜单”，那么就在zNodes这个数组里新增一项，然后在<span style=\"font-family: 仿宋, FangSong; text-indent: 32px;\">NedAdmController里增加对应名称的RequestMapping就可以了</span>：</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">var zNodes =[</span></p><p style=\"line-height: 2em; text-indent: 2em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">{lxpy:&#39;lanmu&#39;, id:-1,name:&quot;栏目列表&quot;},</span></p><p style=\"line-height: 2em; text-indent: 2em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">{lxpy:&#39;yqlj&#39;,id:-2, name:&quot;友情链接&quot;},</span></p><p style=\"line-height: 2em; text-indent: 2em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">{lxpy:&#39;zdb&#39;,id:-3, name:&quot;字典表&quot;},</span></p><p style=\"line-height: 2em; text-indent: 2em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">{name:&quot;配置项&quot;,children:[{name:&#39;可编辑&#39;,lxpy:&#39;cfg_kbj&#39;,id:-41},{name:&#39;不可编辑&#39;,lxpy:&#39;cfg&#39;,id:-42}]},</span></p><p style=\"line-height: 2em; text-indent: 2em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">{lxpy:&#39;wzjth&#39;,id:-5, name:&quot;网站静态化&quot;},</span></p><p style=\"line-height: 2em; text-indent: 2em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px; color: rgb(255, 255, 255); background-color: rgb(0, 176, 240);\">{lxpy:&#39;cscd&#39;,id:-6,name:&quot;测试菜单&quot;}</span></p><p style=\"line-height: 2em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">];</span></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 5px;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">那后台的友情链接页面是怎么配出来的呢？直接上图</span></p><p style=\"text-align: center;\"><img src=\"/alitjp/ueditor/jsp/upload/image/20161122/1479801540305037551.png\" style=\"width: 888px; height: 287px;\" width=\"888\" height=\"287\" border=\"0\" vspace=\"0\" title=\"\" alt=\"\"/></p><p style=\"text-align: center;\"><br/></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 20px;\"><span style=\"font-family: 黑体, SimHei; font-size: 22px;\"><strong>首先</strong></span><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">定义个一个Curd对象，entMapper是MyBatis的接口，系统自带的一些sql操作是在里面完成的。request直接带入，第三个参数是表名，也就是友情链接存储在哪张表里，最后一个参数是bread导航的名称。那么生成Crud对象时，系统会自动的完成一些初始化设置，这个就不用管了，有兴趣的话可以进去看看做了什么。</span></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 5px;\"><span style=\"font-family: 黑体, SimHei; font-size: 22px;\"><strong>第二步</strong></span><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">是定义查询区和列表区，及cxs和hds，都是String二维数组，第一维的每一项代表一个字段，第二维的每一项代表对这个字段的一些配置项。第二维中第1个和第2个必须是中文名称和对于数据库表中的字段名称，比如在tjpcms_yqlj表中有个mc字段存储的是网站名称，那么配置时就写{&quot;网站名称&quot;,&quot;mc&quot;}，最终页面的查询区里会自动生成一块查询网站名称的区域，下方的列表中也会出现一列表头为网站名称，并且显示出该字段的内容。最终生成的list页面如下：</span></p><p style=\"line-height: 2.5em; margin-bottom: 20px; text-indent: 0em; text-align: center;\"><img src=\"http://www.tjpcms.com/alitjp/ueditor/jsp/upload/image/20161122/1479801894828045212.png\" width=\"888\" height=\"482\" border=\"0\" vspace=\"0\" title=\"\" alt=\"\" style=\"text-align: center; white-space: normal; width: 888px; height: 482px;\"/><br/></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 5px;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\"><strong style=\"font-family: 黑体, SimHei; font-size: 22px; text-indent: 32px; white-space: normal;\">第三步</strong></span><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">是定义aev区，为什么叫aev，这是我自己定义的，就是add、edit、view的简称。对于新增、修改和查看这三种情况，其实是同一个页面模板，只是根据不同的情况呈现带有区别的页面。前两个字段还是一样，中文及字段名，后面可以有下面这几种情况（只针对友情链接的例子）：</span></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 5px;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">1.设置字段类型，详见AevZdType。比如PIC就会生成一个图片上传的区域，TEXT就会只在查看时生成该字段的值，默认的类型是INPUT，可以不写。</span></p><p style=\"line-height: 2.5em; margin-bottom: 5px; text-align: left; text-indent: 0em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 2em;\">2.校验。注意这是前台校验，后台校验目前是没有的，后期考虑再完善一下，只不过通常不那么严格的情况下也够用了。可以同时有多个校验规则，以空白符（空格、TAB之类的都可以）分隔，最常用的规则是&nbsp;&nbsp;&nbsp;&nbsp;正则的名称:不符合的提示语&nbsp;&nbsp;&nbsp;&nbsp;，具体有哪些正则呢，在aev.jsp里搜$pintuercheck，目前有四十多个常用的。那如果需要自定义的怎么办呢，规则是&nbsp;&nbsp;&nbsp;&nbsp;regexp#具体的正则表达式:</span><span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\">不符合的提示语&nbsp;&nbsp;&nbsp;&nbsp;，还有两个特殊的规则required和unique，required指定该字段必填（px字段默认添加该属性，px即排序，tjpcms默认px为排序，不可用做其他用途，新增记录时会自动生成一个最大的px值带入页面，px值可以重复），unique指定该字段值是唯一的，这两个字段都会调ajax去后台查，这两个字段都可以不加校验</span><span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\">不符合的提示语，有默认的，当然也可以加。</span><br/></p><p style=\"text-indent: 32px; line-height: 2.5em; margin-bottom: 5px; text-align: left;\"><span style=\"font-family:仿宋, FangSong\"><span style=\"font-size: 24px; font-family: 黑体, SimHei;\">注</span><span style=\"font-size: 22px;\">：校验这块是参考的pintuer，在此致谢！</span></span></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 20px;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">3.两个反斜杠开头的<span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\"></span><span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\"></span><span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\"></span><span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\"></span><span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\"></span><span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\"></span><span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\"></span>，是设置该字段的初始默认值</span></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 20px;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">最终生成的aev页面如下：</span></p><p style=\"line-height: 2.5em; margin-bottom: 20px; text-align: center; text-indent: 0em;\"><img src=\"/alitjp//ueditor/jsp/upload/image/20161123/1479884160410082894.png\" title=\"1479884160410082894.png\" alt=\"blob.png\"/><br/></p><p style=\"line-height: 2.5em; margin-bottom: 20px; text-indent: 2em;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">这个例子的意义在于：如果你只是想做一个最普通的crud的功能，按照上述配置就已经可以生成功能比较完备、样式清新统一的页面了。当然是实际的开发过程中，需求可不会都是这么简单的，Curd还可以支持什么样的功能呢，请继续看下面的教程吧！</span><br/></p>', null, '', '', null, '14', '2016-11-23 13:00:38', '2016-11-28 10:06:01', '0', '36', '3.0.161109', '/alitjp/jiandan_detail.dhtml?id=152', '/alitjp/static/neirong/jiandan_detail/152.html', 'jiandan_detail');
INSERT INTO `tjpcms_tywz` VALUES ('153', '155', '自定义操作区、列表区自定义字段（用户列表页面）', '<p style=\"text-indent: 2em;\"><br/></p><p style=\"margin-bottom: 25px; white-space: normal; text-indent: 2em;\"><span style=\"font-family: 黑体, SimHei;\"><strong><span style=\"font-size: 24px;\">请注意此教程只适用于3.0.161109</span></strong></span></p><p style=\"margin-bottom: 10px; white-space: normal; text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family:仿宋, FangSong\"><span style=\"font-size: 22px;\">先上图</span></span></p><p style=\"text-indent: 0em; text-align: center;\"><img src=\"/alitjp//ueditor/jsp/upload/image/20161123/1479885193273090134.png\" title=\"1479885193273090134.png\" alt=\"1479885193273090134.png\" width=\"888\" height=\"560\" border=\"0\" vspace=\"0\" style=\"width: 888px; height: 560px;\"/></p><p style=\"text-indent: 0em; text-align: center; margin-bottom: 20px;\"><img src=\"/alitjp//ueditor/jsp/upload/image/20161123/1479885806393010271.png\" title=\"1479885806393010271.png\" alt=\"blob.png\"/></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 20px;\"><span style=\"font-family:仿宋, FangSong\"><span style=\"font-size: 22px;\">因为这个页面是在栏目树中的，所以在生成Crud对象o之后，需要固定地加上一句if(o.getCid() ==null){return &quot;adm/welcome&quot;;}。welcome页面呢，就是后台的“<span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\">我的主页</span>”，固定的TAB项，可以在里面写点欢迎语、提示语自之类的。</span></span></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 20px;\"><span style=\"font-family:仿宋, FangSong\"><span style=\"font-size: 22px;\">因为这里后台不需要新增和编辑用户，所以setNeeda(false)，setNeede(false)。查询区的状态和会员单位是下拉列表，下拉项可以在后台的【字段表】菜单里增加（先增加字段表，再增加表的字典项，最后在这里引用字典表py就可以了）。</span></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family:仿宋, FangSong\"><span style=\"font-size: 22px;\">列表区hds，这里有两个新的使用方法：</span></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family:仿宋, FangSong\"><span style=\"font-size: 22px;\">1、style，可以给该字段列加css属性，不过目前我也就想到设置一个宽度，其他还有什么需要设置的还没想到。</span></span></p><p style=\"text-indent: 2em; line-height: 2.5em; margin-bottom: 20px;\"><span style=\"font-family:仿宋, FangSong\"><span style=\"font-size: 22px;\">2、sql，这个实际上是在select中嵌入了一段语句作为新增的字段，类似于select....,(sql)as zdm from...，方便将某些字段转值或者关联上其他表获取值。</span></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family:仿宋, FangSong\"><span style=\"font-size: 22px;\">操作区czs，这块是可以设置自定义的列表操作区，默认的列表操作区是<span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\">查看、</span>编辑和删除，肯定是不能满足需求的，所以设置czs可以自定义操作区，以上述页面为例，可以配置以下字段</span></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family:仿宋, FangSong\"><span style=\"font-size: 22px;\">1、text，用于操作项文字是固定的，设置操作项的文字，建议简洁一点，后面考虑可以用图片和icon</span></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family:仿宋, FangSong\"><span style=\"font-size: 22px;\">2、idx，设置该操作项最终要排在第几个，从0开始，1就是第二个。默认是在<span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\">最后面</span>追加。</span></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family:仿宋, FangSong\"><span style=\"font-size: 22px;\">3、js，即点击该操作项按钮时，执行的js函数的名称和存放的地方，因此配置js:fn_yhlbczmm(this,id):listczq.js后在生成list页面时，会自动引入<span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\">listczq.js，而<span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\">fn_yhlbczmm就是在<span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\">listczq.js中定义的。</span></span></span></span></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family:仿宋, FangSong\"><span style=\"font-size: 22px;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\"><span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\">4、text和case配合，用于操作项文字是可变的，依据展现出来的每条记录的具体值来设置不同的文字。case:zt=锁定:val:解锁#case:zt!=锁定:val:锁定，即查询出来的某条记录的zt字段值为锁定时，操作区显示解锁，反之显示锁定。为什么要加val呢，因为我考虑有一种操作项按钮可见，但是不可操作的情况，比如：业务上设定，只有当用户的状态为锁定时，才可删除，状态不为锁定时，不可以删除。配置的方法是val:删除:case:zt=锁定#case:zt!=锁定:gray:删除，即将val改为gray（grey也可）。这块的case目前只支持&gt;=, &lt;=,==,!=,=,&gt;,&lt;，后期考虑支持表达式。</span></span></span></span></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 24px;\">注</span><span style=\"font-family: 仿宋, FangSong; font-size: 22px;\">：操作区的配置项之间没有次序要求，但需要加类型前缀，即text,<span style=\"font-family: 仿宋, FangSong; font-size: 22px; text-indent: 32px;\">idx，</span>js这种。另外如果有两个配置项的名称相同，后面的覆盖前面的（所以可以利用这点覆盖掉系统自带的删除、编辑这些）。</span></p>', null, '', '', null, '0', '2016-11-23 15:23:52', '2016-12-20 16:33:41', '0', '37', '3.0.161109', '/alitjp/jinjie_detail.dhtml?id=153', '/alitjp/static/neirong/jinjie_detail/153.html', 'jinjie_detail');
INSERT INTO `tjpcms_tywz` VALUES ('154', '164', '3.0.161109', '<p dir=\"rtl\" style=\"text-indent: 2em; text-align: left; line-height: 2.5em;\"><span style=\"font-size: 24px; font-family: 黑体, SimHei;\">版本号：3.0.161109</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">这个版本是初始发布到网络上的版本，实现的功能大致有：</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">1、普通单表的crud</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">2、aev前台校验</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">3、11种AevZdType(<span style=\"font-family: 仿宋, FangSong; font-size: 18px;\">INPUT,PIC,RICH,HIDDEN,TEXT,SELECT,TEXTAREA,PASSWORD,ZDB,CHECKBOX.RADIO</span>)</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">4、查询区支持eq、like、&gt;、&lt;、==、！=，以及def默认值</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">5、支持自定义字段（sql、style、pic、ext、text）、自定义操作区</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">6、表单校验，动态引入js及jsp文件<br/></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">7、aev及del的动态嵌入hook</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">8、普通aev表单直接展示<br/></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">9、约8种自带模型，可自定义模型</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">10、网站整站及部分静态化</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 楷体, 楷体_GB2312, SimKai; font-size: 20px;\">后续版本的计划是根据实际的业务需求继续完善功能，强化list和aev两个页面的功能，增加更多好用的配置项。</span><br/></p>', null, '', '', null, '5', '2016-11-24 11:20:31', '2016-11-24 14:47:09', '0', '38', '', '/alitjp/bbgx_detail.dhtml?id=154', '/alitjp/static/neirong/bbgx_detail/154.html', 'bbgx_detail');
INSERT INTO `tjpcms_tywz` VALUES ('155', '153', '22', '<p>333</p>', null, '', '', null, '0', '2016-12-13 17:46:22', '2016-12-13 17:46:22', '1', '39', '', '/alitjp/huanjing_detail.dhtml?id=155', null, 'huanjing_detail');
INSERT INTO `tjpcms_tywz` VALUES ('156', '153', '111', '<p>222</p>', null, '', '', null, '0', '2016-12-13 17:47:14', '2016-12-13 17:47:08', '1', '40', '', null, null, 'huanjing_detail');
INSERT INTO `tjpcms_tywz` VALUES ('157', '153', '22', '<p>222</p>', null, '', '', null, '0', '2016-12-13 17:48:00', '2016-12-13 17:47:59', '1', '41', '', null, null, 'huanjing_detail');
INSERT INTO `tjpcms_tywz` VALUES ('158', '164', '2', '<p>2</p>', null, '', '', null, '0', '2016-12-14 10:18:36', '2016-12-14 10:18:36', '1', '42', '', '/alitjp/bbgx_detail.dhtml?id=158', null, 'bbgx_detail');
INSERT INTO `tjpcms_tywz` VALUES ('159', '154', 'tjpcms如何通过动态配置来实现增删改查的页面及功能', '<p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">其实任何应用的出现总是要解决一些问题的，tjpcms只所以出现呢，是因为作者在实际的工作过程中发现开发cms系统后台时有很多重复的工作，以开发后台一个友情链接的功能为例：</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">1、首先得建一个友情链接的表吧，设计字段类型、设置字段长度、主键、默认值等等这些工作。</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">2、其次都有个列表页面显示所有的友情链接，列表页还得有查询和分页的功能</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">3、要可以新增、编辑和查看某个友情链接，开发对应的功能和页面，要可以上传图片、编辑富文本等</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">4、新增和编辑时得有校验，不合格的数据不入库</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">5、单个删除和批量删除</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">当然对于一个熟手来说呢，以上5点也不是什么难事，页面和<span style=\"font-family: 黑体, SimHei; text-indent: 32px;\">java代码</span>基本就是copy改改，sql嘛也是基本换个名字，只不过就是要按照系统增删改查的那一套路子走一遍，自然少不了文件和代码的<span style=\"font-family: 黑体, SimHei; text-indent: 32px;\">各种</span>复制，虽说是麻烦了点，但也不是不能接受吧。那作者为什么要费时费力整个tjpcms出来呢，其实还是有渊源的，作者之前一份工作是做erp系统的（其实说白了也是crud，再加个导入导出统计吧），有两位同事在整合crud的路子上探索过，对我也是有不少启发，具体的后续再讲。</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">回到这个友情连接功能，如果用了tjpcms，这个功能如何实现呢？看下图：</span></p><p style=\"text-align: center; text-indent: 0em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\"><img src=\"/alitjp/ueditor/jsp/upload/image/20161122/1479801540305037551.png\" alt=\"1479801540305037551.png\" width=\"888\" height=\"343\" border=\"0\" vspace=\"0\" title=\"1479801540305037551.png\" style=\"width: 888px; height: 343px;\"/></span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">这个就是在tjpcms中配置友情链接的代码，主要就是设置查询区、表头表体区和aev(add，edit，view)的内容，设置好之后调用指定的接口和模板即可生成友情链接的增删该查页面及功能，如下图：</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family:黑体, SimHei\"></span></p><p><br/></p><p style=\"text-align: center; line-height: 2.5em;\"><img src=\"/alitjp/ueditor/jsp/upload/image/20161122/1479801894828045212.png\" style=\"\"/></p><p><br/></p><p style=\"text-align: center; line-height: 2.5em;\"><img src=\"/alitjp/ueditor/jsp/upload/image/20161123/1479884160410082894.png\" style=\"\"/></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">也就是说，通过代码中对crud对象的配置，即动态完成了友情链接的所有页面和功能，并且可以即时修改，即时生效，如在查询区增加对网址的查询，那么只要在cxs中增加一项即可，保存java文件后刷新页面，在列表页的查询区即增加了对网址的查询功能。再比如编辑友情链接需要增加一个备注字段，那么只要在tjpcms_yqlj表中增加一个备注字段，并在代码中的aev中增加一项，保存后刷新页面，页面中即多了一项备注可以保存。因此，使用了tjpcms后，维护一个crud功能的步骤只需要两步：</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">1、根绝实际业务需求创建一个表，设计好表的各个字段</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">2、根据实际业务需求配置crud，配置好后所有的页面和功能即完成</span></p><p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family: 黑体, SimHei; font-size: 16px;\">当然了，凡事有利必有弊，有弊也必有利，我在前文也提到了<span style=\"font-size: 16px; font-family: 黑体, SimHei; text-indent: 32px;\">有两位前同事在整合crud的路子上探索过，那么他们探索的结果和tjpcms相比又有哪些优势和劣势呢？有兴趣的请看</span></span><span style=\"text-indent: 32px; font-family: 黑体, SimHei; font-size: 16px;\"><a href=\"/alitjp/zatan_detail.dhtml?id=160\" target=\"_self\" title=\"前同事整合crud与tjpcms的比较\"> 前同事整合crud与tjpcms的比较&nbsp;</a>。</span></p>', null, '', 'tjpcms实时配置增删改查', null, '1', '2017-01-05 15:12:53', '2017-01-05 17:37:52', '0', '37', '', '/alitjp/jiandan_detail.dhtml?id=159', '/alitjp/static/neirong/jiandan_detail/159.html', 'jiandan_detail');
INSERT INTO `tjpcms_tywz` VALUES ('199', '167', '测试1', '22', null, null, null, null, '0', '2017-01-06 16:25:42', '2016-01-06 16:23:20', '0', '1', null, '/alitjp/dashi_detail.dhtml?id=199', null, 'dashi_detail');
INSERT INTO `tjpcms_tywz` VALUES ('299', '167', '测试2016', '<p>33</p>', null, '', '', null, '0', '2017-01-06 16:26:50', '2017-01-02', '0', '2', '', '/alitjp/dashi_detail.dhtml?id=299', null, 'dashi_detail');
INSERT INTO `tjpcms_tywz` VALUES ('300', '167', '111', '<p>222</p>', null, '', '', null, '0', '2017-01-06 17:19:49', '2017-01-25', '0', '45', '', '/alitjp/dashi_detail.dhtml?id=300', null, 'dashi_detail');
INSERT INTO `tjpcms_tywz` VALUES ('161', '167', '完成第一个基于jeecms的网站二次开发', '<p style=\"text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 20px; font-family: 仿宋, FangSong;\">其实在这个时间点之前一直处于遍地是php的cms但那时还玩不转php，java类cms完全是非主流但自己又只青睐来java开发尴尬境地。这个点之前自己还下过dedecms的视频学习，什么老李dede888仿站，看了半天似懂非懂的，后来想还是找找java的cms吧，网上一圈搜索也就这个jeecms勉强能用吧，算是网上有点诚意的产品，不过商用收费的啦，而且用过之后发现这玩意效率奇低，就一最简单的新闻类cms，启动一下等好几分钟，追了一下代码，我滴妈，套了不知道多少层，还是用的freemarker模板，什么shiro权限控制，我用jeecms实际开发了这个网站后，对它已经全无好感了，二开特别费劲，一个登陆后自动跳转的功能就搞了我半天，一个列表页字段查询的功能追了好久代码才发现系统其实自带这功能，但是文档里不说。只不过聊胜于无，有总比没有好，就这么也用了一段时间，在熟悉的过程中也逐渐总结出来cms最常用的功能是什么，有哪些可以改进的，可以说是tjpcms的一个启蒙。</span></p>', null, '', 'jeecms tjpcms', null, '0', '2017-01-06 15:25:26', '2017-01-06 16:23:20', '0', '44', '', '/alitjp/dashi_detail.dhtml?id=161', null, 'dashi_detail');
INSERT INTO `tjpcms_tywz` VALUES ('160', '152', '前同事整合crud与tjpcms的比较', '<p style=\"white-space: normal; text-indent: 2em; line-height: 2.5em;\"><span style=\"font-family:黑体, SimHei\"><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">之前一份工作的两位同事对整合crud的方法有过实际的工作成果，分别如下：</span></span></p><p style=\"white-space: normal; text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">1、第一位同事采取的方法是：建一张crud的通用表，crud所有的相关数据都存到这个表里。还是以友情链接为例，在系统后台的某个菜单里，开发者先以可视化的方式来设计友情链接功能需要维护的字段的相关属性，如名称、长度、排列位置、style等，设置好了点保存，数据就到crud通用表里了，其实此时用户需要维护一个什么样的表，各个表字段分别是什么名称、类型、怎么排列的等等，系统已经完全了解了，然后开发者再借助通用的controller代码和通用的前台模板将功能页面展示出来，其实等于主要的工作就是在那个可视化的页面里设置表字段内容，设置好之后，剩下的工作都是由通用代码和模板自行完成的，开发者就不需要知道具体的实现细节了。这套方法的好处是可视化非常方便，基本不需要写代码就能完成一个简单的crud页面及功能了，因使用的是同一个模板，可以做到改进一点，所有页面受益，缺点是功能非常有限，仅限于比较简单的curd功能，没有拓展的能力，因模板要兼容不同的crud页面，因此模板会比较复杂，不好修改，数据存在crud的通用表里，维护也稍显不便。</span></p><p style=\"white-space: normal; text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">2、第二位同事采取的方法是：不再强求不同的crud功能使用同一个模板，而是每个不同的crud功能使用各自独立的一套模板，举个例子：友情链接维护功能使用yqlj文件夹下的list页面展示列表，edit页面新增编辑查看内容，国内新闻维护功能使用gnxw文件夹下的list页面展示列表，edit页面新增编辑查看内容，以此类推。这样会带来两个问题：一是同名的文件太多，如果单凭文件名来查找文件会搜索出一大堆；二是每次新增一个crud维护的功能都需要建对应的实体文件、list、edit文件、xml配置文件等等，重复工作量很大。我这位同事的解决办法是，对于第一个问题，做了一个eclipse插件，可以根据文件的路径名来查找文件，选中路径后按快捷键即找到对应的文件。第二个问题还是用插件解决，只不过这个插件是比较复杂的了，根据指定的实体文件，业务上的需求可以通过gui页面直接配置，最后插件根据各种配置的内容直接生成该curd功能所需要的所有文件，因此生成后基本的页面和功能也就有了。当然这并不意味着开发者点点鼠标输入什么的就搞定了，因为相比上一个同事的方法，这种解决办法的初衷显然是希望让用户在通用的页面及功能基础上可以做更多的再开发工作，插件只是替你打了个基础框架，楼还得自己盖。只不过对于最最简单的crud功能而言，那基本上鼠标点点一生成也就搞定了。那么这套方法的优点是没有通用模板和通用代码的束缚了，根据业务需求实现什么样的功能都可以，不同的crud功能代码都是独立的，方便修改，插件也可以根据实际的业务需求不断改进完善。缺点是节省的工作量比较有限，插件基本只做到了本来由人来复制文件、复制代码的工作改成了由程序完成，生成结束后插件的作用也就结束了，不使用模板也没法做到一改全改。</span></p><p style=\"white-space: normal; text-indent: 2em; line-height: 2.5em;\"><span style=\"font-size: 16px; font-family: 黑体, SimHei;\">tjpcms算是一个杂糅和拓展吧。首先我认为模板还是利大于弊的，比如用模板生成了1000个crud的功能模块，那么如果模板改进了一个显示或者功能，那么收益的是这1000个功能模块及后续的模块，对于个性化确实比较强，比较特殊的功能模块，那就由开发者自行另外开发一套，即能套模板的套模板，不能套模板的自行开发；其次以上两套方法有一个核心的共同点，就是追求重复性的工作自动化，tjpcms正是在这一点上做了拓展，通过由开发者来配置crud对象的方式，来自动完成常见的各类crud功能模块，list和aev两个模板的功能开发的比较完善，查询、分页、校验、保存、富文本、文件上传等等功能都通过配置来完成，大大减轻了开发人员的重复劳动，使得集中精力在业务的开发上。另外tjpcms的优势在于，用tjpcms开发一个网站，针对实际的需求做完善和改进，其实用性就上一个档次，我追求的目标是除非是比较不常见的需求，否则大多数的crud模块都可以都直接配出来。</span></p><p style=\"white-space: normal; text-indent: 2em; line-height: 2.5em;\"><font face=\"黑体, SimHei\">最后，为什么tjpcms不打算弄个页面来直接操作数据库呢，像jeecms和dedecms里都有模块可以直接操作表字段，dedecms是可以直接建表，jeecms是不建表只建表字段。因为根据我个人的实际使用来看，如果有个可以直接操作数据库表的口子，会存在一个问题：系统部署上线后运行中，突然提出来了要二次开发，你在开发过程中又不能要求现网就不能用了吧，现网就有可能变动了数据库，你开发时也会变动数据库，这样就没法同步了，所以其实干脆不给用户留操作数据库的口子吧。</font></p>', null, '', '', null, '0', '2017-01-05 17:31:14', '2017-01-06 14:47:11', '0', '43', '', '/alitjp/zatan_detail.dhtml?id=160', '/alitjp/static/neirong/zatan_detail/160.html', 'zatan_detail');

-- ----------------------------
-- Table structure for `tjpcms_yqlj`
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_yqlj`;
CREATE TABLE `tjpcms_yqlj` (
  `id` int(11) NOT NULL auto_increment,
  `mc` varchar(100) NOT NULL,
  `wz` varchar(100) NOT NULL,
  `logo` varchar(50) default NULL,
  `px` int(11) NOT NULL default '1',
  `gx` varchar(30) NOT NULL,
  `cs` int(11) NOT NULL default '0' COMMENT '点击次数',
  `rq` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tjpcms_yqlj
-- ----------------------------
INSERT INTO `tjpcms_yqlj` VALUES ('57', '拼图Pintuer', 'http://www.pintuer.com/', '', '1', '2016-11-01 10:59:26', '0', '2016-11-01 10:52:38');
INSERT INTO `tjpcms_yqlj` VALUES ('58', 'LigerUI', 'http://www.ligerui.com/', '', '2', '2016-11-01 10:59:32', '0', '2016-11-01 10:53:31');
INSERT INTO `tjpcms_yqlj` VALUES ('59', 'Iconfont', 'http://www.iconfont.cn/plus', '', '3', '2016-11-01 10:59:36', '0', '2016-11-01 10:54:42');
INSERT INTO `tjpcms_yqlj` VALUES ('60', 'PublicCMS', 'http://www.publiccms.com/', '', '4', '2016-11-01 10:55:48', '0', '2016-11-01 10:55:48');
INSERT INTO `tjpcms_yqlj` VALUES ('61', 'JEECMS', 'http://www.jeecms.com/', '', '5', '2016-11-01 10:56:20', '0', '2016-11-01 10:56:20');
INSERT INTO `tjpcms_yqlj` VALUES ('62', '织梦CMS', 'http://www.dedecms.com/', '', '6', '2016-11-01 10:57:07', '0', '2016-11-01 10:57:07');
INSERT INTO `tjpcms_yqlj` VALUES ('63', 'Layui', 'http://www.layui.com/', '', '7', '2016-11-01 13:11:11', '0', '2016-11-01 10:59:01');

-- ----------------------------
-- Table structure for `tjpcms_zdb`
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_zdb`;
CREATE TABLE `tjpcms_zdb` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `mc` varchar(100) NOT NULL,
  `py` varchar(100) NOT NULL,
  `rq` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `gx` varchar(30) NOT NULL,
  `px` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tjpcms_zdb
-- ----------------------------
INSERT INTO `tjpcms_zdb` VALUES ('4', '栏目类型', 'lanmuleixing', '2016-06-16 17:16:23', '2016-06-16 17:16:23', '1');
INSERT INTO `tjpcms_zdb` VALUES ('8', '江苏省地级市', 'jsdijishi', '2016-06-22 18:04:34', '2016-06-22 18:04:34', '3');
INSERT INTO `tjpcms_zdb` VALUES ('9', '导航栏显示', 'navxs', '2016-06-23 14:46:01', '2016-06-23 15:40:37', '4');
INSERT INTO `tjpcms_zdb` VALUES ('11', '是否', 'shifou', '2016-06-30 10:49:47', '2016-06-30 10:49:47', '6');
INSERT INTO `tjpcms_zdb` VALUES ('12', '是不是', 'shibushi', '2016-06-30 17:31:57', '2016-06-30 17:31:57', '7');
INSERT INTO `tjpcms_zdb` VALUES ('22', '文章审核状态', 'wzshzt', '2016-07-20 14:42:43', '2016-07-20 14:42:53', '13');
INSERT INTO `tjpcms_zdb` VALUES ('25', '否是', 'foushi', '2016-09-14 16:15:52', '2016-09-14 16:15:52', '16');
INSERT INTO `tjpcms_zdb` VALUES ('27', '捐赠来源', 'juanzenglaiyuan', '2016-12-14 09:52:08', '2016-12-14 09:52:08', '17');

-- ----------------------------
-- Table structure for `tjpcms_zdx`
-- ----------------------------
DROP TABLE IF EXISTS `tjpcms_zdx`;
CREATE TABLE `tjpcms_zdx` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `pid` int(11) NOT NULL,
  `zdxmc` varchar(100) NOT NULL,
  `zdxpy` varchar(100) NOT NULL COMMENT '字典项拼音',
  `bz` varchar(60) default NULL,
  `rq` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `gx` varchar(30) NOT NULL,
  `px` int(11) NOT NULL,
  `test` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=102 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tjpcms_zdx
-- ----------------------------
INSERT INTO `tjpcms_zdx` VALUES ('11', '4', '单行文本', 'danhangwenben', null, '2016-06-21 20:07:05', '2016-06-21 20:07:05', '4', null);
INSERT INTO `tjpcms_zdx` VALUES ('10', '4', '富文本', 'fuwenben', null, '2016-06-21 20:06:56', '2016-06-21 20:06:56', '3', null);
INSERT INTO `tjpcms_zdx` VALUES ('13', '4', '外部链接', 'waibulianjie', null, '2016-06-22 09:00:44', '2016-06-22 09:00:44', '5', null);
INSERT INTO `tjpcms_zdx` VALUES ('14', '4', '父栏目zi', 'fulanmu_zi', '栏目树中点击后后是显示的是直接子栏目列表', '2016-06-22 09:33:24', '2016-11-25 12:51:28', '6', null);
INSERT INTO `tjpcms_zdx` VALUES ('15', '4', '父栏目nr', 'fulanmu_nr', '栏目树中点击后显示的是所有子栏目的内容列表', '2016-06-22 14:12:22', '2016-11-25 12:51:20', '7', null);
INSERT INTO `tjpcms_zdx` VALUES ('21', '8', '南京市', 'nanjingshi', '', '2016-06-22 18:04:44', '2016-06-22 18:04:44', '13', null);
INSERT INTO `tjpcms_zdx` VALUES ('22', '8', '无锡市', 'wuxishi', '', '2016-06-22 18:05:03', '2016-06-22 18:05:03', '14', null);
INSERT INTO `tjpcms_zdx` VALUES ('23', '8', '徐州市', 'xuzhoushi', '', '2016-06-22 18:05:09', '2016-06-22 18:05:09', '15', null);
INSERT INTO `tjpcms_zdx` VALUES ('24', '8', '常州市', 'changzhoushi', '', '2016-06-22 18:05:18', '2016-06-22 18:05:18', '16', null);
INSERT INTO `tjpcms_zdx` VALUES ('25', '8', '苏州市', 'suzhoushi', '', '2016-06-22 18:05:24', '2016-06-22 18:05:24', '17', null);
INSERT INTO `tjpcms_zdx` VALUES ('26', '8', '南通市', 'nantongshi', '', '2016-06-22 18:05:30', '2016-06-22 18:05:30', '18', null);
INSERT INTO `tjpcms_zdx` VALUES ('27', '8', '连云港市', 'lianyungangshi', '', '2016-06-22 18:05:35', '2016-06-22 18:05:35', '19', null);
INSERT INTO `tjpcms_zdx` VALUES ('28', '8', '淮安市', 'huaianshi', '', '2016-06-22 18:05:39', '2016-06-22 18:05:39', '20', null);
INSERT INTO `tjpcms_zdx` VALUES ('29', '8', '盐城市', 'yanchengshi', '', '2016-06-22 18:05:44', '2016-06-22 18:05:44', '21', null);
INSERT INTO `tjpcms_zdx` VALUES ('30', '8', '扬州市', 'yangzhoushi', '', '2016-06-22 18:05:49', '2016-06-22 18:05:49', '22', null);
INSERT INTO `tjpcms_zdx` VALUES ('31', '8', '镇江市', 'zhenjiangshi', '', '2016-06-22 18:05:54', '2016-06-22 18:05:54', '23', null);
INSERT INTO `tjpcms_zdx` VALUES ('32', '8', '泰州市', 'taizhoushi', '', '2016-06-22 18:05:59', '2016-06-22 18:05:59', '24', null);
INSERT INTO `tjpcms_zdx` VALUES ('33', '8', '宿迁市', 'suqianshi', '', '2016-06-22 18:06:15', '2016-06-22 18:06:15', '25', null);
INSERT INTO `tjpcms_zdx` VALUES ('34', '9', '显示', '1', '', '2016-06-23 14:46:12', '2016-06-23 15:40:49', '26', null);
INSERT INTO `tjpcms_zdx` VALUES ('35', '9', '不显示', '0', '', '2016-06-23 14:46:18', '2016-06-23 15:40:56', '27', null);
INSERT INTO `tjpcms_zdx` VALUES ('42', '11', '是', 'shi', '', '2016-06-30 10:49:54', '2016-06-30 10:49:54', '32', null);
INSERT INTO `tjpcms_zdx` VALUES ('43', '11', '否', 'fou', '', '2016-06-30 10:50:02', '2016-06-30 10:50:02', '33', null);
INSERT INTO `tjpcms_zdx` VALUES ('44', '12', '是', 'shi', '', '2016-06-30 17:32:05', '2016-06-30 17:32:05', '34', null);
INSERT INTO `tjpcms_zdx` VALUES ('45', '12', '不是', 'bushi', '', '2016-06-30 17:32:10', '2016-06-30 17:32:10', '35', null);
INSERT INTO `tjpcms_zdx` VALUES ('50', '4', '图片类', 'tupianlei', '', '2016-07-12 10:41:59', '2016-07-12 10:41:59', '40', null);
INSERT INTO `tjpcms_zdx` VALUES ('95', '4', '留言', 'liuyan', '', '2016-11-04 09:54:47', '2016-11-04 09:54:47', '74', null);
INSERT INTO `tjpcms_zdx` VALUES ('88', '4', '互动', 'hudong', '', '2016-11-01 10:38:09', '2016-11-01 10:38:09', '70', null);
INSERT INTO `tjpcms_zdx` VALUES ('96', '4', '只显示', 'zhixianshi', '', '2016-11-04 10:00:15', '2016-11-04 10:00:15', '75', null);
INSERT INTO `tjpcms_zdx` VALUES ('90', '4', '捐赠', 'juanzeng', '', '2016-11-01 11:30:07', '2016-11-01 11:30:07', '72', null);
INSERT INTO `tjpcms_zdx` VALUES ('97', '4', '问答', 'wenda', '', '2016-11-04 11:57:47', '2016-11-04 11:57:47', '76', null);
INSERT INTO `tjpcms_zdx` VALUES ('92', '4', '通用文章', 'tywz', '包含标题，摘要，图片，内容和备注等', '2016-11-01 15:06:17', '2016-11-25 12:50:53', '3', null);
INSERT INTO `tjpcms_zdx` VALUES ('93', '4', '图文教程', 'tuwenjiaocheng', '', '2016-11-01 15:12:59', '2016-11-01 15:12:59', '73', null);
INSERT INTO `tjpcms_zdx` VALUES ('69', '22', '待审核', 'daishenhe', '', '2016-07-20 14:43:03', '2016-07-20 15:33:48', '55', null);
INSERT INTO `tjpcms_zdx` VALUES ('70', '22', '审核通过', 'yishenhe', '', '2016-07-20 14:43:09', '2016-07-20 14:49:32', '56', null);
INSERT INTO `tjpcms_zdx` VALUES ('71', '22', '审核不通过', 'butongyi', '', '2016-07-20 14:47:31', '2016-07-20 14:49:37', '57', null);
INSERT INTO `tjpcms_zdx` VALUES ('72', '22', '退回修改', 'tuihuixiugai', '', '2016-07-20 14:51:57', '2016-07-20 14:51:57', '58', null);
INSERT INTO `tjpcms_zdx` VALUES ('80', '25', '否', 'fou', '', '2016-09-14 16:15:58', '2016-09-14 16:15:58', '66', null);
INSERT INTO `tjpcms_zdx` VALUES ('81', '25', '是', 'shi', '', '2016-09-14 16:16:03', '2016-09-14 16:16:03', '67', null);
INSERT INTO `tjpcms_zdx` VALUES ('98', '27', '支付宝', 'zhifubao', '', '2016-12-14 09:53:18', '2016-12-14 09:53:18', '77', null);
INSERT INTO `tjpcms_zdx` VALUES ('99', '27', '微信支付', 'weixinzhifu', '', '2016-12-14 09:53:24', '2016-12-14 09:53:24', '78', null);
INSERT INTO `tjpcms_zdx` VALUES ('100', '4', '网站互动信息', 'wzhdxx', '', '2016-12-14 17:34:20', '2016-12-15 09:50:26', '79', null);
INSERT INTO `tjpcms_zdx` VALUES ('101', '4', '大事记', 'dashiji', '', '2017-01-09 16:43:14', '2017-01-09 16:43:14', '80', null);

-- ----------------------------
-- Table structure for `t_hd`
-- ----------------------------
DROP TABLE IF EXISTS `t_hd`;
CREATE TABLE `t_hd` (
  `id` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL,
  `lx` varchar(20) NOT NULL,
  `rq` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `nr` varchar(1000) default NULL,
  `ip` varchar(30) NOT NULL,
  `ag` varchar(3000) NOT NULL,
  `yd` varchar(1) NOT NULL default '0',
  `delf` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hd
-- ----------------------------
INSERT INTO `t_hd` VALUES ('1', '171', '捐赠反馈', '2016-12-14 17:25:26', '12233444', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36', '1', '0');
INSERT INTO `t_hd` VALUES ('2', '171', '捐赠反馈', '2016-12-14 17:26:52', '2222', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36', '1', '0');
INSERT INTO `t_hd` VALUES ('3', '172', '首页点赞', '2016-11-24 18:09:44', '', '180.98.60.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_0_2 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) Mobile/14A456 QQ/6.5.9.426 V1_IPH_SQ_6.5.9_1_APP_A Pixel/1080 Core/UIWebView NetType/4G Mem/52', '1', '0');
INSERT INTO `t_hd` VALUES ('4', '172', '首页点赞', '2016-11-24 18:56:44', '', '183.212.244.45', 'Mozilla/5.0 (Linux; U; Android 4.1.2; zh-CN; LT26i Build/6.2.B.1.96) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.9.2.712 U3/0.8.0 Mobile Safari/534.30', '1', '0');

-- ----------------------------
-- Table structure for `t_jz`
-- ----------------------------
DROP TABLE IF EXISTS `t_jz`;
CREATE TABLE `t_jz` (
  `id` int(11) NOT NULL auto_increment,
  `cid` int(11) NOT NULL,
  `jzr` varchar(20) NOT NULL,
  `je` varchar(20) NOT NULL,
  `ly` varchar(20) NOT NULL,
  `jzrq` varchar(20) NOT NULL,
  `rq` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `gx` varchar(20) NOT NULL,
  `delf` int(11) NOT NULL default '0',
  `bz` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jz
-- ----------------------------
INSERT INTO `t_jz` VALUES ('11', '145', 'sharvy', '6.66', '支付宝', '2016-11-23', '2016-12-14 10:09:04', '2016-12-14 10:14:20', '0', '');
INSERT INTO `t_jz` VALUES ('12', '145', 'CT', '8.8', '支付宝', '2016-11-24', '2016-12-14 10:14:40', '2016-12-14 10:14:40', '0', '');
