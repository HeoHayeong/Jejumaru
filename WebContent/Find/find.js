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

function chkSubmit(){
	frm = document.forms["frm"];
	
	var mpw = frm["mpw"].value.trim();
	var mompw = frm["mompw"].value.trim();
	var mompwchk = frm["mompwchk"].value.trim();

    if (mpw == "") {
    	alert("필수 입력 사항입니다.");
        frm["mpw"].focus();
        return false;
    }

    if (mompw == "") {
    	alert("필수 입력 사항입니다.");
        frm["mpw"].focus();
        return false;
    }
    
    if (mompwchk == "") {
        alert("필수 입력 사항입니다.");
        frm["mpw"].focus();
        return false;
    }
    return true;
} // end chkSubmit()

function chkDelete(mno){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("탈퇴하시겠습니까?");
	
	if(r){
		location.href = 'deleteOk.do?mno=' + mno;
	}
} // chkDelete



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