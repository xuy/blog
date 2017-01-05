local:
	jekyll s --incremental

publish:
	s3_website push --config-dir ~/Dropbox
