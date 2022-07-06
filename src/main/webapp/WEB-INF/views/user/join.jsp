<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/layouts/user" %>

<t:wrapper>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<link rel="stylesheet" href="<c:url value="/css/user/join.css"/>" />
	<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>" />

<script src="<c:url value="/js/bootstrap.min.js"/>" type="text/javascript" >="javascript"></script>
<script>
	const classNo = ${classNo};
	console.log(classNo);

	window.onload = () => {
		let actionUrl = ""
		if(classNo === 1) actionUrl = '<c:url value='/user/join'/>';
		else if(classNo === 2) actionUrl = '<c:url value='/delivery/join'/>';

		document.querySelector("form[name=joinfrm]").action = actionUrl;
	}
</script>
<script src="<c:url value="/js/join.js"/>" type="text/javascript" text="javascript"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div id="join_wrap">
	<div class="join_form">
		<form name="joinfrm" method="post"
			action="" >
			<fieldset>
			<!-- 배달기사 로그인은 제목 다르게 -->
				<h3 align="center">${classNo == 1 ? "러너" : "배달기사"} 회원 가입</h3>
				<div class="namebox">
					<label for="name">회원 이름</label> 
					<input type="text" name="name" id="name" style="ime-mode: active">
					<input type="text" name="userCode" id="userCode" value="${classNo == 1 ? 1 : 2}" readonly>
				</div>
				<div>
					<label for="email">이메일</label>
					<input type="text" name="email" id="email">
					<c:if test="${classNo == 1}">
						<input type="button" value="중복 확인" id="btnChkEmail">
						<input type="text" name="chkEmail" id="chkEmail" disabled>
					</c:if>
					<c:if test="${classNo == 2}">
						<input type="button" value="중복 확인" id="btnChkDmail">
						<input type="text" name="chkDmail" id="chkDmail" disabled>
					</c:if>
				</div>
				<div>
					<label for="pwd">비밀번호</label> 
					<input type="Password" name="pwd" 
						id="pwd" placeholder="8자 이상의 문자,특수문자 포함">
				</div>
				<div>
					<label for="pwd2">비밀번호 확인</label> 
					<input type="Password" name="pwd2" id="pwd2">
				</div>
				<!-- 일반회원 가입시 주소 입력 폼-->
				<c:if test="${classNo == 1}">
					<div>
						<label for="zipcode">우편번호</label>
						<input type="text" name="zipcode" id="zipcode">&nbsp;
						<input type="Button" value="우편번호 찾기" id="btnZipcode" onclick="execZipcode()">
						<input type="text" name="point" id="point" value= 5000 readonly><br />
						<label for="adress">주소</label>
						<input type="text" name="address" id="address">
						<input type="text" name="officeNo" id="OfficeNo" value=0 readonly><br />
						<label for="adressDetail">상세주소</label>
						<input type="text" name="addressDetail" id="addressDetail"><br />
						<label for="entermethod">공동현관 출입방법</label>
						<input type="text" name="entermethod" id="entermethod"
							placeholder="입력하지 않을시 '없음'으로 입력됩니다">
						<input type="text" name="entermethod2" id="entermethod2" value="없음" readonly>
					</div>
				</c:if>
				<!-- 배달기사 가입시 지점, 계좌 입력 폼-->
				<c:if test="${classNo == 2}">
					<div>
						<label for="office">지점선택</label>
						<select name="office" id="office">
							<option value="강남지점">강남지점</option>
							<option value="강동지점">강동지점</option>
							<option value="강북지점">강북지점</option>
							<option value="강서지점">강서지점</option>
							<option value="관악지점">관악지점</option>
							<option value="광진지점">광진지점</option>
							<option value="노원지점">노원지점</option>
							<option value="동대문지점">동대문지점</option>
							<option value="서대문지점">서대문지점</option>
							<option value="송파지점">송파지점</option>
							<option value="양천지점">양천지점</option>
							<option value="용산지점">용산지점</option>
							<option value="종로지점">종로지점</option>
							<option value="중랑지점">중랑지점</option>
						</select>
						<input type="text" name="officeNo" id="OfficeNo" value=0 readonly>
					</div>
					<div>
						<label for="accHolder">계좌주</label>
						<input type="text" name="accHolder" id="accHolder"><br />
						<label for="bank">은행-계좌번호</label>
						<select name="bank" id="bank">
							<option value="국민은행">국민은행</option>
							<option value="기업은행">기업은행</option>
							<option value="NH농협은행">NH농협은행</option>
							<option value="NH농협은행">NH농협은행</option>
							<option value="신한은행">신한은행</option>
							<option value="우리은행">우리은행</option>
							<option value="카카오뱅크">카카오뱅크</option>
							<option value="토스뱅크">토스뱅크</option>
							<option value="하나은행">하나은행</option>
							<option value="한국씨티은행">한국씨티은행</option>
							<option value="SC제일은행">SC제일은행</option>
						</select>
						<input type="text" name="accNum" id="accNum" 
							placeholder="-를 제외하고 입력해주세요" class="width_350">
					</div>
				</c:if>
				<div class="hpbox">
					<label for="hp">휴대전화</label>
					<input type="text" name="hp" id="hp" maxlength="11" 
						placeholder="-를 제외하고 입력해주세요">&nbsp;
					<c:if test="${classNo == 1}">
						<input type="button" value="중복 확인" id="btnChkHp">
						<input type="text" name="chkHp" id="chkHp" disabled>
					</c:if>
					<c:if test="${classNo == 2}">
						<input type="button" value="중복 확인" id="btnChkDhp">
						<input type="text" name="chkDhp" id="chkDhp" disabled>
					</c:if>
				</div>
				<div class="divTerms">
				  	<h5>러너 이용약관</h5>
				  	<div class="scroll">
						제1조(목적)<br>
						이 약관은 러너(전자거래 사업자)가 운영하는 웹사이트(이하 "사이트"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 서비스 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.<br><br>
						제2조(정의)<br>
						① "사이트" 이란 러너가 일정 서비스를 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 서비스를 이용할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이트를 운영하는 사업자의 의미로도 사용합니다. <br>
						② "이용자"란 "사이트"에 접속하여 이 약관에 따라 "사이트"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다. <br>
						③ 회원'이라 함은 "사이트"에 개인정보를 제공하여 회원등록을 한 자로서, "사이트"의 정보를 지속적으로 제공받으며, "사이트"가 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다. <br>
						④ 비회원'이라 함은 회원에 가입하지 않고 "사이트"가 제공하는 서비스를 이용하는 자를 말합니다.<br><br>
						제3조 (약관의 명시와 개정)<br>
						① "사이트"는 이 약관의 내용과 상호, 영업소 소재지, 대표자의 성명, 사업자등록번호, 연락처(전화, 팩스, 전자우편 주소 등) 등을 이용자가 알 수 있도록 서비스화면에 게시합니다. <br>
						② "사이트"는 약관의규제등에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. <br>
						③ "사이트"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 "사이트"의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. <br>
						④ "사이트"가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 "사이트"에 송신하여 "사이트"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. <br>
						⑤ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 상관례에 따릅니다.<br><br>
						제 4조 (서비스 이용 계약의 성립)<br>
						① "사이트"의  서비스 이용 계약은 이용자가 이 약관에 동의한다는 의사표시와 함께 회원 가입을 위한 서비스 이용 신청을 하고, 이에 대한 "사이트"의 이용 승낙으로 성립됩니다.<br>
						② 이용자가 회원에 가입하여 사이트의 서비스를 이용하고자 하는 경우, 이용자는 사이트에서 요청하는 개인 신상정보를 제공해야 합니다.<br>
						③ 이용자의 사이트의 서비스 이용신청에 대하여 사이트가 승낙한 경우, 사이트는 회원 ID와 기타 사이트가 필요하다고 인정하는 내용을 이용자에게 통지합니다.<br>
						④ 사이트는 다음 각 호에 해당하는 서비스의 이용 신청에 대하여는 이를 승낙하지 아니합니다.<br>
						가. 다른 사람의 명의를 사용하여 신청하였을 때<br>
						나. 본인의 실명으로 신청하지 않았을 때<br>
						다. 서비스 이용 계약 신청서의 내용을 허위로 기재하였을 때<br>
						라. 사회의 안녕과 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때<br>
						마. 기타 이용신청자의 귀책사유로 이용승낙이 곤란한 경우<br><br>
						제 6조 (서비스 이용 및 제한)<br>
						① 사이트의 서비스 이용은 사이트의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.<br>
						② 사이트는  정보통신 시스템 등의 정기점검, 보수, 교체, 고장, 통신두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시 중단할 수 있습니다. .<br>
						③ 제2항에 의한 서비스 중단의 경우에는 사이트는 회원에게 제13조의 방법으로 통지를 합니다. 단, 사이트가 통제할 수 없는 사유로 인한 서비스 중단으로 사전 통지가 불가능한 경우에는 그러하지 아니합니다.<br>
						④ 사이트에서 제공하는 서비스는 기본적으로 무료입니다. 단, 별도로 유료임을 명시한 정보에 대해서는 해당 정보에 명시된 요금을 지불하여야 사용이 가능합니다.<br>
						⑤ 회원은 "사이트"를 이용함으로써 얻은 정보를 "사이트"의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송, 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br>
						⑥ "사이트"는 서비스 요금이 무료인 서비스 이용과 관련하여 이용자에게 발생한 어떠한 손해에 대해서도 책임을 지지 않습니다.<br><br>
						제7조(서비스의 중단)<br>
						① "사이트"는 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. <br>
						② 제1항에 의한 서비스 중단의 경우에는 "사이트"가 정한 방법으로 이용자에게 통지합니다. <br><br>
						제8조(회원가입)<br>
						① 이용자는 "사이트"가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다. <br>
						② "사이트"는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.<br>
						1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 "사이트"의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br>
						2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br>
						3. 기타 회원으로 등록하는 것이 "사이트"의 기술상 현저히 지장이 있다고 판단되는 경우 <br>
						③ 회원가입계약의 성립시기는 "사이트"의 승낙이 회원에게 도달한 시점으로 합니다. <br>
						④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "사이트"에 대하여 그 변경사항을 알려야 합니다.<br><br>
						제9조(회원 탈퇴 및 자격 상실 등)<br>
						① 회원은 "사이트"에 언제든지 탈퇴를 요청할 수 있으며 "사이트"는 즉시 회원탈퇴를 처리합니다. <br>
						② 회원이 다음 각호의 사유에 해당하는 경우, "사이트"는 회원자격을 제한 및 정지시킬 수 있습니다.<br>
						1. 가입 신청시에 허위 내용을 등록한 경우<br>
						2. 다른 사람의 "사이트" 이용을 방해하거나 그 정보를 도용하는 등 전자거래질서를 위협하는 경우<br>
						3. "사이트"를 이용하여 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우 <br>
						③ "사이트"가 회원 자격을 제한·정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 "사이트"는 회원자격을 상실시킬 수 있습니다. <br>
						④ "사이트"가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 소명할 기회를 부여합니다.<br><br>
						제10조(회원에 대한 통지)<br>
						① "사이트"가 회원에 대한 통지를 하는 경우, 회원이 "사이트"에 제출한 전자우편 주소로 할 수 있습니다. <br>
						② "사이트"는 불특정다수 회원에 대한 통지의 경우 1주일이상 "몰" 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다.<br><br>
						제11조(서비스의 신청)<br>
						"사이트"이용자는 "사이트"상에서 '사이트'가 정하여 공시하는 방법에 의하여 서비스를 신청합니다.<br><br>
						제12조(개인정보보호)<br>
						① "사이트"는 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다.<br>
						다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.<br>
						1. 성명<br>
						2. 생년월일(회원의 경우)<br>
						3. 주소<br>
						4. 전화번호<br>
						5. 희망ID(회원의 경우)<br>
						6. 비밀번호(회원의 경우) <br>
						② "사이트"가 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다. <br>
						③ 제공된 개인정보는 당해 이용자의 동의 없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 "사이트"가 집니다. 다만, 다음의 경우에는 예외로 합니다.<br>
						1. "사이트"가 제공하는 서비스의 실시 시 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우<br>
						2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우 <br>
						④ "사이트"가 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받는자, 제공목적 및 제공할 정보의 내용)등 정보통신망이용촉진등에관한법률 제16조제3항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다. <br>
						⑤ 이용자는 언제든지 "사이트"가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "사이트"는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "사이트"는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다. <br>
						⑥ "사이트" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br><br>
						제13조("사이트"의 의무)<br>
						① "사이트"는 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하는 데 최선을 다하여야 합니다. <br>
						② "사이트"는 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다. <br>
						④ "사이트"는 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.<br><br>
						제14조( 회원의 ID 및 비밀번호에 대한 의무)<br>
						① 제15조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다. <br>
						② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다. <br>
						③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "사이트"에 통보하고 "사이트"의 안내가 있는 경우에는 그에 따라야 합니다.<br><br>
						제15조(이용자의 의무)<br>
						이용자는 다음 행위를 하여서는 안됩니다.<br>
						1. 신청 또는 변경시 허위내용의 등록<br>
						2. "사이트"에 게시된 정보의 변경<br>
						3. "사이트"가 정한 정보 이외의 정보(컴퓨터 프로그램 등)의 송신 또는 게시<br>
						4. "사이트" 기타 제3자의 저작권 등 지적재산권에 대한 침해<br>
						5. "사이트" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>
						6. 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속에 반하는 정보를 "사이트"에 공개 또는 게시하는 행위<br><br>
						제16조(저작권의 귀속 및 이용제한)<br>
						① "사이트"가 작성한 저작물에 대한 저작권 기타 지적재산권은 "사이트"에 귀속합니다. <br>
						② 이용자는 "사이트"를 이용함으로써 얻은 정보를 "사이트"의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br><br>
						제17조(분쟁해결)<br>
						① "사이트"는 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다. <br>
						② "사이트"와 이용자간에 발생한 분쟁은 전자거래기본법 제28조 및 동 시행령 제15조에 의하여 설치된 전자거래분쟁조정위원회의 조정에 따를 수 있습니다.<br><br>
						제18조(재판권 및 준거법)<br>
						① "사이트"와 이용자간에 발생한 전자거래 분쟁에 관한 소송은 민사소송법상의 관할법원에 제기합니다. <br>
						② 이 약관은 준거법으로 한국법을 적용합니다. 
					</div>
					<div>
			   		<label class="label2" for="agreechk">동의함</label>
				  	<input type="checkbox" name="agreechk" id="agreechk" class="checkbox"/>
					</div>
					<h5>개인정보 수집 및 이용안내</h5>
				  	<div class="scroll">
						(주)러너는 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신서비스제공자가 준수하여야 할 관련 법령상의 개인정보보호 규정을 준수하며, 관련 법령에 의거한 개인정보취급방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다.<br>
						러너의 개인정보취급방침은 다음과 같은 내용을 담고 있습니다.<br><br> 
						가. 수집하는 개인정보 항목 및 수집방법<br>
						러너는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br>
						▶ 이름, 이메일, 생년월일, 주소, 연락처, 핸드폰 번호, 월소득, 직업, 점포소유유무, 투자가능금액, 희망소득금액, 실제운영자 성별, 실제운영자 나이, 매장운영형태, 수거배달가능여부, 수선가능여부, 개설동기, 오픈희망지역 또한 서비스 이용과정이나 사업 처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.<br>
						▶ 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록, 이용정지 기록 러너는 다음과 같은 방법으로 개인정보를 수집합니다.<br>
						▶ 홈페이지, 서면양식, 전화 팩스를 통한 회원가입, 상담 게시판, 경품 행사 응모, 배송 요청<br>
						▶ 제휴사로부터의 제공<br>
						▶ 생성정보 수집 툴을 통한 수집<br><br>
						나. 개인정보 수집 및 이용목적<br>
						러너는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
						▶ 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공, 물품배송 또는 청구서 등 발송, 금융거래 본인 인증 및 금융 서 비스, 구매 및 요금 결재, 요금추심<br>
						▶ 회원 관리 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달<br>
						▶ 마케팅 및 광고에 활용 신규 서비스(제품) 개발 및 특화, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악, 회원의 서비스 이용에 대한 통계, 이벤트 등 광고성 정보 전달<br><br>
						다. 수집한 개인정보의 보유 및 이용기간 원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다.<br>
						단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br><br>
						&lt;내부 방침에 의한 정보보유 사유&gt;<br>
						▶ 회원 ID<br>
						- 보존 이유 : 서비스 이용의 혼선방지<br>
						- 보존 기간 : 탈퇴 후 1년<br><br>
						&lt;관련법령에 의한 정보보유 사유&gt;<br>
						상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.<br>
						이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.<br>
						▶ 계약 또는 청약철회 등에 관한 기록<br>
						- 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
						- 보존 기간 : 5년<br>
						▶ 대금결제 및 재화 등의 공급에 관한 기록<br>
						- 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
						- 보존 기간 : 5년<br>
						▶ 소비자의 불만 또는 분쟁처리에 관한 기록<br>
						- 보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률<br>
						- 보존 기간 : 3년<br>
						▶ 본인확인에 관한 기록<br>
						- 보존 이유 : 정보통신망 이용촉진 및 정보보호 등에 관한 법률<br>
						- 보존 기간 : 6개월<br>
						▶ 웹사이트 방문기록<br>
						- 보존 이유 : 통신비밀보호법<br>
						- 보존 기간 : 1년
					</div>
					<div>
			   		<label class="label2" for="privacychk">동의함</label>
				  	<input type="checkbox" name="privacychk" id="privacychk" class="checkbox"/>
					</div>
					<h5>제 3자 개인정보 제공 동의</h5>
					<div class="scroll">
						1. 제공받는자<br> 
 									본인이 이용하는 가맹점 및 지사, ㈜이젠포스, 이젠글로벌로지스<br><br> 
						2. 개인정보 이용 목적<br> 
						   세탁서비스 이용내역 확인, 소비자 분쟁 해결, 고객이관, 전산 프로그램 오류 처리<br><br> 
						3. 제공하는 개인정보 항목<br> 
						   아이디, 이름, 성별, 생년월일, 휴대전화, 주소<br><br> 
						4. 개인정보 보유 및 이용 기간<br> 
						   5년 (단, 목적 달성 후에도 법령에 따라 개인정보를 보유할 수 있습니다.<br><br> 
						5. 제3자 정보제공 동의 거부 권리<br> 
						   귀하께서는 본 제3자 개인정보 제공 동의를 거부할 수 있으나<br> 
						   거부하실 경우 홈페이지내 서비스 이용 제한으로 회원가입이 불가합니다.
					</div>
					<div>
				   		<label class="label2" for="privacychk2">동의함</label>
					  	<input type="checkbox" name="privacychk2" id="privacychk2" class="checkbox"/>
					  	<label class="label3" for="agreeAllchk">전체 동의</label>
						<input type="checkbox" name="agreeAllchk" id="agreeAllchk" class="checkbox"/>
					</div>
				</div>
				<div class="center">
					<input type="submit" id="wr_submit" value="회원가입">
					<input type="reset" id="wr_reset" 
						onclick="history.go(-1);return false;" value="취소">
				</div>
			</fieldset>
		</form>
	</div>
</div>
</t:wrapper>