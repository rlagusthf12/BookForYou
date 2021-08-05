<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BK4U 로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
    	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
    	*{
    		font-family: "Noto Sans KR", sans-serif !important;
    	}
        body{
            background-color: #f6f4f4;
            width:1200px;
            height:1550px;
            margin:auto;
        }
        #content-box{
            width: 550px;
            height:100%;
            background-color: #FFFFFF;
            margin-left: auto;
            margin-right: auto;
            margin-top: 0;
        }
        #blank-box{
            height:60px;
        }
        #logo-box{
            text-align: center;
        }
        #head-of-content-box{
            margin-top: 30px;
            text-align: center;
        }
        #sign-up-box{
            width: 80%;
            height: fit-content;
            margin-left: auto;
            margin-right: auto;
        }
        #divider-box{
            text-align: center;
        }
        #input-box{
            width: 480px;
            margin: auto;
        }
        .custom-input{
            font-size: 12px;
            box-sizing: border-box;
            display: block;
            width: 100%;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
            outline: 0;
        }
        .custom-input-basic{
            border-color: #bbb;
            color: #555;
        }
        .custom-input-basic:focus{
            border-color: #555;
        }
        .custom-input-danger{
            border-color: red;
        }
        .black-button {
            font-size: 15px;
            box-sizing: border-box;
            display: inline-flex;
            width: fit-content;
            border-width: 1px;
            border-style: solid;
            padding: 5px;
            outline: 0;
            background: rgb(55, 56, 56);
            border: 1px solid rgb(55, 56, 56);
            color: #fff;
            cursor: pointer;
            text-align: center;
        }
        
        .black-button:hover{
            background: rgb(80, 82, 82);
            border: 1px solid rgb(80, 82, 82);
            color: #fff;
            cursor: pointer;
        }
        .green-button {
            font-size: 15px;
            box-sizing: border-box;
            display: block;
            width: 100%;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
            outline: 0;
            background: rgb(64, 175, 142);
            border: 1px solid rgb(64, 175, 142);
            color: #fff;
            cursor: pointer;
        }
        
        .green-button:hover{
            background: rgb(48, 151, 120);
            border: 1px solid rgb(48, 151, 120);
            color: #fff;
            cursor: pointer;
        }
        .margin-top{
            margin-top: 20px;
        }
        .custom-input-post{
            font-size: 12px;
            box-sizing: border-box;
            display: inline;
            width: 76%;
            border-width: 1px;
            border-style: solid;
            padding: 10px;
            outline: 0;
        }
        .custom-input-post-basic{
            border-color: #bbb;
            color: #555;
        }
        .custom-input-post-basic:focus{
            border-color: #555;
        }
        .gender-box{
            display: inline-flex;
        }
    </style>
</head>

