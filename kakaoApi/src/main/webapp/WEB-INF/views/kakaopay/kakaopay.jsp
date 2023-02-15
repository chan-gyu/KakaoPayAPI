<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KakaoPay</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>

<h1> KakaoPay api 이용하기</h1>
<form method="post" action="/kakaoPay"></form>
<button id="check_module" type="button">카카오페이 테스트 결제</button>

</body>

<script>
	$("#check_module").click(function(){
		var IMP = window.IMP; //생략가능
		IMP.init(""); //i'mport imp값
		IMP.request_pay({
			pg: "kakaopay",
			pay_method: "card",
			merchant_uid: "merchant_" + new Date().getTime(),
			name: "주문명 : 아메리카노",
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와 같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: 100,
			// amount: ${bid.b_bid},
			// 가격
			buyer_name: "이름",
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			buyer_postcode: "123-456",
			}, function(rsp) {
				console.log(rsp);
			if(rsp.success){
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액 : ' + rsp.paid_amount;
				// success.submit();
				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법
			}else{
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
</script>

</html>