<div class="topic">
	<!-- IMPORT partials/breadcrumbs.tpl -->

	<div component="topic/deleted/message" class="alert alert-warning<!-- IF !deleted --> hidden<!-- ENDIF !deleted -->">[[topic:deleted_message]]</div>

	<ul component="topic" id="post-container" class="posts" data-tid="{tid}">
		<!-- BEGIN posts -->
			<li component="post" class="<!-- IF posts.deleted -->deleted<!-- ENDIF posts.deleted -->" <!-- IMPORT partials/data/topic.tpl -->>
				<a component="post/anchor" data-index="{posts.index}" name="{posts.index}"></a>
				<div class="post-row">

					<meta itemprop="datePublished" content="{posts.timestampISO}">
					<meta itemprop="dateModified" content="{posts.editedISO}">

					<div class="topic-item">
						<div class="topic-body">
							<div class="row">
								<div class="col-md-12">
                                    <div class="topic-profile-pic hidden-xs text-center">
                                        <!-- IF posts.selfPost -->
                                        <div class="user-icon" style="background-color: {posts.user.icon:bgColor};">ME</div>
                                        <!-- ELSE -->
                                            <!-- IF posts.secretAuthorName -->
                                            <div class="user-icon" style="background-color: {posts.user.icon:bgColor}; font-size: xx-large;">{posts.secretAuthorName}</div>
                                            <!-- ENDIF posts.secretAuthorName -->
                                        <!-- ENDIF posts.selfPost -->

										<!-- IMPORT partials/topic/badge.tpl -->
									</div>
									<div class="topic-text">
										<!-- IF @first -->
										<h1 class="topic-title">
											<p component="post/header" class="topic-title" itemprop="name"><i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !pinned -->hidden<!-- ENDIF !pinned -->"></i> <i component="topic/locked" class="fa fa-lock <!-- IF !locked -->hidden<!-- ENDIF !locked -->"></i> <span component="topic/title">{title}</span></p>
											<hr>
										</h1>
										<!-- ENDIF @first -->
										<div component="post/content" class="post-content" itemprop="text">{posts.content}</div>
										<!-- IF posts.user.signature -->
										<div class="post-signature">{posts.user.signature}</div>
										<!-- ENDIF posts.user.signature -->
									</div>
								</div>
							</div>
						</div>
						<div class="topic-footer">
							<div class="row">
								<div class="">
									<small class="pull-right">
										<span>
											<span>
												<span class="timeago" title="{posts.timestampISO}"></span>
											</span>
										</span>

										<span component="post/editor" class="<!-- IF !posts.editor.username --> hidden<!-- ENDIF !posts.editor.username -->">, [[global:edited]] <span class="timeago" title="{posts.editedISO}"></span></span>
									</small>

									<div class="dropdown moderator-tools" component="post/tools">
										<a href="#" data-toggle="dropdown"><i class="fa fa-fw fa-gear"></i></a>
										<ul class="dropdown-menu" role="menu"></ul>
									</div>

									<!-- IF !reputation:disabled -->
									&bull;
									<a component="post/upvote" href="#" class="upvote<!-- IF posts.upvoted --> upvoted<!-- ENDIF posts.upvoted -->">
										<i class="fa fa-chevron-up"></i>
									</a>
									<span component="post/vote-count" class="votes" data-votes="{posts.votes}">{posts.votes}</span>
									<!-- IF !downvote:disabled -->
									<a component="post/downvote" href="#" class="downvote<!-- IF posts.downvoted --> downvoted<!-- ENDIF posts.downvoted -->">
										<i class="fa fa-chevron-down"></i>
									</a>
									<!-- ENDIF !downvote:disabled -->
									<!-- ENDIF !reputation:disabled -->

									<!-- IF posts.user.custom_profile_info.length -->
										<!-- BEGIN custom_profile_info -->
										&bull; {posts.user.custom_profile_info.content}
										<!-- END custom_profile_info -->
									<!-- ENDIF posts.user.custom_profile_info.length -->
									<span class="post-tools">
										<!-- IF !posts.selfPost -->
										<!-- IF posts.user.userslug -->
										<!-- IF loggedIn -->
										<!-- IF !config.disableChat -->
										<button component="post/chat" class="btn btn-sm btn-link chat" type="button" title="[[topic:chat]]"><i class="fa fa-comment"></i><span class="hidden-xs-inline"> [[topic:chat]]</span></button>
										<!-- ENDIF !config.disableChat -->
										<!-- ENDIF loggedIn -->
										<!-- ENDIF posts.user.userslug -->
										<!-- ENDIF !posts.selfPost -->

										<button component="post/quote" class="btn btn-sm btn-link <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->" type="button" title="[[topic:quote]]"><i class="fa fa-quote-left"></i><span class="hidden-xs-inline"> [[topic:quote]]</span></button>
										<button component="post/reply" class="btn btn-sm btn-link <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->" type="button"><i class="fa fa-reply"></i><span class="hidden-xs-inline"> [[topic:reply]]</span></button>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- IF !posts.index -->
				<div class="post-bar-placeholder"></div>
				<!-- ENDIF !posts.index -->
			</li>
		<!-- END posts -->
	</ul>

	<div class="post-bar col-xs-12">
		<!-- IMPORT partials/post_bar.tpl -->
	</div>

	<!-- IF config.usePagination -->
		<!-- IMPORT partials/paginator.tpl -->
	<!-- ENDIF config.usePagination -->

	<!-- IMPORT partials/topic/navigator.tpl -->
</div>

<!-- IF !config.usePagination -->
<noscript>
	<!-- IMPORT partials/paginator.tpl -->
</noscript>
<!-- ENDIF !config.usePagination -->
