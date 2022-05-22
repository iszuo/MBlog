//头部搜索框方法
$(function(){
    //找到文本框，并注册得到焦点事件
    $(".ipt").focus(function(){
        //让当前得到焦点的文本框改变其背景色
        $(".sousuo").css("border","1px solid #ff8200");
    });
    //找到文本框，并注册失去焦点事件
    $(".ipt").blur(function(){
        //让当前失去焦点的文本框背景色变为白色
        $(".sousuo").css("border","none");
    });
});

//中间导航x显示更多
$(".gd").click(
    function(){
    $(".gengduo").slideToggle();
});

//回复框焦点
$(function(){
    $(".hfint").focus(function(){
        $(".hfint").css({"border":"1px solid #ff8200","background":"none"});
    })
})
$(function(){
    $(".hfint").blur(function(){
        $(".hfint").css({"background":"#F0F1F4","border":"none"});
    })
})

//回复
$(".middle_word_footer_pl").on('click',function (){
    $(this).parent().parent().parent().children("div").eq(3).slideToggle();
})


// 点赞
function DZan(id) {
    console.log($(this).children().eq(1).children().text())
    $.ajax({
        url: "/Home/AddZan/" + id,
        type: "get",
        contentType: "application/x-www-form-urlencoded",
        data: {
            "Msg_id": id
        },
        success: function (data) {
            if (data != "false") {
                //$(this).siblings("span").siblings().text(data);
                //window.location.href = "/Home/Index";
            } else {
                alert(1)
            }
        }
    })
}



// 评论
$(".btn_reply").click(function () {
    $.ajax({
        url: "/Home/Reply",
        type: "post",
        data: {
            "msg_id": $("#msg_id").val(),
            "texts": $("#texts").val()
        },
        success: function (data) {
            if (data == "true") {
                $(".huifu_div").slideToggle();
                $("#texts").val("");
                layer.msg("评论成功", { icon: 1 });
            } else {
                layer.msg(data, { icon: 2 });
            }
        }
    })
})
