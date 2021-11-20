class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.766.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.766.0/snyk-macos"
    sha256 "9b8fd9af9d4cfb6d1bbfe461bedf60987db5c01c866201c627fb1cb88f89227d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.766.0/snyk-linux"
    sha256 "5d15404c22df94f6ed2f02302c957d920bfe581fccc14509b1f2d5f58a753d49"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
