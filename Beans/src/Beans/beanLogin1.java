package Beans;

public class beanLogin1 {
    private String userId;
    private String userPw;
    final String realId = "kim";
    final String realPw ="kimpass";

    public boolean CheckUser(){
        if(userId.equals(realId) && userPw.equals(realPw) ){
            return true;
        }else{
            return false;
        }
    }

    public String getUserId(){
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserPw() {
        return userPw;
    }

    public void setUserPw(String userPw) {
        this.userPw = userPw;
    }
}

