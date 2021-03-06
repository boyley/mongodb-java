DROP TABLE IF EXISTS tbl_cms_navigation;
CREATE TABLE tbl_cms_navigation (
  id varchar(32) NOT NULL,
  navigation_name varchar(10) NOT NULL COMMENT '导航名称',
  order_sn int(1) NOT NULL comment '排序',
  deleteflag int(1) NOT NULL comment '启用标识 1启用, 0 禁用',
  navigation_no varchar(50) DEFAULT NULL COMMENT '导航编码',
  url varchar(255) DEFAULT NULL COMMENT '频道链接地址',
  has_child tinyint(4) DEFAULT '0' COMMENT '是否有子导航：0-无，1-有',
  link_open_type tinyint(4) DEFAULT '1' COMMENT '链接打开方式：0 - 新窗口打开; 1 - 原窗口打开',
  create_time datetime DEFAULT NULL COMMENT '创建时间',
  color varchar(7) DEFAULT NULL COMMENT '导航文本颜色RGB值',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目频道';
