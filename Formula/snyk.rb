class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.790.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.790.0/snyk-macos"
    sha256 "6cf46b1b2fb624e96b6d2e175cf0a0f3283b32fc0a6754cf666cf62c3889fdbb"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.790.0/snyk-linux"
    sha256 "4fc124a380e775b5995d046f9c306a4fdec90f3a7b7041b60084b64531271841"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
