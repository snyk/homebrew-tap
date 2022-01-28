class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.839.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.839.0/snyk-macos"
    sha256 "f3e5e31def231eb04d910c3cf0723c922c858fa1e9d1f2d1cdbd9099be878897"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.839.0/snyk-linux"
    sha256 "5cd779adbef19c3c9982f01b672d5bd0e0005943a9dbb7038f8be772f70d1ddb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
