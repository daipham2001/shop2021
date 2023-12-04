
"use strict";

function pad(n) {
    return (n < 10) ? ("0" + n) : n;
}
$(document).ready(function() {
            $("#btnplus").click(function() {
                var quantityCart = parseInt($(this).attr("data-quantityCart"))
                var quan = parseInt($("#quantity").val())
                var parse = quan + 1
                var unitInstock = parseInt($("#btnplus").attr("data-quantity"))
                var stillQuantity = unitInstock - quantityCart
                $("#quantity").val(parse)
                if (quan == stillQuantity) {
                    $("#quantity").val(stillQuantity)
                }

            })
            $("#btnminus").click(function() {
                var quan = parseInt($("#quantity").val())
                var parse = quan - 1
                $("#quantity").val(parse)
                if (quan == 1) {
                    $("#quantity").val(1)
                }
                if (quan == 0) {
                    $("#quantity").val(0)
                }

            })
            $("#btnMua").click(function() {
                var id = $(this).attr("data-id")
                var quantity = $("#quantity").val()
                var comand = "plus"
                $.ajax({
                    type: "get",
                    url: "/ShopSmartPhone/cartServlet",
                    data: {
                        comand: comand,
                        productID: id,
                        quantity: quantity
                    },
                    success: function(response) {
                        if (response == "success") {
                            location.reload()
                        }
                    }
                });
            })
            $("#btnHetHang").click(function() {
                $("#hetHangModal").modal('show')
            })

            $("#btnShowComment").click(function() {
            alert("aaaa");
                $("#writeComment").css("display", "block")
                $("#btnShowComment").css("display", "none")
            })
            $("#btnLoginToComment").click(function() {
                $("#alertLoginModal").modal('show')
            })
            $("#btn-okToLogin").click(function() {
                $('#alertLoginModal').modal('hide').on('hidden.bs.modal', function(e) {
                    $('#LoginModal').modal('show');
                    $(this).off('hidden.bs.modal'); // Remove the 'on' event binding
                });
            })
            $("#textComment").keypress(function() {
                $("#alert_Comment").html('')
            })
            $("#btnComment").click(function() {
                var flag = 0
                var textComment = $("#textComment").val()
                //var valueStar=  $("input[name='star']:checked").val()
                var valueStar = parseInt($("#btnComment").val())
                console.log(valueStar)
                var idUser = $(this).attr("data-idUser")
                var idProduct = $(this).attr("data-idProduct")
                var dataButton = "addComment"
                if (textComment.trim() == '') {
                    $("#alert_Comment").html("(*)Phần bình luận không được để trống! ")
                    flag = 1
                }
                if (isNaN(valueStar)) {
                    $("#alert_Comment").html("(*)Bạn cần đánh giá sản phẩm! ")
                    flag = 1
                }
                if (flag == 0) {

                    $.ajax({
                        type: "post",
                        url: "/ShopSmartPhone/commentServlet",
                        data: {
                            textComment: textComment,
                            valueStar: valueStar,
                            idUser: idUser,
                            dataButton: dataButton,
                            idProduct: idProduct
                        },
                        success: function(response) {
                            if (response == "success") {
                                location.reload()
                            }
                        }
                    });
                }
            })
            /* ----------Rating----------- */
            $('#stars li').on('mouseover', function() {
                var onStar = parseInt($(this).data('value'), 10);
                $(this).parent().children('li.star').each(function(e) {
                    if (e < onStar) {
                        $(this).addClass('hover');
                    } else {
                        $(this).removeClass('hover');
                    }
                });

            }).on('mouseout', function() {
                $(this).parent().children('li.star').each(function(e) {
                    $(this).removeClass('hover');
                });
            });
            $('#stars li').on('click', function() {
                var onStar = parseInt($(this).data('value'), 10);
                $(this).parent().children('li.star').each((i, elem) => {
                    if (i < onStar) {
                        $(elem).addClass('selected');
                    } else {
                        $(elem).removeClass('selected');
                    }
                });
                var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
                console.log(ratingValue)
                $("#btnComment").val(ratingValue)
            });


            /* ----------Rating----------- */
            $("#deleteComment").click(function() {
                var idComment = $(this).attr("data-id")
                $("#deleteCommentUser").val(idComment)
                $("#deleteCommentModal").modal('show')
                $("#deleteCommentUser").click(function() {
                    var idComment = $("#deleteCommentUser").val()
                    var dataButton = "deleteComment"
                    $.ajax({
                        type: "post",
                        url: "/ShopSmartPhone/commentServlet",
                        data: {
                            dataButton: dataButton,
                            idComment: idComment
                        },
                        success: function(response) {
                            if (response == "success") {
                                location.reload()
                            } else if (response == "fail") {
                                alert("lỗi")
                            }
                        }
                    });
                })

            })
        })