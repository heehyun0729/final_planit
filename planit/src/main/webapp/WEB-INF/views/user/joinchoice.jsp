<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="termscheck">
	<form method="post" action="<c:url value='/user/join'/>" class="termsform">
		<div class="userstop">
			<a href="<c:url value='/'/>"><img class="logoimg" src="<c:url value='/resources/images/logo1.png'/>"></a>
		</div>
		<!-- 이용약관 -->
		<div class="terms">
			<div class="terms_title_maintitle">이용약관</div>
			<div class="terms_subtitle">제 1 장 총 칙</div>
			<div class="terms_title_contenttitle">제 1 조 (목적)</div>
			<div class="terms_content">이 약관은 플랜잇(Planit)(이하 "사이트"라 합니다)에서 제공하는 인터넷서비스(이하 "서비스"라 합니다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.</div>
			<div class="terms_title_contenttitle">제 2 조 (약관의 효력 및 변경)</div>
			<div class="terms_content">
				① 이 약관은 서비스 화면이나 기타의 방법으로 이용고객에게 공지함으로써 효력을 발생합니다.
				<br>
				② 사이트는 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.
			</div>
			<div class="terms_title_contenttitle">제 3 조 (용어의 정의)</div>
			<div class="terms_content">
				이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
				<br>
				① 회원 : 사이트와 서비스 이용계약을 체결하거나 이용자 아이디(ID)를 부여받은 개인 또는 단체를 말합니다.
				<br>
				② 신청자 : 회원가입을 신청하는 개인 또는 단체를 말합니다.
				<br>
				③ 아이디(ID) : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 사이트가 승인하는 문자와 숫자의 조합을 말합니다.
				<br>
				④ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
				<br>
				⑤ 해지 : 사이트 또는 회원이 서비스 이용계약을 취소하는 것을 말합니다.
			</div>
			<div class="terms_subtitle">제 2 장 서비스 이용계약</div>
			<div class="terms_title_contenttitle">제 4 조 (이용계약의 성립)</div>
			<div class="terms_content">
				① 이용약관 하단의 동의 버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
				<br>
				② 이용계약은 서비스 이용희망자의 이용약관 동의 후 이용 신청에 대하여 사이트가 승낙함으로써 성립합니다.
			</div>
			<div class="terms_title_contenttitle">제 5 조 (이용신청)</div>
			<div class="terms_content">
				① 신청자가 본 서비스를 이용하기 위해서는 사이트 소정의 가입신청 양식에서 요구하는 이용자 정보를 기록하여 제출해야 합니다.
				<br>
				② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며, 서비스의 제한을 받을 수 있습니다.
			</div>
			<div class="terms_title_contenttitle">제 6 조 (이용신청의 승낙)</div>
			<div class="terms_content">
				① 사이트는 신청자에 대하여 제2항, 제3항의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.
				<br>
				② 사이트는 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.
				<br>
				가. 서비스 관련 설비에 여유가 없는 경우
				<br>
				나. 기술상 지장이 있는 경우
				<br>
				다. 기타 사이트가 필요하다고 인정되는 경우
				<br>
				③ 사이트는 신청자가 다음에 해당하는 경우에는 승낙을 거부할 수 있습니다.
				<br>
				가. 다른 개인(사이트)의 명의를 사용하여 신청한 경우
				<br>
				나. 이용자 정보를 허위로 기재하여 신청한 경우
				<br>
				다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
				<br>
				라. 기타 사이트 소정의 이용신청요건을 충족하지 못하는 경우
			</div>
			<div class="terms_title_contenttitle">제 7 조 (이용자정보의 변경)</div>
			<div class="terms_content">회원은 이용 신청시에 기재했던 회원정보가 변경되었을 경우에는, 온라인으로 수정하여야 하며 변경하지 않음으로 인하여 발생되는 모든 문제의 책임은 회원에게 있습니다.</div>
			<div class="terms_subtitle">제 3 장 계약 당사자의 의무</div>
			<div class="terms_title_contenttitle">제 8 조 (사이트의 의무)</div>
			<div class="terms_content">
				① 사이트는 회원에게 각 호의 서비스를 제공합니다.
				<br>
				가. 신규서비스와 도메인 정보에 대한 뉴스레터 발송
				<br>
				나. 추가 도메인 등록시 개인정보 자동 입력
				<br>
				다. 도메인 등록, 관리를 위한 각종 부가서비스
				<br>
				② 사이트는 서비스 제공과 관련하여 취득한 회원의 개인정보를 회원의 동의없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다.
				<br>
				가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우
				<br>
				나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우
				<br>
				다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우
				<br>
				③ 사이트는 이 약관에서 정한 바에 따라 지속적, 안정적으로 서비스를 제공할 의무가 있습니다.
			</div>
			<div class="terms_title_contenttitle">제 9 조 (회원의 의무)</div>
			<div class="terms_content">
				① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.
				<br>
				가. 다른 회원의 ID를 부정하게 사용하는 행위
				<br>
				나. 서비스에서 얻은 정보를 사이트의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 변경, 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위
				<br>
				다. 사이트의 저작권, 타인의 저작권 등 기타 권리를 침해하는 행위
				<br>
				라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위
				<br>
				마. 범죄와 결부된다고 객관적으로 판단되는 행위
				<br>
				바. 기타 관계법령에 위배되는 행위
				<br>
				② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수하여야 합니다.
				<br>
				③ 회원은 내용별로 사이트가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.
			</div>
			<div class="terms_subtitle">제 4 장 서비스 제공 및 이용</div>
			<div class="terms_title_contenttitle">제 10 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무)</div>
			<div class="terms_content">
				① 아이디(ID)와 비밀번호에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.
				<br>
				② 자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 사이트에 그 사실을 통보해야 합니다.
			</div>
			<div class="terms_title_contenttitle">제 11 조 (서비스 제한 및 정지)</div>
			<div class="terms_content">
				① 사이트는 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지하는 등 기타 불가항력적 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다.
				<br>
				② 사이트는 제1항의 규정에 의하여 서비스의 이용을 제한하거나 정지할 때에는 그 사유 및 제한기간 등을 지체없이 회원에게 알려야 합니다.
			</div>
			<div class="terms_subtitle">제5장 계약사항의 변경, 해지</div>
			<div class="terms_title_contenttitle">제 12 조 (정보의 변경)</div>
			<div class="terms_content">회원이 주소, 비밀번호 등 고객정보를 변경하고자 하는 경우에는 홈페이지의 회원정보 변경 서비스를 이용하여 변경할 수 있습니다.</div>
			<div class="terms_title_contenttitle">제 13 조 (계약사항의 해지)</div>
			<div class="terms_content">
				회원은 서비스 이용계약을 해지할 수 있으며, 해지할 경우에는 본인이 직접 서비스를 통하거나 전화 또는 온라인 등으로 사이트에 해지신청을 하여야 합니다. 사이트는 해지신청이 접수된 당일부터 해당 회원의 서비스 이용을 제한합니다. 사이트는 회원이 다음 각 항의 1에 해당하여 이용계약을 해지하고자 할 경우에는 해지조치 7일전까지 그 뜻을 이용고객에게 통지하여 소명할 기회를 주어야 합니다.
				<br>
				① 이용고객이 이용제한 규정을 위반하거나 그 이용제한 기간 내에 제한 사유를 해소하지 않는 경우
				<br>
				② 정보통신윤리위원회가 이용해지를 요구한 경우
				<br>
				③ 이용고객이 정당한 사유 없이 의견진술에 응하지 아니한 경우
				<br>
				④ 타인 명의로 신청을 하였거나 신청서 내용의 허위 기재 또는 허위서류를 첨부하여 이용계약을 체결한 경우
				<br>
				사이트는 상기 규정에 의하여 해지된 이용고객에 대해서는 별도로 정한 기간동안 가입을 제한할 수 있습니다.
			</div>
			<div class="terms_subtitle">제6장 손해배상</div>
			<div class="terms_title_contenttitle">제 14 조 (면책조항)</div>
			<div class="terms_content">
				① 사이트는 회원이 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.
				<br>
				② 사이트는 회원의 귀책사유나 제3자의 고의로 인하여 서비스에 장애가 발생하거나 회원의 데이터가 훼손된 경우에 책임이 면제됩니다.
				<br>
				③ 사이트는 회원이 게시 또는 전송한 자료의 내용에 대해서는 책임이 면제됩니다.
				<br>
				④ 상표권이 있는 도메인의 경우, 이로 인해 발생할 수도 있는 손해나 배상에 대한 책임은 구매한 회원 당사자에게 있으며, 사이트는 이에 대한 일체의 책임을 지지 않습니다.
			</div>
			<div class="terms_title_contenttitle">제 15 조 (관할법원)</div>
			<div class="terms_content">서비스와 관련하여 사이트와 회원간에 분쟁이 발생할 경우 사이트의 본사 소재지를 관할하는 법원을 관할법원으로 합니다.</div>
			<div class="terms_content">(시행일) 이 약관은 2019년 06월 23일 부터 시행합니다.</div>
		</div>
		<div class="termsagreecheck">
			<label for="terms_agree">사이트 이용약관에 동의합니다.</label> <input type="checkbox" id="terms_agree" name="terms_agree" required="required">
		</div>

		<!-- 개인정보처리방침 -->
		<div class="terms">
			<div class="terms_title_maintitle">개인정보 처리방침</div>

			<div class="terms_content"><b style="color: black; font-weight: bold;">Planit(이하 플랜잇)</b>은 개인정보 보호법 제30조에 따라 정보주체(고객)의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립․공개합니다.</div>

			<div class="terms_title_contenttitle">1. 개인정보의 처리목적</div>
			<div class="terms_content">
				플랜잇은 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;- 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급․배송 등
			</div>

			<div class="terms_title_contenttitle">2. 개인정보의 처리 및 보유기간</div>
			<div class="terms_content">
				① 플랜잇은 정보주체로부터 개인정보를 수집할 때 동의받은 개인정보 보유․이용기간 또는 법령에 따른 개인정보 보유․이용기간 내에서 개인정보를 처리․보유합니다.
				<br>
				② 구체적인 개인정보 처리 및 보유 기간은 다음과 같습니다.
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;- 고객 가입 및 관리 : 서비스 이용계약 또는 회원가입 해지시까지, 다만 채권․채무관계 잔존시에는 해당 채권․채무관계 정산시까지
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;- 전자상거래에서의 계약․청약철회, 대금결제, 재화 등 공급기록 : 5년
			</div>

			<div class="terms_title_contenttitle">3. 개인정보의 제3자 제공</div>
			<div class="terms_content">플랜잇은 정보주체의 별도 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우 외에는 개인정보를 제3자에게 제공하지 않습니다.</div>

			<div class="terms_title_contenttitle">4. 개인정보처리의 위탁</div>
			<div class="terms_content">
				① 플랜잇은 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 외부에 위탁하고 있습니다.
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;- A/S 센터 운영
				<br>
				․위탁받는 자 (수탁자) : 중앙 전자
				<br>
				․위탁하는 업무의 내용 : 고객 대상 제품 A/S 제공
				<br>
				② 플랜잇은 위탁계약 체결시 개인정보 보호법 제25조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 재위탁 제한, 수탁자에 대한 관리․감독, 책임에 관한 사항을 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.
			</div>

			<div class="terms_title_contenttitle">5. 정보주체와 법정대리인의 권리․의무 및 행사방법</div>
			<div class="terms_content">
				정보주체는 플랜잇은에 대해 언제든지 다음 각 호의 개인정보 보호 관련 권리를 행사할 수 있습니다.
				<br>
				&nbsp;&nbsp;1. 개인정보 열람요구
				<br>
				&nbsp;&nbsp;2. 개인정보에 오류 등이 있을 경우 정정 요구
				<br>
				&nbsp;&nbsp;3. 삭제요구
				<br>
				&nbsp;&nbsp;4. 처리정지 요구
			</div>

			<div class="terms_title_contenttitle">6. 처리하는 개인정보 항목</div>
			<div class="terms_content">
				플랜잇은 다음의 개인정보 항목을 처리하고 있습니다.
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;- 성명, 생년월일, 주소, 전화번호, 휴대전화번호, 성별, 이메일주소, 신용카드번호, 은행계좌번호 등 결제정보
			</div>

			<div class="terms_title_contenttitle">7. 개인정보의 파기</div>
			<div class="terms_content">
				① 플랜잇은 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.
				<br>
				② 플랜잇은 다음의 방법으로 개인정보를 파기합니다.
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;- 전자적 파일 : 파일 삭제 및 디스크 등 저장매체 포맷
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;- 수기(手記) 문서 : 분쇄하거나 소각
			</div>

			<div class="terms_title_contenttitle">8. 개인정보의 안전성 확보조치</div>
			<div class="terms_content">
				플랜잇은 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;- 관리적 조치 : 내부관리계획 수립․시행, 직원․종업원 등에 대한 정기적 교육
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;- 기술적 조치 : 개인정보처리시스템(또는 개인정보가 저장된 컴퓨터)의 비밀번호 설정 등 접근권한 관리, 백신소프트웨어 등 보안프로그램 설치, 개인정보가 저장된 파일의 암호화
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;- 물리적 조치 : 개인정보가 저장․보관된 장소의 시건, 출입통제 등
			</div>

			<div class="terms_title_contenttitle">9. 개인정보 자동 수집 장치의 설치∙운영 및 거부에 관한 사항</div>
			<div class="terms_content">
				① 플랜잇은 이용자에게 개별적인 맞춤서비스를 제공하기 위해 이용정보를 저장하고 수시로 불러오는 ‘쿠기(cookie)’를 사용합니다.
				<br>
				② 쿠키는 웹사이트를 운영하는데 이용되는 서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에 저장되기도 합니다.
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;가. 쿠키의 사용목적: 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태, 인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다.
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;나. 쿠키의 설치∙운영 및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다.
			</div>

			<div class="terms_title_contenttitle">10. 개인정보 보호책임자</div>
			<div class="terms_content">
				플랜잇은 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제를 처리하기 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
				<br>
				▶ 개인정보 보호책임자 (사업주 또는 대표자)
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;성명 : 장혜리 &nbsp;&nbsp;&nbsp;&nbsp; 직책 : 대표이사
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;연락처 : 070-8240-3211, jhr@jhta.co.kr, 02-777-5407
			</div>

			<div class="terms_title_contenttitle">11. 개인정보 처리방침 변경 이 개인정보 처리방침은 2019. 06. 23.부터 적용됩니다.</div>
		</div>
		<div class="termsagreecheck">
			<label for="personal_information_terms_agree">개인정보 처리방침에 동의합니다.</label> <input type="checkbox" id="personal_information_terms_agree" name="personal_information_terms_agree" required="required">
		</div>
		<input type="submit" value="회원가입 하러 가기" class="btn btn-primary btn-block">
		<div class="errMsg">${errMsg }</div>
	</form>
</div>