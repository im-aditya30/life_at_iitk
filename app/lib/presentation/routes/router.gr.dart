// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i24;
import 'package:flutter/material.dart' as _i25;

import '../../domain/models/posts.dart' as _i26;
import '../../domain/models/student.dart' as _i28;
import '../core/enums.dart' as _i27;
import '../screen/auth/reset_password.dart' as _i4;
import '../screen/auth/sign_in_up_page.dart' as _i2;
import '../screen/events/calendar.dart' as _i16;
import '../screen/events/ongoing_events.dart' as _i17;
import '../screen/events/upcoming_events.dart' as _i18;
import '../screen/home/home_page.dart' as _i5;
import '../screen/home/home_root.dart' as _i3;
import '../screen/map/map.dart' as _i8;
import '../screen/misc/about_us.dart' as _i21;
import '../screen/misc/make_coordinator.dart' as _i13;
import '../screen/misc/preferences.dart' as _i7;
import '../screen/posts/bookmark.dart' as _i15;
import '../screen/posts/create_edit_post/create_edit_post.dart' as _i22;
import '../screen/posts/featured.dart' as _i9;
import '../screen/posts/pending_approval.dart' as _i14;
import '../screen/posts/post_desc.dart' as _i12;
import '../screen/posts/post_list.dart' as _i10;
import '../screen/posts/post_search.dart' as _i11;
import '../screen/posts/update_drafts.dart' as _i23;
import '../screen/profile/profile_page.dart' as _i6;
import '../screen/student_search/ss_page.dart' as _i19;
import '../screen/student_search/ss_results.dart' as _i20;
import '../splash/spash_page.dart' as _i1;

class Router extends _i24.RootStackRouter {
  Router([_i25.GlobalKey<_i25.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i24.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.SplashPage());
    },
    SignInUpPageRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.SignInUpPage());
    },
    HomeRootRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.HomeRoot());
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.ResetPassword(key: args.key, onPop: args.onPop));
    },
    HomePageRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i5.HomePage());
    },
    ProfilePageRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i6.ProfilePage(),
          fullscreenDialog: true);
    },
    PreferencesRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i7.Preferences());
    },
    CampusMapRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i8.CampusMap(), fullscreenDialog: true);
    },
    FeaturedRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i9.Featured());
    },
    PostListRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i10.PostList());
    },
    PostSearchRoute.name: (routeData) {
      final args = routeData.argsAs<PostSearchRouteArgs>();
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i11.PostSearch(posts: args.posts, type: args.type),
          fullscreenDialog: true);
    },
    PostDescriptionRoute.name: (routeData) {
      final args = routeData.argsAs<PostDescriptionRouteArgs>();
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i12.PostDescription(
              key: args.key,
              posts: args.posts,
              index: args.index,
              type: args.type));
    },
    MakeCoordinatorRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i13.MakeCoordinator());
    },
    PendingApprovalRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i14.PendingApproval());
    },
    BoookmarksRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i15.Boookmarks());
    },
    CalendarRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i16.Calendar());
    },
    OngoingEventsRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i17.OngoingEvents());
    },
    UpcomingEventsRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i18.UpcomingEvents());
    },
    StudentSearchPageRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i19.StudentSearchPage());
    },
    SSResultRoute.name: (routeData) {
      final args = routeData.argsAs<SSResultRouteArgs>();
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i20.SSResult(key: args.key, query: args.query));
    },
    AboutUsRoute.name: (routeData) {
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData, child: _i21.AboutUs());
    },
    CreateEditPostRoute.name: (routeData) {
      final args = routeData.argsAs<CreateEditPostRouteArgs>();
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i22.CreateEditPost(
              key: args.key, type: args.type, post: args.post));
    },
    UpdateDraftsPageRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateDraftsPageRouteArgs>();
      return _i24.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i23.UpdateDraftsPage(key: args.key, isUpdate: args.isUpdate));
    }
  };

  @override
  List<_i24.RouteConfig> get routes => [
        _i24.RouteConfig(SplashPageRoute.name, path: '/'),
        _i24.RouteConfig(SignInUpPageRoute.name,
            path: '/authenticate',
            children: [
              _i24.RouteConfig(ResetPasswordRoute.name,
                  path: 'reset-password', parent: SignInUpPageRoute.name)
            ]),
        _i24.RouteConfig(HomeRootRoute.name, path: '/home', children: [
          _i24.RouteConfig(HomePageRoute.name,
              path: '', parent: HomeRootRoute.name),
          _i24.RouteConfig(ProfilePageRoute.name,
              path: 'profile-page', parent: HomeRootRoute.name),
          _i24.RouteConfig(PreferencesRoute.name,
              path: 'Preferences', parent: HomeRootRoute.name),
          _i24.RouteConfig(CampusMapRoute.name,
              path: 'campus-map', parent: HomeRootRoute.name),
          _i24.RouteConfig(FeaturedRoute.name,
              path: 'Featured', parent: HomeRootRoute.name),
          _i24.RouteConfig(PostListRoute.name,
              path: 'post-list', parent: HomeRootRoute.name),
          _i24.RouteConfig(PostSearchRoute.name,
              path: 'search-results', parent: HomeRootRoute.name),
          _i24.RouteConfig(PostDescriptionRoute.name,
              path: 'post-description', parent: HomeRootRoute.name),
          _i24.RouteConfig(MakeCoordinatorRoute.name,
              path: 'make-coordinator', parent: HomeRootRoute.name),
          _i24.RouteConfig(PendingApprovalRoute.name,
              path: 'pending-approvals', parent: HomeRootRoute.name),
          _i24.RouteConfig(BoookmarksRoute.name,
              path: 'Boookmarks', parent: HomeRootRoute.name),
          _i24.RouteConfig(CalendarRoute.name,
              path: 'schedule', parent: HomeRootRoute.name),
          _i24.RouteConfig(OngoingEventsRoute.name,
              path: 'ongoing-events', parent: HomeRootRoute.name),
          _i24.RouteConfig(UpcomingEventsRoute.name,
              path: 'upcoming-events', parent: HomeRootRoute.name),
          _i24.RouteConfig(StudentSearchPageRoute.name,
              path: 'students-search', parent: HomeRootRoute.name),
          _i24.RouteConfig(SSResultRoute.name,
              path: 'results', parent: HomeRootRoute.name),
          _i24.RouteConfig(AboutUsRoute.name,
              path: 'about-us', parent: HomeRootRoute.name),
          _i24.RouteConfig(CreateEditPostRoute.name,
              path: 'admin/:name', parent: HomeRootRoute.name),
          _i24.RouteConfig(UpdateDraftsPageRoute.name,
              path: 'update-drafts-page', parent: HomeRootRoute.name)
        ])
      ];
}

