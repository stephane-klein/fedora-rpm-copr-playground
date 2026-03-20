Name:           hello-bash
Version:        1.0.6
Release:        1%{?dist}
Summary:        A simple Hello World bash script

License:        MIT
URL:            https://github.com/stephane-klein/fedora-rpm-copr-playground
Source0:        hello-bash

BuildArch:      noarch

%description
A simple "Hello World" Bash script packaged as an RPM for Fedora COPR.

%prep
# Nothing to prepare, source is ready

%build
# Nothing to build, it's a bash script

%install
mkdir -p %{buildroot}/%{_bindir}
cp %{SOURCE0} %{buildroot}/%{_bindir}/hello-bash
chmod 755 %{buildroot}/%{_bindir}/hello-bash

%files
%{_bindir}/hello-bash

%changelog
* Thu Mar 19 2026 Stéphane Klein <contact@stephane-klein.info> - 1.0.0-1
- Initial release
