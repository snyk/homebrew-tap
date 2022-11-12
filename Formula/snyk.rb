class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1058.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1058.0/snyk-macos"
    sha256 "52b2968bac45009593dc0c5547bb494127f415fa0bcf8c1f41107bf00c3f6d43"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1058.0/snyk-linux"
    sha256 "077018310f5781b75a0eb6960db9ac82421670dc09bac514ca17a6e3feec7ff6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
