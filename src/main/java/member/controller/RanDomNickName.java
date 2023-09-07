package member.controller;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class RanDomNickName {
	public static String randomHangulName() {
	    List<String> 성 = Arrays.asList("화가난 ", "웃는 ", "화끈한 ", "매끈한 ", "조용한 ", "예쁜 ", "더러운 ", "망할 ", "새로운 ", "화끈한 ", "새로운 ", "시끄러운 ", "늙은 ", "구운 ", "차가운 ", "놀라운 ", "신박한 ",
	        "기발한 ", "기존의 ", "날것의 ", "감동적인 ", "감격의 ", "치사한 ", "놀라운 ", "잘생긴 ", "귀여운 ", "멀쩡한 ", "이상한 ", "배부른 ", "배고픈 ", "지루한 ", "루즈한 ", "망한 ", "실패한 ", "사라진 ", "실종된 ","나타난 ");
	    List<String> 이름 = Arrays.asList("강아지", "장동건", "개", "소", "말", "뱀", "개구리", "돼지", "도야지", "근", "도마뱀", "코끼리", "거미", "지렁이", "프로틴", "물병", "아이폰",
	        "공주", "왕자", "거지", "노숙자", "오리", "거위", "똥", "대머리", "라신", "라이즈", "카타리나", "개미", "말벌", "탈모인", "서퍼", "판사", "의사", "개발자", "이혼남", "이혼녀", "쿼카",
	        "호랑이", "사자", "기린", "티라노", "감스트", "아빠", "엄마", "새", "독수리", "참새", "거위");
	    Collections.shuffle(성);
	    Collections.shuffle(이름);
	    return 성.get(0) + 이름.get(0);
	  }
	 
	  public static void main(String[] args) {
	  
	    System.out.println("랜덤 닉네임 : " + randomHangulName());
	  }

}
