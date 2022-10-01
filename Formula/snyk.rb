class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1019.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1019.0/snyk-macos"
    sha256 "d66c5d9d6254e3941667f0b58ee8532bb49ca2b90c0eef65a063226bc545bb61"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1019.0/snyk-linux"
    sha256 "d6671c95e44c9e53684bd115797b5fd12c834c61c32e8fa72215566e1871bb63"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
