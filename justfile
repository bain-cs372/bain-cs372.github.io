verify:
  uv run tools/verify_jekyll.py

zip:
	uv run tools/zip_it.py course-files/exercises
	uv run tools/zip_it.py course-files/lectures

serve-search: build
	bundle exec jekyll serve

build: verify zip
  JEKYLL_ENV=production bundle exec jekyll build --trace
  uv run tools/custom_indexer.py

serve:
	bundle exec jekyll serve

test-deploy:
	uv run tools/canvas_deploy.py deploy --verbose

deploy:
	uv run tools/canvas_deploy.py deploy --no-dry-run

test: build
	bundle exec rake test
