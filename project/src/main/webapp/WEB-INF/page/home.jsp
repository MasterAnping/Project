<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%@ include file="common/tag.jsp"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My JSP 'MyJsp.jsp' starting page</title>
<%@ include file="common/label.jsp"%>
<style type="text/css">
/*-- post --*/
.post {
	margin: 3em 0 0 0;
}

.post h3 {
	color: #444444;
	font-size: 16px;
	margin: 0;
	font-family: 'Georgia Italic';
	font-style: italic;
	position: relative;
}

.post h3:after {
	content: '';
	background: url(../images/strip3.png) repeat 0px 0px;
	position: absolute;
	display: block;
	height: 10px;
	width: 82%;
	top: 30%;
	left: 14%;
}

.post-grids {
	margin: 2em 0;
	padding-bottom: 2em;
	border-bottom: 1px solid #F2F2F2;
}

.post-left img {
	width: 100%;
	height: 200px;
	padding: .5em;
	border: 1px solid #CBCBCB;
	margin: 0;
}

.post-right h4 {
	margin: 0;
}

.post-right h4 a {
	color: #444444;
	font-size: 14px;
	font-family: 'Open Sans', sans-serif;
	font-style: normal;
	font-weight: 600;
	text-decoration: none;
}

.post-right h4 a:hover {
	color: #e47600;
}

.post-right p.comments {
	color: #d7d7d7;
	font-size: 12px;
	margin: 1em 0;
	font-family: 'Georgia Italic';
	font-style: italic;
}

.post-right p.comments a {
	color: #d7d7d7;
	text-decoration: none;
}

.post-rightp.comments a:hover {
	color: #555555;
}

.post-right p.text {
	color: #555555;
	margin: 0;
	font-size: 13px;
	padding-bottom: 1em;
}
</style>
</head>
<body>
	<%@ include file="common/head.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="carousel slide" id="carousel-352008">
					<ol class="carousel-indicators">
						<li data-target="#carousel-352008" data-slide-to="0"></li>
						<li data-target="#carousel-352008" data-slide-to="1"></li>
						<li class="active" data-target="#carousel-352008"
							data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="item">
							<img alt="" src="${ctx}/image/picture1.jpg" />
							<div class="carousel-caption">
								<h4></h4>
								<p></p>
							</div>
						</div>
						<div class="item">
							<img alt="" src="${ctx}/image/picture2.jpg" />
							<div class="carousel-caption">
								<h4></h4>
								<p></p>
							</div>
						</div>
						<div class="item active">
							<img alt="" src="${ctx}/image/picture3.jpg" />
							<div class="carousel-caption">
								<h4></h4>
								<p></p>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-352008"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#carousel-352008"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>
			<div class="col-md-4">
				<div class="hero-unit">
					<h3>全新Kindle Oasis电子书阅读器</h3>
					<p>轻薄机身，配合皮质充电保护套可续航长达数月，300ppi超清电子墨水屏</p>
					<p>
						<a class="btn btn-primary btn-large" href="#">参看更多 ?</a>
					</p>
				</div>
				<div class="hero-unit">
					<h3>Fire亚马逊平板电脑咪咕权益版</h3>
					<p>享阅读：7英寸IPS屏，高品质电池；防蓝光模式；35余万册正版电子书，软硬兼修阅读好体验</p>
					<p>
						<a class="btn btn-primary btn-large" href="#">参看更多 ?</a>
					</p>
				</div>

			</div>
		</div>
		<hr />
		<div class="row">
			<div class="col-md-8">
				<!-- post -->
				<div class="post">
					<h3>图书列表</h3>
					
				</div>
				<!-- //post -->

				<nav>
					<ul id="pagination" class="pagination pagination-lg">
					</ul>
				</nav>
			</div>

			<div class="col-md-4">
				<ul class="nav nav-tabs nav-justified">
					<li role="presentation" class="active"><a href="#home"
						data-toggle="tab">销量排行</a></li>
					<li role="presentation"><a href="#profile" data-toggle="tab">我的足迹</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="home">
						<ul class="media-list" id="mostSale">

						</ul>
					</div>
					<div class="tab-pane" id="profile">
						<ul class="list-group" id="lastBooks">

						</ul>
					</div>
				</div>
			</div>
			<%-- <form action="${ctx }/home/test" method="get">
				 <input type="text" name="map['newsId']" />
				 <input type="text" name="map['newsName']" />
				<input type="submit" value="submit" />
			</form> --%>
		</div>
	</div>
</body>
<script type="text/javascript">


	

	
	
	
</script>

</html>