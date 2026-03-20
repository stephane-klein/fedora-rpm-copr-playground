specfile = rpm/hello-golang.spec
version = 1.0.0

.PHONY: srpm
srpm: $(specfile)
	mkdir -p /tmp/copr-srpm-build/source
	cp -r . /tmp/copr-srpm-build/source/
	cd /tmp/copr-srpm-build && \
		tar -czf source/hello-golang-$(version).tar.gz -C source hello-golang-$(version) --exclude='.git' --exclude='rpmbuild' && \
		rpmbuild -bs $(specfile) \
			--define "_topdir /tmp/copr-srpm-build/rpmbuild" \
			--define "dist .fc42" \
			--define "_sourcedir /tmp/copr-srpm-build/source"
	cp /tmp/copr-srpm-build/rpmbuild/SRPMS/*.src.rpm $(outdir)
