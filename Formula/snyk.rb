class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.881.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.881.0/snyk-macos"
    sha256 "52ed0c8a98d7e23f9a04ea5a4e24571158860b11846fe1912da6071b4c7ce218"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.881.0/snyk-linux"
    sha256 "7df9f445b2eaab22b6d024ebc92b1471d49a5a827a8b6b14970e1d7d03eccf16"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
