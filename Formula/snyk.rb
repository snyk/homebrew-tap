class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.530.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.530.0/snyk-macos"
    sha256 "b47741f5f60339661e475a59d9f270496e0f7aea76d2a34facd4acb0b7e017df"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.530.0/snyk-linux"
    sha256 "606e1cc3529e6e611fdd7abe203a2dd6790eeacc7b1fcda16148fa1dc3f1fe79"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
