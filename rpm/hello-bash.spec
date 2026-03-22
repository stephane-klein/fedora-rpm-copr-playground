Name:           hello-bash
Version:        1.0.7
Release:        1%{?dist}
Summary:        A simple Hello World bash script

License:        MIT
URL:            https://github.com/stephane-klein/fedora-rpm-copr-playground
Source0:        hello-bash
Source1:        hello-bash2
Source2:        doc.txt

BuildArch:      noarch

%description
A simple "Hello World" Bash script packaged as an RPM for Fedora COPR.

%prep
# Nothing to prepare, source is ready

%build
# Nothing to build, it's a bash script

%install
mkdir -p %{buildroot}/%{_bindir}
mkdir -p %{buildroot}/%{_docdir}/%{name}
cp %{SOURCE0} %{buildroot}/%{_bindir}/hello-bash
cp %{SOURCE1} %{buildroot}/%{_bindir}/hello-bash2
cp %{SOURCE2} %{buildroot}/%{_docdir}/%{name}/
chmod 755 %{buildroot}/%{_bindir}/hello-bash
chmod 755 %{buildroot}/%{_bindir}/hello-bash2

%files
%{_bindir}/hello-bash
%{_bindir}/hello-bash2
%{_docdir}/%{name}/

%changelog
* Sun Mar 22 2026 Stéphane Klein <contact@stephane-klein.info> - 1.0.7-1
- Add hello-bash2 script and doc.txt documentation

* Thu Mar 19 2026 Stéphane Klein <contact@stephane-klein.info> - 1.0.0-1
- Initial release
