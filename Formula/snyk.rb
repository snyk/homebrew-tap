class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.893.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.893.0/snyk-macos"
    sha256 "01b554c97f795cb8882d25ca51c3ef55ddcfb6175669f90c56f016a3be0c8856"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.893.0/snyk-linux"
    sha256 "06914a796ba641d97876778340ca5b7d74966c259b02ac74111bf5975be8f661"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
