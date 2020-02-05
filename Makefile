local:
	jekyll s --incremental

publish:
	bundle exec jekyll b
	firebase deploy
