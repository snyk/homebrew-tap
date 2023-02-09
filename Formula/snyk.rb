class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1100.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1100.0/snyk-macos"
    sha256 "ffdd06ebe5d152ab76798d2e4b7ac1ea66db07f0f16aa6dd1473508eef6b86a3"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1100.0/snyk-linux"
    sha256 "688084874a5f99816cc76d57dc880e87277f261bd974bf5fca6b3ed182043988"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
