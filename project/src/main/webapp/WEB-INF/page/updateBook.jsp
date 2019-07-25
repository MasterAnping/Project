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
</head>

<body>
	<%@ include file="common/head.jsp"%>
	<div class="container">
		<div class="row">
			<h1>图书修改！</h1>
			<div class="panel panel-default">
				<div class="panel-body">
					<form role="form" id="update_form" action="${ctx}/book/manage/updateCheck"
						enctype="multipart/form-data" method="post">
						<input type="hidden" name="bookId" value="${book.bookId}">
						<input type="hidden" name="bookPic" value="${book.bookPic}">
						<div class="row">
							<div class="col-md-10">
								<div class="form-group">
									<label for="bookName">图书名称</label> <input type="text"
										class="form-control" id="bookName" name="bookName"
										value="${book.bookName}">
								</div>
								<div class="form-group">
									<label for="writer">作者</label> <input type="text"
										class="form-control" id="writer" name="writer"
										value="${book.writer}">
								</div>
								<div class="form-group">
									<label for="press">出版社</label> <input type="text"
										class="form-control" id="press" name="press"
										value="${book.press}">
								</div>
							</div>
							<div class="col-md-2">
								<div class="form-group">
									<a class="thumbnail"> <img class="carousel-inner img-responsive img-rounded"
										src="${ctx}/bookPic/${book.bookPic}" alt="...">
									</a>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="form-group col-md-3">
									<label for="category">图书分类</label> <select class="form-control"
										id="category" name="category.cateId">
										<c:forEach var="category" items="${categorys}">
											<option value="${category.cateId}"
												<c:if test="${category.cateId==book.category.cateId}">selected</c:if>>${category.cateName}</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group col-md-2">
									<label for="price">价格</label> <input type="text"
										class="form-control" id="price" name="price"
										value="${book.price}">
								</div>
								<div class="form-group col-md-2">
									<label for="num">数量</label> <input type="text"
										class="form-control" id="num" name="num" value="${book.num}">
								</div>
								<div class="form-group col-md-3">
									<label for="bookPic">封面图</label> <input type="file"
										id="bookPic" name="file" >
								</div>

								<div class="form-group col-md-2">
									<label>是否上架</label><br /> <br /> <input type="radio"
										name="isDisplay" value="true"
										<c:if test="${book.isDisplay==true}">checked</c:if>>是
									<input type="radio" name="isDisplay" value="false"
										<c:if test="${book.isDisplay==false}">checked</c:if>>否
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="bookDesc">图书简述</label>
							<textarea class="form-control" rows="10" id="bookDesc"
								name="bookDesc">${book.bookDesc}</textarea>
						</div>



						<button type="submit" class="btn btn-default">提交</button>
					</form>
				</div>
			</div>

		</div>
	</div>
</body>
<script type="text/javascript">
	$().ready(function() {
		$("#update_form").bootstrapValidator({
			feedbackIcons : {
				valid : 'glyphicon glyphicon-ok',
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				bookName : {
					validators : {
						notEmpty : true
					}
				},
				writer : {
					validators : {
						notEmpty : true
					}
				},
				press : {
					validators : {
						notEmpty : true
					}
				},
				price : {
					validators : {
						notEmpty : true
					}
				},
				num : {
					validators : {
						notEmpty : true
					}
				},
				bookDesc : {
					validators : {
						notEmpty : true
					}
				}
			}
		});
	})
</script>

</html>