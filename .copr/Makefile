specfile = rpm/hello-bash.spec

# Extract version from git tag (removes 'v' prefix if present)
git_version := $(shell git describe --tags 2>/dev/null | sed 's/^v//')
version := $(if $(git_version),$(git_version),1.0.0)

.PHONY: srpm
srpm: $(specfile)
	@echo "Building SRPM with version: $(version)"
	mkdir -p /tmp/copr-srpm-build
	cat $< | sed 's/^Version:.*/Version:        $(version)/' > /tmp/copr-srpm-build/$(notdir $<)
	cp -r . /tmp/copr-srpm-build/source/
	cd /tmp/copr-srpm-build && \
		rpmbuild -bs $(notdir $<) \
			--define "_topdir /tmp/copr-srpm-build/rpmbuild" \
			--define "dist .fc42" \
			--define "_sourcedir /tmp/copr-srpm-build/source"
	cp /tmp/copr-srpm-build/rpmbuild/SRPMS/*.src.rpm $(outdir)
