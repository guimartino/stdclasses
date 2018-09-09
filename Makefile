v = 0000
clean:
	@rm -rf ~/Library/Caches/pip
	@find . -name "*.pyc" | xargs rm -rf
	@find . -name "*.pyo" | xargs rm -rf
	@find . -name "*.log" | xargs rm -rf
	@find . -name "__pycache__" -type d | xargs rm -rf
	@find . -name ".pytest_cache" -type d | xargs rm -rf
	@rm -f .coverage
	@rm -rf htmlcov/
	@rm -f coverage.xml
	@rm -f *.log

upload:
	python -m twine upload dist/*

generate-wheel:
	python setup.py bdist_wheel

commit:
	git add .
	git commit -m "$(v)"
	git push origin master

all:
	make clean
	make generate-wheel
	make upload
	make clean
	make commit "$(v)"
