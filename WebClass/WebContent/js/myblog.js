$(document).ready(function() {
	$('#fullpage').fullpage();
});

function login() {
	var login_form = document.login_form;

	var l_id = login_form.l_id;
	var l_pw = login_form.l_pw;

	var check = l_id.value != '' && l_pw.value != '';

	if(check) {
		$.post("http://httpbin.org/post", {id: l_id.value, pwd: l_pw.value},
            function (data) {
				$('.modal-body').find('p').text(data.form.id + '님 로그인되었습니다.');
				$('#alertModal').modal()
            }
        );
	} else {
		$('.modal-body').find('p').text('아직 작성되지 않은 항목이 있습니다!')
		$('#alertModal').modal()
	}
}

$(document).ready(function () {
    $('#SigninForm').submit(function (event) {
        // submit이 자동으로 되는 기능 막기
        event.preventDefault();

        // id, pwd를 가져오기
//                document.getElementById("id").value
        var id = $('#id').val();
        var pwd = $('#pwd').val();
        //console.log(id, pwd);
        // 서버로 post 전송 (ajax)
        $.post("http://httpbin.org/post",
                { "id" : id , "pwd" : pwd },
                function (data) {
                    //alert(data.form.id + '님 로그인 되었습니다.');
                    var myModal = $('#myModal');
                    myModal.modal();
                    myModal.find('.modal-body').text(data.form.id + '님 로그인 되었습니다.');
                });
    });
});


$(document).ready(function () {
    $('#registerform').submit(function (event) {
        // submit이 자동으로 되는 기능 막기
        event.preventDefault();

        var id = $('#register-name').val();
        //console.log(id, pwd);
        // 서버로 post 전송 (ajax)
        $.post("http://httpbin.org/post",
                { "id" : id },
                function (data) {
                    //alert(data.form.id + '님 로그인 되었습니다.');
                    var myModal = $('#myModal');
                    myModal.modal();
                    myModal.find('.modal-body').text(data.form.id + '님 회원가입 되었습니다.');
                });
    });
});
// function register() {
// 	var register_form = document.register_form;
//
// 	var r_id = register_form.register_id;
// 	var r_pw = register_form.register_pw;
// 	var r_num = register_form.register_num;
// 	var r_name = register_form.register_name;
// 	var r_grade = register_form.grade;
// 	var r_clazz = register_form.clazz;
//
// 	var check = r_id.value != '' && r_pw.value != '' && r_num.value != '' && r_name.value != '' && r_grade.value != '' && r_clazz.value != '';
//
// 	if(check) {
// 		$.post("http://httpbin.org/post", {id: r_id.value, pwd: r_pw.value},
//             function (data) {
// 				$('.modal-body').find('p').text(data.form.id + '님 회원가입되었습니다.');
// 				$('#alertModal').modal()
//             }
//         );
// 	} else {
// 		$('.modal-body').find('p').text('아직 작성되지 않은 항목이 있습니다!')
// 		$('#alertModal').modal()
// 	}
// }
//
// function switchToLogin() {
// 	$('#register-box').hide();
// 	$('#login-box').show();
// }
//
// function switchToRegister() {
// 	$('#login-box').hide();
// 	$('#register-box').show();
// }