<body>
    <div id="content-box">
        <header>
            <div id="logo-box">
                <div id="blank-box"></div>
                <img src="resources\member\images\bk4u_logo.png" width="200px">
            </div>
            <div id="head-of-content-box">
                <h5><b>회원가입</b></h5>
            </div>
        </header>
        <div id="divider-box">
            <hr width="480px" style="margin-top: 30px; margin-left: auto; margin-right: auto;"/>
        </div>
        <form action="second-enroll.me" method="post" name="first_enroll" id="enrollForm1">
        <div id="sign-up-box">
             <br>
            <div class="mb-3">
                <label class="form-label"><b>아이디</b></label>
                <input type="text" class="custom-input custom-input-basic" id="idInput" name="memId" placeholder="아이디(5자~11자)" required/>
                <div id="idInfo" class="form-text"></div>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>비밀번호</b></label>
                <input type="password" class="custom-input custom-input-basic" id="pwdInput" name="memPwd" placeholder="숫자,영문,특수문자 조합 최소 8자" maxlength='30' required/>
                <div id="pwdInfo" class="form-text"></div>
                <input type="password" class="custom-input custom-input-basic" id="pwdCheckInput" maxlength='30' placeholder="비밀번호 확인" required/>
                <div id="pwdCheckInfo" class="form-text"></div>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>닉네임</b></label>
                <input type="text" class="custom-input custom-input-basic" id="nickInput" name="memNickname" placeholder="닉네임(최대 8자)" maxlength='8' required/>
                <div id="nickInfo" class="form-text"></div>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>이메일</b></label>
                <input type="email" class="custom-input custom-input-basic" id="emailInput" name="memEmail" placeholder="이메일을 입력해주세요. 인증에 사용됩니다." required/>
                <div id="emailInfo" class="form-text"></div>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>실명</b></label>
                <input type="text" class="custom-input custom-input-basic" id="nameInput" name="memName" placeholder="실명" maxlength="6" required/>
                <div id="nameInfo" class="form-text"></div>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>주소</b></label>
                
                <div id="post-box"><input type="text" class="custom-input-post custom-input-post-basic" name="memPost" id="memPost" placeholder="우편번호" required readonly/>
                <button type="button" class="black-button" onclick="sample6_execDaumPostcode();">우편번호 찾기</button></div>
                
                <input type="text" class="custom-input custom-input-basic margin-top" id="memBasicAddress" name="memBasicAddress" placeholder="기본 주소" required readonly/>
                <input type="text" class="custom-input custom-input-basic margin-top" id="detailAddress" name="memDetailAddress" placeholder="상세 주소"/>
                <input type="text" class="custom-input custom-input-basic margin-top" id="memAddressRefer" name="memAddressRefer" placeholder="참고"/>
                <div id="postInfo" class="form-text"></div>
            </div>
            <!-- 다음 주소 api -->
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
    		function sample6_execDaumPostcode() {
        		new daum.Postcode({
            		oncomplete: function(data) {
                		// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                		// 각 주소의 노출 규칙에 따라 주소를 조합한다.
               			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                		var addr = ''; // 주소 변수
                		var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("memAddressRefer").value = extraAddr;
		                
		                } else {
		                    document.getElementById("memAddressRefer").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('memPost').value = data.zonecode;
		                document.getElementById("memBasicAddress").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                basicAddress = true;
		                post = true;
        				$("#memBasicAddress").removeClass("custom-input-danger");
						$("#memBasicAddress").addClass("custom-input-basic");
						$("#memPost").removeClass("custom-input-danger");
						$("#memPost").addClass("custom-input-post-basic");
						$("#postInfo").css("color","green").text("");
		 
		                self.close();
		            }
		        }).open();
		    }
		</script>
            <div class="mb-3">
                <label class="form-label"><b>성별</b></label>
                <div>
                    <div class="gender-box">
                        <div class="form-check" style="margin-right: 50px;">
                            <input class="form-check-input" type="radio" name="memGender"
                            value="M" checked>
                            <label class="form-check-label" for="flexRadioDefault1">
                                	남
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="memGender"
                             value="F">
                            <label class="form-check-label" for="flexRadioDefault1">
                                	여
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>연령대</b></label>
                <select class="custom-input custom-input-basic" name="memAge" required>
                    <option value="10" selected>10대</option>
                    <option value="20">20대</option>
                    <option value="30">30대</option>
                    <option value="40">40대</option>
                    <option value="50">50대</option>
                    <option value="60">60대</option>
                    <option value="70">70대 이상</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label"><b>연락처</b></label>
                <input type="text" class="custom-input custom-input-basic" id="phoneInput" name="memPhone" placeholder="연락처" required/>
                <div id="phoneInfo" class="form-text"></div>
            </div>
            <br>
            <input type="button" class="green-button" onclick="form_check();" value="다음 단계"/>
            <!-- 유효성 체크 스크립트-->
            <script>
            	var $idInput = $("#enrollForm1 input[name=memId]");
    			var $pwdInput = $("#enrollForm1 input[name=memPwd]");
    			var $pwdCheckInput = $("#enrollForm1 input[id=pwdCheckInput]");
    			var $nickInput = $("#enrollForm1 input[name=memNickname]");
    			var $emailInput = $("#enrollForm1 input[name=memEmail]");
    			var $nameInput = $("#enrollForm1 input[name=memName]");
    			var $phoneInput = $("#enrollForm1 input[name=memPhone]");
    			var $postInput = $("#enrollForm1 input[name=memPost]");
    			var $basicAddressInput = $("#enrollForm1 input[name=memBasicAddress]");
    			
    			var id = false;
    			var pwd = false;
    			var pwdCheck = false;
    			var nick = false;
    			var email = false;
    			var post = false;
    			var basicAddress = false;
    			var name = false;
    			var phone = false;
    			
    			let check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/; 
    			
    			
    			function idCheck(){
    				if($idInput.val().length >=5 && $idInput.val().length <=11){
        				// 5글자이상 11자 이하일때 아이디에 대한 중복검사 진행
        				$.ajax({
        					url:"id-check.me",
        					data: {
        						checkId: $idInput.val()
        					},
        					success:function(result){
        						if(result=="NNNNN"){
        							console.log(result);
        							id = false;
        							$("#idInfo").css("color","red").text("중복된 아이디입니다.");
        							$("#idInput").removeClass("custom-input-basic");
        							$("#idInput").addClass("custom-input-danger");
        						}else{
        							console.log(result);
        							id = true;
        							$("#idInput").removeClass("custom-input-danger");
        							$("#idInput").addClass("custom-input-basic");
        							$("#idInfo").css("color","green").text("사용가능한 아이디입니다.");
        							
        						}
        					}, error:function(result){
        						id = false;
        						console.log("아이디 중복 체크용 ajax통신 실패");
        					}
        				});
        			}else{
        				// 빨간색의 테두리 쓰여지고, 메세지도 보여진다.
        				id = false;
        				$("#idInput").removeClass("custom-input-basic");
        				$("#idInput").addClass("custom-input-danger");
        				$("#idInfo").css("color","red").text("아이디는 5글자 이상 11글자 이하로 입력해주세요.");
        				
        			}
    			}
    			
    			function passwordCheck(){
        			// 정규 표현식을 통과하지 못하면 
        			if($pwdInput.val().length == 0){
        				pwd = false;
        				$("#pwdInfo").css("color","red").text("비밀번호는 필수 입력사항입니다.");
						$("#pwdInput").removeClass("custom-input-basic");
						$("#pwdInput").addClass("custom-input-danger");
        			}else if(!check.test($pwdInput.val())) { 
        				// 처리할 문장
        				pwd = false;
        				$("#pwdInfo").css("color","red").text("비밀번호는 영어,숫자,특수문자 포함 최소 8글자 이상입니다.");
						$("#pwdInput").removeClass("custom-input-basic");
						$("#pwdInput").addClass("custom-input-danger");
        			}else if(check.test($pwdInput.val())){
        				pwd = true;
        				$("#pwdInput").removeClass("custom-input-danger");
						$("#pwdInput").addClass("custom-input-basic");
						$("#pwdInfo").css("color","green").text("사용가능한 비밀번호입니다.");
        			}
    			}
    			
    			function pwdInputCheck(){
    				if(check.test($pwdInput.val())){
        				// 아무것도 입력하지 않는다면
        				console.log($pwdCheckInput.val());
        				if($pwdCheckInput.val().length == 0){
        					pwdCheck = false;
            				$("#pwdCheckInfo").css("color","red").text("비밀번호 확인은 필수 입력사항입니다.");
							$("#pwdCheckInput").removeClass("custom-input-basic");
							$("#pwdCheckInput").addClass("custom-input-danger");
            			}else if($pwdCheckInput.val() == $pwdInput.val()){
            				pwdCheck = true;
            				$("#pwdCheckInput").removeClass("custom-input-danger");
							$("#pwdCheckInput").addClass("custom-input-basic");
							$("#pwdCheckInfo").css("color","green").text("비밀번호가 일치합니다.");
            			}else if($pwdCheckInput.val() != $pwdInput.val()){
            				pwdCheck = false;
            				$("#pwdCheckInfo").css("color","red").text("비밀번호 확인이 일치하지 않습니다.");
							$("#pwdCheckInput").removeClass("custom-input-basic");
							$("#pwdCheckInput").addClass("custom-input-danger");
            			}
        			}
    			}
    			
    			function nickInputCheck(){
    				if($nickInput.val().length >=1 && $idInput.val().length <=8){
        				// 5글자이상 11자 이하일때 아이디에 대한 중복검사 진행
        				$.ajax({
        					url:"nick-check.me",
        					data: {
        						checkNick: $nickInput.val()
        					},
        					success:function(result){
        						if(result=="NNNNN"){
        							console.log(result);
        							nick = false;
        							$("#nickInfo").css("color","red").text("중복된 닉네임입니다.");
        							$("#nickInput").removeClass("custom-input-basic");
        							$("#nickInput").addClass("custom-input-danger");
        						}else{
        							console.log(result);
        							nick = true;
        							$("#nickInput").removeClass("custom-input-danger");
        							$("#nickInput").addClass("custom-input-basic");
        							$("#nickInfo").css("color","green").text("사용가능한 닉네임입니다.");
        							
        						}
        					}, error:function(result){
        						nick = false;
        						console.log("닉네임 중복 체크용 ajax통신 실패");
        					}
        				});
        			}else{
        				// 빨간색의 테두리 쓰여지고, 메세지도 보여진다.
        				nick = false;
        				$("#nickInput").removeClass("custom-input-basic");
        				$("#nickInput").addClass("custom-input-danger");
        				$("#nickInfo").css("color","red").text("닉네임은 1글자 이상 8글자 이하로 입력해주세요.");
        				
        			}
    			}
    			
    			function emailInputCheck(){
    				if($emailInput.val().length >=1 && $emailInput.val().includes("@")){
        				
        				$.ajax({
        					url:"email-check.me",
        					data: {
        						checkEmail: $emailInput.val()
        					},
        					success:function(result){
        						if(result=="NNNNN"){
        							console.log(result);
        							email = false;
        							$("#emailInfo").css("color","red").text("중복된 이메일입니다.");
        							$("#emailInput").removeClass("custom-input-basic");
        							$("#emailInput").addClass("custom-input-danger");
        						}else{
        							console.log(result);
        							email = true;
        							$("#emailInput").removeClass("custom-input-danger");
        							$("#emailInput").addClass("custom-input-basic");
        							$("#emailInfo").css("color","green").text("사용 가능한 이메일입니다.");
        							
        						}
        					}, error:function(result){
        						email = false;
        						console.log("이메일 중복 체크용 ajax통신 실패");
        					}
        				});
        			}else{
        				// 빨간색의 테두리 쓰여지고, 메세지도 보여진다.
        				email = false;
        				$("#emailInput").removeClass("custom-input-basic");
        				$("#emailInput").addClass("custom-input-danger");
        				$("#emailInfo").css("color","red").text("이메일 형식(@)이 일치하지 않습니다.");
        				$("#enrollForm1:submit").attr("disabled",true);
        			}
    			}
    			
    			function nameInputCheck(){
    				if($nameInput.val().length >=1){
    					name = true;
        				$("#nameInput").removeClass("custom-input-danger");
						$("#nameInput").addClass("custom-input-basic");
						$("#nameInfo").css("color","green").text("");
        			}else{
        				// 빨간색의 테두리 쓰여지고, 메세지도 보여진다.
        				name = false;
        				$("#nameInput").removeClass("custom-input-basic");
        				$("#nameInput").addClass("custom-input-danger");
        				$("#nameInfo").css("color","red").text("실명은 필수 입력사항입니다.");
        				
        			}
    			}
    			
    			function phoneInputCheck(){
    				if($phoneInput.val().length >=1){
    					phone = true;
        				$("#phoneInput").removeClass("custom-input-danger");
						$("#phoneInput").addClass("custom-input-basic");
						$("#phoneInfo").css("color","green").text("");
        			}else{
        				// 빨간색의 테두리 쓰여지고, 메세지도 보여진다.
        				phone = false;
        				$("#phoneInput").removeClass("custom-input-basic");
        				$("#phoneInput").addClass("custom-input-danger");
        				$("#phoneInfo").css("color","red").text("핸드폰 번호는 필수 입력사항입니다.");
        				
        			}
    			}
    			
    			function postInputCheck(){
    				if($postInput.val().length >=1){
    					post = true;
    					$("#memBasicAddress").removeClass("custom-input-danger");
						$("#memBasicAddress").addClass("custom-input-basic");
        				$("#memPost").removeClass("custom-input-danger");
						$("#memPost").addClass("custom-input-post-basic");
						$("#postInfo").css("color","green").text("");
        			}else{
        				// 빨간색의 테두리 쓰여지고, 메세지도 보여진다.
        				post = false;
        				$("#memPost").removeClass("custom-input-post-basic");
        				$("#memPost").addClass("custom-input-danger");
        				$("#memBasicAddress").removeClass("custom-input-basic");
        				$("#memBasicAddress").addClass("custom-input-danger");
        				$("#postInfo").css("color","red").text("우편 번호와 기본 주소는 필수 입력사항입니다.");
        				
        			}
    			}
    			
    			function basicAddressInputCheck(){
    				if($basicAddressInput.val().length >=1){
    					basicAddress = true;
        				$("#memBasicAddress").removeClass("custom-input-danger");
						$("#memBasicAddress").addClass("custom-input-basic");
						$("#memPost").removeClass("custom-input-danger");
						$("#memPost").addClass("custom-input-post-basic");
						$("#postInfo").css("color","green").text("");
        			}else{
        				// 빨간색의 테두리 쓰여지고, 메세지도 보여진다.
        				basicAddress = false;
        				$("#memPost").removeClass("custom-input-post-basic");
        				$("#memPost").addClass("custom-input-danger");
        				$("#memBasicAddress").removeClass("custom-input-basic");
        				$("#memBasicAddress").addClass("custom-input-danger");
        				$("#postInfo").css("color","red").text("우편 번호와 기본 주소는 필수 입력사항입니다.");
        				
        			}
    			}
    			
    			
            	$(function(){
            		// 아이디 유효성 체크
            		$idInput.keyup(function(){
            			console.log($idInput.val());
            			idCheck();
            		});
            		
            		// 비밀번호 유효성 체크
            		$pwdInput.keyup(function(){
            			passwordCheck();
            		});
            		
            		$pwdCheckInput.keyup(function(){
            			// 위의 정규 표현식을 다 통과했을 경우 비밀번호 일치하는지 체크
            			pwdInputCheck();
            		});
            		
            		// 닉네임 유효성 체크 
            		$nickInput.keyup(function(){
            			console.log($nickInput.val());
            			nickInputCheck();
            		});
            		
            		//이메일 유효성 체크
            		$emailInput.keyup(function(){
            			console.log($emailInput.val());
            			emailInputCheck();
            		});
            		
            		//실명 유효성 체크
            		$nameInput.keyup(function(){
            			console.log($emailInput.val());
            			nameInputCheck();
            		});
            		
            		// 핸드폰 번호 유효성 체크
            		$phoneInput.keyup(function(){
            			console.log($phoneInput.val());	
            			phoneInputCheck(); 
            		});
            	})
            	
            	function form_check(){
            		console.log("시작");
            		if(id == false){
            			console.log("아이디");
            			$idInput.focus();
            			idCheck();
            			return false;
            		}
            		if(pwd == false){
            			console.log("패스워드");
            			$pwdInput.focus();
            			passwordCheck();
            			return false;
            		}if(pwdCheck == false){
            			console.log("패스워드체크");
            			$pwdCheckInput.focus();
            			pwdInputCheck();
            			return false;
            		}if(nick == false){
            			console.log("닉체크");
            			$nickInput.focus();
            			nickInputCheck();
            			return false;
            		}if(email == false){
            			console.log("이메일체크");
            			$emailInput.focus();
            			emailInputCheck();
            			return false;
            		}if(name == false){
            			console.log("실명체크");
            			$nameInput.focus();
            			nameInputCheck();
            			return false;
            		}if(post == false){
            			console.log("우편번호체크");
            			$postInput.focus();
            			postInputCheck();
            			return false;
            		}if(basicAddress == false){
            			console.log("기본주소체크");
            			$basicAddressInput.focus();
            			basicAddressInputCheck();
            			return false;
            		}if(phone == false){
            			console.log("폰체크");
            			$phoneInput.focus();
            			phoneInputCheck();
            			return false;
            		}
            		console.log("대기");
            		document.first_enroll.submit();
            		
            	}
            </script>
        	</div>
        </form>
    </div>
    
</body>

</html>