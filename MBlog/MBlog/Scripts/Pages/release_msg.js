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
    $(this).parent().parent().parent().children("div").eq(4).slideToggle();
})
$(".img_video").click(
    function(){
    $(".wenjian").slideToggle();
});

//当file改变的时候，将img的src改为修改后的值
$($('#file').change(function () {
    var location = $("#file").val();
    var point = location.lastIndexOf(".");
    var type = location.substr(point);
    f = document.getElementById('file').files[0];
    var reads = new FileReader();
    reads.readAsDataURL(f);
    reads.onload = function(e) {
        if(f){
            if(type==".jpg" || type==".gif" || type==".png" || type==".JPG" ||type==".PNG"){
                $('.fabu_img')[0].src = this.result;
                $('.fabu_video')[0].src = "";
            }else if(type==".mp4"){
                $('.fabu_video')[0].src = this.result;
                $('.fabu_img')[0].src ="";
            }else{
                alert("上传格式错误");
            }
        }else{
            alert("不能为空文件");
        }
    }
}))
// 点击button来点击input:file
$('.img_a').click(function () {
    $(".fabu_img").slideToggle();
    // $('.wenjian').click()
})
$(".fabu_img").click(function(){
    $("#file").click()
})
$(".video_a").click(function(){
    $("#file").click()
    $(".fabu_video").css({"display":"block"});
    $(".fabu_img").css({"display":"none"});
})

// 回复
$(function () {
    $(".btn_reply").click(function () {
        $.ajax({
            url: "/Home/Reply",
            type: "post",
            data: {
                
                "msg_id": $(this).prev().prev().prev().val(),
                "texts": $(this).prev().prev().val(),
            },
            success: function (data) {
                if (data == "true") {
                    $(this).parent().parent().slideToggle();
                    $(this).parent().parent().next().slideToggle();
                    $(".texts").val('');
                    //$(".huifu_pinglun").slideToggle();
                    layer.msg("评论成功", { icon: 1 });
                } else {
                    layer.msg(data, { icon: 2 });
                }
            }
        })
    })
})
