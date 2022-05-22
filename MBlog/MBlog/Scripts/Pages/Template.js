$(function(){
	// 头部导航颜色切换
	$(".template_center_list").click(function(){
		// 移除当前选中的颜色
		$(this).parent().parent().parent().children().children().children().removeClass("action");
		// 给当前点击的添加颜色
		$(this).addClass("action");
	})
	// 设置的二级菜单
	$(".login_menu").eq(0).click(function(){
		//var state = $("#Login_menu_list").css("display");
		//if(state == "none"){
		//	$("#Login_menu_list").css("display","block");
		//}else{
		//	$("#Login_menu_list").css("display","none");
		//}
		$("#Login_menu_list").slideToggle();
	})
	
	
	// 白天黑夜模式切换
	$("#sun").click(function () {
		$(this).css("display", "none");
		$("#moon").css("display", "block");
	})
	$("#moon").click(function () {
		$(this).css("display", "none");
		$("#sun").css("display", "block");
	})


})