import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:limonfy/app/injection.dart';
import 'package:limonfy/core/config/size/size.config.dart';
import 'package:limonfy/core/constants/colors.constants.dart';
import 'package:limonfy/core/constants/limonfy.constants.dart';
import 'package:limonfy/core/extensions/localization.extension.dart';

import 'package:limonfy/app/domain/usecases/user/get_user_account.usecase.dart';
import 'package:limonfy/app/domain/usecases/user/get_user_profile.usecase.dart';
import 'package:limonfy/app/domain/usecases/links/verify_exist_link.usecase.dart';
import 'package:limonfy/app/domain/usecases/links/convert_link_from_js.usecase.dart';
import 'package:limonfy/app/domain/usecases/links/create_limonfy_app_link.usecase.dart';
import 'package:limonfy/app/domain/usecases/user/get_user_account_subscription.usecase.dart';
import 'package:limonfy/app/domain/usecases/collections/get_featured_collections.usecase.dart';

import 'package:limonfy/app/presentation/bloc/link/create/create.bloc.dart';
import 'package:limonfy/app/presentation/bloc/link/create/create.state.dart';
import 'package:limonfy/app/presentation/bloc/link/create/create.event.dart';

import 'package:limonfy/app/presentation/bloc/user/account/account_bloc.dart';

import 'package:limonfy/app/presentation/bloc/user/profile/profile.bloc.dart';
import 'package:limonfy/app/presentation/bloc/user/profile/profile.event.dart';
import 'package:limonfy/app/presentation/bloc/user/profile/profile.state.dart';

import 'package:limonfy/app/presentation/bloc/collections/featured/featured.bloc.dart';
import 'package:limonfy/app/presentation/bloc/collections/featured/featured.event.dart';
import 'package:limonfy/app/presentation/bloc/collections/featured/featured.state.dart';

import 'package:limonfy/app/presentation/components/atoms/texts/error.text.atom.dart';
import 'package:limonfy/app/presentation/components/molecules/buttons/text.button.molecule.dart';

import 'package:limonfy/app/presentation/components/organisms/appbar/main.appbar.organism.dart';
import 'package:limonfy/app/presentation/components/organisms/forms/create_link.form.organism.dart';
import 'package:limonfy/app/presentation/components/organisms/list/links_collections_avatar.list.organism.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AccountBloc(
            injector.get<GetUserAccountUsecase>(),
          )..add(const AccountInit(refresh: false)),
        ),
        BlocProvider(
          create: (_) => ProfileBloc(
            injector.get<GetUserProfileUsecase>(),
          )..add(const ProfileInit(refresh: false)),
        ),
        BlocProvider(
          create: (_) => CreateLinkBloc(
            injector.get<CreateLimonfyAppLinkUsecase>(),
            injector.get<VerifyExistLinkUsecase>(),
            injector.get<ConvertLinkFromJsUsecase>(),
          )..add(const CreateLinkOnInit()),
        ),
        BlocProvider<FeaturedCollectionBloc>(
          create: (_) => FeaturedCollectionBloc(
            injector.get<GetFeaturedCollectionUsecase>(),
            injector.get<GetUserAccountSubscriptionUsecase>(),
          )..add(const FeatCollecInit(refresh: false)),
        ),
      ],
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (BuildContext context, ProfileState state) {
                  return MainAppbar(
                    loading: state.loading,
                    profile: state.profile,
                    refresh: () {
                      context
                          .read<AccountBloc>()
                          .add(const AccountInit(refresh: true));
                      context
                          .read<ProfileBloc>()
                          .add(const ProfileInit(refresh: true));
                      context
                          .read<FeaturedCollectionBloc>()
                          .add(const FeatCollecInit(refresh: true));
                    },
                  );
                },
              ),
              const SizedBox(height: 30),
              Text(context.l10n.featuredCollections),
              const SizedBox(height: 10),
              BlocBuilder<FeaturedCollectionBloc, FeatCollecState>(
                builder: (BuildContext context, FeatCollecState state) {
                  if (state.loading) {
                    return CollectionsAvatarListOrganism(
                      selected: (c) => false,
                      loading: state.loading,
                      collections: state.collections,
                      status: state.status,
                      onCollectionPressed: (coll) {},
                      onErrorPressed: () {},
                    );
                  } else if (state.premium) {
                    return CollectionsAvatarListOrganism(
                      selected: (c) {
                        if (state.collection.id == '') {
                          return c.id == state.collections[0].id;
                        } else {
                          return c.id == state.collection.id;
                        }
                      },
                      loading: state.loading,
                      collections: state.collections,
                      status: state.status,
                      onCollectionPressed: (coll) {
                        context
                            .read<FeaturedCollectionBloc>()
                            .add(FeaturedCollSet(coll: coll));
                      },
                      onErrorPressed: () {
                        context
                            .read<FeaturedCollectionBloc>()
                            .add(const FeatCollecInit(refresh: true));
                      },
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ErrorTextAtom(
                          maxLines: 2,
                          text: context.l10n.nonPremiumSelectExplanation,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          context.l10n.linkWillBeSavedInDefault,
                          style: const TextStyle(
                            fontSize: 12,
                            color: ColorsConstants.textAlt,
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
              const SizedBox(height: 30),
              Text(context.l10n.linkUrl),
              const SizedBox(height: 10),
              BlocBuilder<CreateLinkBloc, CreateLinkState>(
                builder: (BuildContext context, CreateLinkState create) {
                  if (create.exist) {
                    return Container(
                      width: injector.get<SizeConfig>().sizeH * 100,
                      decoration: BoxDecoration(
                        color: ColorsConstants.success.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 15,
                        ),
                        child: Center(
                          child: Text(
                            context.l10n.linkAlreadySaved,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        CreateLinkFormOrganism(
                          link: create.link,
                          loading: create.loading,
                          creating: create.creating,
                          private: create.private,
                          onPrivate: (v) {
                            context
                                .read<CreateLinkBloc>()
                                .add(CreateLinkMakePrivate(private: v));
                          },
                          onSaved: () {
                            context
                                .read<CreateLinkBloc>()
                                .add(CreateLinkSubmitLink(
                                  coll: context
                                      .read<FeaturedCollectionBloc>()
                                      .state
                                      .collection,
                                ));
                          },
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: TextButtonMolecule(
                            text: context.l10n.getAppSignUp,
                            underline: true,
                            onPressed: () async {
                              await launchUrl(
                                Uri.parse(LimonfyConstants.limonfyWeb),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
