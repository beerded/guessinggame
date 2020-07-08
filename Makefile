.PHONY: doc
doc:
	touch README.md
	echo "# Project Name: guessinggame\n" > README.md
	printf 'Document generated at `%s`\n\n' "$$(date)" >> README.md
	printf 'guessinggame.sh contains %s lines' "$$(wc -l guessinggame.sh | awk '{print $$1}')" >> README.md
