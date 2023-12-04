$(document).ready(function() {
		 $("#trigger1Click").trigger('click')
		 
		//bắt sự kiện click nút delete trong table 
		$(".btnShipper").click(function() {
			
			var id = $(this).attr("data-id")
			var str="#btnShipper"+id
			$('#shipper').val(str);
			$("#shipperModal").modal('show')
			
		})
		$("#shipper").click(function() {
			
			var idShipper=$('#cmbShipper').val()
			var link = $('#shipper').val();
			var idOrder= $(link).attr("data-id")
			var email= $(link).attr("data-email")
			var dataButton = $(this).attr('data-button');
			$.ajax({
				type : "post",
				url : "/ShopSmartPhone/orderAdminServlet",
				data : {
					idShipper : idShipper,
					idOrder : idOrder,
					email : email,
					dataButton : dataButton
				},
				success : function(response) {
					if (response == "success") {
						$('.modal-backdrop').remove()
						$('#content').load('../Admin/OrderAdmin.jsp');
						$("#trigger2Click").trigger('click')
					}
				}
			});
		})
			//hàm chuyển các giá trị trong col thành chữ thường LowerCase()
		$.extend($.expr[":"], {"containsNC": function(elem, i, match, array) {
        return (elem.textContent || elem.innerText || "").toLowerCase().indexOf((match[3] || "").toLowerCase()) >= 0;
			}
			});
		//bắt sự kiện search, giá trị nhập vào thành chữ thường 
		$("#btn-Search").click(function() {
			var a = $("#text-Search").val().toLowerCase();
			    $(".tableViewContent td.colName:containsNC('" +a + "')").parent().show();
		        $(".tableViewContent td.colName:not(:containsNC('" +a+ "'))").parent().hide();
		})

	
		
	})
		function complete(a){
			var str="#btnComplete"+a;
			$("#btnduyetComplete").val(str)
			$("#duyetModal").modal('show')
			$("#btnduyetComplete").click(function(){
				var str=$("#btnduyetComplete").val()
				var dataButton  = $(str).attr('data-button')
				var idOrder = $(str).attr('data-id')
				$.ajax({
					type : "post",
					url : "/ShopSmartPhone/orderAdminServlet",
					data : {
						idOrder : idOrder,
						dataButton : dataButton
					},
					success : function(response) {
						if (response == "success") {
							$("#duyetModal").modal('hide')
							$('.modal-backdrop').remove()
							$('#content').load('../Admin/OrderAdmin.jsp');
							$("#trigger3Click").trigger('click')
						}
					}
				});
			})
			
		} 
