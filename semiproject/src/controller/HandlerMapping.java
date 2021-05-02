package controller;


public class HandlerMapping {
	private static HandlerMapping instance=new HandlerMapping();
	private HandlerMapping() {}
	public static HandlerMapping getInstance() {
		return instance;
	}
	public Controller create(String command) throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		Controller controller=null;
		//현재 패키지명을 구한다 
		String packageName=this.getClass().getPackage().getName();
		//System.out.println("현재 패키지명:"+packageName);
		String classInfo=new StringBuilder(packageName).append(".").append(command).toString();
		//System.out.println(classInfo);
		controller=(Controller)Class.forName(classInfo).newInstance();
		//System.out.println(controller);
		return controller;
	}
}