/// generated route for [_i1.SplashPage]
class SplashPageRoute extends _i24.PageRouteInfo<void> {
  const SplashPageRoute() : super(name, path: '/');

  static const String name = 'SplashPageRoute';
}

/// generated route for [_i2.SignInUpPage]
class SignInUpPageRoute extends _i24.PageRouteInfo<void> {
  const SignInUpPageRoute({List<_i24.PageRouteInfo>? children})
      : super(name, path: '/authenticate', initialChildren: children);

  static const String name = 'SignInUpPageRoute';
}

/// generated route for [_i3.HomeRoot]
class HomeRootRoute extends _i24.PageRouteInfo<void> {
  const HomeRootRoute({List<_i24.PageRouteInfo>? children})
      : super(name, path: '/home', initialChildren: children);

  static const String name = 'HomeRootRoute';
}

/// generated route for [_i4.ResetPassword]
class ResetPasswordRoute extends _i24.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({_i25.Key? key, required void Function(bool) onPop})
      : super(name,
            path: 'reset-password',
            args: ResetPasswordRouteArgs(key: key, onPop: onPop));

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({this.key, required this.onPop});

  final _i25.Key? key;

  final void Function(bool) onPop;
}

/// generated route for [_i5.HomePage]
class HomePageRoute extends _i24.PageRouteInfo<void> {
  const HomePageRoute() : super(name, path: '');

  static const String name = 'HomePageRoute';
}

/// generated route for [_i6.ProfilePage]
class ProfilePageRoute extends _i24.PageRouteInfo<void> {
  const ProfilePageRoute() : super(name, path: 'profile-page');

  static const String name = 'ProfilePageRoute';
}

/// generated route for [_i7.Preferences]
class PreferencesRoute extends _i24.PageRouteInfo<void> {
  const PreferencesRoute() : super(name, path: 'Preferences');

  static const String name = 'PreferencesRoute';
}

/// generated route for [_i8.CampusMap]
class CampusMapRoute extends _i24.PageRouteInfo<void> {
  const CampusMapRoute() : super(name, path: 'campus-map');

  static const String name = 'CampusMapRoute';
}

/// generated route for [_i9.Featured]
class FeaturedRoute extends _i24.PageRouteInfo<void> {
  const FeaturedRoute() : super(name, path: 'Featured');

  static const String name = 'FeaturedRoute';
}

/// generated route for [_i10.PostList]
class PostListRoute extends _i24.PageRouteInfo<void> {
  const PostListRoute() : super(name, path: 'post-list');

  static const String name = 'PostListRoute';
}

/// generated route for [_i11.PostSearch]
class PostSearchRoute extends _i24.PageRouteInfo<PostSearchRouteArgs> {
  PostSearchRoute({required List<_i26.Post> posts, required dynamic type})
      : super(name,
            path: 'search-results',
            args: PostSearchRouteArgs(posts: posts, type: type));

