/**
 * 用户登录
 */
function login() {
        $.ajax({
        //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "user/info" ,//url
            data: $('#form').serialize(),
            success: function (data) {
            	/* window.location.herf = data; */
            	alert(data);
                /* console.log(data);//打印服务端返回的数据(调试用)
                if (data.status == 200) {
                    alert("SUCCESS");
                    window.location.herf = "index.jsp";
                    return;
                } */
            },
            error : function() {
                alert("异常！");
            }
        });
}