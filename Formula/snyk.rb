class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.283.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.283.0/snyk-macos"
    sha256 "b121d9e07ad648dd0bb0d9386c4e3fe94b5428872a0a4ad14eac7ed377d27c2b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.283.0/snyk-linux"
    sha256 "95f90689a5906148969676f087ab7bce9a2db7828632f759c75b00e15c6aae28"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
