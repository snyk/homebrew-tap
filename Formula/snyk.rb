class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1059.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1059.0/snyk-macos"
    sha256 "8b5e6accc89204df942514c03594391caf19a0c36661cbfaa5809287287a7d7b"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1059.0/snyk-linux"
    sha256 "bc3d779687dee6181245663efeb6759b85e074cebc7bffd6fdc260a591f502fc"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
