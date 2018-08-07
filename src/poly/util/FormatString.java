package poly.util;


//정규식 문자 제거 해줄곳
public class FormatString {

	
	//xml파싱해서  ? 값 지워줌
	public static String stringChg(String str) throws Exception {
		
		String strCom=str;
		
		int idx=strCom.indexOf("?");
		String str1 = strCom.substring(0, idx);
		System.out.println("str1"+str1);

		return str1;
		
	}
	
public static String stringExtr(String str) throws Exception {
		
		String strCom=str;
		
		String str1 =strCom.substring(strCom.indexOf("?"),strCom.length());
		System.out.println("str1"+str1);
		
		return str1;
		
	}
public static String lastStringSub(String str) {
    if (str.length() > 0 && str.charAt(str.length()-1)==',') {
      str = str.substring(0, str.length()-1);
    }
    return str;
}
	
	
}
