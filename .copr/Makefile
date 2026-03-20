specfile = rpm/hello-bash.spec

.PHONY: srpm
srpm: $(specfile)
	mkdir -p /tmp/copr-srpm-build
	cp rpm/hello-bash.spec /tmp/copr-srpm-build/hello-bash.spec
	cp -r . /tmp/copr-srpm-build/source/
	cd /tmp/copr-srpm-build && \
		rpmbuild -bs hello-bash.spec \
			--define "_topdir /tmp/copr-srpm-build/rpmbuild" \
			--define "dist .fc42" \
			--define "_sourcedir /tmp/copr-srpm-build/source"
	cp /tmp/copr-srpm-build/rpmbuild/SRPMS/*.src.rpm $(outdir)
