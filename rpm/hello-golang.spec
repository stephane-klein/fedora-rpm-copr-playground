Name:           hello-golang
Version:        1.0.10
Release:        1%{?dist}
Summary:        A simple Hello World Go application

License:        MIT
URL:            https://github.com/stephane-klein/fedora-rpm-copr-playground
Source0:        %{name}-%{version}.tar.gz

BuildRequires:  golang >= 1.21

%description
A simple "Hello World" Go application packaged as an RPM for Fedora COPR.

%prep
%autosetup

%build
go build -ldflags "-X main.version=%{version}" -o %{name}

%install
mkdir -p %{buildroot}%{_bindir}
cp %{name} %{buildroot}%{_bindir}/

%files
%{_bindir}/%{name}

%changelog
* Fri Mar 20 2026 Stéphane Klein <contact@stephane-klein.info> - 1.0.0-1
- Initial release
