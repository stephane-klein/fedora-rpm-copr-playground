specfile = rpm/hello-bash.spec

.PHONY: srpm
srpm: $(specfile)
	mkdir -p /tmp/copr-srpm-build
	cp -r . /tmp/copr-srpm-build/source/
	cd /tmp/copr-srpm-build && \
		rpmbuild -bs $(notdir $<) \
			--define "_topdir /tmp/copr-srpm-build/rpmbuild" \
			--define "dist .fc42" \
			--define "_sourcedir /tmp/copr-srpm-build/source"
	cp /tmp/copr-srpm-build/rpmbuild/SRPMS/*.src.rpm $(outdir)
