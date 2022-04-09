import 'package:auto_route/annotations.dart';
import 'package:life_at_iitk/presentation/screen/events/ongoing_events.dart';
import 'package:life_at_iitk/presentation/screen/events/upcoming_events.dart';
import 'package:life_at_iitk/presentation/screen/home/home_root.dart';
import 'package:life_at_iitk/presentation/screen/map/map.dart';
import 'package:life_at_iitk/presentation/screen/posts/pending_approval.dart';

import '../screen/auth/reset_password.dart';
import '../screen/auth/sign_in_up_page.dart';
import '../screen/events/calendar.dart';
import '../screen/home/home_page.dart';
import '../screen/misc/about_us.dart';
import '../screen/misc/make_coordinator.dart';
import '../screen/misc/preferences.dart';
import '../screen/posts/bookmark.dart';
import '../screen/posts/create_edit_post/create_edit_post.dart';
import '../screen/posts/featured.dart';
import '../screen/posts/pending_approval.dart';
import '../screen/posts/post_desc.dart';
import '../screen/posts/post_list.dart';
import '../screen/posts/post_search.dart';
import '../screen/posts/update_drafts.dart';
import '../screen/profile/profile_page.dart';
import '../screen/student_search/ss_page.dart';
import '../screen/student_search/ss_results.dart';
import '../screen/student_search/student_desc.dart';
import '../splash/spash_page.dart';


@MaterialAutoRouter(
	routes: <AutoRoute>[
    AdaptiveRoute(page: SplashPage, initial: true,),
    AdaptiveRoute(page: SignInUpPage,
			path: "/authenticate",
			children: [
				AdaptiveRoute(page: ResetPassword)
			]
			),
		// AdaptiveRoute(page: ResetPassword),
    // AdaptiveRoute(page: ResetPassword,),
		AdaptiveRoute(page: HomeRoot, path: '/home',
			children: [
				AdaptiveRoute(page: HomePage,initial: true),
				AdaptiveRoute(page: ProfilePage, fullscreenDialog: true),
				AdaptiveRoute(page: Preferences),
				AdaptiveRoute(page: CampusMap, fullscreenDialog: true, path: 'campus-map'),
				AdaptiveRoute(page: Featured),
				AdaptiveRoute(page: PostList,
					// children: [
					// 	AdaptiveRoute(page: PostSearch,
					// 		path: '/search-results', fullscreenDialog: true, initial: true),
					// ]
				),
				AdaptiveRoute(page: PostSearch,
							path: 'search-results', fullscreenDialog: true,),
				AdaptiveRoute(page: PostDescription),
				AdaptiveRoute(page: MakeCoordinator),
				AdaptiveRoute(page: PendingApproval, path: 'pending-approvals'),
				// AdaptiveRoute(page: UpdateDraftsPage, path: '/drafts'),
				AdaptiveRoute(page: Boookmarks),
				AdaptiveRoute(page: Calendar, path: 'schedule'),
				AdaptiveRoute(page: OngoingEvents),
				AdaptiveRoute(page: UpcomingEvents),
				AdaptiveRoute(page: StudentSearchPage,
					path: 'students-search',
					// children: [
					// 	AdaptiveRoute(page: SSResult, path: '/results'),
					// 	// AdaptiveRoute(page: StudentDescription, path: '/results/description', fullscreenDialog: true)
					// ]
				),
				AdaptiveRoute(page: SSResult, path: 'results'),
				// AdaptiveRoute(page: StudentDescription, path: '/results/description'),
				AdaptiveRoute(page: AboutUs),
				AdaptiveRoute(page: CreateEditPost, path: 'admin/:name'),
				AdaptiveRoute(page: UpdateDraftsPage, path: 'update-drafts-page'),
			]
		),
		// AdaptiveRoute(page: ProfilePage, fullscreenDialog: true),
		// 		AdaptiveRoute(page: Preferences),
		// 		AdaptiveRoute(page: CampusMap, fullscreenDialog: true, path: 'campus-map'),
		// 		AdaptiveRoute(page: Featured),
		// 		AdaptiveRoute(page: PostList,
					// children: [
					// 	AdaptiveRoute(page: PostSearch,
					// 		path: '/search-results'),
					// ]
				// ),
				// AdaptiveRoute(page: PostSearch,
				// 			path: '/search-results'),
				// AdaptiveRoute(page: PostDescription),
				// AdaptiveRoute(page: MakeCoordinator),
				// AdaptiveRoute(page: CreateEditPost, path: '/:name'),
				// AdaptiveRoute(page: UpdateDraftsPage, path: '/:page'),
				// AdaptiveRoute(page: PendingApproval, path: '/pending-approvals'),
				// // AdaptiveRoute(page: UpdateDraftsPage, path: '/drafts'),
				// AdaptiveRoute(page: Boookmarks),
				// AdaptiveRoute(page: Calendar, path: '/schedule'),
				// AdaptiveRoute(page: OngoingEvents),
				// AdaptiveRoute(page: UpcomingEvents),
				// AdaptiveRoute(page: StudentSearchPage,
				// 	path: '/students-search',
				// // 	children: [
				// // 		AdaptiveRoute(page: SSResult, path: '/results'),
				// // AdaptiveRoute(page: StudentDescription, path: '/results/description')
				// // 	]
				// ),
				// AdaptiveRoute(page: SSResult, path: '/results'),
				// AdaptiveRoute(page: StudentDescription, path: '/results/description'),
				// AdaptiveRoute(page: AboutUs),
		// AdaptiveRoute(page: SplashPage, path: '*'),
	],
)
	// generateNavigationHelperExtension: true)
class $Router {
	// SignInUpPage signInUpPage;
}