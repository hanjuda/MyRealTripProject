package action;

public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();
	private ActionFactory() {}
	static ActionFactory getInstance() {
		return instance;
	}
	
	Action getAction(String command) {
		System.out.println(command);
		Action action = null;
		switch(command) {
			case "home" :
				action = new HomeAction();
				break;
			case "HomeResultAction" :
				action = new RequestHomeAction();
				break;
			case "sign_up" :
				action = new SignUpAction();
				break;
			case "SignUpResultAction" :
				action = new RequestSignUpAction();
				break;
			case "sign_in" :
				action = new SignInAction();
				break;
			case "SignInResultAction" :
				action = new RequestSignInAction();
				break;
			case "becomepartner" :
				action = new BecomePartnerAction();
				break;
			case "BecomePartnerResultAction" :
				action = new RequestBecomePartnerAction();
				break;
			case "email_sign_up":
				action = new EmailSignUpAction();
				break;
			case "EmailSignUpResultAction":
				action = new RequestEmailSignUpAction();
				break;
			case "email_sign_in":
				action = new EmailSignInAction();
				break;
			case "EmailSignInResultAction":
				action = new RequestEmailSignInAction();
				break;
			case "motel_discount" :
				action = new MotelDiscountAction();
				break;
			case "MotelDiscountResultAction":
				action = new RequestMotelDiscountAction();
			case "discount_benefit" :
				action = new DiscountBenefitAction();
				break;
			case "DiscountBenefitResultAction":
				action = new RequestDiscountBenefitAction();
				break;
			case "regions" :
				action = new RegionsAction();
				break;
			case "RegionsResultAction":
				action = new RequestRegionsAction();
				break;
			case "seoul" :
				action = new SeoulAction();
				break;
			case "Seoul_All" :
				action = new SeoulAllAction();
				break;
			case "SeoulAllResultAction":
				action = new RequestSeoulAllAction();
				break;
			case "email_login":
				action = new EmailLoginAction();
				break;
			case "cate_filter":
				action = new CateFilterAction();
				break;
			case "wishlist":
				action = new WishlistAction();
				break;
			case "WishlistResultAction":
				action = new RequestWishlistAction();
				break;
			case "message":
				action = new MessageAction();
				break;
			case "MessageResultAction":
				action = new RequestMessageAction();
				break;
			case "logout":
				action = new LogoutAction();
				break;
			case "LogoutResultAction":
				action = new RequestLogoutAction();
				break;
			case "heart_plus":
				action = new HeartPlusAction();
				break;
			case "heart_minus":
				action = new HeartMinusAction();
				break;
			case "infi_seoul":
				action = new InfiSeoulAction();
				break;
			case "see_more":
				action = new SeeMoreAction();
				break;
			case "SnapMoreResultAction":
				action = new RequestSnapMoreAction();
				break;
			case "ClassMoreResultAction":
				action = new RequestClassMoreAction();
				break;
			case "RestrantMoreResultAction":
				action = new RequestRestrantMoreAction();
				break;
			case "ActivityMoreResultAction":
				action = new RequestActivityMoreAction();
				break;
			case "DateMoreResultAction":
				action = new RequestDateMoreAction();
				break;
			case "search":
				action = new SearchAction();
				break;
			case "SerachResultAction":
				action = new RequestSerachAction();
				break;
			case "point":
				action = new PointAction();
				break;
			case "mymanage":
				action = new MyManageAction();
				break;
			case "MyManagerResultAction":
				action = new RequestMyManagerAction();
				break;
			case "profileUpdate":
				action = new ProfileUpdateAction();
				break;
			case "profileEdit":
				action = new ProfileEditAction();
				break;
			case "ProfileEditResultAction":
				action = new RequestProfileEditAction();
				break;
			case "lastUpdate":
				action = new LastUpdateAction();
				break;
			case "mytrip":
				action = new MyTripAction();
				break;
			case "resultMyTrip":
				action = new RequestMyTripAction();
				break;
			case "canceltrip":
				action = new CancelTripAction();
				break;
			case "scanner":
				action = new ScannerAction();
				break;
			case "email_sign_up_sql" :
				action = new email_sign_up_sqlAction();
				break;
			case "complete" :
				action = new CompleteAction();
				break;
			case "detail" :
				action = new DetailAction();
				break;
			case "payment" :
				action = new PaymentAction();
				break;
			case "review" :
				action = new ReviewAction();
				break;
				
			}
		
		return action;
	}
}

