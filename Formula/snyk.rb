class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1229.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1229.0/snyk-macos"
    sha256 "3a432a95c131c0ef54afdb3e4377dd20e828a2f944f52195abf93f79b33febbe"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1229.0/snyk-linux"
    sha256 "6d54fb787a376a2fa0cdd23a3031ff8255f7bf76cda2a50bdf615d44360fbdc6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
