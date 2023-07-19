class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1191.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1191.0/snyk-macos"
    sha256 "1ae4b260d532041c9cc97a1f736ea8ed1133e03ff19ce63a4a7fc0e4194f557e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1191.0/snyk-linux"
    sha256 "01e9b39961075d7a687a7de5195da42db3e9aeca4a25ec96ec6792fea23593c1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
