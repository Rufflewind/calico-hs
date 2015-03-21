DOCDIR=dist/doc/html/calico

doc:
	cabal haddock

doc-upload: doc $(DOCDIR)/.git/config
	cd $(DOCDIR) \
	  && git add -A \
	  && git commit --amend -q -m Autogenerated \
	  && git push -f origin master:gh-pages

$(DOCDIR)/.git/config:
	mkdir -p $(DOCDIR)
	@url=`git remote -v | grep origin | awk '{ printf "%s", $$2; exit }'` \
	  && cd $(DOCDIR) \
	  && git init \
	  && git config user.name Bot \
	  && git config user.email "<>" \
	  && git commit -m _ --allow-empty \
	  && git remote add origin $$url