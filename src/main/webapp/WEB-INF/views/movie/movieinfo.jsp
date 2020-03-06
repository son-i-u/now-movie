<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="en">
<%@ include file="../includes/header.jsp"%>
<body class="sb-nav-fixed">
	<%@ include file="../includes/nav.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">movie info</h1>
					</div>
					<!--  /.col-lg-12 -->
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading"></div>
							<!-- /.panel-heading -->

							<div class="panel-body">

								<div class="col-2">
									<img src="http://placehold.it/5x5" class="card-img"
										alt="...">
								</div>
								
								<div class="form-group">
									<label>��ȭ�̸�</label> <input class="form-control" name='bno'
										value="Ÿ��Ÿ��" readonly="readonly">
								</div>

								<div class="form-group">
									<label>�帣</label> <input class="form-control" name='title'
										value="����" readonly="readonly">
								</div>

								<div class="form-group">
									<label>�ٰŸ�</label>
									<textarea class="form-control" rows="3" name='content'
										readonly="readonly"> Ÿ��Ÿ�� ȣ�� ħ���ϱ� 2��Ʋ��.. �Ƹ��ٿ� ����̾߱�</textarea>
								</div>

								<div class="form-group">
									<label>������</label> <input class="form-control" name='writer'
										value="20190909" readonly="readonly">
								</div>

								<button data-oper='list' class="btn btn-info"
									onclick="location.href='/board/list'">List</button>

							</div>
							<!-- end panel-body -->
						</div>
						<!-- end panel-body -->
					</div>
					<!--  end panel -->
				</div>
				<!-- /.row -->
			</div>
		</main>
	</div>
</body>
</html>
