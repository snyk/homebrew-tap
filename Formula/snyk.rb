class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1040.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1040.0/snyk-macos"
    sha256 "2fac2b74115ad15aed564264dfd8192d1a19c01af594d904aefcca8fa8fd05f8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1040.0/snyk-linux"
    sha256 "f31139a885886515d320723e35436fe5ba9ba558675a870a12c0036fd7e032d8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
