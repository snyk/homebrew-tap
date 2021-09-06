class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.697.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.697.0/snyk-macos"
    sha256 "43ddd17c20177b930c3e65106f6a51fd033d2889612188480568bbf769fd3b7d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.697.0/snyk-linux"
    sha256 "fcefa2e85afb104f73f54edcda14aec5cad6c3a1be30063b80bb22cb5bd5dff8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
