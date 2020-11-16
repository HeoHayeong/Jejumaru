

var LoginModalController = {
    tabsElementName: ".logmod__tabs li",
    tabElementName: ".logmod__tab",
    inputElementsName: ".logmod__form .input",
    hidePasswordName: ".hide-password",

    inputElements: null,
    tabsElement: null,
    tabElement: null,
    hidePassword: null,

    activeTab: null,
    tabSelection: 0, // 0 - first, 1 - second

    findElements: function () {
        var base = this;

        base.tabsElement = $(base.tabsElementName);
        base.tabElement = $(base.tabElementName);
        base.inputElements = $(base.inputElementsName);
        base.hidePassword = $(base.hidePasswordName);

        return base;
    },

    setState: function (state) {
        var base = this,
            elem = null;

        if (!state) {
            state = 0;
        }

        if (base.tabsElement) {
            elem = $(base.tabsElement[state]);
            elem.addClass("current");
            $("." + elem.attr("data-tabtar")).addClass("show");
        }

        return base;
    },

    getActiveTab: function () {
        var base = this;

        base.tabsElement.each(function (i, el) {
            if ($(el).hasClass("current")) {
                base.activeTab = $(el);
            }
        });

        return base;
    },

    addClickEvents: function () {
        var base = this;

        base.hidePassword.on("click", function (e) {
            var $this = $(this),
                $pwInput = $this.prev("input");

            if ($pwInput.attr("type") == "password") {
                $pwInput.attr("type", "text");
                $this.text("Hide");
            } else {
                $pwInput.attr("type", "password");
                $this.text("Show");
            }
        });

        base.tabsElement.on("click", function (e) {
            var targetTab = $(this).attr("data-tabtar");

            e.preventDefault();
            base.activeTab.removeClass("current");
            base.activeTab = $(this);
            base.activeTab.addClass("current");

            base.tabElement.each(function (i, el) {
                el = $(el);
                el.removeClass("show");
                if (el.hasClass(targetTab)) {
                    el.addClass("show");
                }
            });
        });

        base.inputElements.find("label").on("click", function (e) {
            var $this = $(this),
                $input = $this.next("input");

            $input.focus();
        });

        return base;
    },

    initialize: function () {
        var base = this;

        base.findElements().setState().getActiveTab().addClickEvents();
    }
};



$(document).ready(function () {
    LoginModalController.initialize();
});

//----------------------------------------------------------------------------------------

// form validation 
// 모두 필수사항

function logSubmit(){
	frm1 = document.forms['frm1'];
	
	var id = frm1["user"].value.trim();
	var pw = frm1["pass"].value.trim();
	
	if(id == ""){
		alert("필수 입력 사항입니다.");
		frm1["id"].focus();
		return false;
	}
	
	else if(pw == ""){
		alert("필수 입력 사항입니다.");
		frm1["pw"].focus();
		return false;
	}
	
	return true;	
		
}


// form validation 
// 회원가입 란 모두 필수


function chkSubmit(){
	frm = document.forms['frm'];
	
	var mid = frm["mid"].value.trim();
	var mpw = frm["mpw"].value.trim();
	var mname = frm["mname"].value.trim();
	var memail = frm["memail"].value.trim();
	
	if(mid == ""){
		alert("필수 입력 사항입니다.");
		frm["mid"].focus();
		return false;
	}

	if(mpw == ""){
		alert("필수 입력 사항입니다.");
		frm["mpw"].focus();
		return false;
	}

	if(mname == ""){
		alert("필수 입력 사항입니다.");
		frm["mname"].focus();
		return false;
	}
	
	if(memail == ""){
		alert("필수 입력 사항입니다.");
		frm["memail"].focus();
		return false;
	}
	
	return true;	
		
}

function changeView(value){
    
    if(value == "0") // HOME 버튼 클릭시 메인으로 이동
    {
        location.href="main.do";
    }
    else if(value == "1") // 로그인 버튼 클릭시 로그인 화면으로 이동
    {
        location.href="login.do";
    }
    else if(value == "2") // 회원가입 버튼 클릭시 회원가입 화면으로 이동
    {
        location.href="login.do";
    }
    else if(value == "3") // 로그아웃 버튼 클릭시 로그아웃 처리
    {
        location.href="logout.do";
    }
    else if(value == "4") // 회원정보 수정 버튼 클릭시 회원 확인 화면으로 이동
    {
        location.href="infochk.do";
    }
    else if(value == "5") // 비밀번호 확인 후 인증되면 비밀번호 변경 화면으로 이동
    {
        location.href="modify.do";
    }
}


function sendmail(){
				
		var frm = document.forms["frm2"]; //검증 할 것
		var chkNum = "" + (parseInt(Math.random() * 900000) + 100000);
		document.forms["frm3"].email.value = frm["memail"].value;
		document.forms["frm3"].num.value = chkNum;
		document.forms["frm2"].num.value = chkNum;

		$.ajax({
			url : "sendMail.do",
			type : "post",
			cache : false,
			data : $("form#frm3").serialize(),
			success : function(data, status){
				if(status == "success"){	
					alert("메일이 발송 되었습니다.");
				}
			}
		});
	}



//유효성 검사

var text = "";
var cnt = 0;
function check(){
	cnt++;
    
    // 객체
    var id = document.getElemenetById("user");
    var pw = document.getElementById("pass");
    var corpw = document.getElementById("passchk");
    var mail = document.getElementById("email");

    // 정규식
    var idptn = /^[A-Za-z]{1}[A-Za-z0-9]{3,19}$/;
    var pwptn = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
    var mailptn = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    // 아이디
    if(idptn.test(id.value) == true){
    }
    else alert("아이디 형식이 올바르지 않습니다.");

    // 비번
    if(pwptn.test(pw.value) == true){
        if(pwptn.test(corpw.value) == true){
            if(pw.value == corpw.value){
        }
    }
    else alert("비밀번호가 일치하지 않습니다.");
}
    else alert("비밀번호 형식이 올바르지 않습니다.");

    // 이메일
    if(mailptn.test(mail.value) == true) {
    }
    else alert("이메일 형식이 올바르지 않습니다.");

    alert(text);

    // 이전에 입력했던 회원정보 비우기

    if(cnt == 0+cnt)
    text = [];
} // function check() end

    // 클리어
    function inputClear(){
        document.getElementById("fm").reset();
    }


	
	
	
// 유효하지 않은 입력 내용이 있으면 submit 중지
(function(){
  window.addEventListener('load', function(){
  


    // '.needs-validation' 이 있는 form 들을 찾아서 
    var forms = document.getElementsByClassName('needs-validation');


    // 위 form 에 onsubmit 이벤트 리스너 등록
    Array.prototype.filter.call(forms, function(form){
      form.addEventListener('submit', function(event){
      
        // submit 발생시 유효성 체크 통과 못하면
        if(form.checkValidity() === false){
        
          // event 진행 중지 (submit 진행 안됨.)
          event.preventDefault();
          event.stopPropagation();
        }
        // BS 의 .was-validated 추가 
        form.classList.add("was-validated");
      });
    });
  });
})();
