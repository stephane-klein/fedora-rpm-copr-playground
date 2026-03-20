specfile = rpm/hello-golang.spec
version = 1.0.7

.PHONY: srpm
srpm: $(specfile)
	mkdir -p /tmp/copr-srpm-build
	cp -r . /tmp/copr-srpm-build/hello-golang-$(version)
	cd /tmp/copr-srpm-build && \
		tar -czf hello-golang-$(version).tar.gz hello-golang-$(version) --exclude='.git' --exclude='rpmbuild' && \
		rpmbuild -bs $(specfile) \
			--define "_topdir /tmp/copr-srpm-build/rpmbuild" \
			--define "dist .fc42" \
			--define "_sourcedir /tmp/copr-srpm-build"
	cp /tmp/copr-srpm-build/rpmbuild/SRPMS/*.src.rpm $(outdir)
