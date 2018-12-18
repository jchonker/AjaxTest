使用ajax方式发送请求，不在使用传统请求

1：
我们当前案例发送get请求

2:
案例：注册的时候，提示该用户是否已经注册

3：
用户名文本框市区焦点时，发送ajax请求，验证用户名是否可用，
可用的话，提供恭喜的信息(12号字体，绿色)，不可用的时候，提供错误信息(12号字体，红色)






ajax实现省市联动效果：

1：准备数据库表：
	将mysql数据库的jar包拷贝到WEB-INF/lib下面
	将DBUtils工具包拷贝到项目中
	建表，模拟数据
	
		drop table if exists t_city;
		drop table if exists t_provance;

		create table t_province(
			code char(3) primary key,
			name varchar(255)
		);
	
		insert into t_province(code,name) values('001',"山东省");
		insert into t_province(code,name) values('002',"山西省");
		insert into t_province(code,name) values('003',"河北省");
		
		create table t_city(
			code int primary key auto_increment,
			name varchar(255),
			pcode char(3),
			foreign key(pcode) references t_province(code)
		);

		insert into t_city(code,name,pcode) values('001',"保定市",'003');
		insert into t_city(code,name,pcode) values('002',"石家庄",'003');
		insert into t_city(code,name,pcode) values('003',"廊坊市",'003');
		insert into t_city(code,name,pcode) values('004',"张家口",'003');
		
		insert into t_city(code,name,pcode) values('005',"济南市",'001');
		insert into t_city(code,name,pcode) values('006',"淄博市",'001');
		insert into t_city(code,name,pcode) values('007',"青岛市",'001');
		insert into t_city(code,name,pcode) values('008',"烟台市",'001');
		
		insert into t_city(code,name,pcode) values('009',"太原市",'002');
		insert into t_city(code,name,pcode) values('010',"运城市",'002');
		insert into t_city(code,name,pcode) values('011',"大同市",'002');
		insert into t_city(code,name,pcode) values('012',"临汾市",'002');
		
		commit;
		
		select * from t_city;
		select * from t_province;
		
2：再页面加载完成后，发送ajax请求，获取所有省份，后台拼接一个JSON格式的字符串，发送给前端，前端解析JSON字符串拼接成HTML字符串，将HTML字符串设置到下拉列表里
JSON:
	[
		{
			"code":110,
			"name":"山东省"
		},
		{
			"code":110,
			"name":"山东省"
		},
		{
			"code":110,
			"name":"山东省"
		}
		
	]
前端接收到一个json字符串后，eval解析之后生成json对象，徐娅在前端使用循环语句取出一个json对象，每一个json对象都是一个省份，
然后<option value="110">山东省</option>,放到下拉列表<select>标签内部






解决ajax跨域请求的问题：
jsonp页面

端口号有6万多个，测试用的端口最好是3000以上的端口

