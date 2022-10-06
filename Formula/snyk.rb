class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1022.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1022.0/snyk-macos"
    sha256 "b8335f940922e99a68c95a3fde437c9413c92f71e019e1af70a95848cb6d5e78"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1022.0/snyk-linux"
    sha256 "5749eb5ccdc7d551ef7c63b1ea93c852d596493446d19db9443bad2928e16bad"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