  static const String name = 'PostSearchRoute';
}

class PostSearchRouteArgs {
  const PostSearchRouteArgs({required this.posts, required this.type});

  final List<_i26.Post> posts;

  final dynamic type;
}

/// generated route for [_i12.PostDescription]
class PostDescriptionRoute
    extends _i24.PageRouteInfo<PostDescriptionRouteArgs> {
  PostDescriptionRoute(
      {_i25.Key? key,
      required List<_i26.Post> posts,
      required int index,
      required _i27.PostDescType type})
      : super(name,
            path: 'post-description',
            args: PostDescriptionRouteArgs(
                key: key, posts: posts, index: index, type: type));

  static const String name = 'PostDescriptionRoute';
}

class PostDescriptionRouteArgs {
  const PostDescriptionRouteArgs(
      {this.key, required this.posts, required this.index, required this.type});

  final _i25.Key? key;

  final List<_i26.Post> posts;

  final int index;

  final _i27.PostDescType type;
}

/// generated route for [_i13.MakeCoordinator]
class MakeCoordinatorRoute extends _i24.PageRouteInfo<void> {
  const MakeCoordinatorRoute() : super(name, path: 'make-coordinator');

  static const String name = 'MakeCoordinatorRoute';
}

/// generated route for [_i14.PendingApproval]
class PendingApprovalRoute extends _i24.PageRouteInfo<void> {
  const PendingApprovalRoute() : super(name, path: 'pending-approvals');

  static const String name = 'PendingApprovalRoute';
}

/// generated route for [_i15.Boookmarks]
class BoookmarksRoute extends _i24.PageRouteInfo<void> {
  const BoookmarksRoute() : super(name, path: 'Boookmarks');

  static const String name = 'BoookmarksRoute';
}

/// generated route for [_i16.Calendar]
class CalendarRoute extends _i24.PageRouteInfo<void> {
  const CalendarRoute() : super(name, path: 'schedule');

  static const String name = 'CalendarRoute';
}

/// generated route for [_i17.OngoingEvents]
class OngoingEventsRoute extends _i24.PageRouteInfo<void> {
  const OngoingEventsRoute() : super(name, path: 'ongoing-events');

  static const String name = 'OngoingEventsRoute';
}

/// generated route for [_i18.UpcomingEvents]
class UpcomingEventsRoute extends _i24.PageRouteInfo<void> {
  const UpcomingEventsRoute() : super(name, path: 'upcoming-events');

  static const String name = 'UpcomingEventsRoute';
}

/// generated route for [_i19.StudentSearchPage]
class StudentSearchPageRoute extends _i24.PageRouteInfo<void> {
  const StudentSearchPageRoute() : super(name, path: 'students-search');

  static const String name = 'StudentSearchPageRoute';
}

/// generated route for [_i20.SSResult]
class SSResultRoute extends _i24.PageRouteInfo<SSResultRouteArgs> {
  SSResultRoute({_i25.Key? key, required _i28.Student query})
      : super(name,
            path: 'results', args: SSResultRouteArgs(key: key, query: query));

  static const String name = 'SSResultRoute';
}

class SSResultRouteArgs {
  const SSResultRouteArgs({this.key, required this.query});

  final _i25.Key? key;

  final _i28.Student query;
}

/// generated route for [_i21.AboutUs]
class AboutUsRoute extends _i24.PageRouteInfo<void> {
  const AboutUsRoute() : super(name, path: 'about-us');

  static const String name = 'AboutUsRoute';
}

/// generated route for [_i22.CreateEditPost]
class CreateEditPostRoute extends _i24.PageRouteInfo<CreateEditPostRouteArgs> {
  CreateEditPostRoute(
      {_i25.Key? key, required _i27.PostDescType type, required _i26.Post post})
      : super(name,
            path: 'admin/:name',
            args: CreateEditPostRouteArgs(key: key, type: type, post: post),
            rawPathParams: {});

  static const String name = 'CreateEditPostRoute';
}

class CreateEditPostRouteArgs {
  const CreateEditPostRouteArgs(
      {this.key, required this.type, required this.post});

  final _i25.Key? key;

  final _i27.PostDescType type;

  final _i26.Post post;
}

/// generated route for [_i23.UpdateDraftsPage]
class UpdateDraftsPageRoute
    extends _i24.PageRouteInfo<UpdateDraftsPageRouteArgs> {
  UpdateDraftsPageRoute({_i25.Key? key, required bool isUpdate})
      : super(name,
            path: 'update-drafts-page',
            args: UpdateDraftsPageRouteArgs(key: key, isUpdate: isUpdate));

  static const String name = 'UpdateDraftsPageRoute';
}

class UpdateDraftsPageRouteArgs {
  const UpdateDraftsPageRouteArgs({this.key, required this.isUpdate});

  final _i25.Key? key;

  final bool isUpdate;
}
